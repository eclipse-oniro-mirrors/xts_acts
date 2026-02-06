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
import { ToneMappingType, ToneMappingSettings, PostProcessSettings, Vec3, Vec4, Color, Quaternion, Position3,  Scale3, NodeType, Container, Node, Geometry, LightType, Light, SpotLight, DirectionalLight,
  SceneResourceFactory, Scene } from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'
import { lookAt } from '../common/utils';

export default function sceneNodeTest() {
  describe('sceneNodeTest', ()=> {
    let scene: Scene | null = null;
    let scene1: Scene | null = null;
    let node: Node | null = null;
    let geom: Geometry | null = null;
    let rf: SceneResourceFactory;
    let cam: scene3d.Camera | null = null;
    let lig: Light | null = null;
    let spotLight: SpotLight;
    let directionalLight: DirectionalLight;

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0100
     * @tc.name      : testGetNodeByPath
     * @tc.desc      : Used to obtain the node according to the path, and return empty if it cannot be obtained
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " get scene success ");
        node = scene?.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') as Node;
        expect(node != null).assertTrue();
        console.info(msg + " Succeed in scene.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') " +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0080
     * @tc.name      : testPath
     * @tc.desc      : Used to get node path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testPath";
      console.info(msg + ' begin ');
      try {
        let path = node?.path;
        expect(path).assertEqual("/rootNode_/Scene/");
        console.info(msg + " Succeed in path = node?.path ");
        done();
      } catch (err) {
        console.info(msg + " Failed in path = node?.path " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0090
     * @tc.name      : testParent
     * @tc.desc      : Used to get node Parent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testParent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testParent";
      console.info(msg + ' begin ');
      try {
        let parentName = node?.parent?.name;
        expect(parentName).assertEqual("Scene");
        console.info(msg + " Succeed in parentName = node?.parent?.name ");
        done();
      } catch (err) {
        console.info(msg + " Failed in parentName = node?.parent?.name " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0110
     * @tc.name      : testRemove
     * @tc.desc      : Used to remove specified object
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testRemove";
      console.info(msg + ' begin ');
      try {
        let count = scene?.root?.children.count() as number;
        let container: Container<Node>;
        container = scene?.root?.children as Container<Node>;
        container.append(node);
        expect(container.count()).assertEqual(count + 1);
        console.info(msg + " Succeed in scene.root?.children.append(node) ");
        container.remove(node);
        expect(container.count()).assertEqual(count);
        console.info(msg + " Succeed in scene.root?.children.remove(node) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.remove(node) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0120
     * @tc.name      : testInsertAfter
     * @tc.desc      : Used to insert an object after the sibling node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testInsertAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testInsertAfter";
      console.info(msg + ' begin ');
      try {
        let count = scene?.root?.children.count() as number;
        scene?.root?.children.insertAfter(node, null);
        expect(scene?.root?.children.count()).assertEqual(count + 1);
        console.info(msg + " Succeed in scene.root?.children.insertAfter(node,null) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.insertAfter(node,null) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0130
     * @tc.name      : testGet
     * @tc.desc      : Used to gets the specified subscript object and returns empty if it cannot be obtained
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testGet";
      console.info(msg + ' begin ');
      try {
        scene?.root?.children.remove(node);
        scene?.root?.children.append(node);
        let count = scene?.root?.children.count() as number;
        let node1 = scene?.root?.children.get(count - 1) as Node;
        console.info(msg + " Succeed in scene.root?.children.get(count - 1) ");
        expect(node1).assertEqual(node);
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.get(count - 1) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0140
     * @tc.name      : testLayerMask
     * @tc.desc      : The layer mask used to define the node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLayerMask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testLayerMask";
      console.info(msg + ' begin ');
      try {
        let layerMask = node?.layerMask;
        expect(layerMask != null).assertTrue();
        console.info(msg + " layerMask is not null ");
        node?.layerMask.setEnabled(3, false);
        expect(node?.layerMask.getEnabled(3)).assertFalse();
        console.info(msg + " Succeed in node?.layerMask.setEnabled(3, false) ");
        node?.layerMask.setEnabled(3, true);
        expect(node?.layerMask.getEnabled(3)).assertTrue();
        console.info(msg + " Succeed in node?.layerMask.setEnabled(3, true) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in node?.layerMask.setEnabled(3, false) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0150
     * @tc.name      : testPosition
     * @tc.desc      : Used to set node position
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testPosition";
      console.info(msg + ' begin ');
      try {
        let vec3: Vec3;
        let position: Position3;
        vec3 = { x: 5, y: 5, z: 5 };
        position = vec3;
        if (node) {
          node.position = position;
        }
        expect(node?.position.x).assertEqual(5);
        expect(node?.position.y).assertEqual(5);
        expect(node?.position.z).assertEqual(5);
        console.info(msg + " Succeed in node?.position ");
        done();
      } catch (err) {
        console.info(msg + " Failed in node?.position " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0160
     * @tc.name      : testRotation
     * @tc.desc      : Used to set node Rotation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testRotation";
      console.info(msg + ' begin ');
      try {
        let rotation: Quaternion;
        let vec4: Vec4;
        vec4 = {
          x: 5,
          y: 5,
          z: 5,
          w: 5
        };
        rotation = vec4;
        if (node) {
          node.rotation = rotation;
        }
        expect(node?.rotation.x).assertEqual(5);
        expect(node?.rotation.y).assertEqual(5);
        expect(node?.rotation.z).assertEqual(5);
        expect(node?.rotation.w).assertEqual(5);
        console.info(msg + " Succeed in node.rotation ");
        done();
      } catch (err) {
        console.info(msg + " Failed in node?.rotation " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0170
     * @tc.name      : testScale
     * @tc.desc      : Used to set node scale
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testScale";
      console.info(msg + ' begin ');
      try {
        let scale: Scale3 = {
          x: 5, y: 5, z: 5
        };
        if (node) {
          node.scale = scale;
        }
        expect(node?.scale.x).assertEqual(5);
        expect(node?.scale.y).assertEqual(5);
        expect(node?.scale.z).assertEqual(5);
        console.info(msg + " Succeed in node.scale = scale ");
        done();
      } catch (err) {
        console.info(msg + " Failed in node.scale = scale " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0180
     * @tc.name      : testVisible
     * @tc.desc      : Used to set weather the node is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testVisible";
      console.info(msg + ' begin ');
      try {
        expect(node?.visible).assertTrue();
        console.info(msg + " node?.visible is true ");
        if (node) {
          node.visible = false;
        }
        expect(node?.visible).assertFalse();
        console.info(msg + " Succeed in node.visible set false");
        done();
      } catch (err) {
        console.info(msg + " Failed in node.visible set false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0190
     * @tc.name      : testFov
     * @tc.desc      : Used to set field of view
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFov', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testFov";
      console.info(msg + ' begin ');
      try {
        expect(scene != null).assertTrue();
        console.info(msg + " scene is not null ");
        if (scene) {
          rf = scene.getResourceFactory();
          cam = await rf.createCamera({ name: "Camera1" });
        }
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.fov = 2;
        }
        expect(cam?.fov).assertEqual(2);
        console.info(msg + " Succeed in cam.fov = 2 ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.fov = 2 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0200
     * @tc.name      : testNearPlane
     * @tc.desc      : Used to set nearPlane The value ranges from 0 to 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testNearPlane', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testNearPlane";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.nearPlane = 0.5;
        }
        expect(cam?.nearPlane).assertEqual(0.5);
        console.info(msg + " Succeed in cam.nearPlane = 0.5 ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.nearPlane = 0.5 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0210
     * @tc.name      : testFarPlane
     * @tc.desc      : Used to set farPlane The value ranges from 0 to 1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFarPlane', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testFarPlane";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.farPlane = 0.5;
        }
        expect(cam?.farPlane).assertEqual(0.5);
        console.info(msg + " Succeed in cam.farPlane = 0.5 ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.farPlane = 0.5 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0220
     * @tc.name      : testCamEnabled
     * @tc.desc      : Used to set whether the camera is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCamEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testCamEnabled";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.enabled = true;
          expect(cam?.enabled).assertTrue();
          cam.enabled = false;
        }
        expect(cam?.enabled).assertFalse();
        console.info(msg + " Succeed in cam.enabled = false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.enabled = false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0230
     * @tc.name      : testClearColor
     * @tc.desc      : The specific color used to empty the render target
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testClearColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testClearColor";
      console.info(msg + ' begin ');
      try {
        let color: Color | null;
        color = { r: 2, g: 2, b: 2, a: 2 };
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.enabled = true;
          cam.clearColor = color;
        }
        expect(cam?.clearColor?.r).assertEqual(2);
        expect(cam?.clearColor?.g).assertEqual(2);
        expect(cam?.clearColor?.b).assertEqual(2);
        expect(cam?.clearColor?.a).assertEqual(2);
        console.info(msg + " Succeed in cam.clearColor = color ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.clearColor = color " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0240
     * @tc.name      : testPostProcess
     * @tc.desc      : Used to post-processing Settings
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testPostProcess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testPostProcess";
      console.info(msg + ' begin ');
      try {
        let toneMapType: ToneMappingType;
        let toneMap: ToneMappingSettings;
        let post: PostProcessSettings | null;
        let exposure = 0.5 as number;
        toneMapType = ToneMappingType.ACES;
        toneMapType = ToneMappingType.ACES_2020;
        toneMapType = ToneMappingType.FILMIC;
        toneMap = { type: toneMapType, exposure };
        post = { toneMapping: toneMap }
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam.postProcess = post;
        }
        expect(cam?.postProcess?.toneMapping?.exposure).assertEqual(0.5);
        console.info(msg + " Succeed in cam.postProcess = post ");
        done();
      } catch (err) {
        console.info(msg + " Failed in cam.postProcess = post " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0250
     * @tc.name      : testLightColor
     * @tc.desc      : Used to set light color
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLightColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testLightColor";
      console.info(msg + ' begin ');
      try {
        lig = await rf.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig.color = { r: 2, g: 2, b: 2, a: 2 };
          expect(lig.color.r).assertEqual(2);
          console.info(msg + " Succeed in lig.color = { r: 2, g: 2, b: 2, a: 2 } ");
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in lig.color = { r: 2, g: 2, b: 2, a: 2 } " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0260
     * @tc.name      : testLigEnabled
     * @tc.desc      : Used to set whether the light is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLigEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testLigEnabled";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig.enabled = true;
          expect(lig?.enabled).assertTrue();
          console.info(msg + " Succeed in lig.enabled = false ");
          lig.enabled = false;
          expect(lig?.enabled).assertFalse();
          console.info(msg + " Succeed in lig.enabled = false ");
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in lig.enabled = false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0270
     * @tc.name      : testShadowEnabled
     * @tc.desc      : Used to set whether the shadow is visible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShadowEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testShadowEnabled";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig.shadowEnabled = true;
          expect(lig?.shadowEnabled).assertTrue();
          console.info(msg + " Succeed in lig.shadowEnabled = true ");
          lig.shadowEnabled = false;
          expect(lig?.shadowEnabled).assertFalse();
          console.info(msg + " Succeed in lig.shadowEnabled = false ");
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in lig.shadowEnabled = false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0280
     * @tc.name      : testLightType
     * @tc.desc      : Used to get light type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3g
     */
    it('testLightType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testLightType";
      console.info(msg + ' begin ');
      try {
        directionalLight = await rf.createLight({ name: "Light1" }, LightType.DIRECTIONAL)
        expect(directionalLight.lightType).assertEqual(LightType.DIRECTIONAL);
        console.info(msg + " Succeed in createLight LightType.DIRECTIONAL ");
        spotLight = await rf.createLight({ name: "Light2" }, LightType.SPOT)
        expect(spotLight.lightType).assertEqual(LightType.SPOT);
        console.info(msg + " Succeed in createLight LightType.SPOT ");
        done();
      } catch (err) {
        console.info(msg +
          ' Failed in lig = await directionalLight.createLight({name: "Light1"},  LightType.SPOT) ' +
        JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0290
     * @tc.name      : testIntensity
     * @tc.desc      : Used to set light intensity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testIntensity";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig.intensity = 1000;
          expect(lig.intensity).assertEqual(1000);
          console.info(msg + " Succeed in lig.intensity = 1000 ");
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in lig.intensity = 1000 " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0300
     * @tc.name      : testNodeType
     * @tc.desc      : Used to get nodeType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testNodeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testNodeType";
      console.info(msg + ' begin ');
      try {
        let node1 = await rf.createNode({ name: "createNode1" })
        scene1 = await Scene.load($rawfile("gltf/Cube/glTF/Cube.glb"));
        expect(scene1 != undefined).assertTrue();
        console.info(msg + " succeed in load ");
        geom = scene1.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Geometry;
        expect(geom != null).assertTrue();
        console.info(msg + " succeed in getNodeByPath ");
        expect(node1?.nodeType).assertEqual(NodeType.NODE);
        console.info(msg + " node1?.nodeType is " + JSON.stringify(node1?.nodeType));
        expect(geom?.nodeType).assertEqual(NodeType.GEOMETRY);
        console.info(msg + " geom?.nodeType is " + JSON.stringify(geom?.nodeType));
        expect(lig?.nodeType).assertEqual(NodeType.LIGHT);
        console.info(msg + " lig?.nodeType is " + JSON.stringify(lig?.nodeType));
        expect(cam?.nodeType).assertEqual(NodeType.CAMERA);
        console.info(msg + " cam?.nodeType is " + JSON.stringify(cam?.nodeType));
        done();
      } catch (err) {
        console.info(msg + " Failed in node?.nodeType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0310
     * @tc.name      : testClear
     * @tc.desc      : Used to empty all objects in the container
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testClear";
      console.info(msg + ' begin ');
      try {
        scene?.root?.children.append(node);
        scene?.root?.children.clear();
        console.info(msg + " Succeed in scene.root?.children.clear() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.clear() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0570
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to set the properties of the bloom
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBloomSettings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testBloomSettings";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        expect(cam?.postProcess != null).assertTrue();
        console.info(msg + " cam?.postProcess is not null ");
        if (cam?.postProcess) {
          cam.postProcess.bloom = { thresholdHard: 1.0, thresholdSoft: 1.0, scaleFactor: 0.5, scatter: 2.0 };
          expect(cam.postProcess.bloom.thresholdHard).assertEqual(1.0);
          console.info(msg + " Succeed in cam.postProcess.bloom.thresholdHard ");
          expect(cam.postProcess.bloom.thresholdSoft).assertEqual(1.0);
          console.info(msg + " Succeed in cam.postProcess.bloom.thresholdSoft ");
          expect(cam.postProcess.bloom.scaleFactor).assertEqual(0.5);
          console.info(msg + " Succeed in cam.postProcess.bloom.scaleFactor ");
          expect(cam.postProcess.bloom.scatter).assertEqual(2.0);
          console.info(msg + " Succeed in cam.postProcess.bloom.scatter ");
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in testBloomSettings " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0580
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to create a cube
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateGeometryCUBE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateGeometryCUBE";
      console.info(msg + ' begin ');
      try {
        let cubeGeom = new scene3d.CubeGeometry();
        expect(cubeGeom != null).assertTrue();
        console.info(msg + " cubeGeom is not null ");
        expect(cubeGeom.geometryType).assertEqual(scene3d.GeometryType.CUBE);
        cubeGeom.size = {x: 0.8, y: 0.4, z: 0.6}
        let meshRes1 = await rf.createMesh({ name: "resource name not used at the moment "}, cubeGeom);
        expect(meshRes1 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        let geometry1 = await rf.createGeometry({ name: "cuubio" }, meshRes1);
        expect(geometry1 != null).assertTrue();
        console.info(msg + " Succeed in createGeometry ");
        scene?.root?.children.append(geometry1);
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateGeometryCUBE " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0590
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to create a plane
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateGeometryPLANE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateGeometryPLANE";
      console.info(msg + ' begin ');
      try {
        let planeGeom = new scene3d.PlaneGeometry();
        expect(planeGeom != null).assertTrue();
        console.info(msg + " planeGeom is not null ");
        expect(planeGeom.geometryType).assertEqual(scene3d.GeometryType.PLANE);
        planeGeom.size = {x: 1, y: 1};
        let meshRes2 = await rf.createMesh({ name: "resource name not used at the moment "}, planeGeom);
        expect(meshRes2 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        let geometry2 = await rf.createGeometry({ name: "plaanio" }, meshRes2);
        expect(geometry2 != null).assertTrue();
        console.info(msg + " Succeed in createGeometry ");
        scene?.root?.children.append(geometry2);
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateGeometryPLANE " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0600
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to import a node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testImportNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testImportNode";
      console.info(msg + ' begin ');
      try {
        let node1 = scene1?.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Node;
        let node2: scene3d.Node | null | undefined = null;
        node2 = scene?.importNode("scene2", node1, scene.root);
        expect(node2 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testImportNode " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0610
     * @tc.name      : testSphereGeometry
     * @tc.desc      : Used to import a scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testImportScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testImportScene";
      console.info(msg + ' begin ');
      try {
        let node2: scene3d.Node | null | undefined = null;
        node2 = scene?.importScene("scene1", scene1, null);
        expect(node2 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testImportScene " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0740
     * @tc.name      : testGeometry_Morpher
     * @tc.desc      : Verifies that a Geometry node can have an optional Morpher
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGeometry_Morpher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testGeometry_Morpher";
      console.info(msg + ' begin ');
      try {

        let scene = await Scene.load($rawfile('gltf/Morpher/MorphStressTest.glb'));
        console.info(msg, 'scene loaded:', scene != null);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg, 'rootNode:', rootNode != null);
        expect(rootNode != null).assertTrue();

        let geometryNode = scene.getNodeByPath('rootNode_/Scene/Main');
        console.info(msg, 'geometryNode:', geometryNode != null);
        expect(geometryNode != null).assertTrue();

        if (geometryNode != null) {
          let morpher: scene3d.Morpher | undefined = (geometryNode as Geometry).morpher;
          console.info(msg, 'morpher:', morpher != null);
          expect(morpher != null).assertTrue();

          if (morpher != null) {
            let targets = morpher.targets;
            console.info(msg, 'morpher.targets:', targets != null);
            expect(targets != null).assertTrue();
            Object.values(targets).forEach(weight => {
              expect(weight >= 0.0 && weight <= 1.0).assertTrue();
            });
          }
        }
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGeometry_Morpher " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0750
     * @tc.name      : testCamera_raycast
     * @tc.desc      : Verifies Camera raycast returns valid hit results with node, centerDistance,
     *                 and hitPosition using a screen-space ray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCamera_raycast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msg = "============================testCamera_raycast";
      console.info(msg + ' begin');
      try {
        let scene = await Scene.load($rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb'));
        console.info(msg, 'scene loaded:', scene != null);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg + " root node:", rootNode);
        expect(rootNode != null).assertTrue();

        let raycastNode = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as scene3d.Node;
        console.info(msg + " target node obtained:", raycastNode?.name ?? "null");
        expect(raycastNode != null).assertTrue();

        let factory: SceneResourceFactory = scene.getResourceFactory();
        let cameraParams: scene3d.SceneNodeParameters = { name: "camera1" };
        let camera = await factory.createCamera(cameraParams);
        camera.enabled = true;

        lookAt(camera, { x: 15, y: 10, z: 20 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });
        let viewPos: scene3d.Vec2 = { x: 0.5, y: 0.5 };

        let results: scene3d.RaycastResult[] = await camera.raycast(viewPos, { rootNode: raycastNode });
        expect(results != null && results.length > 0).assertTrue();
        let hit = results[0];

        expect(hit.node != null).assertTrue();
        console.info(msg + " Hit node name:", hit.node.name);

        expect(typeof hit.centerDistance === 'number' && hit.centerDistance > 0).assertTrue();
        console.info(msg + " Hit centerDistance:", hit.centerDistance);

        expect(hit.hitPosition != null).assertTrue();
        console.info(msg + " Hit position:", JSON.stringify(hit.hitPosition));

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testCamera_raycast: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}