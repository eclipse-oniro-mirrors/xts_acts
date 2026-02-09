/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function drawingTsPathTest() {
  describe('DrawingTsPathTest', () => {
    const DEFAULT = 0;
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
     * @tc.name   testPathMoveToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0100
     * @tc.desc   testPathMoveToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathMoveToNormal';
      try {
        let path = new drawing.Path();
        path.moveTo(10, 10);
        path.moveTo(10.1, 10.1);
        path.moveTo(-1, -1);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathMoveToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0101
     * @tc.desc   testPathMoveToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathMoveToNull';
      let path = new drawing.Path();
      try {
        path.moveTo(undefined, 10);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.moveTo(10, undefined);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.moveTo(null, 10);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.moveTo(10, null);
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testPathMoveToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0103
     * @tc.desc   testPathMoveToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathMoveToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathMoveToMultipleCalls';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.moveTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'moveTo successed');
      } catch (e) {
        console.info(msg + `moveTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathLineToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0200
     * @tc.desc   testPathLineToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathLineToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathLineToNormal';
      try {
        let path = new drawing.Path();
        path.lineTo(10, 10);
        path.lineTo(10.1, 10.1);
        path.lineTo(-1, -1);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathLineToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0201
     * @tc.desc   testPathLineToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathLineToNull';
      let path = new drawing.Path();
      try {
        path.lineTo(undefined, 10);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.lineTo(10, undefined);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.lineTo(null, 10);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.lineTo(10, null);
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testPathLineToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0203
     * @tc.desc   testPathLineToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathLineToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathLineToMultipleCalls';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.lineTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'lineTo successed');
      } catch (e) {
        console.info(msg + `lineTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathArcToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0300
     * @tc.desc   testPathArcToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathArcToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathArcToNormal';
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
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathArcToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0301
     * @tc.desc   testPathArcToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathArcToNull';
      let path = new drawing.Path();
      try {
        path.arcTo(undefined, 15, 10, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, undefined, 10, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, undefined, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, undefined, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, 10, undefined, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, 10, 10, undefined);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(null, 15, 10, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, null, 10, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, null, 10, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, null, 10, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, 10, null, 60);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.arcTo(10, 15, 10, 10, 10, null);
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testPathArcToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0303
     * @tc.desc   testPathArcToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathArcToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathArcToMultipleCalls';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.arcTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'arcTo successed');
      } catch (e) {
        console.info(msg + `arcTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathQuadToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0400
     * @tc.desc   testPathQuadToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathQuadToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathQuadToNormal';
      try {
        let path = new drawing.Path();
        path.quadTo(10, 15, 10, 10);
        path.quadTo(10.2, 15.3, 10.4, 10.5);
        path.quadTo(-10, -15, 10, 10);
        path.quadTo(10, 15, -10, -10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathQuadToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0401
     * @tc.desc   testPathQuadToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathQuadToNull';
      let path = new drawing.Path();
      try {
        path.quadTo(undefined, 15, 10, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, undefined, 10, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, 15, undefined, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, 15, 10, undefined);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(null, 15, 10, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, null, 10, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, 15, null, 10);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.quadTo(10, 15, 10, null);
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testPathQuadToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0403
     * @tc.desc   testPathQuadToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathQuadToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathQuadToMultipleCalls';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.quadTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'quadTo successed');
      } catch (e) {
        console.info(msg + `quadTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathCubicToNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0500
     * @tc.desc   testPathCubicToNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathCubicToNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathCubicToNormal';
      let path = new drawing.Path();
      try {
        path.cubicTo(10, 15, 10, 10, 10, 10);
        path.cubicTo(10.2, 15.3, 10.4, 10.5, 10.3, 60.3);
        path.cubicTo(-10, -15, 10, 10, 90, 180);
        path.cubicTo(10, 15, -10, -10, 90, 180);
        path.cubicTo(10, 15, 10, 10, -10, -10);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathCubicToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0501
     * @tc.desc   testPathCubicToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathCubicToNull';
      let path = new drawing.Path();
      try {
        path.cubicTo(undefined, 15, 10, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, undefined, 10, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, undefined, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, undefined, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, 10, undefined, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, 10, 10, undefined);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(null, 15, 10, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, null, 10, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, null, 10, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, null, 10, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, 10, null, 60);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }

      try {
        path.cubicTo(10, 15, 10, 10, 10, null);
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401)
      }
    })

    /**
     * @tc.name   testPathCubicToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0503
     * @tc.desc   testPathCubicToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathCubicToMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathCubicToMultipleCalls';
      try {
        let path = new drawing.Path();
        for (let index = 0; index < 20; index++) {
          path.cubicTo(Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE, Math.random() * Number.MAX_VALUE,
            Math.random() * Number.MAX_VALUE);
        }
        console.info(msg + 'cubicTo successed');
      } catch (e) {
        console.info(msg + `cubicTo errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathCloseNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0600
     * @tc.desc   testPathCloseNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathCloseNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathCloseNormal';
      try {
        let path = new drawing.Path();
        path.close();
        console.info(msg + 'close successed');
      } catch (e) {
        console.info(msg + `close errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathPathMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0601
     * @tc.desc   testPathPathMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathPathMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathPathMultipleCalls';
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
        console.info(msg + `close errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0700
     * @tc.desc   testPathResetNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathResetNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathResetNormal';
      try {
        let path = new drawing.Path();
        path.reset();
        console.info(msg + 'reset successed');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0701
     * @tc.desc   testPathResetMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathResetMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathResetMultipleCalls';
      let path = new drawing.Path();
      try {
        for (let index = 0; index < 20; index++) {
          path.cubicTo(10, 10, 10, 10, 15, 15);
          path.reset();
        }
        path.close()
        console.info(msg + 'reset successed');
      } catch (e) {
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
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}