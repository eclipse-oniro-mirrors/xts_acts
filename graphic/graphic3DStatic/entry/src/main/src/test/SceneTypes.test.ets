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
  NodeType,
  SceneResourceType,
  RenderingPipelineType,
  GeometryType,
  MaterialType,
  PolygonMode,
  CullMode,
  SamplerFilter,
  SamplerAddressMode,
  GeometryDefinition,
  CustomGeometry,
  CubeGeometry,
  PlaneGeometry,
  SphereGeometry,
  CylinderGeometry,
  PrimitiveTopology
} from '@ohos.graphics.scene'
import { describe, expect, it, Level, Size, TestType } from '../../../hypium/index'

export default function sceneTypesTest() {
  describe('sceneTypesTest', () => {
    /**
     * @tc.name   testNodeTypeCustom
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1100
     * @tc.desc   Test NodeType.CUSTOM enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeTypeCustom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testNodeTypeCustom";
      console.info(msg + ' begin ');
      try {
        expect(NodeType.CUSTOM).assertEqual(255);
        console.info(msg + " NodeType.CUSTOM = 255 verified");
        
        expect(NodeType.CUSTOM != NodeType.NODE).assertTrue();
        expect(NodeType.CUSTOM != NodeType.GEOMETRY).assertTrue();
        expect(NodeType.CUSTOM != NodeType.CAMERA).assertTrue();
        expect(NodeType.CUSTOM != NodeType.LIGHT).assertTrue();
        console.info(msg + " NodeType.CUSTOM distinct from other types");
        
        expect(NodeType.CUSTOM > NodeType.NODE).assertTrue();
        expect(NodeType.CUSTOM > NodeType.GEOMETRY).assertTrue();
        console.info(msg + " NodeType.CUSTOM value range verified");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSceneResourceTypeEffect
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1110
     * @tc.desc   Test SceneResourceType.EFFECT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSceneResourceTypeEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSceneResourceTypeEffect";
      console.info(msg + ' begin ');
      try {
        expect(SceneResourceType.EFFECT).assertEqual(9);
        console.info(msg + " SceneResourceType.EFFECT = 9 verified");
        
        expect(SceneResourceType.EFFECT != SceneResourceType.NODE).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.MESH_RESOURCE).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.MATERIAL).assertTrue();
        expect(SceneResourceType.EFFECT != SceneResourceType.SHADER).assertTrue();
        console.info(msg + " SceneResourceType.EFFECT distinct from other types");
        
        expect(SceneResourceType.EFFECT > SceneResourceType.MESH_RESOURCE).assertTrue();
        console.info(msg + " SceneResourceType.EFFECT value range verified");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderingPipelineTypeForwardLightweight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1120
     * @tc.desc   Test RenderingPipelineType.FORWARD_LIGHTWEIGHT enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderingPipelineTypeForwardLightweight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRenderingPipelineTypeForwardLightweight";
      console.info(msg + ' begin ');
      try {
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT).assertEqual(0);
        console.info(msg + " RenderingPipelineType.FORWARD_LIGHTWEIGHT = 0 verified");
        
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT < RenderingPipelineType.FORWARD).assertTrue();
        console.info(msg + " FORWARD_LIGHTWEIGHT < FORWARD verified");
        
        expect(RenderingPipelineType.FORWARD_LIGHTWEIGHT != RenderingPipelineType.FORWARD).assertTrue();
        console.info(msg + " RenderingPipelineType values distinct");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGetGeometryType
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1470
     * @tc.desc   Test GeometryDefinition.geometryType getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGeometryType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testGetGeometryType";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        let geometryType = customGeometry.geometryType;
        expect(geometryType != undefined).assertTrue();
        expect(geometryType != null).assertTrue();
        expect(geometryType).assertEqual(GeometryType.CUSTOM);
        console.info(msg + " geometryType getter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetTopology
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1480
     * @tc.desc   Test CustomGeometry.topology getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetTopology', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetTopology";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let topology = customGeometry.topology;
        expect(topology != undefined).assertTrue();
        expect(topology != null).assertTrue();
        console.info(msg + " topology getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetTopology
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1490
     * @tc.desc   Test CustomGeometry.topology setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetTopology', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetTopology";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.topology = PrimitiveTopology.TRIANGLE_LIST;
        expect(customGeometry.topology).assertEqual(PrimitiveTopology.TRIANGLE_LIST);
        console.info(msg + " topology setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetVertices
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1500
     * @tc.desc   Test CustomGeometry.vertices getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetVertices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetVertices";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let vertices = customGeometry.vertices;
        expect(vertices != undefined).assertTrue();
        expect(vertices != null).assertTrue();
        console.info(msg + " vertices getter succeeded");

        customGeometry.vertices = [];
        let emptyVertices = customGeometry.vertices;
        expect(emptyVertices.length).assertEqual(0);
        console.info(msg + " empty array test succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetVertices
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1510
     * @tc.desc   Test CustomGeometry.vertices setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetVertices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetVertices";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.vertices = [{ x: 0, y: 0, z: 0 }, { x: 1, y: 0, z: 0 }, { x: 0, y: 1, z: 0 }];
        expect(customGeometry.vertices != null).assertTrue();
        console.info(msg + " vertices setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetIndices
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1520
     * @tc.desc   Test CustomGeometry.indices getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetIndices";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let indices = customGeometry.indices;
        expect(indices != undefined).assertTrue();
        expect(indices != null).assertTrue();
        console.info(msg + " indices getter succeeded");

        customGeometry.indices = [];
        let emptyIndices = customGeometry.indices;
        expect(emptyIndices?.length == 0).assertTrue();
        console.info(msg + " empty array test succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetIndices
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1530
     * @tc.desc   Test CustomGeometry.indices setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetIndices";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.indices = [0, 1, 2];
        expect(customGeometry.indices != null).assertTrue();
        console.info(msg + " indices setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetNormals
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1540
     * @tc.desc   Test CustomGeometry.normals getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetNormals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetNormals";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let normals = customGeometry.normals;
        expect(normals != undefined).assertTrue();
        expect(normals != null).assertTrue();
        console.info(msg + " normals getter succeeded");

        customGeometry.normals = [];
        let emptyNormals = customGeometry.normals;
        expect(emptyNormals?.length == 0).assertTrue();
        console.info(msg + " empty array test succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetNormals
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1550
     * @tc.desc   Test CustomGeometry.normals setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetNormals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetNormals";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.normals = [{ x: 0, y: 1, z: 0 }];
        expect(customGeometry.normals != null).assertTrue();
        console.info(msg + " normals setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetUvs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1560
     * @tc.desc   Test CustomGeometry.uvs getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetUvs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetUvs";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let uvs = customGeometry.uvs;
        expect(uvs != undefined).assertTrue();
        expect(uvs != null).assertTrue();
        console.info(msg + " uvs getter succeeded");

        customGeometry.uvs = [];
        let emptyUvs = customGeometry.uvs;
        expect(emptyUvs?.length == 0).assertTrue();
        console.info(msg + " empty array test succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetUvs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1570
     * @tc.desc   Test CustomGeometry.uvs setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetUvs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetUvs";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.uvs = [{ x: 0, y: 0 }, { x: 1, y: 1 }];
        expect(customGeometry.uvs != null).assertTrue();
        console.info(msg + " uvs setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometryGetColors
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1580
     * @tc.desc   Test CustomGeometry.colors getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometryGetColors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometryGetColors";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();

        let colors = customGeometry.colors;
        expect(colors != undefined).assertTrue();
        expect(colors != null).assertTrue();
        console.info(msg + " colors getter succeeded");

        customGeometry.colors = [];
        let emptyColors = customGeometry.colors;
        expect(emptyColors?.length == 0).assertTrue();
        console.info(msg + " empty array test succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCustomGeometrySetColors
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1590
     * @tc.desc   Test CustomGeometry.colors setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCustomGeometrySetColors', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCustomGeometrySetColors";
      console.info(msg + ' begin ');
      try {
        let customGeometry = new CustomGeometry();
        expect(customGeometry != null).assertTrue();
        
        customGeometry.colors = [{ r: 1, g: 0, b: 0, a: 1 }];
        expect(customGeometry.colors != null).assertTrue();
        console.info(msg + " colors setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCubeGeometryGetSize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1600
     * @tc.desc   Test CubeGeometry.size getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCubeGeometryGetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCubeGeometryGetSize";
      console.info(msg + ' begin ');
      try {
        let cubeGeometry = new CubeGeometry();
        expect(cubeGeometry != null).assertTrue();

        let size = cubeGeometry.size;
        expect(size != undefined).assertTrue();
        expect(size != null).assertTrue();
        expect(typeof size).assertEqual('object');
        console.info(msg + " size getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done
      }
    })

    /**
     * @tc.name   testCubeGeometrySetSize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1610
     * @tc.desc   Test CubeGeometry.size setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCubeGeometrySetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCubeGeometrySetSize";
      console.info(msg + ' begin ');
      try {
        let cubeGeometry = new CubeGeometry();
        expect(cubeGeometry != null).assertTrue();
        
        cubeGeometry.size = { x: 2, y: 2, z: 2 };
        expect(cubeGeometry.size != null).assertTrue();
        console.info(msg + " size setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPlaneGeometryGetSize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1620
     * @tc.desc   Test PlaneGeometry.size getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlaneGeometryGetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testPlaneGeometryGetSize";
      console.info(msg + ' begin ');
      try {
        let planeGeometry = new PlaneGeometry();
        expect(planeGeometry != null).assertTrue();

        let size = planeGeometry.size;
        expect(size != undefined).assertTrue();
        expect(size != null).assertTrue();
        expect(typeof size).assertEqual('object');
        console.info(msg + " size getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testPlaneGeometrySetSize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1630
     * @tc.desc   Test PlaneGeometry.size setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPlaneGeometrySetSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testPlaneGeometrySetSize";
      console.info(msg + ' begin ');
      try {
        let planeGeometry = new PlaneGeometry();
        expect(planeGeometry != null).assertTrue();
        
        planeGeometry.size = { x: 5, y: 5 };
        expect(planeGeometry.size != null).assertTrue();
        console.info(msg + " size setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSphereGeometryGetRadius
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1640
     * @tc.desc   Test SphereGeometry.radius getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometryGetRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSphereGeometryGetRadius";
      console.info(msg + ' begin ');
      try {
        let sphereGeometry = new SphereGeometry();
        expect(sphereGeometry != null).assertTrue();

        let radius = sphereGeometry.radius;
        expect(radius != undefined).assertTrue();
        expect(radius != null).assertTrue();
        console.info(msg + " radius getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSphereGeometrySetRadius
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1650
     * @tc.desc   Test SphereGeometry.radius setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometrySetRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSphereGeometrySetRadius";
      console.info(msg + ' begin ');
      try {
        let sphereGeometry = new SphereGeometry();
        expect(sphereGeometry != null).assertTrue();
        
        sphereGeometry.radius = 2.0;
        expect(sphereGeometry.radius != null).assertTrue();
        console.info(msg + " radius setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSphereGeometryGetSegmentCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1660
     * @tc.desc   Test SphereGeometry.segmentCount getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometryGetSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSphereGeometryGetSegmentCount";
      console.info(msg + ' begin ');
      try {
        let sphereGeometry = new SphereGeometry();
        expect(sphereGeometry != null).assertTrue();

        let segmentCount = sphereGeometry.segmentCount;
        expect(segmentCount != undefined).assertTrue();
        expect(segmentCount != null).assertTrue();
        console.info(msg + " segmentCount getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSphereGeometrySetSegmentCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1670
     * @tc.desc   Test SphereGeometry.segmentCount setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSphereGeometrySetSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testSphereGeometrySetSegmentCount";
      console.info(msg + ' begin ');
      try {
        let sphereGeometry = new SphereGeometry();
        expect(sphereGeometry != null).assertTrue();
        
        sphereGeometry.segmentCount = 32;
        expect(sphereGeometry.segmentCount != null).assertTrue();
        console.info(msg + " segmentCount setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometryGetRadius
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1680
     * @tc.desc   Test CylinderGeometry.radius getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometryGetRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometryGetRadius";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();

        let radius = cylinderGeometry.radius;
        expect(radius != undefined).assertTrue();
        expect(radius != null).assertTrue();
        console.info(msg + " radius getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometrySetRadius
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1690
     * @tc.desc   Test CylinderGeometry.radius setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometrySetRadius', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometrySetRadius";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();
        
        cylinderGeometry.radius = 1.5;
        expect(cylinderGeometry.radius != null).assertTrue();
        console.info(msg + " radius setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometryGetHeight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1700
     * @tc.desc   Test CylinderGeometry.height getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometryGetHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometryGetHeight";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();

        let height = cylinderGeometry.height;
        expect(height != undefined).assertTrue();
        expect(height != null).assertTrue();
        console.info(msg + " height getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometrySetHeight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1710
     * @tc.desc   Test CylinderGeometry.height setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometrySetHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometrySetHeight";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();
        
        cylinderGeometry.height = 3.0;
        expect(cylinderGeometry.height != null).assertTrue();
        console.info(msg + " height setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometryGetSegmentCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1720
     * @tc.desc   Test CylinderGeometry.segmentCount getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometryGetSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometryGetSegmentCount";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();

        let segmentCount = cylinderGeometry.segmentCount;
        expect(segmentCount != undefined).assertTrue();
        expect(segmentCount != null).assertTrue();
        console.info(msg + " segmentCount getter succeeded");

        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCylinderGeometrySetSegmentCount
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1730
     * @tc.desc   Test CylinderGeometry.segmentCount setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCylinderGeometrySetSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testCylinderGeometrySetSegmentCount";
      console.info(msg + ' begin ');
      try {
        let cylinderGeometry = new CylinderGeometry();
        expect(cylinderGeometry != null).assertTrue();
        
        cylinderGeometry.segmentCount = 24;
        expect(cylinderGeometry.segmentCount != null).assertTrue();
        console.info(msg + " segmentCount setter succeeded");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testGeometryTypeCylinder
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1810
     * @tc.desc   Test GeometryType.CYLINDER enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGeometryTypeCylinder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testGeometryTypeCylinder";
      console.info(msg + ' begin ');
      try {
        expect(GeometryType.CYLINDER).assertEqual(4);
        console.info(msg + " GeometryType.CYLINDER = 4 verified");
        
        expect(GeometryType.CYLINDER != GeometryType.SPHERE).assertTrue();
        expect(GeometryType.CYLINDER != GeometryType.CUBE).assertTrue();
        console.info(msg + " GeometryType.CYLINDER distinct from other types");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRenderingPipelineTypeForward
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_1830
     * @tc.desc   Test RenderingPipelineType.FORWARD enum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRenderingPipelineTypeForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void) => {
      let msg = "============================testRenderingPipelineTypeForward";
      console.info(msg + ' begin ');
      try {
        expect(RenderingPipelineType.FORWARD).assertEqual(1);
        console.info(msg + " RenderingPipelineType.FORWARD = 1 verified");
        
        expect(RenderingPipelineType.FORWARD != RenderingPipelineType.FORWARD_LIGHTWEIGHT).assertTrue();
        expect(RenderingPipelineType.FORWARD > RenderingPipelineType.FORWARD_LIGHTWEIGHT).assertTrue();
        console.info(msg + " RenderingPipelineType.FORWARD value and order verified");
        
        console.info(msg + " test completed successfully");
        done();
      } catch (err) {
        console.info(msg + ' Failed: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
