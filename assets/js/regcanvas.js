function init() {

	var scene = new THREE.Scene();
	var clock = new THREE.Clock();

	var enableFog = true;

	if (enableFog) {
		scene.fog = new THREE.FogExp2(0xffffff, 0.05);
	}
	
	var planeMaterial = getMaterial('phong', 'rgb(255, 255, 255)');
	var plane = getPlane(planeMaterial, 100, 260);
	var directionalLight = getDirectionalLight(1);
	var sphere = getSphere(0.05);

	plane.rotation.x = Math.PI/2;
	directionalLight.position.x = 13;
	directionalLight.position.y = 10;
	directionalLight.position.z = 10;
	directionalLight.intensity = 2;

	scene.add(plane);
	directionalLight.add(sphere);
	scene.add(directionalLight);

	var camera = new THREE.PerspectiveCamera(
		45,
		window.innerWidth/window.innerHeight,
		1,
		1000
	);

	var cameraZRotation = new THREE.Group();
	var cameraYPosition = new THREE.Group();
	var cameraZPosition = new THREE.Group();
	var cameraXRotation = new THREE.Group();
	var cameraYRotation = new THREE.Group();

	cameraZRotation.name = 'cameraZRotation';
	cameraYPosition.name = 'cameraYPosition';
	cameraZPosition.name = 'cameraZPosition';
	cameraXRotation.name = 'cameraXRotation';
	cameraYRotation.name = 'cameraYRotation';

	cameraZRotation.add(camera);
	cameraYPosition.add(cameraZRotation);
	cameraZPosition.add(cameraYPosition);
	cameraXRotation.add(cameraZPosition);
	cameraYRotation.add(cameraXRotation);
	scene.add(cameraYRotation);

	cameraXRotation.rotation.x = -Math.PI/2;
	cameraYPosition.position.y = 1;
	cameraZPosition.position.z = 50;

	new TWEEN.Tween({val: 50})
		.to({val: 10}, 10000)
		.onUpdate(function() {
			cameraZPosition.position.z = this.val;
		})
		.start();

	new TWEEN.Tween({val: -Math.PI/2})
		.to({val: 0}, 6000)
		.delay(1000)
		.easing(TWEEN.Easing.Quadratic.InOut)
		.onUpdate(function() {
			cameraXRotation.rotation.x = this.val;
		})
		.start();

	new TWEEN.Tween({val: -Math.PI/2})
		.to({val: Math.PI/2}, 6000)
		.delay(1000)
		.easing(TWEEN.Easing.Quadratic.InOut)
		.onUpdate(function() {
			cameraYRotation.rotation.y = this.val;
		})
		.start();

	// load the cube map
	var path = 'assets/textures/cubemap/';
	var format = '.png';
	var urls = [
		path + 'posx' + format, path + 'negx' + format,
		path + 'posy' + format, path + 'negy' + format,
		path + 'posz' + format, path + 'negz' + format
	];
	var reflectionCube = new THREE.CubeTextureLoader().load(urls);
	reflectionCube.format = THREE.RGBFormat;

	scene.background = reflectionCube;

	var loader = new THREE.TextureLoader();
	planeMaterial.map = loader.load('assets/textures/textures/grid.jpg');
	planeMaterial.bumpMap = loader.load('assets/textures/textures/grid.jpg');
	planeMaterial.roughnessMap = loader.load('assets/textures/textures/grid.jpg');
	planeMaterial.bumpScale = 0.01;
	planeMaterial.metalness = 0.1;
	planeMaterial.roughness = 0.7;
	planeMaterial.envMap = reflectionCube;

	var maps = ['map', 'bumpMap', 'roughnessMap'];
	maps.forEach(function(mapName) {
		var texture = planeMaterial[mapName];
		texture.wrapS = THREE.RepeatWrapping;
		texture.wrapT = THREE.RepeatWrapping;
		texture.repeat.set(15, 15);
	});

	var renderer = new THREE.WebGLRenderer();
	renderer.shadowMap.enabled = true;
	renderer.setSize(window.innerWidth, window.innerHeight);
	renderer.setClearColor('rgb(13,14,138)');
	document.getElementById('regCanvas').appendChild(renderer.domElement);

	var controls = new THREE.OrbitControls(camera, renderer.domElement);

	update(renderer, scene, camera, controls, clock);

	return scene;
}

function getPlane(material, size, segments) {
	var geometry = new THREE.PlaneGeometry(size, size, segments, segments);
	material.side = THREE.DoubleSide;
	var obj = new THREE.Mesh(geometry, material);
	obj.receiveShadow = true;
	obj.castShadow = true;
	obj.visible = false;

	return obj;
}

function getMaterial(type, color) {
	var selectedMaterial;
	var materialOptions = {
		color: color === undefined ? 'rgb(255, 255, 255)' : color,
		wireframe: true,
	};

	switch (type) {
		case 'basic':
			selectedMaterial = new THREE.MeshBasicMaterial(materialOptions);
			break;
		case 'lambert':
			selectedMaterial = new THREE.MeshLambertMaterial(materialOptions);
			break;
		case 'phong':
			selectedMaterial = new THREE.MeshPhongMaterial(materialOptions);
			break;
		case 'standard':
			selectedMaterial = new THREE.MeshStandardMaterial(materialOptions);
			break;
		default: 
			selectedMaterial = new THREE.MeshBasicMaterial(materialOptions);
			break;
	}

	return selectedMaterial;
}

//mini light bulb
function getSphere(size) {
	var geometry = new THREE.SphereGeometry(size, 24, 24);
	var material = new THREE.MeshBasicMaterial({
		color: 'rgb(255, 255, 255)'
	});
	var mesh = new THREE.Mesh(
		geometry,
		material 
	);
	mesh.visible = false;

	return mesh;
}

function getPointLight(intensity) {
	var light = new THREE.PointLight(0xffffff, intensity);
	light.castShadow = true;

	return light;
}

function getSpotLight(intensity) {
	var light = new THREE.SpotLight(0xffffff, intensity);
	light.castShadow = true;

	light.shadow.bias = 0.001;
	light.shadow.mapSize.width = 2048;
	light.shadow.mapSize.height = 2048;

	return light;
}

function getDirectionalLight(intensity) {
	var light = new THREE.DirectionalLight(0xffffff, intensity);
	light.castShadow = true;

	light.shadow.camera.left = -40;
	light.shadow.camera.bottom = -40;
	light.shadow.camera.right = 40;
	light.shadow.camera.top = 40;

	light.shadow.mapSize.width = 4096;
	light.shadow.mapSize.height = 4096;

	return light;
}

function update(renderer, scene, camera, controls, clock) {
	renderer.render(
		scene,
		camera
	);

	controls.update();
	TWEEN.update();

	requestAnimationFrame(function() {
		update(renderer, scene, camera, controls, clock);
	})
}

var scene = init();