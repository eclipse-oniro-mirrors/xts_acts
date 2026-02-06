/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Camera,
  Color,
  Container,
  CubeGeometry,
  DirectionalLight,
  Geometry,
  GeometryType,
  Light,
  LightType,
  Morpher,
  Node,
  NodeType,
  PlaneGeometry,
  Position3,
  PostProcessSettings,
  Quaternion,
  RaycastResult,
  Scale3,
  Scene,
  SceneNodeParameters,
  SceneResourceFactory,
  SpotLight,
  ToneMappingSettings,
  ToneMappingType,
  Vec2,
  Vec3,
  Vec4
} from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'
import { lookAt } from '../common/utils'

export default function sceneNodeTest() {
  describe('sceneNodeTest', () => {
    let scene: Scene | null = null;
    let scene1: Scene | null = null;
    let node: Node | null = null;
    let geom: Geometry | null = null;
    let rf: SceneResourceFactory | null = null;
    let cam: Camera | null = null;
    let lig: Light | null = null;
    let spotLight: SpotLight;
    let directionalLight: DirectionalLight;

    /**
     * @tc.name   testGetNodeByPath
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0100
     * @tc.desc   Used to obtain the node according to the path, and return empty if it cannot be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        let sceneUri = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        scene = await Scene.load(sceneUri);
        expect(scene != undefined).assertTrue();
        console.info(msg + " get scene success ");
        node = scene?.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') as Node;
        expect(node != null).assertTrue();
        console.info(msg + " Succeed in scene.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') ");
        let nullNode: Node | null = scene!.root!.getNodeByPath('Scene/1234/456');
        expect(nullNode).assertNull();
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') " +
          JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPath
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0080
     * @tc.desc   Used to get node path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
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
     * @tc.name   testParent
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0090
     * @tc.desc   Used to get node Parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
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
     * @tc.name   testRemove
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0110
     * @tc.desc   Used to remove specified object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRemove";
      console.info(msg + ' begin ');
      try {
        expect(scene != undefined).assertTrue();
        expect(node != null).assertTrue();
        let count = scene!.root!.children.count() as int;
        let container: Container<Node>;
        container = scene!.root!.children as Container<Node>;
        container.append(node!);
        expect(container.count()).assertEqual(count + 1);
        console.info(msg + " Succeed in scene.root?.children.append(node) ");
        container.remove(node!);
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
     * @tc.name   testInsertAfter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0120
     * @tc.desc   Used to insert an object after the sibling node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInsertAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testInsertAfter";
      console.info(msg + ' begin ');
      try {
        expect(scene != undefined).assertTrue();
        expect(node != null).assertTrue();
        let count = scene!.root!.children.count() as int;
        scene!.root!.children.insertAfter(node!, null);
        expect(scene!.root!.children.count()).assertEqual(count + 1);
        console.info(msg + " Succeed in scene.root?.children.insertAfter(node,null) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.insertAfter(node,null) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testGet
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0130
     * @tc.desc   Used to gets the specified subscript object and returns empty if it cannot be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testGet";
      console.info(msg + ' begin ');
      try {
        expect(scene != undefined).assertTrue();
        expect(node != null).assertTrue();
        scene!.root!.children.remove(node!);
        scene!.root!.children.append(node!);
        let count = scene!.root!.children.count() as int;
        let node1 = scene!.root!.children.get(count - 1) as Node;
        console.info(msg + " Succeed in scene.root?.children.get(count - 1) ");
        expect(node1!.name).assertEqual(node!.name);
        expect(node1!.path).assertEqual(node!.path);
        let nullNode: Node | null = scene!.root!.children.get(count);
        expect(nullNode).assertNull();
        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.get(count - 1) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testLayerMask
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0140
     * @tc.desc   The layer mask used to define the node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLayerMask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testLayerMask";
      console.info(msg + ' begin ');
      try {
        expect(node != null).assertTrue();
        let layerMask = node!.layerMask;
        expect(layerMask != null).assertTrue();
        console.info(msg + " layerMask is not null ");
        node!.layerMask.setEnabled(3, false);
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
     * @tc.name   testPosition
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0150
     * @tc.desc   Used to set node position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testPosition";
      console.info(msg + ' begin ');
      try {
        let vec3: Vec3;
        let position: Position3;
        vec3 = { x: 5, y: 5, z: 5 };
        position = vec3;
        if (node) {
          node!.position = position;
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
     * @tc.name   testRotation
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0160
     * @tc.desc   Used to set node Rotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRotation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRotation";
      console.info(msg + ' begin ');
      try {
        let rotation: Quaternion = {
          x: 5,
          y: 5,
          z: 5,
          w: 5
        };
        if (node) {
          node!.rotation = rotation;
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
     * @tc.name   testScale
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0170
     * @tc.desc   Used to set node scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testScale";
      console.info(msg + ' begin ');
      try {
        let scale: Scale3 = {
          x: 5, y: 5, z: 5
        };
        if (node) {
          node!.scale = scale;
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
     * @tc.name   testVisible
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0180
     * @tc.desc   Used to set weather the node is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testVisible";
      console.info(msg + ' begin ');
      try {
        expect(node?.visible).assertTrue();
        console.info(msg + " node?.visible is true ");
        if (node) {
          node!.visible = false;
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
     * @tc.name   testFov
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0190
     * @tc.desc   Used to set field of view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFov', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testFov";
      console.info(msg + ' begin ');
      try {
        expect(scene != null).assertTrue();
        console.info(msg + " scene is not null ");
        if (scene) {
          rf = scene!.getResourceFactory();
          cam = await rf!.createCamera({ name: "Camera1" });
        }
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam!.fov = 2;
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
     * @tc.name   testNearPlane
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0200
     * @tc.desc   Used to set nearPlane The value ranges from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNearPlane', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testNearPlane";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam!.nearPlane = 0.5;
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
     * @tc.name   testFarPlane
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0210
     * @tc.desc   Used to set farPlane The value ranges from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFarPlane', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testFarPlane";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam!.farPlane = 0.5;
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
     * @tc.name   testCamEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0220
     * @tc.desc   Used to set whether the camera is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCamEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCamEnabled";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam!.enabled = true;
          expect(cam?.enabled).assertTrue();
          cam!.enabled = false;
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
     * @tc.name   testClearColor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0230
     * @tc.desc   The specific color used to empty the render target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClearColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testClearColor";
      console.info(msg + ' begin ');
      try {
        let color: Color | null;
        color = { r: 2, g: 2, b: 2, a: 2 };
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        if (cam) {
          cam!.enabled = true;
          cam!.clearColor = color;
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
     * @tc.name   testPostProcess
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0240
     * @tc.desc   Used to post-processing Settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostProcess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
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
          cam!.postProcess = post;
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
     * @tc.name   testLightColor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0250
     * @tc.desc   Used to set light color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLightColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testLightColor";
      console.info(msg + ' begin ');
      try {
        lig = await rf!.createLight({ name: "Light" }, LightType.DIRECTIONAL);
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig!.color = { r: 2, g: 2, b: 2, a: 2 };
          expect(lig!.color.r).assertEqual(2);
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
     * @tc.name   testLigEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0260
     * @tc.desc   Used to set whether the light is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLigEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testLigEnabled";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig!.enabled = true;
          expect(lig?.enabled).assertTrue();
          console.info(msg + " Succeed in lig.enabled = false ");
          lig!.enabled = false;
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
     * @tc.name   testShadowEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0270
     * @tc.desc   Used to set whether the shadow is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShadowEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testShadowEnabled";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig!.shadowEnabled = true;
          expect(lig?.shadowEnabled).assertTrue();
          console.info(msg + " Succeed in lig.shadowEnabled = true ");
          lig!.shadowEnabled = false;
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
     * @tc.name   testLightType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0280
     * @tc.desc   Used to get light type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLightType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testLightType";
      console.info(msg + ' begin ');
      try {
        directionalLight = await rf!.createLight({ name: "Light1" }, LightType.DIRECTIONAL) as DirectionalLight;
        expect(directionalLight.lightType).assertEqual(LightType.DIRECTIONAL);
        console.info(msg + " Succeed in createLight LightType.DIRECTIONAL ");
        spotLight = await rf!.createLight({ name: "Light2" }, LightType.SPOT) as SpotLight;
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
     * @tc.name   testIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0290
     * @tc.desc   Used to set light intensity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIntensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testIntensity";
      console.info(msg + ' begin ');
      try {
        expect(lig != null).assertTrue();
        console.info(msg + " lig is not null ");
        if (lig) {
          lig!.intensity = 1000;
          expect(lig!.intensity).assertEqual(1000);
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
     * @tc.name   testNodeType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0300
     * @tc.desc   Used to get nodeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testNodeType";
      console.info(msg + ' begin ');
      try {
        let node1 = await rf!.createNode({ name: "createNode1" })
        let sceneUri = $rawfile("gltf/Cube/glTF/Cube.glb");
        scene1 = await Scene.load(sceneUri);
        expect(scene1 != undefined).assertTrue();
        console.info(msg + " succeed in load ");
        geom = scene1!.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Geometry;
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
     * @tc.name   testClear
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0310
     * @tc.desc   Used to empty all objects in the container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testClear";
      console.info(msg + ' begin ');
      try {
        expect(node != null).assertTrue();
        scene?.root?.children.append(node!);
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
     * @tc.name   testBloomSettings
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0570
     * @tc.desc   Used to set the properties of the bloom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBloomSettings', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testBloomSettings";
      console.info(msg + ' begin ');
      try {
        expect(cam != null).assertTrue();
        console.info(msg + " cam is not null ");
        expect(cam?.postProcess != null).assertTrue();
        console.info(msg + " cam?.postProcess is not null ");
        if (cam?.postProcess) {
          cam!.postProcess!.bloom = { thresholdHard: 1.0, thresholdSoft: 1.0, scaleFactor: 0.5, scatter: 2.0 };
          expect(cam!.postProcess!.bloom?.thresholdHard).assertEqual(1.0);
          console.info(msg + " Succeed in cam.postProcess.bloom.thresholdHard ");
          expect(cam!.postProcess!.bloom?.thresholdSoft).assertEqual(1.0);
          console.info(msg + " Succeed in cam.postProcess.bloom.thresholdSoft ");
          expect(cam!.postProcess!.bloom?.scaleFactor).assertEqual(0.5);
          console.info(msg + " Succeed in cam.postProcess.bloom.scaleFactor ");
          expect(cam!.postProcess!.bloom?.scatter).assertEqual(2.0);
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
     * @tc.name   testCreateGeometryCUBE
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0580
     * @tc.desc   Used to create a cube
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateGeometryCUBE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCreateGeometryCUBE";
      console.info(msg + ' begin ');
      try {
        let cubeGeom = new CubeGeometry();
        expect(cubeGeom != null).assertTrue();
        console.info(msg + " cubeGeom is not null ");
        expect(cubeGeom.geometryType).assertEqual(GeometryType.CUBE);
        cubeGeom.size = { x: 0.8, y: 0.4, z: 0.6 }
        let meshRes1 = await rf!.createMesh({ name: "resource name not used at the moment " }, cubeGeom);
        expect(meshRes1 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        let geometry1 = await rf!.createGeometry({ name: "cuubio" }, meshRes1);
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
     * @tc.name   testCreateGeometryPLANE
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0590
     * @tc.desc   Used to create a plane
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateGeometryPLANE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCreateGeometryPLANE";
      console.info(msg + ' begin ');
      try {
        let planeGeom = new PlaneGeometry();
        expect(planeGeom != null).assertTrue();
        console.info(msg + " planeGeom is not null ");
        expect(planeGeom.geometryType).assertEqual(GeometryType.PLANE);
        planeGeom.size = { x: 1, y: 1 };
        let meshRes2 = await rf!.createMesh({ name: "resource name not used at the moment " }, planeGeom);
        expect(meshRes2 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        let geometry2 = await rf!.createGeometry({ name: "plaanio" }, meshRes2);
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
     * @tc.name   testImportNode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0600
     * @tc.desc   Used to import a node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testImportNode";
      console.info(msg + ' begin ');
      try {
        let node1 = scene1!.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Node;
        let node2: Node | null | undefined = null;
        node2 = scene?.importNode("scene2", node1!, scene?.root ?? null);
        expect(node2 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testImportNode " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testImportScene
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0610
     * @tc.desc   Used to import a scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testImportScene";
      console.info(msg + ' begin ');
      try {
        let node2: Node | null | undefined = null;
        node2 = scene?.importScene("scene1", scene1!, null);
        expect(node2 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in testImportScene " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGeometry_Morpher
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0740
     * @tc.desc   Verifies that a Geometry node can have an optional Morpher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGeometry_Morpher', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testGeometry_Morpher";
      console.info(msg + ' begin ');
      try {
        let sceneUri = $rawfile('gltf/Morpher/MorphStressTest.glb');
        let scene = await Scene.load(sceneUri);
        console.info(msg, 'scene loaded:', scene != null);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg, 'rootNode:', rootNode != null);
        expect(rootNode != null).assertTrue();

        let geometryNode = scene.getNodeByPath('rootNode_/Scene/Main');
        console.info(msg, 'geometryNode:', geometryNode != null);
        expect(geometryNode != null).assertTrue();

        if (geometryNode != null) {
          let morpher: Morpher | undefined = (geometryNode as Geometry).morpher;
          console.info(msg, 'morpher:', morpher != null);
          expect(morpher != null).assertTrue();

          if (morpher != null) {
            let targets: Record<string, double> = morpher.targets;
            console.info(msg, 'morpher.targets:', targets != null);
            expect(targets != null).assertTrue();
            let ei: Iterator<[string, double]> = targets.entries();
            while (true) {
              let e = ei.next();
              if (e.done) {
                break;
              }
              let weight = e.value![1];
              expect((weight >= 0.0 && weight <= 1.0)).assertTrue();
            }
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
     * @tc.name   testCamera_raycast
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0750
     * @tc.desc   Verifies Camera raycast returns valid hit results with node, centerDistance,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCamera_raycast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCamera_raycast";
      console.info(msg + ' begin');
      try {
        let sceneUri = $rawfile('gltf/CubeWithFloor/glTF/AnimatedCube.glb');
        let scene = await Scene.load(sceneUri);
        console.info(msg, 'scene loaded:', scene != null);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg + " root node:", rootNode);
        expect(rootNode != null).assertTrue();

        let raycastNode = scene.getNodeByPath('rootNode_/Unnamed Node 1/AnimatedCube') as Node;
        console.info(msg + " target node obtained:", raycastNode?.name ?? "null");
        expect(raycastNode != null).assertTrue();

        let factory: SceneResourceFactory = scene.getResourceFactory();
        let cameraParams: SceneNodeParameters = { name: "camera1" };
        let camera = await factory.createCamera(cameraParams);
        camera.enabled = true;

        lookAt(camera, { x: 15, y: 10, z: 20 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });
        let viewPos: Vec2 = { x: 0.5, y: 0.5 };

        let results: RaycastResult[] = await camera.raycast(viewPos, { rootNode: raycastNode });
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