/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { BusinessError } from '@ohos.base';

export default function drawingTsPathTest() {
  describe('DrawingTsPathTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.name   testPathMoveToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0100
     * @tc.desc   testPathMoveToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathMoveToNormalStatic';
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.moveTo(10.1, 10.1);
        path.moveTo(-1, -1);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathMoveToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0103
     * @tc.desc   testPathMoveToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathMoveToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.moveTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'moveTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathLineToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0200
     * @tc.desc   testPathLineToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathLineToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathLineToNormalStatic';
      try {
        let path = new drawing.Path();
        path.lineTo(10, 10);
        path.lineTo(10.1, 10.1);
        path.lineTo(-1, -1);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathLineToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0203
     * @tc.desc   testPathLineToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathLineToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.lineTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'lineTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathArcToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0300
     * @tc.desc   testPathArcToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathArcToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathArcToNormalStatic';
      try {
        let path = new drawing.Path();
        path.arcTo(10, 15, 10, 10, 0, 360);
        path.arcTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.arcTo(-10, -15, 10, 10, 90, 180);
        path.arcTo(10, 15, -10, -10, 90, 180);
        path.arcTo(10, 15, 10, 10, -90, 180);
        path.arcTo(10, 15, 10, 10, 90, -180);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathArcToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0303
     * @tc.desc   testPathArcToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathArcToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.arcTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'arcTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathQuadToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0400
     * @tc.desc   testPathQuadToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathQuadToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathQuadToNormalStatic';
      try {
        let path = new drawing.Path();
        path.quadTo(10, 15, 10, 10);
        path.quadTo(10.2, 15.3, 10.4, 10.5);
        path.quadTo(-10, -15, 10, 10);
        path.quadTo(10, 15, -10, -10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathQuadToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0403
     * @tc.desc   testPathQuadToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathQuadToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.quadTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'quadTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathCubicToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0500
     * @tc.desc   testPathCubicToNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathCubicToNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathCubicToNormalStatic';
      let path = new drawing.Path();
      try {
        path.cubicTo(10, 15, 10, 10, 10, 10);
        path.cubicTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.cubicTo(-10, -15, 10, 10, 90, 180);
        path.cubicTo(10, 15, -10, -10, 90, 180);
        path.cubicTo(10, 15, 10, 10, -10, -10);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathCubicToMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0503
     * @tc.desc   testPathCubicToMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathCubicToMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.cubicTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathCloseNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0600
     * @tc.desc   testPathCloseNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathCloseNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathCloseNormalStatic';
      try {
        let path = new drawing.Path();
        path.close();
        console.info(msg + 'close successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `close errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathPathMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0601
     * @tc.desc   testPathPathMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathPathMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathPathMultipleCallsStatic';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.cubicTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        path.close();
        console.info(msg + 'close successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `close errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathResetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0700
     * @tc.desc   testPathResetNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathResetNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathResetNormalStatic';
      try {
        let path = new drawing.Path();
        path.reset();
        console.info(msg + 'reset successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathResetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0701
     * @tc.desc   testPathResetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathResetMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathResetMultipleCallsStatic';
      let path = new drawing.Path();
      try {
        for (let index = 0; index < 20; index++) {
          path.cubicTo(10, 10, 10, 10, 15, 15);
          path.reset();
        }
        path.close()
        console.info(msg + 'reset successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }

      try {
        path.cubicTo(10, 10, 10, 10, 15, 15);
        for (let index = 0; index < 20; index++) {
          path.reset();
        }
        path.close()
        console.info(msg + 'reset successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}