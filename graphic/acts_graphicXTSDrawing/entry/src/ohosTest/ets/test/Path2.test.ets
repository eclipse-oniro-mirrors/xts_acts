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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0800
     * @tc.name      : testPathAddArcNormal
     * @tc.desc      : testPathAddArcNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddArcNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0801
     * @tc.name      : testPathAddArcMultipleCalls
     * @tc.desc      : testPathAddArcMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddArcMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0802
     * @tc.name      : testPathAddArcToNull
     * @tc.desc      : testPathAddArcToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddArcToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0900
     * @tc.name      : testPathAddCircleNormal
     * @tc.desc      : testPathAddCircleNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddCircleNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0901
     * @tc.name      : testPathAddCircleMultipleCalls
     * @tc.desc      : testPathAddCircleMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddCircleMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0902
     * @tc.name      : testPathAddCircleToNull
     * @tc.desc      : testPathAddCircleToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddCircleToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_0904
     * @tc.name      : testPathAddCircleAbnormal
     * @tc.desc      : testPathAddCircleAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddCircleAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1000
     * @tc.name      : testPathAddOvalNormal
     * @tc.desc      : testPathAddOvalNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddOvalNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1001
     * @tc.name      : testPathAddOvalMultipleCalls
     * @tc.desc      : testPathAddOvalMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddOvalMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1002
     * @tc.name      : testPathAddOvalToNull
     * @tc.desc      : testPathAddOvalToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddOvalToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1004
     * @tc.name      : testPathAddOvalAbnormal
     * @tc.desc      : testPathAddOvalAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddOvalAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1100
     * @tc.name      : testPathAddRectNormal
     * @tc.desc      : testPathAddRectNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddRectNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1101
     * @tc.name      : testPathAddRectMultipleCalls
     * @tc.desc      : testPathAddRectMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1102
     * @tc.name      : testPathAddRectToNull
     * @tc.desc      : testPathAddRectToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRectToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1104
     * @tc.name      : testPathAddRectAbnormal
     * @tc.desc      : testPathAddRectAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRectAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1200
     * @tc.name      : testPathAddRoundRectNormal
     * @tc.desc      : testPathAddRoundRectNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddRoundRectNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1201
     * @tc.name      : testPathAddRoundRectMultipleCalls
     * @tc.desc      : testPathAddRoundRectMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRoundRectMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1202
     * @tc.name      : testPathAddRoundRectToNull
     * @tc.desc      : testPathAddRoundRectToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRoundRectToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1204
     * @tc.name      : testPathAddRoundRectAbnormal
     * @tc.desc      : testPathAddRoundRectAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddRoundRectAbnormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1300
     * @tc.name      : testPathAddPathNormal
     * @tc.desc      : testPathAddPathNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathAddPathNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1301
     * @tc.name      : testPathAddPathMultipleCalls
     * @tc.desc      : testPathAddPathMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPathMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1302
     * @tc.name      : testPathAddPathToNull
     * @tc.desc      : testPathAddPathToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathAddPathToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1400
     * @tc.name      : testPathTransformNormal
     * @tc.desc      : testPathTransformNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathTransformNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1401
     * @tc.name      : testPathTransformMultipleCalls
     * @tc.desc      : testPathTransformMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathTransformMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1402
     * @tc.name      : testPathTransformToNull
     * @tc.desc      : testPathTransformToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathTransformToNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1500
     * @tc.name      : testPathContainsNormal
     * @tc.desc      : testPathContainsNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level0
     */
    it('testPathContainsNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1501
     * @tc.name      : testPathContainsMultipleCalls
     * @tc.desc      : testPathContainsMultipleCalls
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathContainsMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_1502
     * @tc.name      : testPathContainsToNull
     * @tc.desc      : testPathContainsToNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testPathContainsToNull', DEFAULT, () => {
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