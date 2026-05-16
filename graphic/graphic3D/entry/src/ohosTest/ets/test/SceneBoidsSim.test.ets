/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  BoidsSimParameters,
  BoidsSimPlugin,
  Scene,
  SphereGeometry,
} from '@ohos.graphics.scene'

import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size,
} from '@ohos/hypium'

export default function sceneBoidsSimTest() {
  describe('sceneBoidsSimTest', () => {
    const BOIDS_PLUGIN_ID = "a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d";

    /**
     * @tc.name   testBoidsSimPlugin_getDefaultBoidsSimWorld
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1800
     * @tc.desc   Test getDefaultBoidsSimWorld returns valid world when plugin loaded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimPlugin_getDefaultBoidsSimWorld', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimPlugin_getDefaultBoidsSimWorld";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        let scene = await Scene.load();

        let worldBeforePlugin = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        expect(worldBeforePlugin).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialVelocity_defaultValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0100
     * @tc.desc   Test initialVelocity default value is (0,0,0) when not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialVelocity_defaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialVelocity_defaultValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        expect(renderContext != null).assertTrue();
        let pluginLoaded = await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);
        expect(pluginLoaded).assertTrue();

        let scene = await Scene.load();
        expect(scene != null).assertTrue();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;
        expect(rootNode != null).assertTrue();

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        sphereGeom.segmentCount = 16;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        expect(world != null).assertTrue();

        let params: BoidsSimParameters = {};
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.initialVelocity!.x).assertEqual(0);
        expect(retrieved!.initialVelocity!.y).assertEqual(0);
        expect(retrieved!.initialVelocity!.z).assertEqual(0);
        console.info(msg + " end ");

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialVelocity_setValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0200
     * @tc.desc   Test initialVelocity can be set and retrieved correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialVelocity_setValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialVelocity_setValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = { initialVelocity: { x: 1, y: 2, z: 3 } };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.initialVelocity!.x).assertEqual(1);
        expect(retrieved!.initialVelocity!.y).assertEqual(2);
        expect(retrieved!.initialVelocity!.z).assertEqual(3);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialPosition_defaultValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0300
     * @tc.desc   Test initialPosition default value is (NaN,NaN,NaN) when not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialPosition_defaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialPosition_defaultValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {};
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(Number.isNaN(retrieved!.initialPosition!.x)).assertTrue();
        expect(Number.isNaN(retrieved!.initialPosition!.y)).assertTrue();
        expect(Number.isNaN(retrieved!.initialPosition!.z)).assertTrue();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialPosition_setValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0400
     * @tc.desc   Test initialPosition can be set and retrieved correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialPosition_setValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialPosition_setValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = { initialPosition: { x: 5, y: -1, z: 2.5 } };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.initialPosition!.x).assertEqual(5);
        expect(retrieved!.initialPosition!.y).assertEqual(-1);
        expect(retrieved!.initialPosition!.z).assertEqual(2.5);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialRotation_defaultValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0500
     * @tc.desc   Test initialRotation default value is (NaN,NaN,NaN,NaN) when not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialRotation_defaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialRotation_defaultValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {};
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(Number.isNaN(retrieved!.initialRotation!.x)).assertTrue();
        expect(Number.isNaN(retrieved!.initialRotation!.y)).assertTrue();
        expect(Number.isNaN(retrieved!.initialRotation!.z)).assertTrue();
        expect(Number.isNaN(retrieved!.initialRotation!.w)).assertTrue();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_initialRotation_setValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0600
     * @tc.desc   Test initialRotation can be set and retrieved correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_initialRotation_setValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_initialRotation_setValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = { initialRotation: { x: 0, y: 0.70710678, z: 0, w: 0.70710678 } };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.initialRotation!.x).assertEqual(0);
        expect(Math.abs(retrieved!.initialRotation!.y - 0.70710678) < 0.0001).assertTrue();
        expect(retrieved!.initialRotation!.z).assertEqual(0);
        expect(Math.abs(retrieved!.initialRotation!.w - 0.70710678) < 0.0001).assertTrue();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_boundaryMinMax_defaultValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0700
     * @tc.desc   Test boundaryMinPos and boundaryMaxPos default values are (0,0,0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_boundaryMinMax_defaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_boundaryMinMax_defaultValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {};
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.boundaryMinPos!.x).assertEqual(0);
        expect(retrieved!.boundaryMinPos!.y).assertEqual(0);
        expect(retrieved!.boundaryMinPos!.z).assertEqual(0);
        expect(retrieved!.boundaryMaxPos!.x).assertEqual(0);
        expect(retrieved!.boundaryMaxPos!.y).assertEqual(0);
        expect(retrieved!.boundaryMaxPos!.z).assertEqual(0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_boundaryMinMax_setValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0800
     * @tc.desc   Test boundaryMinPos and boundaryMaxPos can be set correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_boundaryMinMax_setValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_boundaryMinMax_setValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {
          boundaryMinPos: { x: -5, y: -1, z: -2.5 },
          boundaryMaxPos: { x: 5, y: 1, z: 2.5 }
        };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.boundaryMinPos!.x).assertEqual(-5);
        expect(retrieved!.boundaryMaxPos!.x).assertEqual(5);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_rangeValues_zero
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_0900
     * @tc.desc   Test all range-restricted parameters with boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_rangeValues_zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_rangeValues_zero";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {
          maxVelocityMag: 0,
          maxAccelerationMag: 0,
          maxTurnRate: { x: 0, y: 0, z: 0 },
          separationWeight: 0,
          separationDistance: 0,
          alignmentWeight: 0,
          alignmentDistance: 0,
          cohesionWeight: 0,
          cohesionDistance: 0,
          boundaryWeight: 0,
          boundaryDistance: 0,
          gravityWeight: 0,
          repulsionWeight: 0
        };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.maxVelocityMag).assertEqual(0);
        expect(retrieved!.maxAccelerationMag).assertEqual(0);
        expect(retrieved!.maxTurnRate!.x).assertEqual(0);
        expect(retrieved!.maxTurnRate!.y).assertEqual(0);
        expect(retrieved!.maxTurnRate!.z).assertEqual(0);
        expect(retrieved!.separationWeight).assertEqual(0);
        expect(retrieved!.separationDistance).assertEqual(0);
        expect(retrieved!.alignmentWeight).assertEqual(0);
        expect(retrieved!.alignmentDistance).assertEqual(0);
        expect(retrieved!.cohesionWeight).assertEqual(0);
        expect(retrieved!.cohesionDistance).assertEqual(0);
        expect(retrieved!.boundaryWeight).assertEqual(0);
        expect(retrieved!.boundaryDistance).assertEqual(0);
        expect(retrieved!.gravityWeight).assertEqual(0);
        expect(retrieved!.repulsionWeight).assertEqual(0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimParameters_rangeValues_positive
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1000
     * @tc.desc   Test all range-restricted parameters with positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimParameters_rangeValues_positive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimParameters_rangeValues_positive";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        let params: BoidsSimParameters = {
          maxVelocityMag: 0.625,
          maxAccelerationMag: 39.0625,
          maxTurnRate: { x: 1.5, y: 2.0, z: 2.5 },
          separationWeight: 4.0,
          separationDistance: 5.0,
          alignmentWeight: 4.0,
          alignmentDistance: 6.0,
          cohesionWeight: 1.0,
          cohesionDistance: 7.0,
          boundaryWeight: 3.0,
          boundaryDistance: 8.0,
          gravityWeight: 2.0,
          repulsionWeight: 2.0
        };
        world!.addBoidsSimComponent(geometry, params);

        let retrieved = world!.getBoidsSimComponent(geometry);
        expect(retrieved!.maxVelocityMag).assertEqual(0.625);
        expect(retrieved!.maxAccelerationMag).assertEqual(39.0625);
        expect(retrieved!.maxTurnRate!.x).assertEqual(1.5);
        expect(retrieved!.maxTurnRate!.y).assertEqual(2.0);
        expect(retrieved!.maxTurnRate!.z).assertEqual(2.5);
        expect(retrieved!.separationWeight).assertEqual(4.0);
        expect(retrieved!.separationDistance).assertEqual(5.0);
        expect(retrieved!.alignmentWeight).assertEqual(4.0);
        expect(retrieved!.alignmentDistance).assertEqual(6.0);
        expect(retrieved!.cohesionWeight).assertEqual(1.0);
        expect(retrieved!.cohesionDistance).assertEqual(7.0);
        expect(retrieved!.boundaryWeight).assertEqual(3.0);
        expect(retrieved!.boundaryDistance).assertEqual(8.0);
        expect(retrieved!.gravityWeight).assertEqual(2.0);
        expect(retrieved!.repulsionWeight).assertEqual(2.0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimGravityParameters_defaultAndSetValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1100
     * @tc.desc   Test BoidsSimGravityParameters radius and accelerationMag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimGravityParameters_defaultAndSetValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimGravityParameters_defaultAndSetValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        world!.addBoidsSimGravityComponent(geometry, {});

        world!.setBoidsSimGravityComponent(geometry, { radius: 0, accelerationMag: 0 });
        let retrieved = world!.getBoidsSimGravityComponent(geometry);
        expect(retrieved!.radius).assertEqual(0);
        expect(retrieved!.accelerationMag).assertEqual(0);

        world!.setBoidsSimGravityComponent(geometry, { radius: 6.0, accelerationMag: 16.0 });
        retrieved = world!.getBoidsSimGravityComponent(geometry);
        expect(retrieved!.radius).assertEqual(6.0);
        expect(retrieved!.accelerationMag).assertEqual(16.0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimRepulsionParameters_defaultAndSetValue
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1200
     * @tc.desc   Test BoidsSimRepulsionParameters radius and accelerationMag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimRepulsionParameters_defaultAndSetValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimRepulsionParameters_defaultAndSetValue";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        world!.addBoidsSimRepulsionComponent(geometry, {});

        world!.setBoidsSimRepulsionComponent(geometry, { radius: 0, accelerationMag: 0 });
        let retrieved = world!.getBoidsSimRepulsionComponent(geometry);
        expect(retrieved!.radius).assertEqual(0);
        expect(retrieved!.accelerationMag).assertEqual(0);

        world!.setBoidsSimRepulsionComponent(geometry, { radius: 4.0, accelerationMag: 16.0 });
        retrieved = world!.getBoidsSimRepulsionComponent(geometry);
        expect(retrieved!.radius).assertEqual(4.0);
        expect(retrieved!.accelerationMag).assertEqual(16.0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_playPauseStop
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1300
     * @tc.desc   Test play, pause, stop methods and isPlaying property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_playPauseStop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_playPauseStop";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);

        expect(world!.isPlaying).assertTrue();
        world!.pause();
        expect(world!.isPlaying).assertFalse();
        world!.play();
        expect(world!.isPlaying).assertTrue();
        world!.stop();
        expect(world!.isPlaying).assertFalse();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_addSetGetComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1400
     * @tc.desc   Test add, set, get methods for BoidsSimComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_addSetGetComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_addSetGetComponent";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        world!.addBoidsSimComponent(geometry, { maxVelocityMag: 1 });
        expect(world!.getBoidsSimComponent(geometry)!.maxVelocityMag).assertEqual(1);

        world!.setBoidsSimComponent(geometry, { maxVelocityMag: 2 });
        expect(world!.getBoidsSimComponent(geometry)!.maxVelocityMag).assertEqual(2);

        world!.removeBoidsSimComponent(geometry);
        expect(world!.getBoidsSimComponent(geometry)).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_addSetGetGravityComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1500
     * @tc.desc   Test add, set, get methods for BoidsSimGravityComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_addSetGetGravityComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_addSetGetGravityComponent";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        world!.addBoidsSimGravityComponent(geometry, { radius: 6 });
        expect(world!.getBoidsSimGravityComponent(geometry)!.radius).assertEqual(6);

        world!.setBoidsSimGravityComponent(geometry, { radius: 10 });
        expect(world!.getBoidsSimGravityComponent(geometry)!.radius).assertEqual(10);

        world!.removeBoidsSimGravityComponent(geometry);
        expect(world!.getBoidsSimGravityComponent(geometry)).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_addSetGetRepulsionComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1600
     * @tc.desc   Test add, set, get methods for BoidsSimRepulsionComponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_addSetGetRepulsionComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_addSetGetRepulsionComponent";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        world!.addBoidsSimRepulsionComponent(geometry, { radius: 4 });
        expect(world!.getBoidsSimRepulsionComponent(geometry)!.radius).assertEqual(4);

        world!.setBoidsSimRepulsionComponent(geometry, { radius: 2 });
        expect(world!.getBoidsSimRepulsionComponent(geometry)!.radius).assertEqual(2);

        world!.removeBoidsSimRepulsionComponent(geometry);
        expect(world!.getBoidsSimRepulsionComponent(geometry)).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_getComponentNullWhenNotExists
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1700
     * @tc.desc   Test get methods return null when component doesn't exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_getComponentNullWhenNotExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_getComponentNullWhenNotExists";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);
        expect(world!.getBoidsSimComponent(geometry)).assertNull();
        expect(world!.getBoidsSimGravityComponent(geometry)).assertNull();
        expect(world!.getBoidsSimRepulsionComponent(geometry)).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimPlugin_getDefaultBoidsSimWorld_nullScene
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_1900
     * @tc.desc   Test getDefaultBoidsSimWorld with null scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimPlugin_getDefaultBoidsSimWorld_nullScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimPlugin_getDefaultBoidsSimWorld_nullScene";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        expect(BoidsSimPlugin.getDefaultBoidsSimWorld(null)).assertNull();
        expect(BoidsSimPlugin.getDefaultBoidsSimWorld(undefined)).assertNull();

        let scene = await Scene.load();
        expect(BoidsSimPlugin.getDefaultBoidsSimWorld(scene) != null).assertTrue();
        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_nullNodeParameter
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_2000
     * @tc.desc   Test methods with null node parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_nullNodeParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_nullNodeParameter";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);

        world!.addBoidsSimComponent(null, {});
        expect(world!.getBoidsSimComponent(null)).assertNull();
        world!.removeBoidsSimComponent(null);
        expect(world!.getBoidsSimComponent(null)).assertNull();

        world!.addBoidsSimGravityComponent(null, {});
        expect(world!.getBoidsSimGravityComponent(null)).assertNull();
        world!.removeBoidsSimGravityComponent(null);
        expect(world!.getBoidsSimGravityComponent(null)).assertNull();

        world!.addBoidsSimRepulsionComponent(null, {});
        expect(world!.getBoidsSimRepulsionComponent(null)).assertNull();
        world!.removeBoidsSimRepulsionComponent(null);
        expect(world!.getBoidsSimRepulsionComponent(null)).assertNull();

        world!.addBoidsSimComponent(undefined, {});
        expect(world!.getBoidsSimComponent(undefined)).assertNull();
        world!.removeBoidsSimComponent(undefined);
        expect(world!.getBoidsSimComponent(undefined)).assertNull();

        world!.addBoidsSimGravityComponent(undefined, {});
        expect(world!.getBoidsSimGravityComponent(undefined)).assertNull();
        world!.removeBoidsSimGravityComponent(undefined);
        expect(world!.getBoidsSimGravityComponent(undefined)).assertNull();

        world!.addBoidsSimRepulsionComponent(undefined, {});
        expect(world!.getBoidsSimRepulsionComponent(undefined)).assertNull();
        world!.removeBoidsSimRepulsionComponent(undefined);
        expect(world!.getBoidsSimRepulsionComponent(undefined)).assertNull();

        world!.setBoidsSimComponent(null, {});
        expect(world!.getBoidsSimComponent(null)).assertNull();
        world!.setBoidsSimGravityComponent(null, {});
        expect(world!.getBoidsSimGravityComponent(null)).assertNull();
        world!.setBoidsSimRepulsionComponent(null, {});
        expect(world!.getBoidsSimRepulsionComponent(null)).assertNull();

        world!.setBoidsSimComponent(undefined, {});
        expect(world!.getBoidsSimComponent(undefined)).assertNull();
        world!.setBoidsSimGravityComponent(undefined, {});
        expect(world!.getBoidsSimGravityComponent(undefined)).assertNull();
        world!.setBoidsSimRepulsionComponent(undefined, {});
        expect(world!.getBoidsSimRepulsionComponent(undefined)).assertNull();

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testBoidsSimWorld_nullParamsParameter
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENEBOIDSSIM_2100
     * @tc.desc   Test add methods with null/undefined params parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoidsSimWorld_nullParamsParameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testBoidsSimWorld_nullParamsParameter";
      console.info(msg + ' begin ');
      try {
        let renderContext = Scene.getDefaultRenderContext();
        await renderContext!.loadPlugin(BOIDS_PLUGIN_ID);

        let scene = await Scene.load();
        let rf = scene!.getResourceFactory();
        let rootNode = scene!.root;

        let sphereGeom = new SphereGeometry();
        sphereGeom.radius = 1;
        let meshRes = await rf.createMesh({ name: "testMesh" }, sphereGeom);
        let geometry = await rf.createGeometry({ name: "testNode" }, meshRes);
        rootNode!.children.append(geometry);

        let world = BoidsSimPlugin.getDefaultBoidsSimWorld(scene);

        world!.addBoidsSimComponent(geometry, null);
        expect(world!.getBoidsSimComponent(geometry)).assertNull();

        world!.addBoidsSimComponent(geometry, undefined);
        expect(world!.getBoidsSimComponent(geometry)).assertNull();

        world!.addBoidsSimGravityComponent(geometry, null);
        expect(world!.getBoidsSimGravityComponent(geometry)).assertNull();

        world!.addBoidsSimGravityComponent(geometry, undefined);
        expect(world!.getBoidsSimGravityComponent(geometry)).assertNull();

        world!.addBoidsSimRepulsionComponent(geometry, null);
        expect(world!.getBoidsSimRepulsionComponent(geometry)).assertNull();

        world!.addBoidsSimRepulsionComponent(geometry, undefined);
        expect(world!.getBoidsSimRepulsionComponent(geometry)).assertNull();

        world!.addBoidsSimComponent(geometry, { maxVelocityMag: 1 });
        world!.setBoidsSimComponent(geometry, null);
        expect(world!.getBoidsSimComponent(geometry)!.maxVelocityMag).assertEqual(1);
        world!.setBoidsSimComponent(geometry, undefined);
        expect(world!.getBoidsSimComponent(geometry)!.maxVelocityMag).assertEqual(1);

        world!.addBoidsSimGravityComponent(geometry, { radius: 5, accelerationMag: 10 });
        world!.setBoidsSimGravityComponent(geometry, null);
        let gravity = world!.getBoidsSimGravityComponent(geometry);
        expect(gravity!.radius).assertEqual(5);
        expect(gravity!.accelerationMag).assertEqual(10);
        world!.setBoidsSimGravityComponent(geometry, undefined);
        gravity = world!.getBoidsSimGravityComponent(geometry);
        expect(gravity!.radius).assertEqual(5);
        expect(gravity!.accelerationMag).assertEqual(10);

        world!.addBoidsSimRepulsionComponent(geometry, { radius: 3, accelerationMag: 8 });
        world!.setBoidsSimRepulsionComponent(geometry, null);
        let repulsion = world!.getBoidsSimRepulsionComponent(geometry);
        expect(repulsion!.radius).assertEqual(3);
        expect(repulsion!.accelerationMag).assertEqual(8);
        world!.setBoidsSimRepulsionComponent(geometry, undefined);
        repulsion = world!.getBoidsSimRepulsionComponent(geometry);
        expect(repulsion!.radius).assertEqual(3);
        expect(repulsion!.accelerationMag).assertEqual(8);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}