/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { Vec2, Rotation3, SceneResourceParameters, SceneNodeParameters, Scene, SceneResourceType,
  NodeType,
  RenderingPipelineType,
  CameraParameters,
  EffectParameters,
  Effect,
  Camera,
  PCFConfig,
  ShadowAlgorithmType} from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'

export default function sceneTest() {
  describe('sceneTest', ()=> {
    let scene: Scene | null = null;
    let rf: scene3d.SceneResourceFactory;
    /**
     * @tc.name   testSceneLoad_01
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0100
     * @tc.desc   Used to load the resource through the incoming resource path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneLoad_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneLoad_01";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        expect(scene != undefined).assertTrue();

        // Test null parameter
        try {
          let nullScene = await Scene.load(null);
          expect(nullScene != null).assertTrue();
          console.info(msg + " load with null parameter succeeded");
        } catch (err) {
          console.info(msg + " load with null parameter threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter
        try {
          let undefinedScene = await Scene.load(undefined);
          expect(undefinedScene != null).assertTrue();
          console.info(msg + " load with undefined parameter succeeded");
        } catch (err) {
          console.info(msg + " load with undefined parameter threw error: " + JSON.stringify(err));
        }

        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")) ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneGetNodeByPath
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0200
     * @tc.desc   Nodes are obtained from paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        let node = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        let node1 = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', scene3d.NodeType.GEOMETRY);
        console.info(msg + " scene?.getNodeByPath node1: " + JSON.stringify(node1));
        expect(node1 != null).assertTrue();
        console.info(msg + " node1 != null ");
        expect(node1?.nodeType).assertEqual(scene3d.NodeType.GEOMETRY);
        let node2 = scene.getNodeByPath('rootNode_/Scene/node_123');
        expect(node2).assertNull();

        // Test path parameter with empty string
        let emptyPathNode = scene?.getNodeByPath('');
        console.info(msg + " getNodeByPath with empty string: " + JSON.stringify(emptyPathNode));
        expect(emptyPathNode != null).assertTrue();

        // Test path parameter with null
        try {
          let nullPathNode = scene?.getNodeByPath(null);
          console.info(msg + " getNodeByPath with null: " + JSON.stringify(nullPathNode));
          expect(nullPathNode).assertNull();
        } catch (err) {
          console.info(msg + " getNodeByPath with null threw error: " + JSON.stringify(err));
        }

        // Test path parameter with undefined
        try {
          let undefinedPathNode = scene?.getNodeByPath(undefined);
          console.info(msg + " getNodeByPath with undefined: " + JSON.stringify(undefinedPathNode));
          expect(undefinedPathNode).assertNull();
        } catch (err) {
          console.info(msg + " getNodeByPath with undefined threw error: " + JSON.stringify(err));
        }

        // Test type parameter with null
        let node3 = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', null);
        console.info(msg + " getNodeByPath with null type: " + JSON.stringify(node3));
        expect(node3).assertNull();

        // Test type parameter with undefined
        let node4 = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', undefined);
        console.info(msg + " getNodeByPath with undefined type: " + JSON.stringify(node4));
        expect(node4).assertNull();

        done();
      } catch (err) {
        console.info(msg + " Failed in scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514') " +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testGetResourceFactory
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0300
     * @tc.desc   Used to get the Scene Asset Factory object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetResourceFactory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testGetResourceFactory";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        scene?.getResourceFactory();
        console.info(msg + " Succeed in scene.getResourceFactory() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.getResourceFactory() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneEnvironment
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0400
     * @tc.desc   Test Scene.environment property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneEnvironment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneEnvironment";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();

        // Test get environment property
        let env = scene?.environment;
        console.info(msg + " environment property: " + JSON.stringify(env));
        expect(env != null).assertTrue();

        // Test set environment property
        try {
          let newEnv = await rf.createEnvironment({ name: "testEnv", uri: $rawfile("gltf/Environment/glTF/images/quarry_02_2k_radiance.ktx") });
          console.info(msg + " created environment: " + JSON.stringify(newEnv));
          expect(newEnv != null).assertTrue();

          scene.environment = newEnv;
          console.info(msg + " set environment property: " + JSON.stringify(scene?.environment));
          expect(scene?.environment != null).assertTrue();
        } catch (envErr) {
          console.info(msg + " set environment threw error: " + JSON.stringify(envErr));
        }

        done();
      } catch (err) {
        console.info(msg + " Failed in scene.environment " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testDestroy
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0500
     * @tc.desc   Used to destroy the scene and release all scene resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testDestroy";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        expect(scene?.root != undefined).assertTrue;
        console.info(msg + " scene?.root is defined ");
        scene?.destroy();
        console.info(msg + " Succeed in scene.destroy() ");
        expect(scene?.root).assertUndefined();
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.destroy() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneResourceParameters
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0600
     * @tc.desc   Used to provide the name of the scene asset and the path to the asset file required for the 3D scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourceParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSceneResourceParameters";
      console.info(msg + ' begin ');
      try {
        let imageParameters: SceneResourceParameters = { name: "Cube", uri: $rawfile("gltf/Cube/glTF/Cube_BaseColor.png") }
        expect(imageParameters.name).assertEqual("Cube");
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneResourceParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneNodeParameters
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0700
     * @tc.desc   A scene node parameter object, which is used to provide a name and path in the scene node hierarchy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneNodeParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSceneNodeParameters";
      console.info(msg + ' begin ');
      try {
        let nodeParameters: SceneNodeParameters = { name: "Helmet", path: "rootNode_/Scene/node_damagedHelmet_-6514" }
        expect(nodeParameters.name).assertEqual("Helmet");
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneNodeParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneType
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0800
     * @tc.desc   SystemCapability.ArkUI.Graphics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSceneType";
      console.info(msg + ' begin ');
      try {
        let ve2: Vec2 = {x:1, y:1};
        let rect: scene3d.Rect = {x:1, y:1, width:1, height:1};
        let rotation3: Rotation3 = {x:1, y:1, z:1};
        expect(ve2.x).assertEqual(1);
        expect(rect.x).assertEqual(1);
        expect(rotation3.x).assertEqual(1);
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneRenderFrame
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_0900
     * @tc.desc   Used to see if the scene is single-frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneRenderFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneRenderFrame";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        scene?.renderFrame({ alwaysRender: true });
        expect(scene?.renderFrame()).assertTrue();
        console.info(msg + " Succeed in scene?.renderFrame() ");

        // Test alwaysRender: false
        let falseResult = scene?.renderFrame({ alwaysRender: false });
        expect(falseResult != null).assertTrue();
        console.info(msg + " Succeed in scene?.renderFrame({ alwaysRender: false }) ");

        // Test params with null
        try {
          let nullParamsResult = scene?.renderFrame(null);
          console.info(msg + " renderFrame with null params: " + JSON.stringify(nullParamsResult));
          expect(nullParamsResult != null).assertTrue();
        } catch (err) {
          console.info(msg + " renderFrame with null params threw error: " + JSON.stringify(err));
        }

        // Test params with undefined
        try {
          let undefinedParamsResult = scene?.renderFrame(undefined);
          console.info(msg + " renderFrame with undefined params: " + JSON.stringify(undefinedParamsResult));
          expect(undefinedParamsResult != null).assertTrue();
        } catch (err) {
          console.info(msg + " renderFrame with undefined params threw error: " + JSON.stringify(err));
        }

        scene.destroy();
        expect(scene.renderFrame()).assertFalse();
        done();
      } catch (err) {
        console.info(msg + " Failed in scene?.renderFrame() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testRenderParameters
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1000
     * @tc.desc   Used to set if the scene is single-frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testRenderParameters";
      console.info(msg + ' begin ');
      try {
        let RenderParameters: scene3d.RenderParameters = { alwaysRender: true};
        expect(RenderParameters.alwaysRender).assertTrue();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is true ");
        RenderParameters = { alwaysRender: false}
        expect(RenderParameters.alwaysRender).assertFalse();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene3d.RenderParameters " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSphereGeometry
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1100
     * @tc.desc   Used to set the properties of the sphere
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSphereGeometry";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        let sphereGeom = new scene3d.SphereGeometry();
        expect(sphereGeom != null).assertTrue();
        expect(sphereGeom.geometryType).assertEqual(scene3d.GeometryType.SPHERE);
        console.info(msg + " Succeed in scene3d.SphereGeometry() ");
        sphereGeom.radius = 1;
        expect(sphereGeom.radius).assertEqual(1);
        console.info(msg + " Succeed in sphereGeom.radius ");
        sphereGeom.segmentCount = Math.floor(26);
        expect(sphereGeom.segmentCount).assertEqual(26);
        console.info(msg + " Succeed in sphereGeom.segmentCount ");
        let meshRes3: scene3d.MeshResource = await rf.createMesh({name: "resource name not used at the moment "}, sphereGeom);
        expect(meshRes3 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        expect(meshRes3.resourceType).assertEqual(SceneResourceType.MESH_RESOURCE)
        console.info(msg + " meshRes3.resourceType is SceneResourceType.MESH_RESOURCE ");
        let geometry3 = await rf.createGeometry({name: "balluro"}, meshRes3);
        expect(geometry3 != null).assertTrue();
        console.info(msg + " Succeed in createGeometry ");
        scene?.root?.children.append(geometry3);
        done();
      } catch (err) {
        console.info(msg + " Failed in testSphereGeometry " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTRIANGLE_LIST
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1200
     * @tc.desc   Used to set the properties of the custom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTRIANGLE_LIST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testTRIANGLE_LIST";
      console.info(msg + ' begin ');
      try {
        let customGeom = new scene3d.CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in scene3d.CustomGeometry() ");
        expect(customGeom.geometryType).assertEqual(scene3d.GeometryType.CUSTOM);
        customGeom.topology = 0;
        expect(customGeom.topology).assertEqual(scene3d.PrimitiveTopology.TRIANGLE_LIST);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_LIST ");
        customGeom.indices = [0, 1, 3, 3, 1, 2];
        expect(customGeom.indices[2]).assertEqual(3);
        console.info(msg + " Succeed in customGeom.indices of TRIANGLE_LIST ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testTRIANGLE_LIST " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTRIANGLE_STRIP
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1300
     * @tc.desc   Used to set the properties of the custom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTRIANGLE_STRIP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testTRIANGLE_STRIP";
      console.info(msg + ' begin ');
      try {
        let customGeom = new scene3d.CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in scene3d.CustomGeometry() ");
        expect(customGeom.geometryType).assertEqual(scene3d.GeometryType.CUSTOM);
        customGeom.topology = 1;
        expect(customGeom.topology).assertEqual(scene3d.PrimitiveTopology.TRIANGLE_STRIP);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_STRIP ");
        customGeom.indices = [0, 1, 3, 2];
        expect(customGeom.indices[2]).assertEqual(3);
        console.info(msg + " Succeed in customGeom.indices of TRIANGLE_STRIP ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testTRIANGLE_STRIP " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCustomGeometry
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1400
     * @tc.desc   Used to set the properties of the custom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCustomGeometry";
      console.info(msg + ' begin ');
      try {
        let customGeom = new scene3d.CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in scene3d.CustomGeometry() ");
        customGeom.topology = 0;
        expect(customGeom.topology).assertEqual(scene3d.PrimitiveTopology.TRIANGLE_LIST);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_LIST ");
        customGeom.vertices = [{x: 0, y: 1, z: 0}, {x: 0.5, y: 0, z: 0.3}, {x: 0, y: -1, z: 0}, {x: -0.5, y: 0, z: 0.3}];
        expect(customGeom.vertices[1].x).assertEqual(0.5);
        console.info(msg + " Succeed in customGeom.vertices ");
        customGeom.uvs = [{x: 0.5, y: 1}, {x: 1, y: 0.5}, {x: 0.5, y: 0}, {x: 0, y: 0.5}];
        expect(customGeom.uvs[0].x).assertEqual(0.5);
        console.info(msg + " Succeed in customGeom.uvs ");
        customGeom.normals = [{x: -1, y: 1, z: 0}, {x: 1, y: -1, z: 0}, {x: 1, y: 1, z: 0}, {x: 1, y: 1, z: 1}];
        expect(customGeom.normals[0].x).assertEqual(-1);
        console.info(msg + " Succeed in customGeom.normals ");
        customGeom.colors = [{r: 1, g: 0, b: 0, a:1}, {r: 0, g: 1, b: 0, a:1}, {r: 0, g: 0, b: 1, a:1}, {r: 1, g: 0, b: 1, a:1}];
        expect(customGeom.colors[0].r).assertEqual(1);
        console.info(msg + " Succeed in customGeom.colors ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCustomGeometry " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCreateScene_01
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1500
     * @tc.desc   Used to create a scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateScene_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateScene_01";
      console.info(msg + ' begin ');
      try {
        let scene1 = await rf.createScene($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene1 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateScene_01 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCreateScene_02
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1600
     * @tc.desc   Used to create a scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateScene_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateScene_02";
      console.info(msg + ' begin ');
      try {
        let scene2 = await rf.createScene();
        expect(scene2 != null).assertTrue();

        // Test null parameter (should create empty scene)
        let nullScene = await rf.createScene(null);
        expect(nullScene != null).assertTrue();
        console.info(msg + " createScene with null parameter created empty scene");

        // Test undefined parameter (should create empty scene)
        let undefinedScene = await rf.createScene(undefined);
        expect(undefinedScene != null).assertTrue();
        console.info(msg + " createScene with undefined parameter created empty scene");

        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateScene_02 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneLoad_02
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1700
     * @tc.desc   Used to load the resource through the incoming resource path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneLoad_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneLoad_02";
      console.info(msg + ' begin ');
      try {
        let scene3 = await Scene.load();
        expect(scene3 != null).assertTrue();
        expect(scene3 != undefined).assertTrue();
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene3.load() ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRaycastResult_node
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1800
     * @tc.desc   Verify raycast returns a valid hit node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastResult_node', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRaycastResult_node";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        console.info(msg +"scene loaded:", scene != null);
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ "name": "Camera" });
        expect(cam != null).assertTrue();

        let viewPosition: Vec2 = {x: 0, y: 0};
        let raycastParams: scene3d.RaycastParameters = {};
        let results: scene3d.RaycastResult[] = await cam.raycast(viewPosition, raycastParams);
        console.info(msg +"raycast results length:", results.length);
        expect(results.length > 0).assertTrue();

        let hitNode: scene3d.Node = results[0].node;
        console.info(msg +"hitNode:", hitNode.constructor?.name);
        expect(hitNode != null).assertTrue();
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_node " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRaycastResult_centerDistance
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_1900
     * @tc.desc   Verify centerDistance is a valid positive number in raycast result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastResult_centerDistance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRaycastResult_centerDistance";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        console.info(msg + "scene loaded:", scene != null);
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ "name": "Camera" });
        console.info(msg + "camera created:", cam != null);
        expect(cam != null).assertTrue();

        let viewPosition: Vec2 = {x: 0, y: 0};
        let raycastParams: scene3d.RaycastParameters = {};
        let results: scene3d.RaycastResult[] = await cam.raycast(viewPosition, raycastParams);
        console.info(msg + "raycast result count:", results.length);
        expect(results.length > 0).assertTrue();

        let distance: number = results[0].centerDistance;
        console.info(msg + "centerDistance value:", distance);
        expect(distance > 0).assertTrue();
        console.info(msg + "test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_centerDistance " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRaycastResult_hitPosition
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2000
     * @tc.desc   Verify hitPosition contains valid 3D coordinates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastResult_hitPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRaycastResult_hitPosition";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        console.info(msg + " scene loaded:", scene != null);
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ "name": "Camera" });
        console.info(msg + " camera created:", cam != null);
        expect(cam != null).assertTrue();

        let viewPosition: Vec2 = {x: 0, y: 0};
        let raycastParams: scene3d.RaycastParameters = {};
        let results: scene3d.RaycastResult[] = await cam.raycast(viewPosition, raycastParams);
        console.info(msg + " raycast result count:", results.length);
        expect(results.length > 0).assertTrue();

        let res: scene3d.Position3 = results[0].hitPosition;
        console.info(msg + ` hitPosition = {x: ${res.x}, y: ${res.y}, z: ${res.z}}`);
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_hitPosition " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRaycastResult_rootNode
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2100
     * @tc.desc   Verify rootNode in RaycastParameters filters raycast scope correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastResult_rootNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRaycastResult_rootNode";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded:", scene != null);
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ "name": "Camera" });
        console.info(msg + " camera created:", cam != null);
        expect(cam != null).assertTrue();

        let params1: scene3d.RaycastParameters = {};
        let results1: scene3d.RaycastResult[] = await cam.raycast({x:0, y:0}, params1);
        console.info(msg + " raycast without rootNode, hit count:", results1.length);
        expect(results1.length > 0).assertTrue();

        let someNode: scene3d.Node = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Node;
        console.info(msg + " rootNode obtained:", someNode?.name ?? "null");
        expect(someNode != null).assertTrue();
        let params2: scene3d.RaycastParameters = { rootNode: someNode };
        console.info(msg + " rootNode set in RaycastParameters:", params2.rootNode?.name ?? "null");
        expect(params2.rootNode).assertEqual(someNode);
        let results2: scene3d.RaycastResult[] = await cam.raycast({x:0, y:0}, params2);
        console.info(msg + " raycast with rootNode, hit count:", results2.length);
        expect(results2.length > 0).assertTrue();

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_rootNode " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderResourceFactory_createSampler
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2200
     * @tc.desc   Verify createSampler correctly creates a Sampler with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderResourceFactory_createSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testRenderResourceFactory_createSampler";
      console.info(msg + ' begin ');
      try {
        const scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        console.info(msg + " scene loaded:", scene != null);
        expect(scene != null).assertTrue();

        const rf: scene3d.RenderResourceFactory = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " getResourceFactory success (as RenderResourceFactory)");

        const sampler: scene3d.Sampler = await rf.createSampler({ name: "testSampler" });
        expect(sampler != null).assertTrue();
        console.info(msg + " createSampler success:", sampler);

        sampler.magFilter = scene3d.SamplerFilter.LINEAR;
        expect(sampler.magFilter).assertEqual(scene3d.SamplerFilter.LINEAR);
        console.info(msg + " sampler.magFilter set and verified");

        sampler.addressModeU = scene3d.SamplerAddressMode.REPEAT;
        expect(sampler.addressModeU).assertEqual(scene3d.SamplerAddressMode.REPEAT);
        console.info(msg + " sampler.addressModeU set and verified");

        // Test null parameter
        let nullSampler = await rf.createSampler(null);
        expect(nullSampler != null).assertTrue();
        console.info(msg + " createSampler with null parameter returned undefined");

        // Test undefined parameter
        let undefinedSampler = await rf.createSampler(undefined);
        expect(undefinedSampler != null).assertTrue();
        console.info(msg + " createSampler with undefined parameter returned undefined");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRenderResourceFactory_createSampler " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2300
     * @tc.desc   Verified whether the SceneComponent class can correctly set component names,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneComponent";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.glb'));
        console.info(msg + ' scene loaded:', scene != null);
        expect(scene != null).assertTrue();
        let rootNode = scene.root;
        console.info(msg + ' root node obtained:', rootNode?.name ?? "null");
        expect(rootNode != null).assertTrue();

        let component: scene3d.SceneComponent = await scene.createComponent(rootNode, "RenderConfigurationComponent");
        expect(component != null).assertTrue();
        console.info(msg + ' component created:', component?.name);
        expect(component.name).assertEqual("RenderConfigurationComponent");

        component.property['string'] = "This is a test component";
        console.info(msg + ' string property set to:', component.property['string']);
        expect(component.property['string']).assertEqual("This is a test component");
        component.property['Boolean'] = true;
        console.info(msg + ' Boolean property set to:', component.property['Boolean']);
        expect(component.property['Boolean']).assertEqual(true);
        component.property['number'] = 3.14;
        console.info(msg + ' number property set to:', component.property['number']);
        expect(component.property['number']).assertEqual(3.14);
        component.property['Vec3'] = {x:1, y:2, z:3};
        console.info(msg + ' Vec3 property set to:', JSON.stringify(component.property['Vec3']));
        expect(component.property['Vec3'].y).assertEqual(2);

        component.property['NumberArray'] = [1, 2, 3];
        expect(component.property['NumberArray'].length).assertEqual(3);
        expect(component.property['NumberArray'][1]).assertEqual(2);
        component.property['StringArray'] = ["hello", "world"];
        expect(component.property['StringArray'][0]).assertEqual("hello");
        component.property['Vec3Array'] = [
          { x: 1, y: 1, z: 1 },
          { x: 2, y: 2, z: 2 }
        ];
        expect(component.property['Vec3Array'][1].z).assertEqual(2);
        component.property['Null'] = null;
        expect(component.property['Null']).assertEqual(null);
        console.info(msg + ' Null property set to:', component.property['Null']);
        component.property['UndefinedValue'] = undefined;
        console.info(msg + ' UndefinedValue property set to:', component.property['UndefinedValue']);
        expect(component.property['UndefinedValue']).assertEqual(undefined);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneComponent " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderContext_getRenderResourceFactory
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2400
     * @tc.desc   Verify getRenderResourceFactory() returns a valid RenderResourceFactory instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderContext_getRenderResourceFactory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testRenderContext_getRenderResourceFactory";
        console.info(msg + ' begin ');
        try {
          let renderContext: scene3d.RenderContext | null = Scene.getDefaultRenderContext();
          console.info(msg + " default renderContext:", renderContext);
          expect(renderContext != null).assertTrue();

          if (renderContext != null) {
            let factory: scene3d.RenderResourceFactory = renderContext?.getRenderResourceFactory();
            console.info(msg + " render resource factory:", factory);
            expect(factory != null).assertTrue();
          }
          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testRenderContext_getRenderResourceFactory " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRenderContext_loadPlugin
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2500
     * @tc.desc   Verify loadPlugin() returns a valid boolean even when loading an empty or non-existent plugin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderContext_loadPlugin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        let msg = "============================testRenderContext_loadPlugin";
        console.info(msg + ' begin ');
        try {
          let renderContext = Scene.getDefaultRenderContext();
          console.info(msg + " default renderContext:", renderContext);
          expect(renderContext != null).assertTrue();

          if (renderContext != null) {
            let loadFail = await renderContext?.loadPlugin("NonExistentPlugin");
            console.info(msg + ' plugin "NonExistentPlugin" load result:', loadFail);
            expect(loadFail).assertFalse();
            let pluginName = '74c2dde9-8134-4471-af49-66ea20993c41'
            let plugin = await renderContext?.loadPlugin(pluginName);
            console.info(msg + ' plugin "' + pluginName + '" load result:', plugin);
            expect(plugin).assertTrue();

            // Test with empty string parameter
            let loadEmpty = await renderContext?.loadPlugin("");
            console.info(msg + ' plugin "" (empty string) load result:', loadEmpty);
            expect(loadEmpty).assertFalse();

            // Test with null parameter
            try {
              let loadNull = await renderContext?.loadPlugin(null);
              console.info(msg + ' plugin null load result:', loadNull);
              expect(loadNull).assertUndefined();
            } catch (nullErr) {
              console.info(msg + ' plugin null parameter caused exception (expected):', JSON.stringify(nullErr));
            }

            // Test with undefined parameter
            try {
              let loadUndefined = await renderContext?.loadPlugin(undefined);
              console.info(msg + ' plugin undefined load result:', loadUndefined);
              expect(loadUndefined).assertUndefined();
            } catch (undefinedErr) {
              console.info(msg + ' plugin undefined parameter caused exception (expected):', JSON.stringify(undefinedErr));
            }
          }
          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testRenderContext_loadPlugin " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testCreateComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2600
     * @tc.desc   Verify whether the basic functional behavior of the CreateComponent method meets expectations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        let msg = "============================testCreateComponent";
        console.info(msg + ' begin ');
        try {
          scene = await Scene.load($rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb'));
          console.info(msg + " scene loaded:", scene);
          expect(scene != null).assertTrue();

          let rootNode: scene3d.Node | null = scene.root;
          console.info(msg + " root node:", rootNode);
          expect(rootNode != null).assertTrue();

          let componentName: string = "RenderConfigurationComponent";
          console.info(msg + ` creating component: ${componentName}`);
          let component: scene3d.SceneComponent = await scene.createComponent(rootNode, componentName);
          console.info(msg + ` created component ${componentName}:`, component);
          expect(component != null).assertTrue();
          console.info(msg + ` component name:`, component?.name);
          expect(component.name).assertEqual(componentName);
          
          // Test node parameter with null
          try {
            let nullNodeComponent = await scene.createComponent(null, componentName);
            console.info(msg + " createComponent with null node: " + JSON.stringify(nullNodeComponent));
            expect().assertFail();
          } catch (err) {
            console.info(msg + " createComponent with null node threw error: " + JSON.stringify(err));
          }

          // Test node parameter with undefined
          try {
            let undefinedNodeComponent = await scene.createComponent(undefined, componentName);
            console.info(msg + " createComponent with undefined node: " + JSON.stringify(undefinedNodeComponent));
            expect().assertFail();
          } catch (err) {
            console.info(msg + " createComponent with undefined node threw error: " + JSON.stringify(err));
          }

          // Test name parameter with empty string
          try {
            let emptyNameComponent = await scene.createComponent(rootNode, "");
            console.info(msg + " createComponent with empty string name: " + JSON.stringify(emptyNameComponent));
            expect().assertFail();
          } catch (err) {
            console.info(msg + " createComponent with empty string name threw error: " + JSON.stringify(err));
          }

          // Test name parameter with null
          try {
            let nullNameComponent = await scene.createComponent(rootNode, null);
            console.info(msg + " createComponent with null name: " + JSON.stringify(nullNameComponent));
            expect(nullNameComponent).assertUndefined();
          } catch (err) {
            console.info(msg + " createComponent with null name threw error: " + JSON.stringify(err));
          }

          // Test name parameter with undefined
          try {
            let undefinedNameComponent = await scene.createComponent(rootNode, undefined);
            console.info(msg + " createComponent with undefined name: " + JSON.stringify(undefinedNameComponent));
            expect(undefinedNameComponent).assertUndefined();
          } catch (err) {
            console.info(msg + " createComponent with undefined name threw error: " + JSON.stringify(err));
          }

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testCreateComponent " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testgetComponent
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2700
     * @tc.desc   Verify whether the basic functional behavior of the getComponent method meets expectations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        let msg = "============================testgetComponent";
        console.info(msg + ' begin ');
        try {
          scene = await Scene.load($rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.glb'));
          console.info(msg +"Scene loaded:", scene);
          expect(scene != null).assertTrue();

          let rootNode: scene3d.Node | null = scene.root;
          console.info(msg + " root node:", rootNode);
          expect(rootNode != null).assertTrue();

          let componentName: string = "RenderConfigurationComponent";
          console.info(msg +`Creating component: ${componentName}`);

          let createdComponent: scene3d.SceneComponent = await scene.createComponent(rootNode, componentName);
          console.info(msg +`Created component ${componentName}:`, createdComponent);
          expect(createdComponent != null).assertTrue();
          let component: scene3d.SceneComponent | null = scene.getComponent(rootNode, componentName);
          console.info(msg +`Retrieved component ${componentName}:`, component);
          expect(component != null).assertTrue();
          expect(component === createdComponent).assertTrue();

          let missingComponent = scene.getComponent(rootNode, "NonExistentComponent");
          console.info(msg +"Attempted to retrieve missing component 'NonExistentComponent':", missingComponent);
          expect(missingComponent).assertNull();

          // Test node parameter with null
          try {
            let nullNodeComponent = scene.getComponent(null, componentName);
            console.info(msg + " getComponent with null node: " + JSON.stringify(nullNodeComponent));
            expect(nullNodeComponent).assertNull();
          } catch (err) {
            console.info(msg + " getComponent with null node threw error: " + JSON.stringify(err));
          }

          // Test node parameter with undefined
          try {
            let undefinedNodeComponent = scene.getComponent(undefined, componentName);
            console.info(msg + " getComponent with undefined node: " + JSON.stringify(undefinedNodeComponent));
            expect(undefinedNodeComponent).assertNull();
          } catch (err) {
            console.info(msg + " getComponent with undefined node threw error: " + JSON.stringify(err));
          }

          // Test name parameter with empty string
          try {
            let emptyNameComponent = scene.getComponent(rootNode, "");
            console.info(msg + " getComponent with empty string name: " + JSON.stringify(emptyNameComponent));
            expect(emptyNameComponent).assertNull();
          } catch (err) {
            console.info(msg + " getComponent with empty string name threw error: " + JSON.stringify(err));
          }
          
          // Test name parameter with null
          try {
            let nullNameComponent = scene.getComponent(rootNode, null);
            console.info(msg + " getComponent with null name: " + JSON.stringify(nullNameComponent));
            expect(nullNameComponent).assertUndefined();
          } catch (err) {
            console.info(msg + " getComponent with null name threw error: " + JSON.stringify(err));
          }

          // Test name parameter with undefined
          try {
            let undefinedNameComponent = scene.getComponent(rootNode, undefined);
            console.info(msg + " getComponent with undefined name: " + JSON.stringify(undefinedNameComponent));
            expect(undefinedNameComponent).assertUndefined();
          } catch (err) {
            console.info(msg + " getComponent with undefined name threw error: " + JSON.stringify(err));
          }

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testgetComponent " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testRenderContext_registerResourcePath
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2800
     * @tc.desc   Verify registerResourcePath() returns a valid boolean indicates whether the registration was successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderContext_registerResourcePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async  (done:Function)=> {
        let msg = "============================testregisterResourcePath";
        console.info(msg + ' begin ');
        try {
          scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
          console.info(msg + " scene loaded:", scene != null);
          expect(scene != null).assertTrue();

          let renderContext: scene3d.RenderContext | null = Scene.getDefaultRenderContext();
          console.info(msg + " default renderContext:", renderContext);
          expect(renderContext != null).assertTrue();

          if (renderContext != null) {
            let registerFail = renderContext?.registerResourcePath("shaders", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "shaders" registration result:', registerFail);
            expect(registerFail).assertFalse();

            let registerEmpty = renderContext?.registerResourcePath("", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "" registration result:', registerEmpty);
            expect(registerEmpty).assertFalse();

            let registerSuss = renderContext?.registerResourcePath("shaders_test", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "shaders_test" registration result:', registerSuss);
            expect(registerSuss).assertTrue();

            // Test with empty uri parameter
            let registerEmptyUri = renderContext?.registerResourcePath("shaders_test2", "");
            console.info(msg + ' uri "" (empty string) registration result:', registerEmptyUri);
            expect(registerEmptyUri).assertFalse();

            // Test with null protocol parameter
            try {
              let registerNullProtocol = renderContext?.registerResourcePath(null, "OhosRawFile://shaders/custom_shader");
              console.info(msg + ' null protocol registration result:', registerNullProtocol);
              expect(registerNullProtocol).assertUndefined();
            } catch (nullProtocolErr) {
              console.info(msg + ' null protocol parameter caused exception (expected):', JSON.stringify(nullProtocolErr));
            }

            // Test with undefined protocol parameter
            try {
              let registerUndefinedProtocol = renderContext?.registerResourcePath(undefined, "OhosRawFile://shaders/custom_shader");
              console.info(msg + ' undefined protocol registration result:', registerUndefinedProtocol);
              expect(registerUndefinedProtocol).assertUndefined();
            } catch (undefinedProtocolErr) {
              console.info(msg + ' undefined protocol parameter caused exception (expected):', JSON.stringify(undefinedProtocolErr));
            }

            // Test with null uri parameter
            try {
              let registerNullUri = renderContext?.registerResourcePath("shaders_test3", null);
              console.info(msg + ' null uri registration result:', registerNullUri);
              expect(registerNullUri).assertUndefined();
            } catch (nullUriErr) {
              console.info(msg + ' null uri parameter caused exception (expected):', JSON.stringify(nullUriErr));
            }

            // Test with undefined uri parameter
            try {
              let registerUndefinedUri = renderContext?.registerResourcePath("shaders_test4", undefined);
              console.info(msg + ' undefined uri registration result:', registerUndefinedUri);
              expect(registerUndefinedUri).assertUndefined();
            } catch (undefinedUriErr) {
              console.info(msg + ' undefined uri parameter caused exception (expected):', JSON.stringify(undefinedUriErr));
            }

            // Test with both parameters as null
            try {
              let registerBothNull = renderContext?.registerResourcePath(null, null);
              console.info(msg + ' both null parameters registration result:', registerBothNull);
              expect(registerBothNull).assertUndefined();
            } catch (bothNullErr) {
              console.info(msg + ' both null parameters caused exception (expected):', JSON.stringify(bothNullErr));
            }

            // Test with both parameters as undefined
            try {
              let registerBothUndefined = renderContext?.registerResourcePath(undefined, undefined);
              console.info(msg + ' both undefined parameters registration result:', registerBothUndefined);
              expect(registerBothUndefined).assertUndefined();
            } catch (bothUndefinedErr) {
              console.info(msg + ' both undefined parameters caused exception (expected):', JSON.stringify(bothUndefinedErr));
            }

            // Test with both parameters as empty string
            let registerBothEmpty = renderContext?.registerResourcePath("", "");
            console.info(msg + ' both empty string parameters registration result:', registerBothEmpty);
            expect(registerBothEmpty).assertFalse();

            rf = scene.getResourceFactory();
            let shader = rf.createShader({name: "CustomShader", uri: $rawfile('shaders/custom_shader/custom_material_sample_test.shader')});
            expect(shader != null).assertTrue();
          }
          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testRenderContext_registerResourcePath " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testCreateCamera
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_2900
     * @tc.desc   create a camera renderingPipeline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCamera', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
        let msg = "============================testCreateCamera";
        console.info(msg + ' begin ');
        try {
          let scene = await Scene.load();
          let rf =  scene.getResourceFactory();
          let LightCameraParams: CameraParameters = {renderingPipeline: RenderingPipelineType.FORWARD_LIGHTWEIGHT};
          expect(LightCameraParams.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD_LIGHTWEIGHT);
          let cam: Camera = await rf.createCamera({ name: "Camera1", path:"//Camera1" }, LightCameraParams);
          console.info(msg + " create cam:", JSON.stringify(cam));
          expect(cam != null).assertTrue();
          console.info(msg + " cam.renderingPipeline:", JSON.stringify(cam.renderingPipeline));
          expect(cam.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD_LIGHTWEIGHT);

          let forWardCameraParams: CameraParameters = {renderingPipeline: RenderingPipelineType.FORWARD}
          expect(forWardCameraParams.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD);
          let cam1: Camera = await rf.createCamera({ name: "Camera2", path:"//Camera2" }, forWardCameraParams);
          console.info(msg + " create cam1:", JSON.stringify(cam1));
          expect(cam1 != null).assertTrue();
          expect(cam1.renderingPipeline).assertEqual(RenderingPipelineType.FORWARD);

          expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT).assertEqual(0);
          expect(RenderingPipelineType.FORWARD).assertEqual(1);
          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testCreateCamera " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testCreateEffect
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3000
     * @tc.desc   create a camera effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
        let msg = "============================testCreateEffect";
        console.info(msg + ' begin ');
        try {
          let scene = await Scene.load();
          let rf =  scene.getResourceFactory();
          let effectIdName: string = "89b83608-c910-433e-9fd8-22f3ef64eabd";
          let effectParameters: EffectParameters = {effectId: effectIdName};
          console.info(msg + " EffectParameters create success. effectIdName: " + effectIdName);
          let cam = await rf.createCamera({ name: "Camera", path:"//Camera" }, { renderingPipeline: RenderingPipelineType.FORWARD });
          console.info(msg + " createCamera success.");
          expect(effectParameters.effectId).assertEqual(effectIdName);
          let effect: Effect = await rf.createEffect(effectParameters);
          console.info(msg + " createEffect success.");
          cam.effects.append(effect);
          expect(effect != null).assertTrue();
          console.info(msg + " create effect is not null ");
          expect(cam.effects.get(0)).assertEqual(effect);
          expect(effect.effectId).assertEqual(effectIdName);
          console.info(msg + " effect.effectId: ", JSON.stringify(effect.effectId));
          expect(effect.enabled).assertFalse();
          console.info(msg + " effect.enabled: ", JSON.stringify(effect.enabled));
          effect.enabled = false;
          expect(cam.effects.get(0)?.enabled).assertFalse();

          expect(NodeType.CUSTOM).assertEqual(255);
          console.info(msg + " NodeType.CUSTOM: ", JSON.stringify(NodeType.CUSTOM));
          expect(SceneResourceType.EFFECT).assertEqual(9)
          console.info(msg + " SceneResourceType.EFFECT: ", JSON.stringify(SceneResourceType.EFFECT));
          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testCreateEffect " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testSceneLoad_03
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3100
     * @tc.desc   Used to load the resource through the incoming resource path, load ext_meshopt_compress mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneLoad_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneLoad_03";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet_MeshOpt.glb"));
        expect(scene != undefined).assertTrue();
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet_MeshOpt.glb")) ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCloneNode
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3200
     * @tc.desc   Test cloneNode method to clone node within the same scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloneNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCloneNode";
      console.info(msg + ' begin ');
      try {
        // Load a scene
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Get nodes from the same scene
        let cubeNode: scene3d.Node | null = scene.getNodeByPath("rootNode_/Unnamed Node 1/AnimatedCube");
        expect(cubeNode != null).assertTrue();
        console.info(msg + " cube node retrieved successfully");

        // Clone node within the same scene
        if (scene && cubeNode && scene.root) {
          // Test cloning a regular node within the same scene
          let clonedCube = scene.cloneNode(cubeNode, scene.root, "clonedCube");
          expect(clonedCube != null).assertTrue();
          console.info(msg + " regular node cloned successfully within the same scene");
          expect(clonedCube?.name).assertEqual("clonedCube");
          console.info(msg + " cloned node name is 'clonedCube'");

          // Test cloning the cloned node again within the same scene
          if (clonedCube) {
            let clonedCube2 = scene.cloneNode(clonedCube, scene.root, "clonedCube2");
            expect(clonedCube2 != null).assertTrue();
            console.info(msg + " cloned node cloned again successfully");
            expect(clonedCube2?.name).assertEqual("clonedCube2");
          }

          // Test cloning a Camera node if it exists
          let cameraNode: scene3d.Node | null = scene.getNodeByPath("rootNode_/Unnamed Node 1/camera_Orientation");
          if (cameraNode != null) {
            let clonedCamera = scene.cloneNode(cameraNode, scene.root, "clonedCamera");
            expect(clonedCamera != null).assertTrue();
            console.info(msg + " camera node cloned successfully");
            expect(clonedCamera?.nodeType).assertEqual(scene3d.NodeType.CAMERA);
            console.info(msg + " cloned camera node type is CAMERA");
          }

          // Test cloning a Light node if it exists
          let lightNode: scene3d.Node | null = scene.getNodeByPath("rootNode_/Unnamed Node 1/DirectionalLight");
          if (lightNode != null) {
            let clonedLight = scene.cloneNode(lightNode, scene.root, "clonedLight");
            expect(clonedLight != null).assertTrue();
            console.info(msg + " light node cloned successfully");
            expect(clonedLight?.nodeType).assertEqual(scene3d.NodeType.LIGHT);
            console.info(msg + " cloned light node type is LIGHT");
          }
        }

        // Test null return scenarios
        if (scene && scene.root && cubeNode) {
          // Test cloneNode with null node should return null
          let resultNullNode = scene.cloneNode(null, scene.root, "testNode");
          expect(resultNullNode).assertNull();
          console.info(msg + " cloneNode with null node returns null");

          // Test cloneNode with undefined node should return null
          let resultUndefinedNode = scene.cloneNode(undefined, scene.root, "testUndefinedNode");
          expect(resultUndefinedNode).assertNull();
          console.info(msg + " cloneNode with undefined node returns null");

          // Test cloneNode with null parent
          try {
            let resultNullParent = scene.cloneNode(cubeNode, null, "testNullParent");
            console.info(msg + " cloneNode with null parent: " + JSON.stringify(resultNullParent));
            expect(resultNullParent).assertUndefined();
          } catch (err) {
            console.info(msg + " cloneNode with null parent threw error: " + JSON.stringify(err));
          }

          // Test cloneNode with undefined parent
          try {
            let resultUndefinedParent = scene.cloneNode(cubeNode, undefined, "testUndefinedParent");
            console.info(msg + " cloneNode with undefined parent: " + JSON.stringify(resultUndefinedParent));
            expect(resultUndefinedParent).assertUndefined();
          } catch (err) {
            console.info(msg + " cloneNode with undefined parent threw error: " + JSON.stringify(err));
          }

          // Test cloneNode with empty string name
          try {
            let resultEmptyName = scene.cloneNode(cubeNode, scene.root, "");
            console.info(msg + " cloneNode with empty string name: " + JSON.stringify(resultEmptyName));
            expect(resultEmptyName != null).assertTrue();
          } catch (err) {
            console.info(msg + " cloneNode with empty string name threw error: " + JSON.stringify(err));
          }

          // Test cloneNode with null name
          try {
            let resultNullName = scene.cloneNode(cubeNode, scene.root, null);
            console.info(msg + " cloneNode with null name: " + JSON.stringify(resultNullName));
            expect(resultNullName).assertUndefined();
          } catch (err) {
            console.info(msg + " cloneNode with null name threw error: " + JSON.stringify(err));
          }

          // Test cloneNode with undefined name
          try {
            let resultUndefinedName = scene.cloneNode(cubeNode, scene.root, undefined);
            console.info(msg + " cloneNode with undefined name: " + JSON.stringify(resultUndefinedName));
            expect(resultUndefinedName).assertUndefined();
          } catch (err) {
            console.info(msg + " cloneNode with undefined name threw error: " + JSON.stringify(err));
          }
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCloneNode " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCustomGeometryVertices
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3300
     * @tc.desc   Test set and get for vertices property of CustomGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryVertices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCustomGeometryVertices";
      console.info(msg + ' begin ');
      try {
        let customGeom = new scene3d.CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " CustomGeometry created successfully");

        // Test setting vertices with normal values
        customGeom.vertices = [{x: 0, y: 1, z: 0}, {x: 0.5, y: 0, z: 0.3}, {x: 0, y: -1, z: 0}];
        expect(customGeom.vertices != null).assertTrue();
        expect(customGeom.vertices.length).assertEqual(3);
        console.info(msg + " normal vertices set successfully");

        // Test setting vertices with negative coordinates
        customGeom.vertices = [{x: -1, y: -1, z: -1}, {x: -2.5, y: -3.5, z: -4.5}];
        expect(customGeom.vertices.length).assertEqual(2);
        expect(customGeom.vertices[0].x).assertEqual(-1);
        console.info(msg + " negative coordinate vertices set successfully");

        // Test setting vertices with zero coordinates
        customGeom.vertices = [{x: 0, y: 0, z: 0}];
        expect(customGeom.vertices.length).assertEqual(1);
        expect(customGeom.vertices[0].x).assertEqual(0);
        console.info(msg + " zero coordinate vertices set successfully");

        // Test setting vertices with floating point values
        customGeom.vertices = [{x: 1.234, y: 2.567, z: -3.890}];
        expect(Math.abs(customGeom.vertices[0].x - 1.234) < 0.001).assertTrue();
        console.info(msg + " floating point vertices set successfully");

        // Test setting vertices with mixed values
        customGeom.vertices = [{x: 0, y: 0, z: 0}, {x: 1, y: -1, z: 2}, {x: -3.14, y: 2.71, z: 0}];
        expect(customGeom.vertices.length).assertEqual(3);
        console.info(msg + " mixed value vertices set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCustomGeometryVertices " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCubeGeometrySize
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3400
     * @tc.desc   Test set and get for size property of CubeGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCubeGeometrySize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCubeGeometrySize";
      console.info(msg + ' begin ');
      try {
        let cubeGeom = new scene3d.CubeGeometry();
        expect(cubeGeom != null).assertTrue();
        console.info(msg + " CubeGeometry created successfully");

        // Test setting size with normal positive values
        cubeGeom.size = {x: 1.0, y: 2.0, z: 3.0};
        expect(cubeGeom.size != null).assertTrue();
        expect(cubeGeom.size.x).assertEqual(1.0);
        expect(cubeGeom.size.y).assertEqual(2.0);
        expect(cubeGeom.size.z).assertEqual(3.0);
        console.info(msg + " normal positive size values set successfully");

        // Test setting size with negative values
        cubeGeom.size = {x: -1.5, y: -2.5, z: -3.5};
        expect(cubeGeom.size.x).assertEqual(-1.5);
        expect(cubeGeom.size.y).assertEqual(-2.5);
        expect(cubeGeom.size.z).assertEqual(-3.5);
        console.info(msg + " negative size values set successfully");

        // Test setting size with zero values
        cubeGeom.size = {x: 0, y: 0, z: 0};
        expect(cubeGeom.size.x).assertEqual(0);
        expect(cubeGeom.size.y).assertEqual(0);
        expect(cubeGeom.size.z).assertEqual(0);
        console.info(msg + " zero size values set successfully");

        // Test setting size with floating point values
        cubeGeom.size = {x: 1.234, y: 2.567, z: 3.890};
        expect(cubeGeom.size.x).assertEqual(1.234);
        console.info(msg + " floating point size values set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCubeGeometrySize " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPlaneGeometrySize
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3500
     * @tc.desc   Test set and get for size property of PlaneGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlaneGeometrySize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testPlaneGeometrySize";
      console.info(msg + ' begin ');
      try {
        let planeGeom = new scene3d.PlaneGeometry();
        expect(planeGeom != null).assertTrue();
        console.info(msg + " PlaneGeometry created successfully");

        // Test setting size with normal positive values
        planeGeom.size = {x: 2.0, y: 3.0};
        expect(planeGeom.size != null).assertTrue();
        expect(planeGeom.size.x).assertEqual(2.0);
        expect(planeGeom.size.y).assertEqual(3.0);
        console.info(msg + " normal positive size values set successfully");

        // Test setting size with negative values
        planeGeom.size = {x: -1.5, y: -2.5};
        expect(planeGeom.size.x).assertEqual(-1.5);
        expect(planeGeom.size.y).assertEqual(-2.5);
        console.info(msg + " negative size values set successfully");

        // Test setting size with zero values
        planeGeom.size = {x: 0, y: 0};
        expect(planeGeom.size.x).assertEqual(0);
        expect(planeGeom.size.y).assertEqual(0);
        console.info(msg + " zero size values set successfully");

        // Test setting size with floating point values
        planeGeom.size = {x: 1.234, y: 5.678};
        expect(planeGeom.size.x).assertEqual(1.234);
        console.info(msg + " floating point size values set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testPlaneGeometrySize " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSphereGeometryRadius
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3600
     * @tc.desc   Test set and get for radius property of SphereGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometryRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSphereGeometryRadius";
      console.info(msg + ' begin ');
      try {
        let sphereGeom = new scene3d.SphereGeometry();
        expect(sphereGeom != null).assertTrue();
        console.info(msg + " SphereGeometry created successfully");

        // Test setting radius with normal positive value
        sphereGeom.radius = 1.5;
        expect(sphereGeom.radius).assertEqual(1.5);
        console.info(msg + " normal positive radius set successfully");

        // Test setting radius with negative value
        sphereGeom.radius = -2.5;
        expect(sphereGeom.radius).assertEqual(-2.5);
        console.info(msg + " negative radius set successfully");

        // Test setting radius with zero
        sphereGeom.radius = 0;
        expect(sphereGeom.radius).assertEqual(0);
        console.info(msg + " zero radius set successfully");

        // Test setting radius with floating point value
        sphereGeom.radius = 3.14159;
        expect(sphereGeom.radius).assertEqual(3.14159);
        console.info(msg + " floating point radius set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSphereGeometryRadius " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSphereGeometrySegmentCount
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3700
     * @tc.desc   Test set and get for segmentCount property of SphereGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometrySegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testSphereGeometrySegmentCount";
      console.info(msg + ' begin ');
      try {
        let sphereGeom = new scene3d.SphereGeometry();
        expect(sphereGeom != null).assertTrue();
        console.info(msg + " SphereGeometry created successfully");

        // Test setting segmentCount with normal positive integer
        sphereGeom.segmentCount = 24;
        expect(sphereGeom.segmentCount).assertEqual(24);
        console.info(msg + " normal positive segmentCount set successfully");

        // Test setting segmentCount with negative value
        sphereGeom.segmentCount = -10;
        expect(sphereGeom.segmentCount).assertEqual(-10);
        console.info(msg + " negative segmentCount set successfully");

        // Test setting segmentCount with zero
        sphereGeom.segmentCount = 0;
        expect(sphereGeom.segmentCount).assertEqual(0);
        console.info(msg + " zero segmentCount set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSphereGeometrySegmentCount " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCylinderGeometryRadius
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3800
     * @tc.desc   Test set and get for radius property of CylinderGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometryRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCylinderGeometryRadius";
      console.info(msg + ' begin ');
      try {
        let cylinderGeom = new scene3d.CylinderGeometry();
        expect(cylinderGeom != null).assertTrue();
        console.info(msg + " CylinderGeometry created successfully");

        // Test setting radius with normal positive value
        cylinderGeom.radius = 1.5;
        expect(cylinderGeom.radius).assertEqual(1.5);
        console.info(msg + " normal positive radius set successfully");

        // Test setting radius with negative value
        cylinderGeom.radius = -2.5;
        expect(cylinderGeom.radius).assertEqual(-2.5);
        console.info(msg + " negative radius set successfully");

        // Test setting radius with zero
        cylinderGeom.radius = 0;
        expect(cylinderGeom.radius).assertEqual(0);
        console.info(msg + " zero radius set successfully");

        // Test setting radius with floating point value
        cylinderGeom.radius = 3.14159;
        expect(cylinderGeom.radius).assertEqual(3.14159);
        console.info(msg + " floating point radius set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCylinderGeometryRadius " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCylinderGeometryHeight
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_3900
     * @tc.desc   Test set and get for height property of CylinderGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometryHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCylinderGeometryHeight";
      console.info(msg + ' begin ');
      try {
        let cylinderGeom = new scene3d.CylinderGeometry();
        expect(cylinderGeom != null).assertTrue();
        console.info(msg + " CylinderGeometry created successfully");

        // Test setting height with normal positive value
        cylinderGeom.height = 2.5;
        expect(cylinderGeom.height).assertEqual(2.5);
        console.info(msg + " normal positive height set successfully");

        // Test setting height with negative value
        cylinderGeom.height = -3.5;
        expect(cylinderGeom.height).assertEqual(-3.5);
        console.info(msg + " negative height set successfully");

        // Test setting height with zero
        cylinderGeom.height = 0;
        expect(cylinderGeom.height).assertEqual(0);
        console.info(msg + " zero height set successfully");

        // Test setting height with floating point value
        cylinderGeom.height = 3.14159;
        expect(cylinderGeom.height).assertEqual(3.14159);
        console.info(msg + " floating point height set successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCylinderGeometryHeight " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCylinderGeometrySegmentCount
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4000
     * @tc.desc   Test set and get for segmentCount property of CylinderGeometry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometrySegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCylinderGeometrySegmentCount";
      console.info(msg + ' begin ');
      try {
        let cylinderGeom = new scene3d.CylinderGeometry();
        expect(cylinderGeom != null).assertTrue();
        console.info(msg + " CylinderGeometry created successfully");

        // Test setting segmentCount with normal positive integer
        cylinderGeom.segmentCount = 20;
        expect(cylinderGeom.segmentCount).assertEqual(20);
        console.info(msg + " normal positive segmentCount set successfully");

        // Test setting segmentCount with negative value
        cylinderGeom.segmentCount = -15;
        expect(cylinderGeom.segmentCount).assertEqual(-15);
        console.info(msg + " negative segmentCount set successfully");

        // Test setting segmentCount with zero
        cylinderGeom.segmentCount = 0;
        expect(cylinderGeom.segmentCount).assertEqual(0);
        console.info(msg + " zero segmentCount set successfully");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCylinderGeometrySegmentCount " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneRenderConfigurationShadowResolution
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4100
     * @tc.desc   Verify Scene.renderConfiguration.shadowResolution property can be set and retrieved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneRenderConfigurationShadowResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneRenderConfigurationShadowResolution";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Get renderConfiguration
        let renderConfig = scene.renderConfiguration;
        expect(renderConfig != null).assertTrue();
        console.info(msg + " renderConfiguration retrieved successfully");

        // Test default value (should be undefined)
        expect(renderConfig.shadowResolution).assertUndefined();
        console.info(msg + " default shadowResolution is undefined as expected");

        // Test setting shadowResolution to different values
        // Test 1: Set to 2048 x 2048
        renderConfig.shadowResolution = { x: 2048, y: 2048 };
        expect(renderConfig.shadowResolution.x).assertEqual(2048);
        expect(renderConfig.shadowResolution.y).assertEqual(2048);
        console.info(msg + " shadowResolution set to 2048x2048 successfully");

        // Test 2: Set to 512 x 512
        renderConfig.shadowResolution = { x: 512, y: 512 };
        expect(renderConfig.shadowResolution.x).assertEqual(512);
        expect(renderConfig.shadowResolution.y).assertEqual(512);
        console.info(msg + " shadowResolution set to 512x512 successfully");

        // Test 3: Set to 1024 x 1024
        renderConfig.shadowResolution = { x: 1024, y: 1024 };
        expect(renderConfig.shadowResolution.x).assertEqual(1024);
        expect(renderConfig.shadowResolution.y).assertEqual(1024);
        console.info(msg + " shadowResolution set to 1024x1024 successfully");

        // Test 4: Set with floating point values (should truncate to integer)
        renderConfig.shadowResolution = { x: 1024.7, y: 2048.3 };
        expect(renderConfig.shadowResolution.x).assertEqual(1024);
        expect(renderConfig.shadowResolution.y).assertEqual(2048);
        console.info(msg + " shadowResolution truncated floating point values successfully");

        // Test 5: Values greater than 0 should work
        renderConfig.shadowResolution = { x: 1, y: 1 };
        expect(renderConfig.shadowResolution.x).assertEqual(1);
        expect(renderConfig.shadowResolution.y).assertEqual(1);
        console.info(msg + " shadowResolution set to minimum value 1x1 successfully");

        // Test 6: Set to large values
        renderConfig.shadowResolution = { x: 4096, y: 4096 };
        expect(renderConfig.shadowResolution.x).assertEqual(4096);
        expect(renderConfig.shadowResolution.y).assertEqual(4096);
        console.info(msg + " shadowResolution set to large value 4096x4096 successfully");

        // Test 7: Test asymmetric resolution
        renderConfig.shadowResolution = { x: 2048, y: 1024 };
        expect(renderConfig.shadowResolution.x).assertEqual(2048);
        expect(renderConfig.shadowResolution.y).assertEqual(1024);
        console.info(msg + " shadowResolution set to asymmetric 2048x1024 successfully");

        // // Test 8: Test zero value (should be ignored and maintain previous value)
        // renderConfig.shadowResolution = { x: 2048, y: 1024 };
        // let previousValueX = renderConfig.shadowResolution.x;
        // let previousValueY = renderConfig.shadowResolution.y;
        // renderConfig.shadowResolution = { x: 0, y: 0 };
        // expect(renderConfig.shadowResolution.x).assertEqual(previousValueX);
        // expect(renderConfig.shadowResolution.y).assertEqual(previousValueY);
        // console.info(msg + " zero values ignored, maintained previous value successfully");
        //
        // // Test 9: Test negative values (should be ignored and maintain previous value)
        // renderConfig.shadowResolution = { x: 1024, y: 1024 };
        // previousValueX = renderConfig.shadowResolution.x;
        // previousValueY = renderConfig.shadowResolution.y;
        // renderConfig.shadowResolution = { x: -512, y: -1024 };
        // expect(renderConfig.shadowResolution.x).assertEqual(previousValueX);
        // expect(renderConfig.shadowResolution.y).assertEqual(previousValueY);
        // console.info(msg + " negative values ignored, maintained previous value successfully");
        //
        // // Test 10: Test one component zero and one positive (both should be ignored)
        // renderConfig.shadowResolution = { x: 512, y: 512 };
        // previousValueX = renderConfig.shadowResolution.x;
        // previousValueY = renderConfig.shadowResolution.y;
        // renderConfig.shadowResolution = { x: 0, y: 1024 };
        // expect(renderConfig.shadowResolution.x).assertEqual(previousValueX);
        // expect(renderConfig.shadowResolution.y).assertEqual(previousValueY);
        // console.info(msg + " one component zero ignored, maintained previous value successfully");
        //
        // // Test 11: Test mixed zero and negative values (should be ignored)
        // renderConfig.shadowResolution = { x: 2048, y: 2048 };
        // previousValueX = renderConfig.shadowResolution.x;
        // previousValueY = renderConfig.shadowResolution.y;
        // renderConfig.shadowResolution = { x: 0, y: -1024 };
        // expect(renderConfig.shadowResolution.x).assertEqual(previousValueX);
        // expect(renderConfig.shadowResolution.y).assertEqual(previousValueY);
        // console.info(msg + " mixed zero and negative values ignored, maintained previous value successfully");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneRenderConfigurationShadowResolution " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneAnimations
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4200
     * @tc.desc   Verify Scene.animations property returns valid Animation array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneAnimations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneAnimations";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Get animations property
        let anims = scene.animations;
        expect(anims != null).assertTrue();
        expect(anims != undefined).assertTrue();
        console.info(msg + " animations property retrieved successfully, length: " + anims.length);

        // Test with scene that has animations
        if (anims.length > 0) {
          expect(anims[0] != null).assertTrue();
          console.info(msg + " first animation is not null");
        }

        // Test with scene that has no animations
        let scene2 = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        let anims2 = scene2.animations;
        expect(anims2 != null).assertTrue();
        expect(anims2 != undefined).assertTrue();
        console.info(msg + " animations property retrieved from scene without animations, length: " + anims2.length);

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneAnimations " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneRoot
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4300
     * @tc.desc   Verify Scene.root property returns valid Node instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneRoot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneRoot";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Get root property
        let rootNode = scene.root;
        expect(rootNode != null).assertTrue();
        console.info(msg + " root property retrieved successfully");

        // Verify root node properties
        expect(rootNode != undefined).assertTrue();
        console.info(msg + " root is defined");

        expect(rootNode?.nodeType).assertEqual(scene3d.NodeType.NODE);
        console.info(msg + " root node type is NODE");

        expect(rootNode?.path).assertEqual("");
        console.info(msg + " root path is empty string");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneRoot " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneRenderConfiguration
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4400
     * @tc.desc   Verify Scene.renderConfiguration property returns valid RenderConfiguration instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneRenderConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneRenderConfiguration";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Get renderConfiguration property
        let renderConfig = scene.renderConfiguration;
        expect(renderConfig != null).assertTrue();
        console.info(msg + " renderConfiguration property retrieved successfully");

        // Verify renderConfiguration is valid object
        expect(renderConfig != undefined).assertTrue();
        console.info(msg + " renderConfiguration is defined");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneRenderConfiguration " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneGetResourceFactory
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4500
     * @tc.desc   Verify Scene.getResourceFactory() returns valid SceneResourceFactory instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneGetResourceFactory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneGetResourceFactory";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        // Call getResourceFactory method
        let factory = scene.getResourceFactory();
        expect(factory != null).assertTrue();
        console.info(msg + " getResourceFactory() returned successfully");

        // Verify factory is valid object
        expect(factory != undefined).assertTrue();
        console.info(msg + " factory is defined");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneGetResourceFactory " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGeometryDefinitionGeometryType
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4600
     * @tc.desc   Verify geometryType property returns correct GeometryType enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGeometryDefinitionGeometryType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testGeometryDefinitionGeometryType";
      console.info(msg + ' begin ');
      try {
        // Test CustomGeometry
        let customGeom = new scene3d.CustomGeometry();
        expect(customGeom.geometryType).assertEqual(scene3d.GeometryType.CUSTOM);
        console.info(msg + " CustomGeometry.geometryType returns CUSTOM");

        // Test CubeGeometry
        let cubeGeom = new scene3d.CubeGeometry();
        expect(cubeGeom.geometryType).assertEqual(scene3d.GeometryType.CUBE);
        console.info(msg + " CubeGeometry.geometryType returns CUBE");

        // Test PlaneGeometry
        let planeGeom = new scene3d.PlaneGeometry();
        expect(planeGeom.geometryType).assertEqual(scene3d.GeometryType.PLANE);
        console.info(msg + " PlaneGeometry.geometryType returns PLANE");

        // Test SphereGeometry
        let sphereGeom = new scene3d.SphereGeometry();
        expect(sphereGeom.geometryType).assertEqual(scene3d.GeometryType.SPHERE);
        console.info(msg + " SphereGeometry.geometryType returns SPHERE");

        // Test CylinderGeometry
        let cylinderGeom = new scene3d.CylinderGeometry();
        expect(cylinderGeom.geometryType).assertEqual(scene3d.GeometryType.CYLINDER);
        console.info(msg + " CylinderGeometry.geometryType returns CYLINDER");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGeometryDefinitionGeometryType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderResourceFactory_createImageStream
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4700
     * @tc.desc   Test createImageStream method of RenderResourceFactory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderResourceFactory_createImageStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testRenderResourceFactory_createImageStream";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
          expect(scene != null).assertTrue();

          const rf: scene3d.RenderResourceFactory = scene.getResourceFactory();
          const imageStream = await rf.createImageStream({ name: "testImageStream" });
          expect(imageStream != null).assertTrue();
          expect(imageStream!.name).assertEqual("testImageStream");
          expect(imageStream!.surfaceId.length > 0).assertTrue();
          expect(imageStream!.width >= 0).assertTrue();
          expect(imageStream!.height >= 0).assertTrue();
          expect(imageStream!.resourceType).assertEqual(scene3d.SceneResourceType.IMAGE);

          imageStream!.destroy();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_surfaceId
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4800
     * @tc.desc   Test ImageStream surfaceId property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_surfaceId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_surfaceId";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStream = await rf.createImageStream({ name: "surfaceIdTest" });
          const surfaceId = imageStream!.surfaceId;
          expect(surfaceId.length > 0).assertTrue();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_width_height
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_4900
     * @tc.desc   Test ImageStream width and height properties inherited from Image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_width_height', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_width_height";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStream = await rf.createImageStream({ name: "widthHeightTest" });
          expect(imageStream!.width >= 0).assertTrue();
          expect(imageStream!.height >= 0).assertTrue();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_resourceType
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5000
     * @tc.desc   Test ImageStream resourceType property inherited from SceneResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_resourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_resourceType";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStream = await rf.createImageStream({ name: "resourceTypeTest" });
          expect(imageStream!.resourceType).assertEqual(scene3d.SceneResourceType.IMAGE);
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_name_uri
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5100
     * @tc.desc   Test ImageStream name and uri properties inherited from SceneResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_name_uri', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_name_uri";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStream1 = await rf.createImageStream({ name: "testNameOnly" });
          expect(imageStream1!.name).assertEqual("testNameOnly");
          const imageStream2 = await rf.createImageStream({ 
            name: "testWithUri", 
            uri: $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb") 
          });
          expect(imageStream2!.name).assertEqual("testWithUri");
          expect(imageStream2!.uri != null).assertTrue();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_destroy
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5200
     * @tc.desc   Test ImageStream destroy method inherited from SceneResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_destroy";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStream = await rf.createImageStream({ name: "destroyTest" });
          imageStream!.destroy();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testImageStream_null_params
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5300
     * @tc.desc   Test createImageStream with null and undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageStream_null_params', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testImageStream_null_params";
        console.info(msg + ' begin ');
        try {
          const scene = await Scene.load();
          const rf = scene.getResourceFactory();
          const imageStreamNull = await rf.createImageStream(null);
          expect(imageStreamNull != null).assertTrue();
          const imageStreamUndefined = await rf.createImageStream(undefined);
          expect(imageStreamUndefined != null).assertTrue();
          scene.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testPCFConfig_create
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5400
     * @tc.desc   Test PCFConfig constructor creates valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_create', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testPCFConfig_create";
        console.info(msg + ' begin ');
        try {
          let scene = await Scene.load();
          expect(scene != null).assertTrue();

          let pcfConfig = new PCFConfig();
          expect(pcfConfig != null).assertTrue();

          scene!.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testPCFConfig_shadowSampleRadius_default
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5500
     * @tc.desc   Test PCFConfig shadowSampleRadius default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_shadowSampleRadius_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let msg = "============================testPCFConfig_shadowSampleRadius_default";
        console.info(msg + ' begin ');
        try {
          let scene = await Scene.load();
          expect(scene != null).assertTrue();

          let pcfConfig = new PCFConfig();
          expect(pcfConfig.shadowSampleRadius).assertEqual(5.0);

          scene!.destroy();
          done();
        } catch (err) {
          console.info(msg + " Failed: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   testPCFConfig_shadowSampleRadius_set
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5600
     * @tc.desc   Test PCFConfig shadowSampleRadius set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_shadowSampleRadius_set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testPCFConfig_shadowSampleRadius_set";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        expect(scene != null).assertTrue();

        let pcfConfig = new PCFConfig();
        pcfConfig.shadowSampleRadius = 10.0;
        expect(pcfConfig.shadowSampleRadius).assertEqual(10.0);

        pcfConfig.shadowSampleRadius = 0;
        expect(pcfConfig.shadowSampleRadius).assertEqual(0);

        pcfConfig.shadowSampleRadius = undefined;
        expect(pcfConfig.shadowSampleRadius).assertEqual(undefined);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPCFConfig_shadowSampleCount_default
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5700
     * @tc.desc   Test PCFConfig shadowSampleCount default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_shadowSampleCount_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testPCFConfig_shadowSampleCount_default";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        expect(scene != null).assertTrue();

        let pcfConfig = new PCFConfig();
        expect(pcfConfig.shadowSampleCount).assertEqual(16);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPCFConfig_shadowSampleCount_set
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5800
     * @tc.desc   Test PCFConfig shadowSampleCount set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_shadowSampleCount_set', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testPCFConfig_shadowSampleCount_set";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        expect(scene != null).assertTrue();

        let pcfConfig = new PCFConfig();
        pcfConfig.shadowSampleCount = 32;
        expect(pcfConfig.shadowSampleCount).assertEqual(32);

        pcfConfig.shadowSampleCount = 0;
        expect(pcfConfig.shadowSampleCount).assertEqual(0);

        pcfConfig.shadowSampleCount = undefined;
        expect(pcfConfig.shadowSampleCount).assertEqual(undefined);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testPCFConfig_shadowAlgorithmType
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_5900
     * @tc.desc   Test PCFConfig shadowAlgorithmType returns PCF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPCFConfig_shadowAlgorithmType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testPCFConfig_shadowAlgorithmType";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        expect(scene != null).assertTrue();

        let pcfConfig = new PCFConfig();
        expect(pcfConfig.shadowAlgorithmType).assertEqual(ShadowAlgorithmType.PCF);
        expect(ShadowAlgorithmType.PCF).assertEqual(0);

        scene!.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testRenderConfiguration_softShadowConfig
     * @tc.number SUB_GRAPHIC_GRAPHICS3D_SCENE_6000
     * @tc.desc   Test RenderConfiguration softShadowConfig property set and get
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderConfiguration_softShadowConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testRenderConfiguration_softShadowConfig";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load();
        let rc = scene!.renderConfiguration;

        expect(rc!.softShadowConfig).assertEqual(undefined);

        rc!.softShadowConfig = new PCFConfig();
        expect(rc!.softShadowConfig != null).assertTrue();

        rc!.softShadowConfig = undefined;
        expect(rc!.softShadowConfig).assertEqual(undefined);

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