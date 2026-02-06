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
  CustomGeometry,
  GeometryType,
  Image,
  Light,
  LightType,
  MeshResource,
  Node,
  NodeType,
  Position3,
  PrimitiveTopology,
  RaycastParameters,
  RaycastResult,
  Rect,
  RenderParameters,
  RenderResourceFactory,
  Rotation3,
  Sampler,
  SamplerAddressMode,
  SamplerFilter,
  Scene,
  SceneComponent,
  SceneNodeParameters,
  SceneResourceFactory,
  SceneResourceParameters,
  SceneResourceType,
  Shader,
  SphereGeometry,
  RenderContext,
  Vec2,
  Vec3,
  Vec4
} from '@ohos.graphics.scene'
import { $rawfile, Resource } from '@ohos.arkui.component'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'
import { doubleEqual, vec4ToString } from '../common/utils'

export default function sceneTest() {
  describe('sceneTest', () => {
    /**
     * @tc.name   testSceneLoad
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0010
     * @tc.desc   Used to load the resource through the incoming resource path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneLoad', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testSceneLoad";
      console.info(msg + ' begin ');
      try {
        let scene: Scene = await Scene.load();
        expect(scene != undefined).assertTrue();
        console.info(msg + " succeed in Scene.load() ");
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        scene = await Scene.load(resource);
        expect(scene != undefined).assertTrue();
        console.info(msg + " succeed in Scene.load(uri) ");
        done();
      } catch (err) {
        console.info(msg + 'Failed in testSceneLoad ' + JSON.stringify(err));
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
    it('testGetNodeByPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testGetNodeByPath";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let node = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        node = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514', NodeType.GEOMETRY);
        console.info(msg + " succeed in getNodeByPath " + JSON.stringify(node));
        expect(node != null).assertTrue();
        console.info(msg + " node != null")
        expect(node?.nodeType).assertEqual(NodeType.GEOMETRY);
        let nullNode: Node | null = scene.getNodeByPath('rootNode_/123/456');
        expect(nullNode).assertNull();
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetNodeByPath " +
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
    it('testGetResourceFactory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testGetResourceFactory";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        let rf: SceneResourceFactory = scene.getResourceFactory();
        expect(rf != undefined).assertTrue();
        console.info(msg + " Succeed in scene.getResourceFactory() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetResourceFactory " + JSON.stringify(err));
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
    it('testDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testDestroy";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        scene?.destroy();
        console.info(msg + " Succeed in scene.destroy() ");
        expect(scene?.root).assertNull();
        done();
      } catch (err) {
        console.info(msg + " Failed in testDestroy " + JSON.stringify(err));
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
    it('testSceneResourceParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSceneResourceParameters";
      console.info(msg + ' begin ');
      try {
        let imageParameters: SceneResourceParameters = { name: "Cube", uri: "rawfile://123" }
        expect(imageParameters?.name).assertEqual("Cube");
        expect(imageParameters?.uri).assertEqual("rawfile://123");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneResourceParameters " + JSON.stringify(err));
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
    it('testSceneNodeParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSceneNodeParameters";
      console.info(msg + ' begin ');
      try {
        let nodeParameters: SceneNodeParameters = { name: "Helmet", path: "rootNode_/node1" }
        expect(nodeParameters.name).assertEqual("Helmet");
        expect(nodeParameters.path).assertEqual("rootNode_/node1");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneNodeParameters " + JSON.stringify(err));
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
    it('testSceneType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSceneType";
      console.info(msg + ' begin ');
      try {
        let ve2: Vec2 = { x: 1, y: 1 };
        let rect: Rect = { x: 1, y: 1, width: 1, height: 1 };
        let rotation3: Rotation3 = { x: 1, y: 1, z: 1 };
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
    it('testSceneRenderFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testSceneRenderFrame";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb")
        let scene = await Scene.load(resource);
        expect(scene.renderFrame()).assertTrue();
        expect(scene.renderFrame({ alwaysRender: true })).assertTrue();
        scene.destroy();
        expect(scene.renderFrame()).assertFalse();
        console.info(msg + " Succeed in scene?.renderFrame() ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testSceneRenderFrame " + JSON.stringify(err));
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
    it('testRenderParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRenderParameters";
      console.info(msg + ' begin ');
      try {
        let RenderParameters: RenderParameters = { alwaysRender: true };
        expect(RenderParameters.alwaysRender).assertTrue();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is true ");
        RenderParameters = { alwaysRender: false }
        expect(RenderParameters.alwaysRender).assertFalse();
        console.info(msg + " Succeed in RenderParameters.alwaysRender is false ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRenderParameters " + JSON.stringify(err));
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
    it('testSphereGeometry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testSphereGeometry";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(resource);
        let rf = scene.getResourceFactory();
        let sphereGeom = new SphereGeometry();
        expect(sphereGeom != null).assertTrue();
        expect(sphereGeom.geometryType).assertEqual(GeometryType.SPHERE);
        console.info(msg + " Succeed in SphereGeometry() ");
        sphereGeom.radius = 1;
        expect(sphereGeom.radius).assertEqual(1);
        console.info(msg + " Succeed in sphereGeom.radius ");
        sphereGeom.segmentCount = 26;
        expect(sphereGeom.segmentCount).assertEqual(26);
        console.info(msg + " Succeed in sphereGeom.segmentCount ");
        let meshRes3: MeshResource = await rf.createMesh({ name: "resource name not used at the moment " }, sphereGeom);
        expect(meshRes3 != null).assertTrue();
        console.info(msg + " Succeed in createMesh ");
        expect(meshRes3.resourceType).assertEqual(SceneResourceType.MESH_RESOURCE)
        console.info(msg + " meshRes3.resourceType is SceneResourceType.MESH_RESOURCE ");
        let geometry3 = await rf.createGeometry({ name: "balluro" }, meshRes3);
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
    it('testTRIANGLE_LIST', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testTRIANGLE_LIST";
      console.info(msg + ' begin ');
      try {
        let customGeom = new CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in CustomGeometry() ");
        expect(customGeom.geometryType).assertEqual(GeometryType.CUSTOM);
        customGeom.topology = PrimitiveTopology.TRIANGLE_LIST;
        expect(customGeom.topology).assertEqual(PrimitiveTopology.TRIANGLE_LIST);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_LIST ");
        customGeom.indices = [0, 1, 3, 3, 1, 2];
        expect(customGeom.indices![2]).assertEqual(3);
        console.info(msg + " Succeed in customGeom.indices of TRIANGLE_LIST ");
        done();
      } catch (err) {
        console.info(msg + " Failed in testTRIANGLE_LIST: " + err);
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
    it('testTRIANGLE_STRIP', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testTRIANGLE_STRIP";
      console.info(msg + ' begin ');
      try {
        let customGeom = new CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in CustomGeometry() ");
        expect(customGeom.geometryType).assertEqual(GeometryType.CUSTOM);
        customGeom.topology = PrimitiveTopology.TRIANGLE_STRIP;
        expect(customGeom.topology).assertEqual(PrimitiveTopology.TRIANGLE_STRIP);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_STRIP ");
        customGeom.indices = [0, 1, 3, 2];
        expect(customGeom.indices![2]).assertEqual(3);
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
    it('testCustomGeometry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometry";
      console.info(msg + ' begin ');
      try {
        let customGeom = new CustomGeometry();
        expect(customGeom != null).assertTrue();
        console.info(msg + " Succeed in CustomGeometry() ");
        customGeom.topology = PrimitiveTopology.TRIANGLE_LIST;
        expect(customGeom.topology).assertEqual(PrimitiveTopology.TRIANGLE_LIST);
        console.info(msg + " Succeed in customGeom.topology set TRIANGLE_LIST ");
        customGeom.vertices = [{ x: 0, y: 1, z: 0 }, { x: 0.5, y: 0, z: 0.3 }, { x: 0, y: -1, z: 0 }, { x: -0.5, y: 0, z: 0.3 }];
        expect(customGeom.vertices[1].x).assertEqual(0.5);
        console.info(msg + " Succeed in customGeom.vertices ");
        customGeom.uvs = [{ x: 0.5, y: 1 }, { x: 1, y: 0.5 }, { x: 0.5, y: 0 }, { x: 0, y: 0.5 }];
        expect(customGeom.uvs![0].x).assertEqual(0.5);
        console.info(msg + " Succeed in customGeom.uvs ");
        customGeom.normals = [{ x: -1, y: 1, z: 0 }, { x: 1, y: -1, z: 0 }, { x: 1, y: 1, z: 0 }, { x: 1, y: 1, z: 1 }];
        expect(customGeom.normals![0].x).assertEqual(-1);
        console.info(msg + " Succeed in customGeom.normals ");
        customGeom.colors = [{ r: 1, g: 0, b: 0, a: 1 }, { r: 0, g: 1, b: 0, a: 1 }, { r: 0, g: 0, b: 1, a: 1 }, { r: 1, g: 0, b: 1, a: 1 }];
        expect(customGeom.colors![0].r).assertEqual(1);
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
    it('testCreateScene_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCreateScene_01";
      console.info(msg + ' begin ');
      try {
        let rf: RenderResourceFactory = Scene.getDefaultRenderContext()!.getRenderResourceFactory();
        let sceneUri = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene1 = await rf.createScene(sceneUri);
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
    it('testCreateScene_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCreateScene_02";
      console.info(msg + ' begin ');
      try {
        let rf: RenderResourceFactory = Scene.getDefaultRenderContext()!.getRenderResourceFactory();
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
    it('testSceneLoad_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testSceneLoad_02";
      console.info(msg + ' begin ');
      try {
        let scene3 = await Scene.load();
        expect(scene3 != null).assertTrue();
        expect(scene3 != undefined).assertTrue();
        done();
      } catch (err) {
        console.info(msg + 'Failed in Scene3.load() ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testRaycastResult
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0640
     * @tc.desc   Verify raycast result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testRaycastResult";
      console.info(msg + ' begin ');
      try {
        let sceneUri = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        console.info(msg + "scene loaded:", scene != null);
        expect(scene != null).assertTrue();
        let rf = scene.getResourceFactory();
        let cam = await rf.createCamera({ "name": "Camera" });
        expect(cam != null).assertTrue();

        let viewPosition: Vec2 = { x: 0, y: 0 };
        let raycastParams: RaycastParameters = {};
        let results: RaycastResult[] = await cam.raycast(viewPosition, raycastParams);
        console.info(msg + "raycast results length:", results.length);
        expect(results.length > 0).assertTrue();

        let hitNode: Node = results[0].node;
        console.info(msg + "hitNode:", hitNode.name);
        expect(hitNode != null).assertTrue();

        let distance: double = results[0].centerDistance;
        console.info(msg + "centerDistance value:", distance);
        expect(Type.of(distance).getLiteral()).assertEqual('double');
        expect(distance > 0).assertTrue();

        let res: Position3 = results[0].hitPosition;
        console.info(msg + ` hitPosition = {x: ${res.x}, y: ${res.y}, z: ${res.z}}`);
        expect(Type.of(res.x).getLiteral()).assertEqual('double');
        expect(Type.of(res.y).getLiteral()).assertEqual('double');
        expect(Type.of(res.z).getLiteral()).assertEqual('double');

        let raycastParams1: RaycastParameters = { rootNode: scene.root! };
        let results1: RaycastResult[] = await cam.raycast(viewPosition, raycastParams1);
        expect(results1.length > 0).assertTrue();

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastResult_node " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testRaycastParameters
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0670
     * @tc.desc   Verify rootNode in RaycastParameters filters raycast scope correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRaycastParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testRaycastParameters";
      console.info(msg + ' begin ');
      try {
        let resource: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(resource);
        let someNode = scene.getNodeByPath('rootNode_/Scene/node_damagedHelmet_-6514');
        console.info(msg + " rootNode obtained:", someNode?.name ?? "null");
        expect(someNode != null).assertTrue();
        let params: RaycastParameters = { rootNode: someNode! };
        console.info(msg + " rootNode set in RaycastParameters:", params.rootNode?.name ?? "null");
        expect(params.rootNode).assertEqual(someNode);
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testRaycastParameters " + JSON.stringify(err));
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
    it('testRenderResourceFactory_createSampler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let msg = "============================testRenderResourceFactory_createSampler";
        console.info(msg + ' begin ');
        try {
          let sceneUri: Resource = $rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb");
          const scene = await Scene.load(sceneUri);
          console.info(msg + " scene loaded:", scene != null);
          expect(scene != null).assertTrue();

          const rf: RenderResourceFactory = scene.getResourceFactory();
          expect(rf != null).assertTrue();
          console.info(msg + " getResourceFactory success (as RenderResourceFactory)");

          const sampler: Sampler = await rf.createSampler({ name: "testSampler" });
          expect(sampler != null).assertTrue();
          console.info(msg + " createSampler success:", sampler);

          sampler.magFilter = SamplerFilter.LINEAR;
          expect(sampler.magFilter).assertEqual(SamplerFilter.LINEAR);
          console.info(msg + " sampler.magFilter set and verified");

          sampler.addressModeU = SamplerAddressMode.REPEAT;
          expect(sampler.addressModeU).assertEqual(SamplerAddressMode.REPEAT);
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
    it('testSceneComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testSceneComponent";
      console.info(msg + ' begin ');
      try {
        let sceneUri: Resource = $rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.glb");
        let scene = await Scene.load(sceneUri);
        console.info(msg + ' scene loaded:', scene != null);
        expect(scene != null).assertTrue();
        let rf = scene.getResourceFactory();
        let cameraNode: Camera = await rf.createCamera({ name: "Camera" });
        console.info(msg + ' camera node created:', cameraNode.name);

        let component: SceneComponent = scene.getComponent(cameraNode, "CameraComponent")!;
        expect(component != null).assertTrue();
        console.info(msg + ' component created:', component?.name);
        expect(component.name).assertEqual("CameraComponent");

        component.property['customRenderNodeGraphFile'] = "rawfile://123";
        console.info(msg + ' string property set to:', component.property['customRenderNodeGraphFile']);
        expect(component.property['customRenderNodeGraphFile']).assertEqual("rawfile://123");

        component.property['zNear'] = 1.2;
        console.info(msg + ' double property set to:', component.property['zNear']);
        expect(doubleEqual(component.property['zNear'] as double, 1.2)).assertTrue();

        component.property['clearColorValue'] = { x: 0.0, y: 0.2, z: 0.3, w: 0.4 } as Vec4;
        console.info(msg + ' Vec4 property set to:', vec4ToString(component.property['clearColorValue'] as Vec4));
        expect(doubleEqual((component.property['clearColorValue'] as Vec4).z, 0.3)).assertTrue();

        component.property['fog'] = undefined;
        console.info(msg + ' undefined property set to:', component.property['fog']);
        expect(component.property['fog']).assertEqual(undefined);

        let component1: SceneComponent = scene.getComponent(cameraNode, "NodeComponent")!;
        component1.property['enabled'] = true;
        console.info(msg + ' boolean property set to:', component1.property['enabled']);
        expect(component1.property['enabled']).assertTrue();
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
      async (done: () => void) => {
        let msg = "============================testRenderContext_getRenderResourceFactory";
        console.info(msg + ' begin ');
        try {
          let renderContext: RenderContext | null = Scene.getDefaultRenderContext();
          console.info(msg + " default renderContext:", renderContext);
          expect(renderContext != null).assertTrue();

          if (renderContext != null) {
            let factory: RenderResourceFactory = renderContext.getRenderResourceFactory();
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
    it('testRenderContext_loadPlugin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
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
    it('testCreateComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testCreateComponent";
      console.info(msg + ' begin ');
      try {
        let sceneUri = $rawfile("gltf/CubeWithFloor/glTF/AnimatedCube.glb");
        let scene = await Scene.load(sceneUri);
        console.info(msg + " scene loaded:", scene);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg + " root node:", rootNode);
        expect(rootNode != null).assertTrue();

        let componentName: string = "RenderConfigurationComponent";
        console.info(msg + ` creating component: ${componentName}`);
        let component: SceneComponent = await scene.createComponent(rootNode!, componentName);
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
     * @tc.name   testGetComponent
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0730
     * @tc.desc   Verify whether the basic functional behavior of the getComponent method meets expectations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let msg = "============================testGetComponent";
      console.info(msg + ' begin ');
      try {
        let sceneUri = $rawfile('gltf/DamagedHelmet/glTF/DamagedHelmet.glb');
        let scene = await Scene.load(sceneUri);
        console.info(msg + "Scene loaded:", scene);
        expect(scene != null).assertTrue();

        let rootNode: Node | null = scene.root;
        console.info(msg + " root node:", rootNode);
        expect(rootNode != null).assertTrue();

        let componentName: string = "RenderConfigurationComponent";
        console.info(msg + ` Creating component: ${componentName}`);

        let createdComponent: SceneComponent = await scene.createComponent(rootNode!, componentName);
        console.info(msg + ` Created component ${componentName}:`, createdComponent);
        expect(createdComponent != null).assertTrue();
        let component: SceneComponent | null = scene.getComponent(rootNode!, componentName);
        console.info(msg + ` Retrieved component ${componentName}:`, component);
        expect(component != null).assertTrue();

        let missingComponent: SceneComponent | null = scene.getComponent(rootNode!, "NonExistentComponent");
        console.info(msg + " Attempted to retrieve missing component 'NonExistentComponent':", missingComponent);
        expect(missingComponent == null).assertTrue();

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + " Failed in testGetComponent " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}