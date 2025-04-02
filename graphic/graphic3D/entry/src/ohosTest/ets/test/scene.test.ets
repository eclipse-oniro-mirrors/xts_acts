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
import { Vec2, Rotation3, SceneResourceParameters, SceneNodeParameters, Scene } from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
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
    it('testSceneLoad', 0, async (done:Function)=> {
      let msg = "============================testSceneLoad";
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
    it('testGetNodeByPath', 0, (done:Function)=> {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
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
    it('testGetResourceFactory', 0, (done:Function)=> {
      let msg = "============================testGetResourceFactory";
      console.info(msg + ' begin ');
      try {
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
    it('testDestroy', 0, (done:Function)=> {
      let msg = "============================testDestroy";
      console.info(msg + ' begin ');
      try {
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
    it('testSceneResourceParameters', 0, (done:Function)=> {
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
    it('testSceneNodeParameters', 0, (done:Function)=> {
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
    it('testSceneType', 0, (done:Function)=> {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0080
     * @tc.name      : testSceneRenderFrame
     * @tc.desc      : Used to see if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneRenderFrame', 0, (done:Function)=> {
      let msg = "============================testSceneRenderFrame";
      console.info(msg + ' begin ');
      try {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0090
     * @tc.name      : testSceneRenderParameters
     * @tc.desc      : Used to set if the scene is single-frame
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRenderParameters', 0, (done:Function)=> {
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
  })
}