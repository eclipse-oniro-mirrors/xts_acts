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
  Camera} from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'

export default function sceneTest() {
  describe('sceneTest', ()=> {
    let scene: Scene | null = null;
    let rf: scene3d.SceneResourceFactory;
    /**
     * @tc.name   testSceneLoad_01
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0010
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
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")) ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testGetNodeByPath
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0020
     * @tc.desc   Nodes are obtained from paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
        let node1 = scene?.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', scene3d.NodeType.GEOMETRY);
        console.info(msg + " scene?.getNodeByPath node1: " + JSON.stringify(node1));
        expect(node1 != null).assertTrue();
        console.info(msg + " node1 != null ");
        expect(node1?.nodeType).assertEqual(scene3d.NodeType.GEOMETRY);
        let node2 = scene.getNodeByPath('rootNode_/Scene/node_123');
        expect(node2).assertNull();
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0030
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
     * @tc.name   testDestroy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0040
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0050
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0060
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0070
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0500
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0510
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0520
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0530
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0540
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0550
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0560
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0620
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
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateScene_02 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSceneLoad_02
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0630
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0640
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0650
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
     * @tc.name   testRaycastResult_hitPosition
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0660
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
     * @tc.name   testRaycastResult_rootNode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0670
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0680
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0690
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0700
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
     * @tc.name   testRenderContext_loadPlugin
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0710
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
            let loadFail = await renderContext.loadPlugin("NonExistentPlugin");
            console.info(msg + ' plugin "NonExistentPlugin" load result:', loadFail);
            expect(loadFail).assertFalse();
            let pluginName = '74c2dde9-8134-4471-af49-66ea20993c41'
            let plugin = await renderContext.loadPlugin(pluginName);
            console.info(msg + ' plugin "' + pluginName + '" load result:', plugin);
            expect(plugin).assertTrue();
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0720
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0730
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0900
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
    /**
     * @tc.name   testCreateCamera
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0910
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0920
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0930
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
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1012
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
     * @tc.name   testSceneRenderConfigurationShadowResolution
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1023
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
  })
}