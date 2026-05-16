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
  SceneResourceFactory, Scene, CameraParameters, SceneNodeParameters, Camera } from '@ohos.graphics.scene'
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
     * @tc.name   testNodeGetNodeByPath
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0100
     * @tc.desc   Used to obtain the node according to the path, and return empty if it cannot be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testNodeGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " get scene success ");
        node = scene?.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') as Node;
        expect(node != null).assertTrue();
        console.info(msg + " Succeed in scene.root?.getNodeByPath('Scene/node_damagedHelmet_-6514') ");
        let node1 = scene.root?.getNodeByPath('Scene/node_123');
        expect(node1).assertNull();

        // Test null parameter
        try {
          let nullNode = scene.root?.getNodeByPath(null);
          console.info(msg + " getNodeByPath with null parameter: " + JSON.stringify(nullNode));
          expect(nullNode).assertUndefined();
        } catch (nullErr) {
          console.info(msg + " getNodeByPath with null parameter threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter
        try {
          let undefinedNode = scene.root?.getNodeByPath(undefined);
          console.info(msg + " getNodeByPath with undefined parameter: " + JSON.stringify(undefinedNode));
          expect(undefinedNode).assertUndefined();
        } catch (undefinedErr) {
          console.info(msg + " getNodeByPath with undefined parameter threw error: " + JSON.stringify(undefinedErr));
        }

        // Test empty string parameter
        try {
          let emptyStringNode = scene.root?.getNodeByPath("");
          console.info(msg + " getNodeByPath with empty string: " + JSON.stringify(emptyStringNode));
          expect(emptyStringNode != null).assertTrue();
        } catch (emptyStringErr) {
          console.info(msg + " getNodeByPath with empty string threw error: " + JSON.stringify(emptyStringErr));
        }

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
     * @tc.name   testParent
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0090
     * @tc.desc   Used to get node Parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testRemove
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0110
     * @tc.desc   Used to remove specified object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

        // Test null parameter for remove
        try {
          container.remove(null);
          console.info(msg + " remove with null parameter executed");
        } catch (nullErr) {
          console.info(msg + " remove with null parameter threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for remove
        try {
          container.remove(undefined);
          console.info(msg + " remove with undefined parameter executed");
        } catch (undefinedErr) {
          console.info(msg + " remove with undefined parameter threw error: " + JSON.stringify(undefinedErr));
        }

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
    it('testInsertAfter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testInsertAfter";
      console.info(msg + ' begin ');
      try {
        let count = scene?.root?.children.count() as number;
        scene?.root?.children.insertAfter(node, null);
        expect(scene?.root?.children.count()).assertEqual(count + 1);
        console.info(msg + " Succeed in scene.root?.children.insertAfter(node,null) ");

        // Test null parameter for item (first parameter)
        try {
          scene?.root?.children.insertAfter(null, node);
          console.info(msg + " insertAfter with null item executed");
        } catch (nullErr) {
          console.info(msg + " insertAfter with null item threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for item (first parameter)
        try {
          scene?.root?.children.insertAfter(undefined, node);
          console.info(msg + " insertAfter with undefined item executed");
        } catch (undefinedErr) {
          console.info(msg + " insertAfter with undefined item threw error: " + JSON.stringify(undefinedErr));
        }

        // Test null parameter for sibling (second parameter)
        try {
          scene?.root?.children.insertAfter(node, null);
          console.info(msg + " insertAfter with null sibling executed (already tested above)");
        } catch (nullSiblingErr) {
          console.info(msg + " insertAfter with null sibling threw error: " + JSON.stringify(nullSiblingErr));
        }

        // Test undefined parameter for sibling (second parameter)
        try {
          scene?.root?.children.insertAfter(node, undefined);
          console.info(msg + " insertAfter with undefined sibling executed");
        } catch (undefinedSiblingErr) {
          console.info(msg + " insertAfter with undefined sibling threw error: " + JSON.stringify(undefinedSiblingErr));
        }

        done();
      } catch (err) {
        console.info(msg + " Failed in scene.root?.children.insertAfter(node,null) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testAppend
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0115
     * @tc.desc   Used to append an object to container with null/undefined coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAppend', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testAppend";
      console.info(msg + ' begin ');
      try {
        let container: Container<Node>;
        container = scene?.root?.children as Container<Node>;
        let count = container.count();

        // Test null parameter for append
        try {
          container.append(null);
          console.info(msg + " append with null parameter executed");
        } catch (nullErr) {
          console.info(msg + " append with null parameter threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for append
        try {
          container.append(undefined);
          console.info(msg + " append with undefined parameter executed");
        } catch (undefinedErr) {
          console.info(msg + " append with undefined parameter threw error: " + JSON.stringify(undefinedErr));
        }

        done();
      } catch (err) {
        console.info(msg + " Failed in testAppend " + JSON.stringify(err));
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
        let node2 =scene?.root?.children.get(count);
        console.info(msg + "node2: " + JSON.stringify(node2));
        expect(node2).assertNull();

        // Test null parameter for get
        try {
          let nullResult = scene?.root?.children.get(null);
          console.info(msg + " get with null parameter: " + JSON.stringify(nullResult));
          expect(nullResult).assertUndefined();
        } catch (nullErr) {
          console.info(msg + " get with null parameter threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for get
        try {
          let undefinedResult = scene?.root?.children.get(undefined);
          console.info(msg + " get with undefined parameter: " + JSON.stringify(undefinedResult));
          expect(undefinedResult).assertUndefined();
        } catch (undefinedErr) {
          console.info(msg + " get with undefined parameter threw error: " + JSON.stringify(undefinedErr));
        }

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

        // Test null parameter for getEnabled
        try {
          let nullGetResult = node?.layerMask.getEnabled(null);
          console.info(msg + " getEnabled with null parameter: " + JSON.stringify(nullGetResult));
          expect(nullGetResult).assertUndefined();
        } catch (nullErr) {
          console.info(msg + " getEnabled with null parameter threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for getEnabled
        try {
          let undefinedGetResult = node?.layerMask.getEnabled(undefined);
          console.info(msg + " getEnabled with undefined parameter: " + JSON.stringify(undefinedGetResult));
          expect(undefinedGetResult).assertUndefined();
        } catch (undefinedErr) {
          console.info(msg + " getEnabled with undefined parameter threw error: " + JSON.stringify(undefinedErr));
        }

        // Test null parameter for setEnabled (index)
        try {
          node?.layerMask.setEnabled(null, true);
          console.info(msg + " setEnabled with null index executed");
        } catch (nullErr) {
          console.info(msg + " setEnabled with null index threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for setEnabled (index)
        try {
          node?.layerMask.setEnabled(undefined, true);
          console.info(msg + " setEnabled with undefined index executed");
        } catch (undefinedErr) {
          console.info(msg + " setEnabled with undefined index threw error: " + JSON.stringify(undefinedErr));
        }

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
     * @tc.name   testRotation
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0160
     * @tc.desc   Used to set node Rotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testScale
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0170
     * @tc.desc   Used to set node scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testVisible
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0180
     * @tc.desc   Used to set weather the node is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testFov
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0190
     * @tc.desc   Used to set field of view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testNearPlane
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0200
     * @tc.desc   Used to set nearPlane The value ranges from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testFarPlane
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0210
     * @tc.desc   Used to set farPlane The value ranges from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testCamEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0220
     * @tc.desc   Used to set whether the camera is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testClearColor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0230
     * @tc.desc   The specific color used to empty the render target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testPostProcess
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0240
     * @tc.desc   Used to post-processing Settings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testLightColor
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0250
     * @tc.desc   Used to set light color
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testLigEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0260
     * @tc.desc   Used to set whether the light is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testShadowEnabled
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0270
     * @tc.desc   Used to set whether the shadow is visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testLightType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0280
     * @tc.desc   Used to get light type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testIntensity
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0290
     * @tc.desc   Used to set light intensity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testNodeType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0300
     * @tc.desc   Used to get nodeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testClear
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0310
     * @tc.desc   Used to empty all objects in the container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testBloomSettings
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0570
     * @tc.desc   Used to set the properties of the bloom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testCreateGeometryCUBE
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0580
     * @tc.desc   Used to create a cube
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

        // Test both parameters with null
        try {
          let nullNullMesh = await rf.createMesh(null, null);
          console.info(msg + " createMesh with (null, null): " + JSON.stringify(nullNullMesh));
          expect().assertFail();
        } catch (err) {
          console.info(msg + " createMesh with (null, null) threw error: " + JSON.stringify(err));
        }

        // Test both parameters with undefined
        try {
          let undefinedUndefinedMesh = await rf.createMesh(undefined, undefined);
          console.info(msg + " createMesh with (undefined, undefined): " + JSON.stringify(undefinedUndefinedMesh));
          expect().assertFail();
        } catch (err) {
          console.info(msg + " createMesh with (undefined, undefined) threw error: " + JSON.stringify(err));
        }

        // Test geometry parameter with null
        try {
          let paramsNullMesh = await rf.createMesh({ name: "test" }, null);
          console.info(msg + " createMesh with (params, null): " + JSON.stringify(paramsNullMesh));
          expect().assertFail();
        } catch (err) {
          console.info(msg + " createMesh with (params, null) threw error: " + JSON.stringify(err));
        }

        // Test geometry parameter with undefined
        try {
          let paramsUndefinedMesh = await rf.createMesh({ name: "test" }, undefined);
          console.info(msg + " createMesh with (params, undefined): " + JSON.stringify(paramsUndefinedMesh));
          expect().assertFail();
        } catch (err) {
          console.info(msg + " createMesh with (params, undefined) threw error: " + JSON.stringify(err));
        }
       
        let nullGeomMesh = await rf.createMesh(null, cubeGeom);
        expect(nullGeomMesh != null).assertTrue();
        console.info(msg + " createMesh with (null, geometry) returned mesh");

        let undefinedGeomMesh = await rf.createMesh(undefined, cubeGeom);
        expect(undefinedGeomMesh != null).assertTrue();
        console.info(msg + " createMesh with (undefined, geometry) returned mesh");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateGeometryCUBE " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCreateGeometryNull
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1046
     * @tc.desc   Test createGeometry with null/undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateGeometryNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateGeometryNull";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " resource factory obtained successfully");

        let cubeGeom = new scene3d.CubeGeometry();
        cubeGeom.size = {x: 1, y: 1, z: 1};
        let meshRes = await rf.createMesh({ name: "MeshName" }, cubeGeom);
        expect(meshRes != null).assertTrue();
        console.info(msg + " mesh created successfully");

        // Test null parameter for createGeometry 1
        try {
          let nullGeometry = await rf.createGeometry(null, meshRes);
          expect(nullGeometry != null).assertTrue();
          console.info(msg + " createGeometry with (null, meshRes) returned null");
        } catch (err) {
          console.info(msg + " createGeometry with (null, meshRes) threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter for createGeometry 1
        try {
          let undefinedGeometry = await rf.createGeometry(undefined, meshRes);
          expect(undefinedGeometry != null).assertTrue();
          console.info(msg + " createGeometry with (undefined, meshRes) returned null");
        } catch (err) {
          console.info(msg + " createGeometry with (undefined, meshRes) threw error: " + JSON.stringify(err));
        }

        // Test null parameter for createGeometry 2
        try {
          let nullGeometry = await rf.createGeometry({ name: "GeometryName", path: "" }, null);
          expect(nullGeometry).assertUndefined();
          console.info(msg + " createGeometry with ({ name: \"GeometryName\", path: \"\" }, null) returned undefined");
        } catch (err) {
          console.info(msg + " createGeometry with ({ name: \"GeometryName\", path: \"\" }, null) threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter for createGeometry 2
        try {
          let undefinedGeometry = await rf.createGeometry({ name: "GeometryName", path: "" }, undefined);
          expect(undefinedGeometry).assertUndefined();
          console.info(msg + " createGeometry with ({ name: \"GeometryName\", path: \"\" }, undefined) returned undefined");
        } catch (err) {
          console.info(msg + " createGeometry with ({ name: \"GeometryName\", path: \"\" }, undefined) threw error: " + JSON.stringify(err));
        }

        // Test empty path for createGeometry
        try {
          let emptyPathGeometry = await rf.createGeometry({ name: "GeometryName", path: "" }, meshRes);
          expect(emptyPathGeometry != null).assertTrue();
          console.info(msg + " createGeometry with empty path returned successfully");
        } catch (err) {
          console.info(msg + " createGeometry with empty path threw error: " + JSON.stringify(err));
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateGeometryNull " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCreateLightNull
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1045
     * @tc.desc   Test createLight with null/undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateLightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCreateLightNull";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != undefined).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        expect(rf != null).assertTrue();
        console.info(msg + " resource factory obtained successfully");

        // Test null parameter for createLight 1
        try {
          let nullLight = await rf.createLight(null, LightType.DIRECTIONAL);
          expect(nullLight != null).assertTrue();
          console.info(msg + " createLight with (null, LightType.DIRECTIONAL) returned null");
        } catch (err) {
          console.info(msg + " createLight with (null, LightType.DIRECTIONAL) threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter for createLight 1
        try {
          let undefinedLight = await rf.createLight(undefined, LightType.DIRECTIONAL);
          expect(undefinedLight != null).assertTrue();
          console.info(msg + " createLight with (undefined, LightType.DIRECTIONAL) returned null");
        } catch (err) {
          console.info(msg + " createLight with (undefined, LightType.DIRECTIONAL) threw error: " + JSON.stringify(err));
        }

        // Test null parameter for createLight 2
        try {
          let nullLight = await rf.createLight({ name: "Light", path: "" }, null);
          expect(nullLight).assertUndefined();
          console.info(msg + " createLight with ({ name: \"Light\", path: \"\" }, null) returned undefined");
        } catch (err) {
          console.info(msg + " createLight with ({ name: \"Light\", path: \"\" }, null) threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter for createLight 2
        try {
          let undefinedLight = await rf.createLight({ name: "Light", path: "" }, undefined);
          expect(undefinedLight).assertUndefined();
          console.info(msg + " createLight with ({ name: \"Light\", path: \"\" }, undefined) returned undefined");
        } catch (err) {
          console.info(msg + " createLight with ({ name: \"Light\", path: \"\" }, undefined) threw error: " + JSON.stringify(err));
        }

        // Test null parameter for createLight
        try {
          let nullLight = await rf.createLight(null, null);
          expect(nullLight).assertUndefined();
          console.info(msg + " createLight with (null, null) returned undefined");
        } catch (err) {
          console.info(msg + " createLight with (null, null) threw error: " + JSON.stringify(err));
        }

        // Test undefined parameter for createLight
        try {
          let undefinedLight = await rf.createLight(undefined, undefined);
          expect(undefinedLight).assertUndefined();
          console.info(msg + " createLight with (undefined, undefined) returned undefined");
        } catch (err) {
          console.info(msg + " createLight with (undefined, undefined) threw error: " + JSON.stringify(err));
        }

        // Test empty path for createLight
        try {
          let emptyPathLight = await rf.createLight({ name: "Light", path: "" }, LightType.DIRECTIONAL);
          expect(emptyPathLight != null).assertTrue();
          console.info(msg + " createLight with empty path returned successfully");
        } catch (err) {
          console.info(msg + " createLight with empty path threw error: " + JSON.stringify(err));
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCreateLightNull " + JSON.stringify(err));
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
     * @tc.name   testImportNode
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0600
     * @tc.desc   Used to import a node
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testImportNode";
      console.info(msg + ' begin ');
      try {
        let node1 = scene1?.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Node;
        let node2: scene3d.Node | null | undefined = null;
        node2 = scene?.importNode("scene2", node1, scene.root);
        expect(node2 != null).assertTrue();

        // Test name parameter with empty string
        try {
          let emptyNameNode = scene?.importNode("", node1, scene.root);
          console.info(msg + " importNode with empty string name: " + JSON.stringify(emptyNameNode));
          expect(emptyNameNode != null).assertTrue();
        } catch (err) {
          console.info(msg + " importNode with empty string name threw error: " + JSON.stringify(err));
        }

        // Test name parameter with null
        try {
          let nullNameNode = scene?.importNode(null, node1, scene.root);
          console.info(msg + " importNode with null name: " + JSON.stringify(nullNameNode));
          expect(nullNameNode).assertUndefined();
        } catch (err) {
          console.info(msg + " importNode with null name threw error: " + JSON.stringify(err));
        }

        // Test name parameter with undefined
        try {
          let undefinedNameNode = scene?.importNode(undefined, node1, scene.root);
          console.info(msg + " importNode with undefined name: " + JSON.stringify(undefinedNameNode));
          expect(undefinedNameNode).assertUndefined();
        } catch (err) {
          console.info(msg + " importNode with undefined name threw error: " + JSON.stringify(err));
        }

        // Test node parameter with null
        try {
          let nullNodeParamNode = scene?.importNode("testNullNode", null, scene.root);
          console.info(msg + " importNode with null node parameter: " + JSON.stringify(nullNodeParamNode));
          expect(nullNodeParamNode).assertNull();
        } catch (err) {
          console.info(msg + " importNode with null node parameter threw error: " + JSON.stringify(err));
        }

        // Test node parameter with undefined
        try {
          let undefinedNodeParamNode = scene?.importNode("testUndefinedNode", undefined, scene.root);
          console.info(msg + " importNode with undefined node parameter: " + JSON.stringify(undefinedNodeParamNode));
          expect(undefinedNodeParamNode).assertNull();
        } catch (err) {
          console.info(msg + " importNode with undefined node parameter threw error: " + JSON.stringify(err));
        }

        // Test parent parameter with null
        try {
          let nullParentNode = scene?.importNode("testNullParent", node1, null);
          console.info(msg + " importNode with null parent: " + JSON.stringify(nullParentNode));
          expect(nullParentNode != null).assertTrue();
        } catch (err) {
          console.info(msg + " importNode with null parent threw error: " + JSON.stringify(err));
        }

        // Test parent parameter with undefined
        try {
          let undefinedParentNode = scene?.importNode("testUndefinedParent", node1, undefined);
          console.info(msg + " importNode with undefined parent: " + JSON.stringify(undefinedParentNode));
          expect(undefinedParentNode != null).assertTrue();
        } catch (err) {
          console.info(msg + " importNode with undefined parent threw error: " + JSON.stringify(err));
        }

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
    it('testImportScene', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done:Function)=> {
      let msg = "============================testImportScene";
      console.info(msg + ' begin ');
      try {
        let node2: scene3d.Node | null | undefined = null;
        node2 = scene?.importScene("scene1", scene1, null);
        expect(node2 != null).assertTrue();

        // Test name parameter with empty string
        try {
          let emptyNameScene = scene?.importScene("", scene1, null);
          console.info(msg + " importScene with empty string name: " + JSON.stringify(emptyNameScene));
          expect(emptyNameScene != null).assertTrue();
        } catch (err) {
          console.info(msg + " importScene with empty string name threw error: " + JSON.stringify(err));
        }

        // Test name parameter with null
        try {
          let nullNameScene = scene?.importScene(null, scene1, null);
          console.info(msg + " importScene with null name: " + JSON.stringify(nullNameScene));
          expect(nullNameScene).assertUndefined();
        } catch (err) {
          console.info(msg + " importScene with null name threw error: " + JSON.stringify(err));
        }

        // Test name parameter with undefined
        try {
          let undefinedNameScene = scene?.importScene(undefined, scene1, null);
          console.info(msg + " importScene with undefined name: " + JSON.stringify(undefinedNameScene));
          expect(undefinedNameScene).assertUndefined();
        } catch (err) {
          console.info(msg + " importScene with undefined name threw error: " + JSON.stringify(err));
        }

        // Test scene parameter with null
        try {
          let nullSceneScene = scene?.importScene("testNullScene", null, null);
          console.info(msg + " importScene with null scene parameter: " + JSON.stringify(nullSceneScene));
          expect(nullSceneScene).assertNull();
        } catch (err) {
          console.info(msg + " importScene with null scene parameter threw error: " + JSON.stringify(err));
        }

        // Test scene parameter with undefined
        try {
          let undefinedSceneScene = scene?.importScene("testUndefinedScene", undefined, null);
          console.info(msg + " importScene with undefined scene parameter: " + JSON.stringify(undefinedSceneScene));
          expect(undefinedSceneScene).assertNull();
        } catch (err) {
          console.info(msg + " importScene with undefined scene parameter threw error: " + JSON.stringify(err));
        }

        // Test parent parameter with null
        try {
          let nullParentScene = scene?.importScene("testNullParent", scene1, null);
          console.info(msg + " importScene with null parent: " + JSON.stringify(nullParentScene));
          expect(nullParentScene != null).assertTrue();
        } catch (err) {
          console.info(msg + " importScene with null parent threw error: " + JSON.stringify(err));
        }

        // Test parent parameter with undefined
        try {
          let undefinedParentScene = scene?.importScene("testUndefinedParent", scene1, undefined);
          console.info(msg + " importScene with undefined parent: " + JSON.stringify(undefinedParentScene));
          expect(undefinedParentScene != null).assertTrue();
        } catch (err) {
          console.info(msg + " importScene with undefined parent threw error: " + JSON.stringify(err));
        }

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
     * @tc.name   testCamera_raycast
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0750
     * @tc.desc   Verifies Camera raycast returns valid hit results with node, centerDistance,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

        scene.root?.children.clear();
        raycastNode = scene.root as Node;
        viewPos = {x: -1, y: 1};
        results = await camera.raycast(viewPos, { rootNode: raycastNode });
        expect(results.length).assertEqual(0);

        // Test null parameter for viewPosition (first parameter)
        try {
          let nullViewPosResults = await camera.raycast(null, { rootNode: raycastNode });
          console.info(msg + " raycast with null viewPosition: " + JSON.stringify(nullViewPosResults));
          expect(nullViewPosResults != null).assertTrue();
        } catch (nullErr) {
          console.info(msg + " raycast with null viewPosition threw error: " + JSON.stringify(nullErr));
        }

        // Test undefined parameter for viewPosition (first parameter)
        try {
          let undefinedViewPosResults = await camera.raycast(undefined, { rootNode: raycastNode });
          console.info(msg + " raycast with undefined viewPosition: " + JSON.stringify(undefinedViewPosResults));
          expect(undefinedViewPosResults != null).assertTrue();
        } catch (undefinedErr) {
          console.info(msg + " raycast with undefined viewPosition threw error: " + JSON.stringify(undefinedErr));
        }

        // Test null parameter for params (second parameter)
        try {
          let nullParamsResults = await camera.raycast(viewPos, null);
          console.info(msg + " raycast with null params: " + JSON.stringify(nullParamsResults));
          expect(nullParamsResults != null).assertTrue();
        } catch (nullParamsErr) {
          console.info(msg + " raycast with null params threw error: " + JSON.stringify(nullParamsErr));
        }

        // Test undefined parameter for params (second parameter)
        try {
          let undefinedParamsResults = await camera.raycast(viewPos, undefined);
          console.info(msg + " raycast with undefined params: " + JSON.stringify(undefinedParamsResults));
          expect(undefinedParamsResults != null).assertTrue();
        } catch (undefinedParamsErr) {
          console.info(msg + " raycast with undefined params threw error: " + JSON.stringify(undefinedParamsErr));
        }

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.error(msg + " Failed in testCamera_raycast: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testSceneCameraParametersMSAA
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0940
     * @tc.desc   Test set and get for msaa property of CameraParameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneCameraParametersMSAA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneCameraParametersMSAA";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        // 测试msaa为true的情况
        let cameraParamsTrue: CameraParameters = {msaa: true};
        expect(cameraParamsTrue.msaa).assertTrue();
        console.info(msg + " CameraParameters msaa=true set successfully");

        let camTrue: scene3d.Camera = await rf.createCamera({ name: "CameraMSAA", path:"//CameraMSAA" }, cameraParamsTrue);
        expect(camTrue != null).assertTrue();
        expect(camTrue.msaa).assertTrue();
        console.info(msg + " Camera created with msaa=true successfully");

        // 测试msaa为false的情况
        let cameraParamsFalse: CameraParameters = {msaa: false};
        expect(cameraParamsFalse.msaa).assertFalse();
        console.info(msg + " CameraParameters msaa=false set successfully");

        let camFalse: scene3d.Camera = await rf.createCamera({ name: "CameraNoMSAA", path:"//CameraNoMSAA" }, cameraParamsFalse);
        expect(camFalse != null).assertTrue();
        expect(camFalse.msaa).assertFalse();
        console.info(msg + " Camera created with msaa=false successfully");

        // 测试默认值
        let cameraParamsDefault: CameraParameters = {};
        expect(cameraParamsDefault.msaa).assertUndefined();
        console.info(msg + " CameraParameters default msaa is undefined");

        let camDefault: scene3d.Camera = await rf.createCamera({ name: "CameraDefault", path:"//CameraDefault" });
        expect(camDefault != null).assertTrue();
        expect(camDefault.msaa).assertFalse();
        console.info(msg + " Camera created with default msaa=false");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneCameraParametersMSAA " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneNodesSpotLightInnerAngle
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0950
     * @tc.desc   Test set and get for innerAngle property of SpotLight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneNodesSpotLightInnerAngle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneNodesSpotLightInnerAngle";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let spotLight: scene3d.SpotLight = await rf.createLight({ name: "SpotLight" }, LightType.SPOT);
        expect(spotLight != null).assertTrue();
        expect(spotLight.nodeType).assertEqual(NodeType.LIGHT);
        expect(spotLight.lightType).assertEqual(LightType.SPOT);

        // 测试默认值
        expect(spotLight.innerAngle).assertEqual(0);
        console.info(msg + " SpotLight innerAngle default value is 0");

        // 测试设置有效值
        spotLight.innerAngle = Math.PI / 6; // 30度
        expect(Math.abs(spotLight.innerAngle - Math.PI / 6)).assertLess(1e-6);
        console.info(msg + " SpotLight innerAngle set to PI/6 successfully");

        // 测试边界值
        spotLight.innerAngle = 0;
        expect(spotLight.innerAngle).assertEqual(0);
        console.info(msg + " SpotLight innerAngle set to 0 successfully");

        spotLight.innerAngle = Math.PI / 4; // 45度
        expect(Math.abs(spotLight.innerAngle - Math.PI / 4)).assertLess(1e-6);
        console.info(msg + " SpotLight innerAngle set to PI/4 successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneNodesSpotLightInnerAngle " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneNodesSpotLightOuterAngle
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0960
     * @tc.desc   Verify the SpotLight outerAngle property can be set and read correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneNodesSpotLightOuterAngle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneNodesSpotLightOuterAngle";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let spotLight: scene3d.SpotLight = await rf.createLight({ name: "SpotLight" }, LightType.SPOT);
        expect(spotLight != null).assertTrue();

        // 测试默认值
        expect(Math.abs(spotLight.outerAngle! - Math.PI / 4)).assertLess(1e-6);
        console.info(msg + " SpotLight outerAngle default value is PI/4");

        // 测试设置有效值
        spotLight.outerAngle = Math.PI / 3; // 60度
        expect(Math.abs(spotLight.outerAngle - Math.PI / 3)).assertLess(1e-6);
        console.info(msg + " SpotLight outerAngle set to PI/3 successfully");

        // 测试边界值
        spotLight.outerAngle = Math.PI / 6; // 30度
        expect(Math.abs(spotLight.outerAngle - Math.PI / 6)).assertLess(1e-6);
        console.info(msg + " SpotLight outerAngle set to PI/6 successfully");

        spotLight.outerAngle = Math.PI / 2; // 90度
        expect(Math.abs(spotLight.outerAngle - Math.PI / 2)).assertLess(1e-6);
        console.info(msg + " SpotLight outerAngle set to PI/2 successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneNodesSpotLightOuterAngle " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneNodesCameraMSAA
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0970
     * @tc.desc   Verify the Camera msaa property can be set and read correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneNodesCameraMSAA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testSceneNodesCameraMSAA";
      console.info(msg + ' begin ');
      try {
        scene = await Scene.load();
        expect(scene != null).assertTrue();
        rf = scene.getResourceFactory();

        let cam: scene3d.Camera = await rf.createCamera({ name: "Camera" });
        expect(cam != null).assertTrue();
        expect(cam.nodeType).assertEqual(NodeType.CAMERA);

        // 测试默认值
        expect(typeof cam.msaa).assertEqual('boolean');
        expect(cam.msaa).assertFalse();
        console.info(msg + " Camera msaa default value is false");

        // 测试设置msaa为true
        cam.msaa = true;
        expect(cam.msaa).assertTrue();
        console.info(msg + " Camera msaa set to true successfully");

        // 测试设置msaa为false
        cam.msaa = false;
        expect(cam.msaa).assertFalse();
        console.info(msg + " Camera msaa set to false successfully");

        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneNodesCameraMSAA " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCameraGetViewMatrix
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1013
     * @tc.desc   Test getViewMatrix method of Camera to get view matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraGetViewMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCameraGetViewMatrix";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get view matrix
        let viewMatrix: scene3d.Mat4x4 = camera.getViewMatrix();
        expect(viewMatrix != null).assertTrue();
        console.info(msg + " viewMatrix retrieved successfully");

        // Verify viewMatrix has all four columns (x, y, z, w)
        expect(viewMatrix.x != null).assertTrue();
        expect(viewMatrix.y != null).assertTrue();
        expect(viewMatrix.z != null).assertTrue();
        expect(viewMatrix.w != null).assertTrue();
        console.info(msg + " viewMatrix has all four columns");

        // Verify each column is a Vec4 with x, y, z, w components
        expect(typeof viewMatrix.x.x).assertEqual('number');
        expect(typeof viewMatrix.x.y).assertEqual('number');
        expect(typeof viewMatrix.x.z).assertEqual('number');
        expect(typeof viewMatrix.x.w).assertEqual('number');
        console.info(msg + " viewMatrix columns have proper Vec4 structure");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCameraGetViewMatrix " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testCameraGetProjectionMatrix
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1014
     * @tc.desc   Test getProjectionMatrix method of Camera to get projection matrix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCameraGetProjectionMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg = "============================testCameraGetProjectionMatrix";
      console.info(msg + ' begin ');
      try {
        let scene = await Scene.load($rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb"));
        expect(scene != null).assertTrue();
        console.info(msg + " scene loaded successfully");

        rf = scene.getResourceFactory();
        let sceneCameraParameter: SceneNodeParameters = { name: "camera1" };
        let camera: Camera = await rf.createCamera(sceneCameraParameter);
        expect(camera != null).assertTrue();
        console.info(msg + " camera created successfully");

        camera.enabled = true;
        lookAt(camera, { x: 0, y: 0, z: -3 }, { x: 0, y: 0, z: 0 }, { x: 0, y: 1, z: 0 });

        // Get projection matrix
        let projectionMatrix: scene3d.Mat4x4 = camera.getProjectionMatrix();
        expect(projectionMatrix != null).assertTrue();
        console.info(msg + " projectionMatrix retrieved successfully");

        // Verify projectionMatrix has all four columns (x, y, z, w)
        expect(projectionMatrix.x != null).assertTrue();
        expect(projectionMatrix.y != null).assertTrue();
        expect(projectionMatrix.z != null).assertTrue();
        expect(projectionMatrix.w != null).assertTrue();
        console.info(msg + " projectionMatrix has all four columns");

        // Verify each column is a Vec4 with x, y, z, w components
        expect(typeof projectionMatrix.x.x).assertEqual('number');
        expect(typeof projectionMatrix.x.y).assertEqual('number');
        expect(typeof projectionMatrix.x.z).assertEqual('number');
        expect(typeof projectionMatrix.x.w).assertEqual('number');
        console.info(msg + " projectionMatrix columns have proper Vec4 structure");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testCameraGetProjectionMatrix " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}