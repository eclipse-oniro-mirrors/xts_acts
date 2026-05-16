/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath7Test(): void {
  describe('DrawingTsPath7Test', () => {
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4400
     * @tc.name      testPathConvertToSvgStringEmptyPathStatic
     * @tc.desc      testPathConvertToSvgStringEmptyPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathConvertToSvgStringEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathConvertToSvgStringEmptyPathStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.convertToSvgString();
        expect(result !== undefined).assertTrue();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4500
     * @tc.name      testPathConvertToSvgStringWithMoveToStatic
     * @tc.desc      testPathConvertToSvgStringWithMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithMoveToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithMoveToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      try {
        let result = path.convertToSvgString();
        expect(result !== undefined).assertTrue();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4600
     * @tc.name      testPathConvertToSvgStringWithLineToStatic
     * @tc.desc      testPathConvertToSvgStringWithLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathConvertToSvgStringWithLineToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathConvertToSvgStringWithLineToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        expect(result.includes('M')).assertTrue();
        expect(result.includes('L')).assertTrue();
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4700
     * @tc.name      testPathConvertToSvgStringWithQuadToStatic
     * @tc.desc      testPathConvertToSvgStringWithQuadToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathConvertToSvgStringWithQuadToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathConvertToSvgStringWithQuadToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.quadTo(50.0, 50.0, 100.0, 100.0);
      try {
        let result = path.convertToSvgString();
        expect(result !== undefined).assertTrue();
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4800
     * @tc.name      testPathConvertToSvgStringWithCubicToStatic
     * @tc.desc      testPathConvertToSvgStringWithCubicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithCubicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithCubicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.cubicTo(30.0, 30.0, 60.0, 60.0, 100.0, 100.0);
      try {
        let result = path.convertToSvgString();
        expect(result !== undefined).assertTrue();
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_4900
     * @tc.name      testPathConvertToSvgStringWithConicToStatic
     * @tc.desc      testPathConvertToSvgStringWithConicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithConicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithConicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.5);
      try {
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5000
     * @tc.name      testPathConvertToSvgStringWithArcToStatic
     * @tc.desc      testPathConvertToSvgStringWithArcToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithArcToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithArcToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.arcTo(10.0, 15.0, 10.0, 10.0, 10.0, 10.0);
      try {
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5100
     * @tc.name      testPathConvertToSvgStringWithCloseStatic
     * @tc.desc      testPathConvertToSvgStringWithCloseStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithCloseStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithCloseStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      path.close();
      try {
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        expect(result.includes('Z')).assertTrue();
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5200
     * @tc.name      testPathPathConvertToSvgStringComplexPathStatic
     * @tc.desc      testPathConvertToSvgStringComplexPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathPathConvertToSvgStringComplexPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathPathConvertToSvgStringComplexPathStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(0.0, 0.0);
      path.lineTo(0.0, 700.0);
      path.lineTo(700.0, 0.0);
      path.close();
      try {
        let result = path.convertToSvgString();
        expect(result !== undefined).assertTrue();
        console.info(msg + ' convertToSvgString successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5300
     * @tc.name      testPathGetPointDataEmptyPathStatic
     * @tc.desc      testPathGetPointDataEmptyPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetPointDataEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetPointDataEmptyPathStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getPointData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5400
     * @tc.name      testPathGetPointDataWithMoveToStatic
     * @tc.desc      testPathGetPointDataWithMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithMoveToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithMoveToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      try {
        let result: Array<common2D.Point> = path.getPointData();
        expect(result.length > 0).assertTrue();
        expect(result[0].x).assertEqual(10);
        expect(result[0].y).assertEqual(10);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5500
     * @tc.name      testPathGetPointDataWithLineToStatic
     * @tc.desc      testPathGetPointDataWithLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithLineToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithLineToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5600
     * @tc.name      testPathGetPointDataWithQuadToStatic
     * @tc.desc      testPathGetPointDataWithQuadToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithQuadToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithQuadToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.quadTo(50.0, 50.0, 100.0, 100.0);
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5700
     * @tc.name      testPathGetPointDataWithCubicToStatic
     * @tc.desc      testPathGetPointDataWithCubicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithCubicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithCubicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.cubicTo(30.0, 30.0, 60.0, 60.0, 100.0, 100.0);
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5800
     * @tc.name      testPathGetPointDataWithConicToStatic
     * @tc.desc      testPathGetPointDataWithConicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithConicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithConicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.5);
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_5900
     * @tc.name      testPathGetPointDataWithArcToStatic
     * @tc.desc      testPathGetPointDataWithArcToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithArcToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithArcToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.arcTo(10.0, 15.0, 10.0, 10.0, 10.0, 10.0);
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6000
     * @tc.name      testPathGetPointDataWithCloseStatic
     * @tc.desc      testPathGetPointDataWithCloseStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithCloseStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithCloseStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      path.close();
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6100
     * @tc.name      testPathGetPointDataComplexPathStatic
     * @tc.desc      testPathGetPointDataComplexPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataComplexPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataComplexPathStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(0.0, 0.0);
      path.lineTo(0.0, 700.0);
      path.lineTo(700.0, 0.0);
      path.close();
      try {
        let result = path.getPointData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getPointData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6200
     * @tc.name      testPathGetVerbDataEmptyPathStatic
     * @tc.desc      testPathGetVerbDataEmptyPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataEmptyPathStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getVerbData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6300
     * @tc.name      testPathGetVerbDataWithMoveToStatic
     * @tc.desc      testPathGetVerbDataWithMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithMoveToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithMoveToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6400
     * * @tc.name      testPathGetVerbDataWithLineToStatic
     * @tc.desc      testPathGetVerbDataWithLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithLineToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithLineToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.LINE);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6500
     * @tc.name      testPathGetVerbDataWithQuadToStatic
     * @tc.desc      testPathGetVerbDataWithQuadToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithQuadToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithQuadToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.quadTo(50.0, 50.0, 100.0, 100.0);
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6600
     * @tc.name      testPathGetVerbDataWithCubicToStatic
     * @tc.desc      testPathGetVerbDataWithCubicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithCubicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithCubicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.cubicTo(30.0, 30.0, 60.0, 60.0, 100.0, 100.0);
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6700
     * @tc.name      testPathGetVerbDataWithConicToStatic
     * @tc.desc      testPathGetVerbDataWithConicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithConicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithConicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.5);
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.CONIC);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6800
     * @tc.name      testPathGetVerbDataWithCloseStatic
     * @tc.desc      testPathGetVerbDataWithCloseStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithCloseStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithCloseStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      path.close();
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        expect(result[2]).assertEqual(drawing.PathIteratorVerb.CLOSE);
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_6900
     * @tc.name      testPathGetVerbDataComplexPathStatic
     * @tc.desc      testPathGetVerbDataComplexPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataComplexPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataComplexPathStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(0.0, 0.0);
      path.lineTo(0.0, 700.0);
      path.lineTo(700.0, 0.0);
      path.close();
      try {
        let result = path.getVerbData();
        expect(result.length > 0).assertTrue();
        console.info(msg + ' getVerbData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7000
     * @tc.name      testPathGetVerbDataAllVerbsStatic
     * @tc.desc      testPathGetVerbDataAllVerbsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetVerbDataAllVerbsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetVerbDataAllVerbsStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.quadTo(50, 50, 100, 100);
        path.cubicTo(150, 150, 200, 200, 250, 250);
        path.conicTo(300, 300, 350, 350, 0.5);
        path.close();
        let result = path.getVerbData();
        expect(result.length).assertLarger(5);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.LINE);
        expect(result[2]).assertEqual(drawing.PathIteratorVerb.QUAD);
        expect(result[3]).assertEqual(drawing.PathIteratorVerb.CUBIC);
        expect(result[4]).assertEqual(drawing.PathIteratorVerb.CONIC);
        expect(result[5]).assertEqual(drawing.PathIteratorVerb.CLOSE);
        console.info(msg + ' getVerbData successes, result.length: ' + result.length);
        for (let i = 0; i < result.length; i++) {
          console.info(msg + ' result[' + i + ']: ' + result[i]);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7100
     * @tc.name      testPathGetVerbDataWithDoneStatic
     * @tc.desc      testPathGetVerbDataWithDoneStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetVerbDataWithDoneStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetVerbDataWithDoneStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();
        let result = path.getVerbData();
        console.info(msg + ' getVerbData with DONE successes, result: ' + result);
        expect(result.length).assertLarger(2);
        let hasDone = false;
        for (let i = 0; i < result.length; i++) {
          if (result[i] === drawing.PathIteratorVerb.DONE) {
            hasDone = true;
            console.info(msg + ' found DONE verb at index: ' + i);
          }
        }
        expect(hasDone).assertFalse();
        console.info(msg + ' getVerbData with DONE successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7200
     * @tc.name      testPathGetConicWeightDataEmptyPathStatic
     * @tc.desc      testPathGetConicWeightDataEmptyPathStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataEmptyPathStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataEmptyPathStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length).assertEqual(0);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7300
     * @tc.name      testPathGetConicWeightDataWithMoveToStatic
     * @tc.desc      testPathGetConicWeightDataWithMoveToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithMoveToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithMoveToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length).assertEqual(0);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7400
     * @tc.name      testPathGetConicWeightDataWithLineToStatic
     * @tc.desc      testPathGetConicWeightDataWithLineToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithLineToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithLineToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.lineTo(100.0, 100.0);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length).assertEqual(0);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7500
     * @tc.name      testPathGetConicWeightDataWithConicToWeight0Static
     * @tc.desc      testPathGetConicWeightDataWithConicToWeight0Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithConicToWeight0Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithConicToWeight0Static';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.0);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length == 0).assertTrue();
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7600
     * @tc.name      testPathGetConicWeightDataWithConicToWeight05Static
     * @tc.desc      testPathGetConicWeightDataWithConicToWeight05Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithConicToWeight05Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithConicToWeight05Static';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.5);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        expect(result[0]).assertEqual(0.5);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7700
     * @tc.name      testPathGetConicWeightDataWithConicToWeight1Static
     * @tc.desc      testPathGetConicWeightDataWithConicToWeight1Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithConicToWeight1Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithConicToWeight1Static';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 1.0);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length == 0).assertTrue();
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7800
     * @tc.name      testPathGetConicWeightDataWithConicToWeight2Static
     * @tc.desc      testPathGetConicWeightDataWithConicToWeight2Static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithConicToWeight2Static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithConicToWeight2Static';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 2.0);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        expect(result[0]).assertEqual(2.0);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as  BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_7900
     * @tc.name      testPathGetConicWeightDataMultipleConicToStatic
     * @tc.desc      testPathGetConicWeightDataMultipleConicToStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataMultipleConicToStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataMultipleConicToStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10.0, 10.0);
      path.conicTo(50.0, 50.0, 100.0, 100.0, 0.5);
      path.conicTo(150.0, 150.0, 200.0, 200.0, 1.5);
      path.conicTo(250.0, 250.0, 300.0, 300.0, 2.5);
      try {
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData result: ' + JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        expect(result.length).assertEqual(3);
        expect(result[0]).assertClose(0.5, 0.001);
        expect(result[1]).assertClose(1.5, 0.001);
        expect(result[2]).assertClose(2.5, 0.001);
        console.info(msg + ' getConicWeightData successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_8000
     * @tc.name      testPathGetConicWeightDataMultipleCallsStatic
     * @tc.desc      testPathGetConicWeightDataMultipleCallsStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetConicWeightDataMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetConicWeightDataMultipleCallsStatic';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.conicTo(100, 100, 200, 200, 0.5);
      try {
        let result1 = path.getConicWeightData();
        let result2 = path.getConicWeightData();
        let result3 = path.getConicWeightData();
        expect(result1.length).assertEqual(result2.length);
        expect(result2.length).assertEqual(result3.length);
        console.info(msg + ' getConicWeightData 1 successes, result.length: ' + result1.length);
        console.info(msg + ' getConicWeightData 2 successes, result.length: ' + result2.length);
        console.info(msg + ' getConicWeightData 3 successes, result.length: ' + result3.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_8100
     * @tc.name      testPathDataMethodsConsistencyStatic
     * @tc.desc      testPathDataMethodsConsistencyStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathDataMethodsConsistencyStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathDataMethodsConsistencyStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.quadTo(50, 50, 200, 200);
        path.conicTo(300, 300, 400, 400, 0.5);

        let pointData = path.getPointData();
        let verbData = path.getVerbData();
        let conicWeightData = path.getConicWeightData();

        expect(pointData.length).assertLarger(0);
        expect(verbData.length).assertLarger(0);
        expect(conicWeightData.length).assertEqual(1);

        console.info(msg + ' getPointData successes, pointData.length: ' + pointData.length);
        console.info(msg + ' getVerbData successes, verbData.length: ' + verbData.length);
        console.info(msg + ' getConicWeightData successes, conicWeightData.length: ' + conicWeightData.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` data methods errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_8200
     * @tc.name      testPathDataMethodsWithSvgConversionStatic
     * @tc.desc      testPathDataMethodsWithSvgConversionStatic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathDataMethodsWithSvgConversionStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathDataMethodsWithSvgConversionStatic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();

        let svgString = path.convertToSvgString();
        let pointData = path.getPointData();
        let verbData = path.getVerbData();
        let conicWeightData = path.getConicWeightData();

        expect(typeof svgString).assertEqual('string');
        expect(pointData.length).assertLarger(0);
        expect(verbData.length).assertLarger(0);

        console.info(msg + ' convertToSvgString successes, svgString: ' + svgString);
        console.info(msg + ' getPointData successes, pointData.length: ' + pointData.length);
        console.info(msg + ' getVerbData successes, verbData.length: ' + verbData.length);
        console.info(msg + ' getConicWeightData successes, conicWeightData.length: ' + conicWeightData.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` data methods with svg errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}
