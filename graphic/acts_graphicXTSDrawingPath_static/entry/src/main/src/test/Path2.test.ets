/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function drawingTsPath2Test() {
  describe('DrawingTsPath2Test', () => {
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
     * @tc.name   testPathAddArcNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0800
     * @tc.desc   testPathAddArcNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddArcNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddArcNormalStatic';
      let path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;

      try {
        path.addArc({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 90, 180);
        path.addArc({
          left: 10.1,
          right: 400.1,
          top: 100.1,
          bottom: 300.1
        }, 90.1, 180.1);
        path.addArc({
          left: -10.1,
          right: 400.1,
          top: -100.1,
          bottom: 300.1
        }, -90, -180);
        path.addArc({
          left: 10,
          right: -400,
          top: 100,
          bottom: -300
        }, 450, 361);
        path.addArc({
          left: 100,
          right: 100,
          top: 100,
          bottom: 300
        }, 45, 36);
        path.addArc({
          left: 100,
          right: 100,
          top: 100,
          bottom: 100
        }, 100, -200);
        path.addArc({
          left: maxVal,
          right: maxVal,
          top: maxVal,
          bottom: maxVal
        }, maxVal, maxVal);
        path.close()
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathAddArcMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0801
     * @tc.desc   testPathAddArcMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddArcMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddArcMultipleCallsStatic';
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
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddCircleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0900
     * @tc.desc   testPathAddCircleNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddCircleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddCircleNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddCircleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0901
     * @tc.desc   testPathAddCircleMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddCircleMultipleCallsStatic';
      let path = new drawing.Path();
      let itemList: drawing.PathDirection[] = [
        drawing.PathDirection.CLOCKWISE,
        drawing.PathDirection.COUNTER_CLOCKWISE
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.round(Math.random()).toInt();
          path.addCircle(Math.random(), Math.random(), Math.random(), itemList[randomEnum])
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddCircleToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_0902
     * @tc.desc   testPathAddCircleToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddCircleToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddCircleToNullStatic';
      let path = new drawing.Path();
      try {
        path.addCircle(100, 200, 50, undefined);
        console.info(msg + `addCircle successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `addCircle error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddOvalNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1000
     * @tc.desc   testPathAddOvalNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddOvalNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddOvalNormalStatic';
      let path = new drawing.Path();
      let maxVal = Number.MAX_VALUE;

      try {
        path.addOval({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 4, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: 10.1,
          right: 400.1,
          top: 100.1,
          bottom: 300.1
        }, 4);
        path.addOval({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 5, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addOval({
          left: 10.1,
          right: 400.1,
          top: 100.1,
          bottom: 300.1
        }, 5);
        path.addOval({
          left: -10,
          right: 400,
          top: -10,
          bottom: 300
        }, 1);
        path.addOval({
          left: 10,
          right: -400,
          top: 100,
          bottom: -300
        }, 5, drawing.PathDirection.CLOCKWISE);
        path.addOval({
          left: maxVal,
          right: maxVal,
          top: maxVal,
          bottom: maxVal
        }, 0);
        path.addOval({
          left: 100,
          right: 100,
          top: 100,
          bottom: 200
        }, 1);
        path.addOval({
          left: 100,
          right: 100,
          top: 100,
          bottom: 200
        }, 3);
        path.addOval({
          left: 100,
          right: 100,
          top: 100,
          bottom: 100
        }, 10);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddOvalMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1001
     * @tc.desc   testPathAddOvalMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddOvalMultipleCallsStatic';
      let path = new drawing.Path();
      let itemList: drawing.PathDirection[] = [
        drawing.PathDirection.CLOCKWISE,
        drawing.PathDirection.COUNTER_CLOCKWISE
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.round(Math.random()).toInt();
          path.addOval({
            left: Math.random(),
            right: Math.random(),
            top: Math.random(),
            bottom: Math.random()
          }, Math.random().toInt(), itemList[randomEnum]);
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddOvalToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1002
     * @tc.desc   testPathAddOvalToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddOvalToNullStatic';
      let path = new drawing.Path();
      try {
        path.addOval({
          left: 10, right: 400, top: 100, bottom: 300
        }, 5, undefined);
        console.info(msg + `addOval successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `addOval error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddOvalAbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1004
     * @tc.desc   testPathAddOvalAbNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddOvalAbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddOvalAbNormalStatic';
      const path = new drawing.Path();

      try {
        path.addOval({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, -1, drawing.PathDirection.CLOCKWISE);
        console.info(msg + `reset error`);
        expect().assertFail()
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset successes. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testPathAddRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1100
     * @tc.desc   testPathAddRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddRectNormalStatic';
      let path = new drawing.Path();
      const maxVal = Number.MAX_VALUE;
      try {
        let rect: common2D.Rect = {
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        };
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        rect = {
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        };
        path.addRect(rect, drawing.PathDirection.COUNTER_CLOCKWISE);
        rect= {
          left: 10.1,
          right: 400.1,
          top: 100.1,
          bottom: 300.1
        };
        path.addRect(rect);
        let rect2: common2D.Rect = {
          left: -10,
          right: 400,
          top: -10,
          bottom: 300
        };
        path.addOval(rect2, 300);
        rect = {
          left: 10,
          right: -400,
          top: 100,
          bottom: -300
        }
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        rect = {
          left: maxVal,
          right: maxVal,
          top: maxVal,
          bottom: maxVal
        };
        path.addRect(rect);
        rect = {
          left: 100,
          right: 100,
          top: 100,
          bottom: 200
        };
        path.addRect(rect);
        rect = {
          left: 100,
          right: 100,
          top: 100,
          bottom: 100
        };
        path.addRect(rect);
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1101
     * @tc.desc   testPathAddRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddRectMultipleCallsStatic';
      let path = new drawing.Path();
      let itemList: drawing.PathDirection[] = [
        drawing.PathDirection.CLOCKWISE,
        drawing.PathDirection.COUNTER_CLOCKWISE
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          const randomEnum = Math.round(Math.random()).toInt();
          path.addRect({
            left: Math.random(),
            right: Math.random(),
            top: Math.random(),
            bottom: Math.random()
          }, itemList[randomEnum])
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddRectToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1102
     * @tc.desc   testPathAddRectToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRectToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddRectToNullStatic';
      let path = new drawing.Path();
      try {
        path.addRect({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, undefined);
        console.info(msg + `addRect successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddRoundRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1200
     * @tc.desc   testPathAddRoundRectNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddRoundRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddRoundRectNormalStatic';

      try {
        let path = new drawing.Path();
        let roundRect = new drawing.RoundRect({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 50, 50);
        path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
        path.addRoundRect(roundRect, drawing.PathDirection.COUNTER_CLOCKWISE);
        path.addRoundRect(roundRect);
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddRoundRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1201
     * @tc.desc   testPathAddRoundRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddRoundRectMultipleCallsStatic';
      let path = new drawing.Path();
      let itemList: drawing.PathDirection[] = [
        drawing.PathDirection.CLOCKWISE,
        drawing.PathDirection.COUNTER_CLOCKWISE
      ];
      try {
        for (let i = 0; i < 20; i += 1) {
          let roundRect = new drawing.RoundRect({
            left: 10,
            right: 400,
            top: 100,
            bottom: 300
          }, 50, 50);
          const randomEnum = Math.round(Math.random()).toInt();
          path.addRoundRect(roundRect, itemList[randomEnum]);
        }
        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddRoundRectToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1202
     * @tc.desc   testPathAddRoundRectToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddRoundRectToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddRoundRectToNullStatic';
      let path = new drawing.Path();
      let roundRect = new drawing.RoundRect({
        left: 10,
        right: 400,
        top: 100,
        bottom: 300
      }, 50, 50);
      try {
        path.addRoundRect(roundRect, undefined);
        console.info(msg + `addRoundRect successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `addRoundRect error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testPathAddPathNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1300
     * @tc.desc   testPathAddPathNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathAddPathNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathAddPathNormalStatic';

      try {
        let path = new drawing.Path();
        let matrix = new drawing.Matrix();
        let dstPath = new drawing.Path();
        dstPath.addPath(path, matrix);
        path.addOval({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 5, drawing.PathDirection.CLOCKWISE);
        dstPath.addPath(path);
        matrix.setMatrix([5, 0, 0, 0, 1, 2, 0, 0, 1]);
        path.addCircle(100, 200, 50, drawing.PathDirection.COUNTER_CLOCKWISE);
        dstPath.addPath(path, matrix);

        dstPath.addPath(path, null);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathAddPathMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1301
     * @tc.desc   testPathAddPathMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddPathMultipleCallsStatic';

      try {
        const dstPath = new drawing.Path()
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let matrix = new drawing.Matrix();
          dstPath.addPath(path, matrix);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathAddPathToNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1302
     * @tc.desc   testPathAddPathToNullStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathAddPathToNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathAddPathToNullStatic';
      try {
        let dstPath = new drawing.Path();
        let path = new drawing.Path();
        dstPath.addPath(path, undefined);
        console.info(msg + `addPath successes`);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `addPath error. errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testPathTransformNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1400
     * @tc.desc   testPathTransformNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathTransformNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathTransformNormalStatic';

      try {
        let path = new drawing.Path();
        let matrix = new drawing.Matrix();
        path.transform(matrix);

        let roundRect = new drawing.RoundRect({
          left: 10,
          right: 400,
          top: 100,
          bottom: 300
        }, 50, 50);
        path.addRoundRect(roundRect, drawing.PathDirection.CLOCKWISE);
        path.transform(matrix);

        path.close();
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })


    /**
     * @tc.name   testPathTransformMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1401
     * @tc.desc   testPathTransformMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathTransformMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathTransformMultipleCallsStatic';

      try {
        for (let i = 0; i < 20; i += 1) {
          let path = new drawing.Path();
          let matrix = new drawing.Matrix();

          path.transform(matrix);
          path.close();
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testPathContainsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1500
     * @tc.desc   testPathContainsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPathContainsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPathContainsNormalStatic';

      try {
        let path = new drawing.Path();
        let rect: common2D.Rect = {
          left: 50,
          top: 50,
          right: 250,
          bottom: 250
        };
        path.addRect(rect, drawing.PathDirection.CLOCKWISE);
        expect(path.contains(0, 0)).assertEqual(false);
        expect(path.contains(50, 50)).assertEqual(true);
        expect(path.contains(60.1, 60.1)).assertEqual(true);
        expect(path.contains(-10, -10)).assertEqual(false);
        console.info(msg + 'reset successes.');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })

    /**
     * @tc.name   testPathContainsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATH_STATIC_1501
     * @tc.desc   testPathContainsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPathContainsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPathContainsMultipleCallsStatic';

      try {
        let path = new drawing.Path();
        for (let i = 0; i < 20; i += 1) {
          let rect: common2D.Rect = {
            left: 50,
            top: 50,
            right: 250,
            bottom: 250
          };
          path.addRect(rect, drawing.PathDirection.CLOCKWISE);
          const val = path.contains(Math.random() * 200 + 50, Math.random() * 200 + 50);
          expect(val).assertEqual(true);
        }
        console.info(msg + 'reset successes');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + `reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  })
}