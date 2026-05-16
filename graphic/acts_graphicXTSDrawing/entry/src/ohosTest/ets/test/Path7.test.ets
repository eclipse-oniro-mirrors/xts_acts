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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath7Test(): void {
  describe('DrawingTsPath7Test', () => {
    beforeEach(() => {
      
    })
    
    afterEach(() => {
      
    })
    
    afterAll(() => {
      
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4400
     * @tc.name      testPathConvertToSvgStringEmpty
     * @tc.desc      testPathConvertToSvgStringEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathConvertToSvgStringEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathConvertToSvgStringEmpty';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4500
     * @tc.name      testPathConvertToSvgStringWithMoveTo
     * @tc.desc      testPathConvertToSvgStringWithMoveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithMoveTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result = path.convertToSvgString();
        console.info(msg + ' convertToSvgString successes, result: ' + result);
        expect(typeof result).assertEqual('string');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4600
     * @tc.name      testPathConvertToSvgStringWithLineTo
     * @tc.desc      testPathConvertToSvgStringWithLineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithLineTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        expect(result.includes('M')).assertTrue();
        expect(result.includes('L')).assertTrue();
        console.info(msg + ' convertToSvgString successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4700
     * @tc.name      testPathConvertToSvgStringWithClose
     * @tc.desc      testPathConvertToSvgStringWithClose
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathConvertToSvgStringWithClose', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathConvertToSvgStringWithClose';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        expect(result.includes('Z')).assertTrue();
        console.info(msg + ' convertToSvgString successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4800
     * @tc.name      testPathConvertToSvgStringMultipleCalls
     * @tc.desc      testPathConvertToSvgStringMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathConvertToSvgStringMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathConvertToSvgStringMultipleCalls';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result1 = path.convertToSvgString();
        let result2 = path.convertToSvgString();
        let result3 = path.convertToSvgString();
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        console.info(msg + ' convertToSvgString 1 successes, result: ' + result1);
        console.info(msg + ' convertToSvgString 2 successes, result: ' + result2);
        console.info(msg + ' convertToSvgString 3 successes, result: ' + result3);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_4900
     * @tc.name      testPathConvertToSvgStringAfterReset
     * @tc.desc      testPathConvertToSvgStringAfterReset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathConvertToSvgStringAfterReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathConvertToSvgStringAfterReset';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        path.reset();
        let result = path.convertToSvgString();
        expect(typeof result).assertEqual('string');
        console.info(msg + ' convertToSvgString successes, result: ' + result);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` convertToSvgString errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5000
     * @tc.name      testPathGetPointDataEmpty
     * @tc.desc      testPathGetPointDataEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetPointDataEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetPointDataEmpty';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getPointData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5100
     * @tc.name      testPathGetPointDataWithMoveTo
     * @tc.desc      testPathGetPointDataWithMoveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithMoveTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result: Array<common2D.Point> = path.getPointData();
        expect(result.length).assertLarger(0);
        expect(result[0].x).assertEqual(10);
        expect(result[0].y).assertEqual(10);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
        console.info(msg + ' result[0].x: ' + result[0].x + ', result[0].y: ' + result[0].y);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5200
     * @tc.name      testPathGetPointDataWithLineTo
     * @tc.desc      testPathGetPointDataWithLineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithLineTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.getPointData();
        expect(result.length).assertLarger(1);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
        for (let i = 0; i < result.length; i++) {
          console.info(msg + ' result[' + i + '].x: ' + result[i].x + ', result[' + i + '].y: ' + result[i].y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5300
     * @tc.name      testPathGetPointDataWithCurve
     * @tc.desc      testPathGetPointDataWithCurve
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetPointDataWithCurve', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetPointDataWithCurve';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        let result = path.getPointData();
        expect(result.length).assertLarger(0);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
        for (let i = 0; i < result.length; i++) {
          console.info(msg + ' result[' + i + '].x: ' + result[i].x + ', result[' + i + '].y: ' + result[i].y);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5400
     * @tc.name      testPathGetPointDataMultipleCalls
     * @tc.desc      testPathGetPointDataMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetPointDataMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetPointDataMultipleCalls';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result1 = path.getPointData();
        let result2 = path.getPointData();
        let result3 = path.getPointData();
        expect(result1.length).assertEqual(result2.length);
        expect(result2.length).assertEqual(result3.length);
        console.info(msg + ' getPointData 1 successes, result.length: ' + result1.length);
        console.info(msg + ' getPointData 2 successes, result.length: ' + result2.length);
        console.info(msg + ' getPointData 3 successes, result.length: ' + result3.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5500
     * @tc.name      testPathGetPointDataAfterReset
     * @tc.desc      testPathGetPointDataAfterReset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetPointDataAfterReset', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetPointDataAfterReset';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        path.reset();
        let result = path.getPointData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getPointData successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getPointData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5600
     * @tc.name      testPathGetVerbDataEmpty
     * @tc.desc      testPathGetVerbDataEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetVerbDataEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetVerbDataEmpty';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getVerbData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getVerbData successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5700
     * @tc.name      testPathGetVerbDataWithMoveTo
     * @tc.desc      testPathGetVerbDataWithMoveTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithMoveTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithMoveTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        let result = path.getVerbData();
        expect(result.length).assertLarger(0);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        console.info(msg + ' getVerbData successes, result.length: ' + result.length);
        console.info(msg + ' result[0]: ' + result[0]);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5800
     * @tc.name      testPathGetVerbDataWithLineTo
     * @tc.desc      testPathGetVerbDataWithLineTo
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithLineTo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithLineTo';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        let result = path.getVerbData();
        expect(result.length).assertLarger(1);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.LINE);
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_5900
     * @tc.name      testPathGetVerbDataWithClose
     * @tc.desc      testPathGetVerbDataWithClose
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithClose', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithClose';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.close();
        let result = path.getVerbData();
        expect(result.length).assertLarger(2);
        expect(result[result.length - 1]).assertEqual(drawing.PathIteratorVerb.CLOSE);
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6000
     * @tc.name      testPathGetVerbDataWithQuad
     * @tc.desc      testPathGetVerbDataWithQuad
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level         LEVEL1
     */
    it('testPathGetVerbDataWithQuad', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithQuad';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.quadTo(50, 50, 100, 100);
        let result = path.getVerbData();
        expect(result.length).assertLarger(1);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.QUAD);
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6100
     * @tc.name      testPathGetVerbDataWithCubic
     * @tc.desc      testPathGetVerbDataWithCubic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithCubic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithCubic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.cubicTo(50, 50, 100, 100, 150, 150);
        let result = path.getVerbData();
        expect(result.length).assertLarger(1);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.CUBIC);
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6200
     * @tc.name      testPathGetVerbDataWithConic
     * @tc.desc      testPathGetVerbDataWithConic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetVerbDataWithConic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetVerbDataWithConic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        let result = path.getVerbData();
        expect(result.length).assertLarger(1);
        expect(result[0]).assertEqual(drawing.PathIteratorVerb.MOVE);
        expect(result[1]).assertEqual(drawing.PathIteratorVerb.CONIC);
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6300
     * @tc.name      testPathGetVerbDataAllVerbs
     * @tc.desc      testPathGetVerbDataAllVerbs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetVerbDataAllVerbs', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetVerbDataAllVerbs';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6400
     * @tc.name      testPathGetVerbDataWithDone
     * @tc.desc      testPathGetVerbDataWithDone
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetVerbDataWithDone', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetVerbDataWithDone';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6500
     * @tc.name      testPathGetVerbDataMultipleCalls
     * @tc.desc      testPathGetVerbDataMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetVerbDataMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetVerbDataMultipleCalls';
      let path: drawing.Path = new drawing.Path();
      path.moveTo(10, 10);
      path.lineTo(100, 100);
      try {
        let result1 = path.getVerbData();
        let result2 = path.getVerbData();
        let result3 = path.getVerbData();
        expect(result1.length).assertEqual(result2.length);
        expect(result2.length).assertEqual(result3.length);
        console.info(msg + ' getVerbData 1 successes, result.length: ' + result1.length);
        console.info(msg + ' getVerbData 2 successes, result.length: ' + result2.length);
        console.info(msg + ' getVerbData 3 successes, result.length: ' + result3.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getVerbData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6600
     * @tc.name      testPathGetConicWeightDataEmpty
     * @tc.desc      testPathGetConicWeightDataEmpty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testPathGetConicWeightDataEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathGetConicWeightDataEmpty';
      let path: drawing.Path = new drawing.Path();
      try {
        let result = path.getConicWeightData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6700
     * @tc.name      testPathGetConicWeightDataWithoutConic
     * @tc.desc      testPathGetConicWeightDataWithoutConic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithoutConic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithoutConic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.lineTo(100, 100);
        path.quadTo(50, 50, 200, 200);
        let result = path.getConicWeightData();
        expect(result.length).assertEqual(0);
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6800
     * @tc.name      testPathGetConicWeightDataWithConic
     * @tc.desc      testPathGetConicWeightDataWithConic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWithConic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWithConic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        let result = path.getConicWeightData();
        expect(result.length).assertLarger(0);
        expect(result[0]).assertEqual(0.5);
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
        console.info(msg + ' result[0]: ' + result[0]);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_6900
     * @tc.name      testPathGetConicWeightDataWeightZero
     * @tc.desc      testPathGetConicWeightDataWeightZero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWeightZero', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWeightZero';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0);
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
        expect(result.length).assertEqual(0);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_7000
     * @tc.name      testPathGetConicWeightDataWeightOne
     * @tc.desc      testPathGetConicWeightDataWeightOne
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL1
     */
    it('testPathGetConicWeightDataWeightOne', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testPathGetConicWeightDataWeightOne';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 1);
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
        expect(result.length).assertEqual(0);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_7100
     * @tc.name      testPathGetConicWeightDataMultipleConic
     * @tc.desc      testPathGetConicWeightDataMultipleConic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetConicWeightDataMultipleConic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetConicWeightDataMultipleConic';
      let path: drawing.Path = new drawing.Path();
      try {
        path.moveTo(10, 10);
        path.conicTo(100, 100, 200, 200, 0.5);
        path.conicTo(300, 300, 400, 400, 0.8);
        path.conicTo(500, 500, 600, 600, 1.2);
        let result = path.getConicWeightData();
        console.info(msg + ' getConicWeightData successes, result.length: ' + result.length);
        console.info(msg + ' getConicWeightData successes, result: ' + JSON.parse(JSON.stringify(result)));
        expect(result.length).assertEqual(3);
        expect(result[0]).assertClose(0.5, 0.001);
        expect(result[1]).assertClose(0.8, 0.001);
        expect(result[2]).assertClose(1.2, 0.001);
        for (let i = 0; i < result.length; i++) {
          console.info(msg + ' result[' + i + ']: ' + result[i]);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getConicWeightData errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    
    /**
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_7200
     * @tc.name      testPathGetConicWeightDataMultipleCalls
     * @tc.desc      testPathGetConicWeightDataMultipleCalls
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL2
     */
    it('testPathGetConicWeightDataMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testPathGetConicWeightDataMultipleCalls';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_7300
     * @tc.name      testPathDataMethodsConsistency
     * @tc.desc      testPathDataMethodsConsistency
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathDataMethodsConsistency', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathDataMethodsConsistency';
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
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_7400
     * @tc.name      testPathDataMethodsWithSvgConversion
     * @tc.desc      testPathDataMethodsWithSvgConversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL3
     */
    it('testPathDataMethodsWithSvgConversion', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathDataMethodsWithSvgConversion';
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
