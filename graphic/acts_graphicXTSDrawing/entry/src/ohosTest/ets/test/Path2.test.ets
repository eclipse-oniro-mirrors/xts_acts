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
import { getEnumCount } from './utils';
import common2D from '@ohos.graphics.common2D';

export default function drawingTsPath2Test() {
  describe('DrawingTsPath2Test', () => {
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
     * @tc.name   testPathAddArcNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0800
     * @tc.desc   testPathAddArcNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddArcNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddArcNormal';
      let path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: 300
        }, 90, 180);
        path.addArc({
          left: 10.1, right: 400.1, top: 100.1, bottom: 300.1
        }, 90.1, 180.1);
        path.addArc({
          left: -10.1, right: 400.1, top: -100.1, bottom: 300.1
        }, -90, -180);
        path.addArc({
          left: 10, right: -400, top: 100, bottom: -300
        }, 450, 361);
        path.addArc({
          left: 100, right: 100, top: 100, bottom: 300
        }, 45, 36);
        path.addArc({
          left: 100, right: 100, top: 100, bottom: 100
        }, 100, -200);
        path.addArc({
          left: maxVal, right: maxVal, top: maxVal, bottom: maxVal
        }, maxVal, maxVal);
        path.close()
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathAddArcMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0801
     * @tc.desc   testPathAddArcMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddArcMultipleCalls';
      let path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          path.addArc({
            left: Math.random(),
            right: Math.random(),
            top: Math.random(),
            bottom: Math.random(),
          }, Math.random(), Math.random());
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathAddArcToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0802
     * @tc.desc   testPathAddArcToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddArcToNull';
      let path = new drawing.Path();

      try {
        path.addArc(null, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: 300
        }, null, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: 300
        }, 90, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc(undefined, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: 300
        }, undefined, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: 300
        }, 90, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: null, right: 400, top: 100, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: null, top: 100, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: null, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: null
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: undefined, right: 400, top: 100, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: undefined, top: 100, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: undefined, bottom: 300
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addArc({
          left: 10, right: 400, top: 100, bottom: undefined
        }, 90, 180);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `test addArc is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testPathAddCircleNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0900
     * @tc.desc   testPathAddCircleNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddCircleNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddCircleNormal';
      let path = new drawing.Path();
      const maxVal = Number.MAX_VALUE

      try {
        path.addCircle(100, 200, 50, drawing.PathDirection.CLOCKWISE);
        path.addCircle(100.1, 300.1, 50.1, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addCircle(200, 200, 50);
        path.addCircle(maxVal, maxVal, maxVal);
        path.addCircle(-200, -200, 200);

        path.addCircle(100, 200, -1, drawing.PathDirection.CLOCKWISE);
        path.addCircle(100, 200, 0);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddCircleMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0901
     * @tc.desc   testPathAddCircleMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddCircleMultipleCalls';
      let path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.PathDirection))
          path.addCircle(Math.random(), Math.random(), Math.random(), randomEnum)
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddCircleToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0902
     * @tc.desc   testPathAddCircleToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddCircleToNull';
      let path = new drawing.Path();
      try {
        path.addCircle(null, 200, 50, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, null, 50, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, 200, null, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, 200, 50, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(undefined, 200, 50, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, undefined, 50, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, 200, undefined, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addCircle(100, 200, 50, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddCircleAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0904
     * @tc.desc   testPathAddCircleAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddCircleAbnormal';
      let path = new drawing.Path();

      try {
        path.addCircle(100, 200, 50, 10);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddOvalNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1000
     * @tc.desc   testPathAddOvalNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddOvalNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddOvalNormal';
      let path = new drawing.Path();
      let maxVal = Number.MAX_VALUE;

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 4, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: 10.1, right: 400.1, top: 100.1, bottom: 300.1
        }, 4.1);
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addOval({
          left: 10.1, right: 400.1, top: 100.1, bottom: 300.1
        }, 5.1);
        path.addOval({
          left: -10, right: 400, top: -10, bottom: 300
        }, 1);
        path.addOval({
          left: 10, right: -400, top: 100, bottom: -300
        }, 5, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: maxVal, right: maxVal, top: maxVal, bottom: maxVal
        }, 0);
        path.addOval({
          left: 100, right: 100, top: 100, bottom: 200
        }, 1);
        path.addOval({
          left: 100, right: 100, top: 100, bottom: 200
        }, 3);
        path.addOval({
          left: 100, right: 100, top: 100, bottom: 100
        }, 10);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddOvalMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1001
     * @tc.desc   testPathAddOvalMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddOvalMultipleCalls';
      let path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.PathDirection));
          path.addOval({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          }, Math.random(), randomEnum);
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddOvalToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1002
     * @tc.desc   testPathAddOvalToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddOvalToNull';
      let path = new drawing.Path();

      try {
        path.addOval(null, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, null, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 5, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval(undefined, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, undefined, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: null, right: 400, top: 100, bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: null, top: 100, bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: null, bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: null
        }, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: undefined, right: 400, top: 100, bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: undefined, top: 100, bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: undefined, bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: undefined
        }, 5, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddOvalAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1004
     * @tc.desc   testPathAddOvalAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddOvalAbnormal';
      const path = new drawing.Path();

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, -1, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 4, 10);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1100
     * @tc.desc   testPathAddRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddRectNormal';
      let path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addRect({
          left: 10.1, right: 400.1, top: 100.1, bottom: 300.1
        });
        path.addOval({
          left: -10, right: 400, top: -10, bottom: 300
        }, 300);
        path.addRect({
          left: 10, right: -400, top: 100, bottom: -300
        }, drawing.PathDirection.CLOCKWISE);
        path.addRect({
          left: maxVal, right: maxVal, top: maxVal, bottom: maxVal
        });
        path.addRect({
          left: 100, right: 100, top: 100, bottom: 200
        });
        path.addRect({
          left: 100, right: 100, top: 100, bottom: 100
        });
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1101
     * @tc.desc   testPathAddRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRectMultipleCalls';
      let path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.PathDirection))
          path.addRect({
            left: Math.random(), right: Math.random(), top: Math.random(), bottom: Math.random()
          }, randomEnum)
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRectToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1102
     * @tc.desc   testPathAddRectToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRectToNull';
      let path = new drawing.Path();

      try {
        path.addRect(null, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect(undefined, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: null, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: null, top: 100, bottom: 300
        }, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: null, bottom: 300
        }, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: null
        }, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: undefined, right: 400, top: 100, bottom: 300
        }, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: undefined, top: 100, bottom: 300
        }, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: undefined, bottom: 300
        }, drawing.PathDirection.COUNTER_CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: undefined
        }, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddRectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1104
     * @tc.desc   testPathAddRectAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRectAbnormal';
      let path = new drawing.Path();

      try {
        path.addRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, 10);
        path.close();
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddRoundRectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1200
     * @tc.desc   testPathAddRoundRectNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRoundRectNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddRoundRectNormal';

      try {
        let path = new drawing.Path();
        let roundRect = new drawing.RoundRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, 50, 50);
        path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
        path.addRoundRect(roundRect, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addRoundRect(roundRect);
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRoundRectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1201
     * @tc.desc   testPathAddRoundRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRoundRectMultipleCalls';
      let path = new drawing.Path();

      try {
        for (let i = 0; i < 20; i += 1) {
          let roundRect = new drawing.RoundRect({
            left: 10, right: 400, top: 100, bottom: 300
          }, 50, 50);
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.PathDirection))
          path.addRoundRect(roundRect, randomEnum);
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRoundRectToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1202
     * @tc.desc   testPathAddRoundRectToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRoundRectToNull';
      let path = new drawing.Path();
      let roundRect = new drawing.RoundRect({
        left: 10, right: 400, top: 100, bottom: 300
      }, 50, 50);

      try {
        path.addRoundRect(null, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRoundRect(roundRect, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRoundRect(undefined, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.addRoundRect(roundRect, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddRoundRectAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1204
     * @tc.desc   testPathAddRoundRectAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddRoundRectAbnormal';
      let path = new drawing.Path();

      try {
        let roundRect = new drawing.RoundRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, 50, 50);
        path.addRoundRect(roundRect, 10);
        console.info(msg + 'reset error');
        expect().assertFail();
      } catch (e) {
        console.info(msg + `reset successes. errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathAddPathNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1300
     * @tc.desc   testPathAddPathNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathAddPathNormal';

      try {
        let path = new drawing.Path();
        let matrix = new drawing.Matrix();
        let dstPath = new drawing.Path();
        dstPath.addPath(path, matrix);
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        dstPath.addPath(path);
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        path.addCircle(100, 200, 50, drawing.PathDirection.COUNTER_CLOCKWISE);
        dstPath.addPath(path, matrix);

        dstPath .addPath(path, null);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPathMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1301
     * @tc.desc   testPathAddPathMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPathMultipleCalls';

      try {
        const dstPath = new drawing.Path()
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let matrix = new drawing.Matrix();
          dstPath.addPath(path, matrix);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPathToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1302
     * @tc.desc   testPathAddPathToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathAddPathToNull';

      try {
        let dstPath = new drawing.Path();
        let matrix = new drawing.Matrix();
        dstPath.addPath(null, matrix);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let dstPath = new drawing.Path();
        let matrix = new drawing.Matrix();
        dstPath.addPath(undefined, matrix);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let dstPath = new drawing.Path();
        let path = new drawing.Path();
        dstPath.addPath(path, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathTransformNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1400
     * @tc.desc   testPathTransformNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathTransformNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathTransformNormal';

      try {
        let path = new drawing.Path();
        let matrix = new drawing.Matrix();
        path.transform(matrix);

        let roundRect = new drawing.RoundRect({
          left: 10, right: 400, top: 100, bottom: 300
        }, 50, 50);
        path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
        path.transform(matrix);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathTransformMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1401
     * @tc.desc   testPathTransformMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathTransformMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathTransformMultipleCalls';

      try {
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let matrix = new drawing.Matrix();

          path.transform(matrix);
          path.close();
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathTransformToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1402
     * @tc.desc   testPathTransformToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathTransformToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathTransformToNull';

      try {
        let path = new drawing.Path();
        path.transform(null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        let path = new drawing.Path();
        path.transform(undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testPathContainsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1500
     * @tc.desc   testPathContainsNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathContainsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testPathContainsNormal';

      try {
        let path = new drawing.Path();
        let rect: common2D.Rect = {
          left: 50, top: 50, right: 250, bottom: 250
        };
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        expect(path.contains(0, 0)).assertEqual(false);
        expect(path.contains(50, 50)).assertEqual(true);
        expect(path.contains(60.1, 60.1)).assertEqual(true);
        expect(path.contains(-10, -10)).assertEqual(false);
        console.info(msg + 'reset successes.');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathContainsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1501
     * @tc.desc   testPathContainsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathContainsMultipleCalls';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let rect: common2D.Rect = {
            left: 50, top: 50, right: 250, bottom: 250
          };
          path.addRect(rect, drawing.PathDirection.CLOCKWISE);
          const val = path.contains(Math.random() * 200 + 50, Math.random() * 200 + 50);
          expect(val).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathContainsToNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1502
     * @tc.desc   testPathContainsToNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsToNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testPathContainsToNull';
      const path = new drawing.Path();

      try {
        path.contains(null, 100);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.contains(100, null);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.contains(undefined, 100);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }

      try {
        path.contains(100, undefined);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })

  })
}