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
  NodeType } from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'

export default function sceneTest() {
  describe('sceneTest', ()=> {
    let scene: Scene | null = null;
    let rf: scene3d.SceneResourceFactory;
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0010
     * @tc.name      : testSceneLoad
     * @tc.desc      : Used to load the resource through the incoming resource path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneLoad_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneLoad_01";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        expect(scene != undefined).assertTrue();
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")) ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0020
     * @tc.name      : testGetNodeByPath
     * @tc.desc      : Nodes are obtained from paths
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        rf = scene.getResourceFactory();
        let node = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514') " +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0030
     * @tc.name      : testGetResourceFactory
     * @tc.desc      : Used to get the Scene Asset Factory object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0040
     * @tc.name      : testDestroy
     * @tc.desc      : Used to destroy the scene and release all scene resources
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0050
     * @tc.name      : testSceneResourceParameters
     * @tc.desc      : Used to provide the name of the scene asset and the path to the asset file required for the 3D scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0060
     * @tc.name      : testSceneNodeParameters
     * @tc.desc      : A scene node parameter object, which is used to provide a name and path in the scene node hierarchy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0070
     * @tc.name      : testSceneType
     * @tc.desc      : SystemCapability.ArkUI.Graphics
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0500
     * @tc.name      : testSceneRenderFrame
     * @tc.desc      : Used to see if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
        done();
      } catch (err) {
        console.info(msg + " Failed in scene?.renderFrame() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0510
     * @tc.name      : testSceneRenderParameters
     * @tc.desc      : Used to set if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0520
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to set the properties of the sphere
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0530
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to set the properties of the custom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0540
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to set the properties of the custom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0550
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to set the properties of the custom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0560
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to create a scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0620
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to create a scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateScene_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateScene_02";
      console.info(msg + ' begin ');
      try {
        let scene2 = await rf.createScene();
        expect(scene2 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateScene_02 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0630
     * @tc.name      : testSceneLoad
     * @tc.desc      : Used to load the resource through the incoming resource path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0640
     * @tc.name      : testRaycastResult_node
     * @tc.desc      : Verify raycast returns a valid hit node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0650
     * @tc.name      : testRaycastResult_centerDistance
     * @tc.desc      : Verify centerDistance is a valid positive number in raycast result
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
        expect(typeof distance).assertEqual('number');
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0660
     * @tc.name      : testRaycastResult_hitPosition
     * @tc.desc      : Verify hitPosition contains valid 3D coordinates
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
        expect(typeof res.x).assertEqual('number');
        expect(typeof res.y).assertEqual('number');
        expect(typeof res.z).assertEqual('number');
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_hitPosition " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0670
     * @tc.name      : testRaycastResult_rootNode
     * @tc.desc      : Verify rootNode in RaycastParameters filters raycast scope correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0680
     * @tc.name      : testRenderResourceFactory_createSampler
     * @tc.desc      : Verify createSampler correctly creates a Sampler with valid parameters
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRenderResourceFactory_createSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
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

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRenderResourceFactory_createSampler " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0690
     * @tc.name      : testSceneComponent
     * @tc.desc      : Verified whether the SceneComponent class can correctly set component names,
     *                 store and access various types of properties.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0700
     * @tc.name      : testRenderContext_getRenderResourceFactory
     * @tc.desc      : Verify getRenderResourceFactory() returns a valid RenderResourceFactory instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            let factory: scene3d.RenderResourceFactory = renderContext.getRenderResourceFactory();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0710
     * @tc.name      : testRenderContext_loadPlugin
     * @tc.desc      : Verify loadPlugin() returns a valid boolean even when loading an empty or non-existent plugin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            let loadFail = await renderContext.loadPlugin("NonExistentPlugin");
            console.info(msg + ' plugin "NonExistentPlugin" load result:', loadFail);
            expect(loadFail).assertEqual(undefined);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0720
     * @tc.name      : testCreateComponent
     * @tc.desc      : Verify whether the basic functional behavior of the CreateComponent method meets expectations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testCreateComponent " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0730
     * @tc.name      : testgetComponent
     * @tc.desc      : Verify whether the basic functional behavior of the getComponent method meets expectations
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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

          let missingComponent: scene3d.SceneComponent | null = scene.getComponent(rootNode, "NonExistentComponent");
          console.info(msg +"Attempted to retrieve missing component 'NonExistentComponent':", missingComponent);
          expect(missingComponent == null).assertTrue();

          console.info(msg + " test completed successfully");
          done();
        } catch (err) {
          console.info(msg + " Failed in testgetComponent " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0900
     * @tc.name      : testRenderContext_registerResourcePath
     * @tc.desc      : Verify registerResourcePath() returns a valid boolean indicates whether the registration was successful
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            let registerFail = renderContext.registerResourcePath("shaders", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "shaders" registration result:', registerFail);
            expect(registerFail).assertFalse();

            let registerEmpty = renderContext.registerResourcePath("", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "" registration result:', registerEmpty);
            expect(registerEmpty).assertFalse();

            let registerSuss = renderContext.registerResourcePath("shaders_test", "OhosRawFile://shaders/custom_shader");
            console.info(msg + ' protocol "shaders_test" registration result:', registerSuss);
            expect(registerSuss).assertTrue();

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
  })
}