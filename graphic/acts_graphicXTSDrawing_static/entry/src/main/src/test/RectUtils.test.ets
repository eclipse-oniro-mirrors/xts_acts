/*
 * Copyright (c) 2025-2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function rectUtilsTest() {
  describe('DrawingTsRectUtilsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.name   testRectUtilsGetWidthHeightNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0400
     * @tc.desc   Test for testRectUtilsGetWidthHeightNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsGetWidthHeightNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsGetWidthHeightNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        let width = drawing.RectUtils.getWidth(rect);
        let height = drawing.RectUtils.getHeight(rect);
        console.info(msg + ' RectUtils getWidth successed width: ' + width);
        console.info(msg + ' RectUtils getHeight successed height: ' + height);
        expect(width).assertEqual(0);
        expect(height).assertEqual(0);
      } catch (e) {
        console.info(msg + ` RectUtils getWidth width  height errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsGetWidthHeightMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0401
     * @tc.desc   testRectUtilsGetWidthHeightMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsGetWidthHeightMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsGetWidthHeightMultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          // let rect = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
          let rect: common2D.Rect = { left: 100, right: 100, top: 200, bottom: 200 };
          let width = drawing.RectUtils.getWidth(rect);
          let height = drawing.RectUtils.getHeight(rect);
          console.info(msg + `RectUtils.makeLtrb success step: ` + i);
          console.info(msg + ' RectUtils getWidth successed width: ' + width);
          console.info(msg + ' RectUtils getHeight successed height: ' + height);
          expect(width).assertEqual(0);
          expect(height).assertEqual(0);
        } catch (e) {
          console.info(msg +
            `RectUtils getWidth width  height error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsIntersectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1000
     * @tc.desc   Test for testRectUtilsIntersectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsIntersectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsIntersectNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      // let rect2 = drawing.RectUtils.makeCopy(rect);
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      let rect2: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        let isIntersect = drawing.RectUtils.intersect(rect, rect2);
        // console.info(msg + ' RectUtils intersect 1 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
        expect(isIntersect).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils intersect 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = {
        left: 100,
        right: 100,
        top: 200,
        bottom: 200
      };
      rect = {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      };
    });
    /**
     * @tc.name   testRectUtilsIsEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1300
     * @tc.desc   Test for testRectUtilsIsEmptyNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsIsEmptyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsIsEmptyNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        let isEmpty = drawing.RectUtils.isEmpty(rect);
        console.info(msg + ' RectUtils isEmpty isEmpty successed isEmpty： ' + isEmpty);
        expect(isEmpty).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils isEmpty isEmpty errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect = { left: 10, right: 20, top: 20, bottom: 20 };
      try {
        let isEmpty2 = drawing.RectUtils.isEmpty(rect);
        console.info(msg + ' RectUtils isEmpty isEmpty2 successed isEmpty2： '+ isEmpty2);
        expect(isEmpty2).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils isEmpty isEmpty2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect = { left: 10, right: 10, top: 10, bottom: 20 };
      try {
        let isEmpty3 = drawing.RectUtils.isEmpty(rect);
        console.info(msg + ' RectUtils isEmpty isEmpty3 successed isEmpty3: ' + isEmpty3);
        expect(isEmpty3).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils isEmpty isEmpty3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      rect = { left: 10, right: 10, top: 10, bottom: 10 };
      try {
        let isEmpty4 = drawing.RectUtils.isEmpty(rect);
        console.info(msg + ' RectUtils isEmpty isEmpty4 successed isEmpty4: ' + isEmpty4);
        expect(isEmpty4).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils isEmpty isEmpty4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsOffsetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1400
     * @tc.desc   Test for testRectUtilsOffsetNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsOffsetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsOffsetNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        drawing.RectUtils.offset(rect, 10, 20);
        console.info(msg + ' RectUtils offset 1 successed');
        // console.info(msg + ' RectUtils offset 1 successed rect: ' + JSON.stringify(rect));
        console.info(msg + ' RectUtils offset 1 successed rect.left: ' + rect.left);
        console.info(msg + ' RectUtils offset 1 successed rect.top: ' + rect.top);
        console.info(msg + ' RectUtils offset 1 successed rect.right: ' + rect.right);
        console.info(msg + ' RectUtils offset 1 successed rect.bottom: ' + rect.bottom);
        expect(rect.left == 10 && rect.top == 20 && rect.right == 10 && rect.bottom == 20).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils offset 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect = { left: 10, right: 20, top: 20, bottom: 20 };
      try {
        drawing.RectUtils.offset(rect, 10.1, 20.2);
        console.info(msg + ' RectUtils offset 2 successed');
        // console.info(msg + ' RectUtils offset 2 successed rect: ' + JSON.stringify(rect));
        console.info(msg + ' RectUtils offset 2 successed rect.left: ' + rect.left);
        console.info(msg + ' RectUtils offset 2 successed rect.top: ' + rect.top);
        console.info(msg + ' RectUtils offset 2 successed rect.right: ' + rect.right);
        console.info(msg + ' RectUtils offset 2 successed rect.bottom: ' + rect.bottom);
        expect(rect.left == 20.100000381469727 && rect.top == 40.20000076293945 && rect.right == 30.100000381469727 && rect.bottom == 40.20000076293945).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils offset 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect = { left: 10, right: 10, top: 10, bottom: 20 };
      try {
        drawing.RectUtils.offset(rect, -5, -5.1);
        console.info(msg + ' RectUtils offset 3 successed');
        // console.info(msg + ' RectUtils offset 3 successed rect: ' + JSON.stringify(rect));
        console.info(msg + ' RectUtils offset 3 successed rect.left: ' + rect.left);
        console.info(msg + ' RectUtils offset 3 successed rect.top: ' + rect.top);
        console.info(msg + ' RectUtils offset 3 successed rect.right: ' + rect.right);
        console.info(msg + ' RectUtils offset 3 successed rect.bottom: ' + rect.bottom);
        expect(rect.left == 5 && rect.top == 4.900000095367432 && rect.right == 5 && rect.bottom == 14.899999618530273).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils offset 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      rect = { left: 10, right: 10, top: 10, bottom: 10 };
      try {
        drawing.RectUtils.offset(rect, 0, 5.1);
        console.info(msg + ' RectUtils offset 4 successed');
        // console.info(msg + ' RectUtils offset 4 successed rect: ' + JSON.stringify(rect));
        console.info(msg + ' RectUtils offset 4 successed rect.left: ' + rect.left);
        console.info(msg + ' RectUtils offset 4 successed rect.top: ' + rect.top);
        console.info(msg + ' RectUtils offset 4 successed rect.right: ' + rect.right);
        console.info(msg + ' RectUtils offset 4 successed rect.bottom: ' + rect.bottom);
        expect(rect.left == 10 && rect.top == 15.100000381469727 && rect.right == 10 && rect.bottom == 15.100000381469727).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils offset 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsOffsetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1401
     * @tc.desc   testRectUtilsOffsetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsOffsetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsOffsetMultipleCallsStatic';
      // let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      let rect: common2D.Rect = { left: 0, right: 0, top: 100, bottom: 100 };
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.offset(rect, Math.random() *100, Math.random() *20);
          console.info(msg + `RectUtils.offset success step: ` + i);
        } catch (e) {
          console.info(msg + `RectUtils offset error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsSortNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1900
     * @tc.desc   Test for testRectUtilsSortNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsSortNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsSortNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        drawing.RectUtils.sort(rect);
        console.info(msg + ' RectUtils sort 1 successed');
        // console.info(msg + ' RectUtils sort 1 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils sort 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect = { left: 10, right: 20, top: 20, bottom: 20 };
      try {
        drawing.RectUtils.sort(rect);
        console.info(msg + ' RectUtils sort 2 successed');
        // console.info(msg + ' RectUtils sort 2 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 10 && rect.top == 20 && rect.right == 20 && rect.bottom == 20).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils sort 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect = { left: 10, right: 10, top: 10, bottom: 20 };
      try {
        drawing.RectUtils.sort(rect);
        console.info(msg + ' RectUtils sort 3 successed');
        // console.info(msg + ' RectUtils sort 3 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 10 && rect.top == 10 && rect.right == 10 && rect.bottom == 20).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils sort 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
      rect = { left: Number.MAX_VALUE, right: Number.MAX_VALUE, top: Number.MAX_VALUE+1, bottom: Number.MAX_VALUE+1 };
      try {
        drawing.RectUtils.sort(rect);
        console.info(msg + ' RectUtils sort 9 successed');
        // console.info(msg + ' RectUtils sort 9 successed rect: ' + JSON.stringify(rect));
      } catch (e) {
        console.info(msg + ` RectUtils sort 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsIsEqualNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2000
     * @tc.desc   Test for testRectUtilsIsEqualNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsIsEqualNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsIsEqualNormalStatic';
      // let rect = drawing.RectUtils.makeEmpty();
      let rect: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      let rect2: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      try {
        let isEqual: boolean = drawing.RectUtils.isEqual(rect, rect2);
        console.info(msg + ' RectUtils isEqual 1 successed');
        expect(isEqual).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils isEqual 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      // rect2 = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect2 = { left: 10, right: 20, top: 20, bottom: 20 };
      try {
        let isEqual2: boolean = drawing.RectUtils.isEqual(rect, rect2);
        console.info(msg + ' RectUtils isEqual2  successed');
        expect(isEqual2).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils isEqual2  errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsIsEqualMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2001
     * @tc.desc   testRectUtilsIsEqualMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsIsEqualMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsIsEqualMultipleCallsStatic';
      // let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      let rect: common2D.Rect = { left: 100, right: 100, top: 100, bottom: 100 };
      let rect2: common2D.Rect = { left: 0, right: 0, top: 0, bottom: 0 };
      for (let i = 0; i < 20; i += 1) {
        try {
          let isEqual: boolean = drawing.RectUtils.isEqual(rect, rect2);
          console.info(msg + `RectUtils.isEqual success step: ` + i);
          expect(isEqual).assertEqual(false);
        } catch (e) {
          console.info(msg + `RectUtils isEqual error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });

    /**
     * @tc.name   testRectContainsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2100
     * @tc.desc   testRectContainsNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectContainsNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRectContainsNormalStatic';
      let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
      let other: common2D.Rect = { left: 10, top: 10, right: 20, bottom: 20 };
      try {
        let isContains1 = drawing.RectUtils.contains(rect, other);
        expect(isContains1).assertEqual(true);
        let isContains2 = drawing.RectUtils.contains(other, rect);
        expect(isContains2).assertEqual(false);
      } catch (e) {
        console.info(msg + `RectContains errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testRectContainsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2101
     * @tc.desc   testRectContainsMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectContainsMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectContainsMultipleCallsStatic';
      let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
      let other: common2D.Rect = { left: 10, top: 10, right: 20, bottom: 20 };
      for (let i = 0; i < 20; i ++) {
        try {
          let isContains = drawing.RectUtils.contains(rect, other);
          console.info(msg + `isContains = ` + isContains);
          expect(isContains).assertEqual(true);
        } catch (e) {
          console.info(msg + `RectContains errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail()
        }
      }
    });

    /**
     * @tc.name   testRectInsetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2200
     * @tc.desc   testRectInsetNormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectInsetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRectInsetNormalStatic';
      let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
      let left = 10;
      let top = 20;
      let right = 30;
      let bottom = 40;
      try {
        drawing.RectUtils.inset(rect, left, top, right, bottom);
        expect(rect.left + '').assertEqual('10');
        expect(rect.top + '').assertEqual('20');
        expect(rect.right + '').assertEqual('70');
        expect(rect.bottom + '').assertEqual('60');
      } catch (e) {
        console.info(msg + `RectInset errorCode is: ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });

    /**
     * @tc.name   testRectInsetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_2201
     * @tc.desc   testRectInsetMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectInsetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectInsetMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        let rect: common2D.Rect = { left: 0, top: 0, right: 100, bottom: 100 };
        let left = 10;
        let top = 20;
        let right = 30;
        let bottom = 40;
        try {
          drawing.RectUtils.inset(rect, left, top, right, bottom);
          expect(rect.left + '').assertEqual('10');
          expect(rect.top + '').assertEqual('20');
          expect(rect.right + '').assertEqual('70');
          expect(rect.bottom + '').assertEqual('60');
        } catch (e) {
          console.info(msg + `RectInset errorCode is: ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail()
        }
      }
    });
  })
}