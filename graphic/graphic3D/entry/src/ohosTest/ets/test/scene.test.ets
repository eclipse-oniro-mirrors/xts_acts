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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
        rf = scene.getResourceFactory();
        expect(scene != undefined).assertTrue();
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf")) ' +
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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
        rf = scene.getResourceFactory();
        scene?.getResourceFactory();
        console.info(msg + " Succeed in scene.getResourceFactory() ");
        expect(true).assertTrue();
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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
        let scene1 = await rf.createScene($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
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
  })
}