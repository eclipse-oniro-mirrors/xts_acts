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
     * @tc.name   testRectUtilsMakeEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0100
     * @tc.desc   Test for testRectUtilsMakeEmptyNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRectUtilsMakeEmptyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRectUtilsMakeEmptyNormalStatic';
      try {
        let rect = drawing.RectUtils.makeEmpty();
        if(rect == undefined){
          console.info(msg + ' RectUtils rect makeEmpty failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect: ' + JSON.stringify(rect));
          expect(rect.left).assertEqual(0);
          expect(rect.top).assertEqual(0);
          expect(rect.right).assertEqual(0);
          expect(rect.bottom).assertEqual(0);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsMakeEmptyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0101
     * @tc.desc   testRectUtilsMakeEmptyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsMakeEmptyMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsMakeEmptyMultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect = drawing.RectUtils.makeEmpty();
          if(rect == undefined){
            console.info(msg + ' RectUtils rect makeEmpty failed');
            expect().assertFail();
          } else {
            console.info(msg + `RectUtils makeEmpty success step: ` + i);
            console.info(msg + `RectUtils makeEmpty success rect: ` + JSON.stringify(rect));
            expect(rect.left).assertEqual(0);
            expect(rect.top).assertEqual(0);
            expect(rect.right).assertEqual(0);
            expect(rect.bottom).assertEqual(0);
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `RectUtils makeEmpty error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsMakeLtrbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0200
     * @tc.desc   Test for testRectUtilsMakeLtrbNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsMakeLtrbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsMakeLtrbNormalStatic';
      try {
        let rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
        if(rect == undefined){
          console.info(msg + ' RectUtils rect makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect: ' + JSON.stringify(rect));
          expect(rect.left).assertEqual(10);
          expect(rect.top).assertEqual(20);
          expect(rect.right).assertEqual(20);
          expect(rect.bottom).assertEqual(20);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect2 = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
        if(rect2 == undefined){
          console.info(msg + ' RectUtils rect2 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect2: ' + JSON.stringify(rect2));
          expect(rect2.left).assertEqual(10);
          expect(rect2.top).assertEqual(10);
          expect(rect2.right).assertEqual(10);
          expect(rect2.bottom).assertEqual(20);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect3 = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
        if(rect3 == undefined){
          console.info(msg + ' RectUtils rect3 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect3: ' + JSON.stringify(rect3));
          expect(rect3.left).assertEqual(10);
          expect(rect3.top).assertEqual(10);
          expect(rect3.right).assertEqual(10);
          expect(rect3.bottom).assertEqual(10);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect4 = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
        if(rect4 == undefined){
          console.info(msg + ' RectUtils rect4 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect4: ' + JSON.stringify(rect4));
          expect(rect4.left).assertEqual(0);
          expect(rect4.top).assertEqual(10.2632);
          expect(rect4.right).assertEqual(100.25474);
          expect(rect4.bottom).assertEqual(100.2884);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect5 = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
        if(rect5 == undefined){
          console.info(msg + ' RectUtils rect5 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect5: ' + JSON.stringify(rect5));
          expect(rect5.left).assertEqual(-100);
          expect(rect5.top).assertEqual(-100.98788);
          expect(rect5.right).assertEqual(100.20);
          expect(rect5.bottom).assertEqual(100);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect6 = drawing.RectUtils.makeLtrb(80000, 80000.25, 0, -20000);
        if(rect6 == undefined){
          console.info(msg + ' RectUtils rect6 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect6: ' + JSON.stringify(rect6));
          expect(rect6.left).assertEqual(80000);
          expect(rect6.top).assertEqual(80000.25);
          expect(rect6.right).assertEqual(0);
          expect(rect6.bottom).assertEqual(-20000);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let rect7 = drawing.RectUtils.makeLtrb(Number.MIN_VALUE, Number.MIN_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
        if(rect7 == undefined){
          console.info(msg + ' RectUtils rect7 makeLtrb failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeEmpty successed rect7: ' + JSON.stringify(rect7));
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeEmpty rect7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsMakeLtrbMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0201
     * @tc.desc   testRectUtilsMakeLtrbMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsMakeLtrbMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsMakeLtrbMultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect = drawing.RectUtils.makeLtrb(Math.random() * 10, Math.random() * 20, Math.random() * 100,
            Math.random() * 200);
          if(rect == undefined){
            console.info(msg + ' RectUtils rect makeLtrb failed');
            expect().assertFail();
          } else {
            console.info(msg + `RectUtils.makeLtrb success step: ` + i);
            console.info(msg + `RectUtils.makeLtrb success rect: ` + JSON.stringify(rect));
          }
        } catch (e) {
          console.info(msg +`RectUtils.makeLtrb error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsMakeCopyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0300
     * @tc.desc   Test for testRectUtilsMakeCopyNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsMakeCopyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsMakeCopyNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        let rect2 = drawing.RectUtils.makeCopy(rect!);
        if(rect2 == undefined){
          console.info(msg + ' RectUtils makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect2: ' + JSON.stringify(rect2));
          expect(rect2.left).assertEqual(0);
          expect(rect2.top).assertEqual(0);
          expect(rect2.right).assertEqual(0);
          expect(rect2.bottom).assertEqual(0);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      };
      try {
        let rect3 = drawing.RectUtils.makeCopy(rect);
        if(rect3 == undefined){
          console.info(msg + ' RectUtils rect3 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect3: ' + JSON.stringify(rect3));
          expect(rect3.left).assertEqual(0);
          expect(rect3.top).assertEqual(0);
          expect(rect3.right).assertEqual(0);
          expect(rect3.bottom).assertEqual(0);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        let rect4 = drawing.RectUtils.makeCopy(rect!);
        if(rect4 == undefined){
          console.info(msg + ' RectUtils rect4 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect4: ' + JSON.stringify(rect4));
          expect(rect4.left).assertEqual(10);
          expect(rect4.top).assertEqual(20);
          expect(rect4.right).assertEqual(20);
          expect(rect4.bottom).assertEqual(20);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        let rect5 = drawing.RectUtils.makeCopy(rect!);
        if(rect5 == undefined){
          console.info(msg + ' RectUtils rect5 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect5: ' + JSON.stringify(rect5));
          expect(rect5.left).assertEqual(10);
          expect(rect5.top).assertEqual(10);
          expect(rect5.right).assertEqual(10);
          expect(rect5.bottom).assertEqual(20);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        let rect6 = drawing.RectUtils.makeCopy(rect!);
        if(rect6 == undefined){
          console.info(msg + ' RectUtils rect6 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect6: ' + JSON.stringify(rect6));
          expect(rect6.left).assertEqual(10);
          expect(rect6.top).assertEqual(10);
          expect(rect6.right).assertEqual(10);
          expect(rect6.bottom).assertEqual(10);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      try {
        let rect7 = drawing.RectUtils.makeCopy(rect!);
        if(rect7 == undefined){
          console.info(msg + ' RectUtils rect7 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect7: ' + JSON.stringify(rect7));
          expect(rect7.left).assertEqual(0);
          expect(rect7.top).assertEqual(10.2632);
          expect(rect7.right).assertEqual(100.25474);
          expect(rect7.bottom).assertEqual(100.2884);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      try {
        let rect8 = drawing.RectUtils.makeCopy(rect!);
        if(rect8 == undefined){
          console.info(msg + ' RectUtils rect8 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect8: ' + JSON.stringify(rect8));
          expect(rect8.left).assertEqual(-100);
          expect(rect8.top).assertEqual(-100.98788);
          expect(rect8.right).assertEqual(100.20);
          expect(rect8.bottom).assertEqual(100);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(80000, 80000.25, 0, -20000);
      try {
        let rect9 = drawing.RectUtils.makeCopy(rect!);
        if(rect9 == undefined){
          console.info(msg + ' RectUtils rect9 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect9: ' + JSON.stringify(rect9));
          expect(rect9.left).assertEqual(80000);
          expect(rect9.top).assertEqual(80000.25);
          expect(rect9.right).assertEqual(0);
          expect(rect9.bottom).assertEqual(-20000);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = {
        left: 0,
        right: 100,
        top: 125,
        bottom: 225
      };
      try {
        let rect10 = drawing.RectUtils.makeCopy(rect);
        if(rect10 == undefined){
          console.info(msg + ' RectUtils rect10 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect10: ' + JSON.stringify(rect10));
          expect(rect10.left).assertEqual(0);
          expect(rect10.top).assertEqual(125);
          expect(rect10.right).assertEqual(100);
          expect(rect10.bottom).assertEqual(225);
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MIN_VALUE, Number.MIN_VALUE, Number.MAX_VALUE, Number.MAX_VALUE);
      try {
        let rect11 = drawing.RectUtils.makeCopy(rect!);
        if(rect11 == undefined){
          console.info(msg + ' RectUtils rect11 makeCopy failed');
          expect().assertFail();
        } else {
          console.info(msg + ' RectUtils makeCopy successed rect11: ' + JSON.stringify(rect11));
          expect(rect11 != null || rect11 != undefined).assertTrue();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils makeCopy rect11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsMakeCopyMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0301
     * @tc.desc   testRectUtilsMakeCopyMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsMakeCopyMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsMakeCopyMultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect2: common2D.Rect | undefined = {
            left: 0,
            right: 100,
            top: 0,
            bottom: 100
          };
          let rect: common2D.Rect = {
            left: 0,
            right: 0,
            top: 0,
            bottom: 0
          };
          rect2 = drawing.RectUtils.makeCopy(rect);
          if(rect2 == undefined){
            console.info(msg + ' RectUtils rect2 makeCopy failed');
            expect().assertFail();
          } else {
            console.info(msg + `RectUtils.makeCopy success step: ` + i);
            console.info(msg + `RectUtils.makeCopy success rect2: ` + JSON.stringify(rect2));
            expect(rect2.left).assertEqual(0);
            expect(rect2.top).assertEqual(0);
            expect(rect2.right).assertEqual(0);
            expect(rect2.bottom).assertEqual(0);
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `RectUtils.makeCopy error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
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
          let rect = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
          let width = drawing.RectUtils.getWidth(rect!);
          let height = drawing.RectUtils.getHeight(rect!);
          console.info(msg + `RectUtils.makeLtrb success step: ` + i);
          console.info(msg + ' RectUtils getWidth successed width: ' + width);
          console.info(msg + ' RectUtils getHeight successed height: ' + height);
          expect(width).assertEqual(100);
          expect(height).assertEqual(100);
        } catch (e) {
          console.info(msg +
            `RectUtils getWidth width  height error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsCenterXYNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0500
     * @tc.desc   Test for testRectUtilsCenterXYNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsCenterXYNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsCenterXYNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        let x = drawing.RectUtils.centerX(rect!);
        let y = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x: ' + x);
        console.info(msg + ' RectUtils centerY successed y: ' + y);
        expect(x).assertEqual(0);
        expect(y).assertEqual(0);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100, 200, 200, 200);
      try {
        let x2 = drawing.RectUtils.centerX(rect!);
        let y2 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x2: ' + x2);
        console.info(msg + ' RectUtils centerY successed y2: ' + y2);
        expect(x2).assertEqual(150);
        expect(y2).assertEqual(200);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100, 100, 100, 200);
      try {
        let x3 = drawing.RectUtils.centerX(rect!);
        let y3 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x3: ' + x3);
        console.info(msg + ' RectUtils centerY successed y3: ' + y3);
        expect(x3).assertEqual(100);
        expect(y3).assertEqual(150);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        let x4 = drawing.RectUtils.centerX(rect!);
        let y4 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x4: ' + x4);
        console.info(msg + ' RectUtils centerY successed y4: ' + y4);
        expect(x4).assertEqual(10);
        expect(y4).assertEqual(10);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      try {
        let x5 = drawing.RectUtils.centerX(rect!);
        let y5 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x5: ' + x5);
        console.info(msg + ' RectUtils centerY successed y5: ' + y5);
        expect(x5).assertEqual(50.12737);
        expect(y5).assertEqual(55.2758);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      try {
        let x6 = drawing.RectUtils.centerX(rect!);
        let y6 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x6: ' + x6);
        console.info(msg + ' RectUtils centerY successed y6: ' + y6);
        expect(x6).assertEqual(0.10000000000000142);
        expect(y6).assertEqual(-0.49394000000000204);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(80000, 80000.25, 0, -20000);
      try {
        let x7 = drawing.RectUtils.centerX(rect!);
        let y7 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x7: ' + x7);
        console.info(msg + ' RectUtils centerY successed y7: ' + y7);
        expect(x7).assertEqual(40000);
        expect(y7).assertEqual(30000.125);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = {
        left: 0,
        right: 100,
        top: 125,
        bottom: 225
      };
      try {
        let x8 = drawing.RectUtils.centerX(rect);
        let y8 = drawing.RectUtils.centerY(rect);
        console.info(msg + ' RectUtils centerX successed x8: ' + x8);
        console.info(msg + ' RectUtils centerY successed y8: ' + y8);
        expect(x8).assertEqual(50);
        expect(y8).assertEqual(175);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      try {
        let x9 = drawing.RectUtils.centerX(rect!);
        let y9 = drawing.RectUtils.centerY(rect!);
        console.info(msg + ' RectUtils centerX successed x9: ' + x9);
        console.info(msg + ' RectUtils centerY successed y9: ' + y9);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils centerY centerY y9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsCenterXYMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0501
     * @tc.desc   testRectUtilsCenterXYMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsCenterXYMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsCenterXYMultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
          let x = drawing.RectUtils.centerX(rect!);
          let y = drawing.RectUtils.centerY(rect!);
          console.info(msg + `RectUtils.makeLtrb success step: ` + i);
          console.info(msg + ' RectUtils getWidth successed x: ' + x);
          console.info(msg + ' RectUtils getHeight successed y: ' + y);
          expect(x).assertEqual(150);
          expect(y).assertEqual(150);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `RectUtils center x  y error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsContains2NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0700
     * @tc.desc   Test for testRectUtilsContains2NormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsContains2NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsContains2NormalStatic';
      let rect: common2D.Rect | undefined = {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      };
      try {
        let isContains = drawing.RectUtils.contains(rect, 0, 0, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains: ' + isContains);
        expect(isContains).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        let isContains2 = drawing.RectUtils.contains(rect!, 10, 20, 20, 20);
        console.info(msg + ' RectUtils contains successed isContains2: ' + isContains2);
        expect(isContains2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        let isContains3 = drawing.RectUtils.contains(rect!, 10, 10, 10, 20);
        console.info(msg + ' RectUtils contains successed isContains3: ' + isContains3);
        expect(isContains3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        let isContains4 = drawing.RectUtils.contains(rect!, 10, 10, 10, 10);
        console.info(msg + ' RectUtils contains successed isContains4: ' + isContains4);
        expect(isContains4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let isContains5 = drawing.RectUtils.contains(rect!, 10, 10, 10, 10);
        console.info(msg + ' RectUtils contains successed isContains5: ' + isContains5);
        expect(isContains5).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains6 = drawing.RectUtils.contains(rect!, 0, 0, 100, 100);
        console.info(msg + ' RectUtils contains successed isContains6: ' + isContains6);
        expect(isContains6).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains7 = drawing.RectUtils.contains(rect!, 0, 0, 20, 20);
        console.info(msg + ' RectUtils contains successed isContains7: ' + isContains7);
        expect(isContains7).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains8 = drawing.RectUtils.contains(rect!, 20, 20, 80, 80);
        console.info(msg + ' RectUtils contains successed isContains8: ' + isContains8);
        expect(isContains8).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains9 = drawing.RectUtils.contains(rect!, -1, -1, 101, 101);
        console.info(msg + ' RectUtils contains successed isContains9: ' + isContains9);
        expect(isContains9).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      try {
        let isContains10 = drawing.RectUtils.contains(rect!, 0, 10.2632, 100.25474, 100.2884);
        console.info(msg + ' RectUtils contains successed isContains10: ' + isContains10);
        expect(isContains10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains11 = drawing.RectUtils.contains(rect!, 0, 10, 100, 100.6884);
        console.info(msg + ' RectUtils contains successed isContains11: ' + isContains11);
        expect(isContains11).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains12 = drawing.RectUtils.contains(rect!, 0.9512, 10.4632, 100.1, 100.1);
        console.info(msg + ' RectUtils contains successed isContains12: ' + isContains12);
        expect(isContains12).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      try {
        let isContains13 = drawing.RectUtils.contains(rect!, -100, -100.98788, 100.20, 100);
        console.info(msg + ' RectUtils contains successed isContains13: ' + isContains13);
        expect(isContains13).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains14 = drawing.RectUtils.contains(rect!, -100.36, -101, 100.3, 100.1);
        console.info(msg + ' RectUtils contains successed isContains14: ' + isContains14);
        expect(isContains14).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains15 = drawing.RectUtils.contains(rect!, -100, -99, 100, 100);
        console.info(msg + ' RectUtils contains successed isContains15: ' + isContains15);
        expect(isContains15).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100, 100.25, -100, -100);
      try {
        let isContains16 = drawing.RectUtils.contains(rect!, 100, 100.25, -100, -100);
        console.info(msg + ' RectUtils contains successed isContains16: ' + isContains16);
        expect(isContains16).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains17 = drawing.RectUtils.contains(rect!, -100.5, -100.5, 100.3, 100.3);
        console.info(msg + ' RectUtils contains successed isContains17: ' + isContains17);
        expect(isContains17).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains18 = drawing.RectUtils.contains(rect!, 10, 10, 100, 100);
        console.info(msg + ' RectUtils contains successed isContains18: ' + isContains18);
        expect(isContains18).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains18 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains19 = drawing.RectUtils.contains(rect!, 90, 90, -50, -50);
        console.info(msg + ' RectUtils contains successed isContains19: ' + isContains19);
        expect(isContains19).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains19 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = {
        left: Number.MAX_VALUE,
        right: Number.MAX_VALUE + 1,
        top: Number.MAX_VALUE,
        bottom: Number.MAX_VALUE + 1
      };
      try {
        let isContains20 =
          drawing.RectUtils.contains(rect, Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE);
        console.info(msg + ' RectUtils contains successed isContains20: ' + isContains20);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils contains isContains20 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsContains2MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0701
     * @tc.desc   testRectUtilsContains2MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsContains2MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsContains2MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect2 = drawing.RectUtils.makeLtrb(0, 0, 40, 40);
          let isContains = drawing.RectUtils.contains(rect2!, 10, 10, 20, 20);
          console.info(msg + `RectUtils.makeLtrb success step: ` + i);
          console.info(msg + ' RectUtils contains successed isContains: ' + isContains);
          expect(isContains).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `RectUtils contains isContains error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsContains3NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0800
     * @tc.desc   Test for testRectUtilsContains3NormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsContains3NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsContains3NormalStatic';
      let rect: common2D.Rect | undefined = {
        left: 0,
        right: 0,
        top: 0,
        bottom: 0
      };
      try {
        let isContains = drawing.RectUtils.contains(rect!, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains: ' + isContains);
        expect(isContains).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        let isContains2 = drawing.RectUtils.contains(rect!, 10, 20);
        console.info(msg + ' RectUtils contains successed isContains2: ' + isContains2);
        expect(isContains2).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        let isContains3 = drawing.RectUtils.contains(rect!, 10, 15);
        console.info(msg + ' RectUtils contains successed isContains3: ' + isContains3);
        expect(isContains3).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        let isContains4 = drawing.RectUtils.contains(rect!, 10, 10);
        console.info(msg + ' RectUtils contains successed isContains4: ' + isContains4);
        expect(isContains4).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let isContains5 = drawing.RectUtils.contains(rect!, 10, 10);
        console.info(msg + ' RectUtils contains successed isContains5: ' + isContains5);
        expect(isContains5).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains6 = drawing.RectUtils.contains(rect!, 0, 50);
        console.info(msg + ' RectUtils contains successed isContains6: ' + isContains6);
        expect(isContains6).assertEqual(true);
        let isContains01 = drawing.RectUtils.contains(rect!, 50, 0);
        console.info(msg + ' RectUtils contains successed isContains01: ' + isContains01);
        expect(isContains01).assertEqual(true);
        let isContains02 = drawing.RectUtils.contains(rect!, 50, 100);
        console.info(msg + ' RectUtils contains successed isContains02: ' + isContains02);
        expect(isContains02).assertEqual(false);
        let isContains03 = drawing.RectUtils.contains(rect!, 100, 50);
        console.info(msg + ' RectUtils contains successed isContains03: ' + isContains03);
        expect(isContains03).assertEqual(false);
        let isContains04 = drawing.RectUtils.contains(rect!, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains04: ' + isContains04);
        expect(isContains04).assertEqual(true);
        let isContains05 = drawing.RectUtils.contains(rect!, 100, 0);
        console.info(msg + ' RectUtils contains successed isContains05: ' + isContains05);
        expect(isContains05).assertEqual(false);
        let isContains06 = drawing.RectUtils.contains(rect!, 0, 100);
        console.info(msg + ' RectUtils contains successed isContains06: ' + isContains06);
        expect(isContains06).assertEqual(false);
        let isContains07 = drawing.RectUtils.contains(rect!, 100, 100);
        console.info(msg + ' RectUtils contains successed isContains07: ' + isContains07);
        expect(isContains07).assertEqual(false);
      } catch (e) {
        console.info(msg +
          ` RectUtils contains isContains6 together errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains7 = drawing.RectUtils.contains(rect!, -1, 0);
        console.info(msg + ' RectUtils contains successed isContains7: ' + isContains7);
        expect(isContains7).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains8 = drawing.RectUtils.contains(rect!, 100, 101);
        console.info(msg + ' RectUtils contains successed isContains8: ' + isContains8);
        expect(isContains8).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      try {
        let isContains9 = drawing.RectUtils.contains(rect!, 100.25474, 100.2884);
        console.info(msg + ' RectUtils contains successed isContains9: ' + isContains9);
        expect(isContains9).assertEqual(false);
        let isContains001 = drawing.RectUtils.contains(rect!, 50, 10.2632);
        console.info(msg + ' RectUtils contains successed isContains001: ' + isContains001);
        expect(isContains001).assertEqual(true);
        let isContains002 = drawing.RectUtils.contains(rect!, 50.2632, 50.2632);
        console.info(msg + ' RectUtils contains successed isContains002: ' + isContains002);
        expect(isContains002).assertEqual(true);
        let isContains003 = drawing.RectUtils.contains(rect!, 100, 50);
        console.info(msg + ' RectUtils contains successed isContains003: ' + isContains003);
        expect(isContains003).assertEqual(true);
      } catch (e) {
        console.info(msg +
          ` RectUtils contains isContains9 together errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      try {
        let isContains10 = drawing.RectUtils.contains(rect!, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains10: ' + isContains10);
        expect(isContains10).assertEqual(false);
        let isContains0001 = drawing.RectUtils.contains(rect!, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains0001: ' + isContains0001);
        expect(isContains0001).assertEqual(false);
      } catch (e) {
        console.info(msg +
          ` RectUtils contains isContains10 together errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      try {
        let isContains11 = drawing.RectUtils.contains(rect!, -100, -100.98788);
        console.info(msg + ' RectUtils contains successed isContains11: ' + isContains11);
        expect(isContains11).assertEqual(true);
        let isContains11_1 = drawing.RectUtils.contains(rect!, 100.20, 100);
        console.info(msg + ' RectUtils contains successed isContains11_1: ' + isContains11_1);
        expect(isContains11_1).assertEqual(false);
        let isContains11_2 = drawing.RectUtils.contains(rect!, 50, 50.55);
        console.info(msg + ' RectUtils contains successed isContains11_2: ' + isContains11_2);
        expect(isContains11_2).assertEqual(true);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains12 = drawing.RectUtils.contains(rect!, -100.33, -100.999999);
        console.info(msg + ' RectUtils contains successed isContains12: ' + isContains12);
        expect(isContains12).assertEqual(false);
        let isContains12_1 = drawing.RectUtils.contains(rect!, 100.3, 100.1111);
        console.info(msg + ' RectUtils contains successed isContains12_1: ' + isContains12_1);
        expect(isContains12_1).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100, 100.25, -100, -100);
      try {
        let isContains13 = drawing.RectUtils.contains(rect!, 100, 100.25);
        console.info(msg + ' RectUtils contains successed isContains13: ' + isContains13);
        expect(isContains13).assertEqual(false);
        let isContains13_1 = drawing.RectUtils.contains(rect!, -100, -100);
        console.info(msg + ' RectUtils contains successed isContains13_1: ' + isContains13_1);
        expect(isContains13_1).assertEqual(false);
        let isContains13_2 = drawing.RectUtils.contains(rect!, -100, 50);
        console.info(msg + ' RectUtils contains successed isContains13_2: ' + isContains13_2);
        expect(isContains13_2).assertEqual(false);
        let isContains13_3 = drawing.RectUtils.contains(rect!, 0, 0);
        console.info(msg + ' RectUtils contains successed isContains13_3: ' + isContains13_3);
        expect(isContains13_3).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        let isContains14 = drawing.RectUtils.contains(rect!, 100.1, 100.1);
        console.info(msg + ' RectUtils contains successed isContains14: ' + isContains14);
        expect(isContains14).assertEqual(false);
        let isContains14_1 = drawing.RectUtils.contains(rect!, 100.1, 100.1);
        console.info(msg + ' RectUtils contains successed isContains14_1: ' + isContains14_1);
        expect(isContains14_1).assertEqual(false);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = {
        left: Number.MAX_VALUE,
        right: Number.MAX_VALUE + 1,
        top: Number.MAX_VALUE,
        bottom: Number.MAX_VALUE + 1
      };
      try {
        let isContains15 = drawing.RectUtils.contains(rect, Number.MAX_VALUE, Number.MAX_VALUE);
        console.info(msg + ' RectUtils contains successed isContains15: ' + isContains15);
      } catch (e) {
        console.info(msg + ` RectUtils contains isContains15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsContains3MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_0801
     * @tc.desc   testRectUtilsContains3MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsContains3MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsContains3MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect2 = drawing.RectUtils.makeLtrb(0, 0, 40, 40);
          let isContains = drawing.RectUtils.contains(rect2!, 10, 10);
          console.info(msg + `RectUtils.makeLtrb success step: ` + i);
          console.info(msg + ' RectUtils contains successed isContains: ' + isContains);
          expect(isContains).assertEqual(true);
        } catch (e) {
          console.info(msg +
            `RectUtils contains isContains error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
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
      let rect: common2D.Rect | undefined = drawing.RectUtils.makeEmpty();
      let rect2: common2D.Rect | undefined = drawing.RectUtils.makeCopy(rect!);
      try {
        let isIntersect = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect 1 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
        expect(isIntersect).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
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
      try {
        let isIntersect2 = drawing.RectUtils.intersect(rect, rect2);
        console.info(msg + ' RectUtils intersect isIntersect2 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
        expect(isIntersect2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
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
      try {
        let isIntersect3 = drawing.RectUtils.intersect(rect, rect2);
        console.info(msg + ' RectUtils intersect isIntersect3 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
        expect(isIntersect3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect2 = {
        left: 15,
        right: 18,
        top: 20,
        bottom: 20
      };
      try {
        let isIntersect4 = drawing.RectUtils.intersect(rect!, rect2);
        console.info(msg + ' RectUtils intersect isIntersect4 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 20 && rect!.right == 20 && rect!.bottom == 20).assertEqual(true);
        expect(isIntersect4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect2 = drawing.RectUtils.makeLtrb(10, 0, 10, 15);
      try {
        let isIntersect5 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect5 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 10 && rect!.bottom == 20).assertEqual(true);
        expect(isIntersect5).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      rect2 = drawing.RectUtils.makeCopy(rect!);
      try {
        let isIntersect6 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect6 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 10 && rect!.bottom == 10).assertEqual(true);
        expect(isIntersect6).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let isIntersect7 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect7 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect7).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = {
        left: 0,
        right: 100,
        top: 0,
        bottom: 100
      };
      try {
        let isIntersect8 = drawing.RectUtils.intersect(rect!, rect2);
        console.info(msg + ' RectUtils intersect isIntersect8 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect8).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
      try {
        let isIntersect9 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect9 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 20 && rect!.bottom == 20).assertEqual(true);
        expect(isIntersect9).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(0, 0, 90, 90);
      try {
        let isIntersect10 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect10 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 90 && rect!.bottom == 90).assertEqual(true);
        expect(isIntersect10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 60.365, 60.28);
      rect2 = drawing.RectUtils.makeLtrb(-1, -1, 101.36, 101.36);
      try {
        let isIntersect11 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect11 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 60.3650016784668 && rect!.bottom == 60.279998779296875)
          .assertEqual(true);
        expect(isIntersect11).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 101.36, 101.36);
      try {
        let isIntersect12 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect12 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 101.36000061035156 && rect!.bottom == 101.36000061035156)
          .assertEqual(true);
        expect(isIntersect12).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      try {
        let isIntersect13 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect13 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 50 && rect!.top == 50 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect13).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      rect2 = drawing.RectUtils.makeLtrb(0, 75, 200, 125);
      try {
        let isIntersect14 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect14 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 50 && rect!.top == 75 && rect!.right == 150 && rect!.bottom == 125).assertEqual(true);
        expect(isIntersect14).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(100, 50, 200, 150);
      try {
        let isIntersect15 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect15 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect15).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
      try {
        let isIntersect16 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect16 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect16).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(200, 200, 300, 300);
      try {
        let isIntersect17 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect17 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
        expect(isIntersect17).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      rect2 = drawing.RectUtils.makeLtrb(0, 10, 100, 100.6884);
      try {
        let isIntersect18 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect18 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 10.263199806213379 && rect!.right == 100 &&
          rect!.bottom == 100.28839874267578).assertEqual(true);
        expect(isIntersect18).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect18 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      rect2 =
        drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      try {
        let isIntersect19 = drawing.RectUtils.intersect(rect!, rect2!);
        console.info(msg + ' RectUtils intersect isIntersect19 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils intersect isIntersect19 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsIsIntersectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1100
     * @tc.desc   Test for testRectUtilsIsIntersectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsIsIntersectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsIsIntersectNormalStatic';
      let rect: common2D.Rect | undefined = drawing.RectUtils.makeEmpty();
      let rect2: common2D.Rect | undefined = drawing.RectUtils.makeCopy(rect!);
      try {
        let isIntersect = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect 1 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
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
      try {
        let isIntersect2 = drawing.RectUtils.isIntersect(rect, rect2);
        console.info(msg + ' RectUtils isIntersect isIntersect2 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect2).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
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
      try {
        let isIntersect3 = drawing.RectUtils.isIntersect(rect, rect2);
        console.info(msg + ' RectUtils isIntersect isIntersect3 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect3).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect2 = {
        left: 15,
        right: 18,
        top: 20,
        bottom: 20
      };
      try {
        let isIntersect4 = drawing.RectUtils.isIntersect(rect!, rect2);
        console.info(msg + ' RectUtils isIntersect isIntersect4 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect4).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect2 = drawing.RectUtils.makeLtrb(10, 0, 10, 15);
      try {
        let isIntersect5 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect5 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect5).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      rect2 = drawing.RectUtils.makeCopy(rect!);
      try {
        let isIntersect6 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect6 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect6).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let isIntersect7 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect7 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect7).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = {
        left: 0,
        right: 100,
        top: 0,
        bottom: 100
      };
      try {
        let isIntersect8 = drawing.RectUtils.isIntersect(rect!, rect2);
        console.info(msg + ' RectUtils isIntersect isIntersect8 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect8).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
      try {
        let isIntersect9 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect9 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect9).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(0, 0, 90, 90);
      try {
        let isIntersect10 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect10 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 60.365, 60.28);
      rect2 = drawing.RectUtils.makeLtrb(-1, -1, 101.36, 101.36);
      try {
        let isIntersect11 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect11 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect11).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 101.36, 101.36);
      try {
        let isIntersect12 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect12 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect12).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      try {
        let isIntersect13 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect13 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect13).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      rect2 = drawing.RectUtils.makeLtrb(0, 75, 200, 125);
      try {
        let isIntersect14 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect14 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect14).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(100, 50, 200, 150);
      try {
        let isIntersect15 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect15 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect15).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
      try {
        let isIntersect16 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect16 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect16).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(200, 200, 300, 300);
      try {
        let isIntersect17 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect17 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect17).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      rect2 = drawing.RectUtils.makeLtrb(0, 10, 100, 100.6884);
      try {
        let isIntersect18 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect18 successed rect: ' + JSON.stringify(rect));
        expect(isIntersect18).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect18 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      rect2 =
        drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      try {
        let isIntersect19 = drawing.RectUtils.isIntersect(rect!, rect2!);
        console.info(msg + ' RectUtils isIntersect isIntersect19 successed rect: ' + JSON.stringify(rect));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isIntersect isIntersect19 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsIsIntersectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1101
     * @tc.desc   testRectUtilsIsIntersectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsIsIntersectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsIsIntersectMultipleCallsStatic';
      let rect = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
      let rect2 = drawing.RectUtils.makeLtrb(0, 0, 40, 40);
      for (let i = 0; i < 20; i += 1) {
        try {
          let isIntersect = drawing.RectUtils.isIntersect(rect!, rect2!);
          console.info(msg + `RectUtils.isIntersect success step: ` + i);
          expect(isIntersect).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `RectUtils isIntersect error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsUnionNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1200
     * @tc.desc   Test for testRectUtilsUnionNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsUnionNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsUnionNormalStatic';
      let rect: common2D.Rect | undefined = drawing.RectUtils.makeEmpty();
      let rect2: common2D.Rect | undefined = {
        left: 100,
        right: 200,
        top: 100,
        bottom: 200
      };
      try {
        drawing.RectUtils.union(rect!, rect2);
        console.info(msg + ' RectUtils union 1 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 100 && rect!.top == 100 && rect!.right == 200 && rect!.bottom == 200).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
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
      try {
        drawing.RectUtils.union(rect, rect2);
        console.info(msg + ' RectUtils union 2 successed rect: ' + JSON.stringify(rect));
        expect(rect.left == 0 && rect.top == 0 && rect.right == 0 && rect.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      rect2 = {
        left: 15,
        right: 18,
        top: 20,
        bottom: 20
      };
      try {
        drawing.RectUtils.union(rect!, rect2);
        console.info(msg + ' RectUtils union 3 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 20 && rect!.right == 20 && rect!.bottom == 20).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      rect2 = drawing.RectUtils.makeLtrb(10, 0, 10, 15);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 4 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 10 && rect!.bottom == 20).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      rect2 = drawing.RectUtils.makeCopy(rect!);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 5 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 10 && rect!.right == 10 && rect!.bottom == 10).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 6 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = {
        left: 0,
        right: 100,
        top: 0,
        bottom: 100
      };
      try {
        drawing.RectUtils.union(rect!, rect2);
        console.info(msg + ' RectUtils union 7 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 8 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(0, 0, 90, 90);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 9 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 100 && rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 60.365, 60.28);
      rect2 = drawing.RectUtils.makeLtrb(-1, -1, 101.36, 101.36);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 10 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -1 && rect!.top == -1 && rect!.right == 101.36000061035156 &&
          rect!.bottom == 101.36000061035156).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 101.36, 101.36);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 11 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -1 && rect!.top == -1 && rect!.right == 101.36000061035156 &&
          rect!.bottom == 101.36000061035156).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 12 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 150 && rect!.bottom == 150).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(50, 50, 150, 150);
      rect2 = drawing.RectUtils.makeLtrb(0, 75, 200, 125);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 13 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 50 && rect!.right == 200 && rect!.bottom == 150).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 13 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(100, 50, 200, 150);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 14 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 200 && rect!.bottom == 150).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 14 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(100, 50, 200, 75);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 15 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 200 && rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 15 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(100, 100, 200, 200);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 16 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 200 && rect!.bottom == 200).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 16 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      rect2 = drawing.RectUtils.makeLtrb(200, 200, 300, 300);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 17 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 300 && rect!.bottom == 300).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 17 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      rect2 = drawing.RectUtils.makeLtrb(0, 10, 100, 100.6884);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 18 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 10 && rect!.right == 100.2547378540039 && rect!.bottom == 100.68840026855469)
          .assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 18 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 10.2632, 100.25474, 100.2884);
      rect2 = {
        left: 0.9512,
        right: 100.1,
        top: 10.4632,
        bottom: 100.1
      };
      try {
        drawing.RectUtils.union(rect!, rect2);
        console.info(msg + ' RectUtils union 19 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 10.263199806213379 && rect!.right == 100.2547378540039 &&
          rect!.bottom == 100.28839874267578).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 19 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      rect2 = drawing.RectUtils.makeLtrb(-100, -100.98788, 100.20, 100);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 20 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -100 && rect!.top == -100.98787689208984 && rect!.right == 100.19999694824219 &&
          rect!.bottom == 100).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 20 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      rect2 =
        drawing.RectUtils.makeLtrb(Number.MAX_VALUE, Number.MAX_VALUE, Number.MAX_VALUE + 1, Number.MAX_VALUE + 1);
      try {
        drawing.RectUtils.union(rect!, rect2!);
        console.info(msg + ' RectUtils union 21 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils union 21 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsUnionMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1201
     * @tc.desc   testRectUtilsUnionMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsUnionMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsUnionMultipleCallsStatic';
      let rect: common2D.Rect | undefined = drawing.RectUtils.makeLtrb(10, 10, 20, 20);
      let rect2: common2D.Rect | undefined= drawing.RectUtils.makeLtrb(0, 0, 40, 40);
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.union(rect!, rect2!);
          console.info(msg + `RectUtils.union success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `RectUtils union error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
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
      const msg = 'testRectUtilsIsEmptyNormal';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        let isEmpty = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty successed');
        expect(isEmpty).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        let isEmpty2 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty2 successed');
        expect(isEmpty2).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        let isEmpty3 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty3 successed');
        expect(isEmpty3).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        let isEmpty4 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty4 successed');
        expect(isEmpty4).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        let isEmpty5 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty5 successed');
        expect(isEmpty5).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0,10.2632,100.25474,100.2884);
      try {
        let isEmpty6 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty6 successed');
        expect(isEmpty6).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100,-100.98788,-50,-50);
      try {
        let isEmpty7 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty7 successed');
        expect(isEmpty7).assertEqual(false);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100,100.25,-100,-100.255);
      try {
        let isEmpty8 = drawing.RectUtils.isEmpty(rect!);
        console.info(msg + ' RectUtils isEmpty isEmpty8 successed');
        expect(isEmpty8).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils isEmpty isEmpty8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
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
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.offset(rect!, Math.random() *100, Math.random() *20);
          console.info(msg + `RectUtils.offset success step: ` + i);
        } catch (e) {
          console.info(msg + `RectUtils offset error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsOffsetToNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1500
     * @tc.desc   Test for testRectUtilsOffsetToNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsOffsetToNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsOffsetToNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        drawing.RectUtils.offsetTo(rect!, 10, 20);
        console.info(msg + ' RectUtils offsetTo 1 successed');
        console.info(msg + ' RectUtils offsetTo 1 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 10 && rect!.top == 20 && rect!.right == 10 && rect!.bottom == 20).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        drawing.RectUtils.offsetTo(rect!, 5.1, 5.2);
        console.info(msg + ' RectUtils offsetTo 2 successed');
        console.info(msg + ' RectUtils offsetTo 2 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 5.099999904632568 && rect!.top == 5.199999809265137 && rect!.right == 15.100000381469727 && rect!.bottom == 5.199999809265137).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        drawing.RectUtils.offsetTo(rect!, -5, -5.1);
        console.info(msg + ' RectUtils offsetTo 3 successed');
        console.info(msg + ' RectUtils offsetTo 3 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -5 && rect!.top == -5.100000381469727 && rect!.right == -5 && rect!.bottom == 4.899999618530273).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        drawing.RectUtils.offsetTo(rect!, 0, 5.1);
        console.info(msg + ' RectUtils offsetTo 4 successed');
        console.info(msg + ' RectUtils offsetTo 4 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 5.099999904632568 && rect!.right == 0 && rect!.bottom == 5.099999904632568).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      try {
        drawing.RectUtils.offsetTo(rect!, -50, 50);
        console.info(msg + ' RectUtils offsetTo 5 successed');
        console.info(msg + ' RectUtils offsetTo 5 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -50 && rect!.top == 50 && rect!.right == 50 && rect!.bottom == 150).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0,10.2632,100.25474,100.2884);
      try {
        drawing.RectUtils.offsetTo(rect!, 205.256, -2.552);
        console.info(msg + ' RectUtils offsetTo 6 successed');
        console.info(msg + ' RectUtils offsetTo 6 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 205.25599670410156 && rect!.top == -2.552000045776367 && rect!.right == 305.5107421875 && rect!.bottom == 87.47319793701172).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100,-100.98788,300.20,300);
      try {
        drawing.RectUtils.offsetTo(rect!, 600, 500);
        console.info(msg + ' RectUtils offsetTo 7 successed');
        console.info(msg + ' RectUtils offsetTo 7 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 600 && rect!.top == 499.9999694824219 && rect!.right == 1000.2000122070313 && rect!.bottom == 900.9878540039063).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(100,100.25,-100,-100);
      try {
        drawing.RectUtils.offsetTo(rect!, -100000, 100000);
        console.info(msg + ' RectUtils offsetTo 8 successed');
        console.info(msg + ' RectUtils offsetTo 8 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == -100000 && rect!.top == 100000 && rect!.right == -100200 && rect!.bottom == 99799.75).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
      try {
        drawing.RectUtils.offsetTo(rect!,Number.MAX_VALUE, Number.MAX_VALUE);
        console.info(msg + ' RectUtils offsetTo 9 successed');
        console.info(msg + ' RectUtils offsetTo 9 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils offsetTo 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsOffsetToMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_1501
     * @tc.desc   testRectUtilsOffsetToMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsOffsetToMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsOffsetToMultipleCalls';
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.offsetTo(rect!, Math.random() *100, Math.random() *20);
          console.info(msg + `RectUtils.offsetTo success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `RectUtils offsetTo error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsSetRectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1600
     * @tc.desc   Test for testRectUtilsSetRectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsSetRectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsSetRectNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      let rect2: common2D.Rect  | undefined= { left: 0, right: 90, top: 0, bottom: 120 };
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 1 successed');
        console.info(msg + ' RectUtils setRect 1 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 2 successed');
        console.info(msg + ' RectUtils setRect 2 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 3 successed');
        console.info(msg + ' RectUtils setRect 3 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 4 successed');
        console.info(msg + ' RectUtils setRect 4 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(0, 0, 300, 300);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 5 successed');
        console.info(msg + ' RectUtils setRect 5 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(0,100.2632,300.25474,300.2884);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 6 successed');
        console.info(msg + ' RectUtils setRect 6 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(-100,-100.98788,350.20,350);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 7 successed');
        console.info(msg + ' RectUtils setRect 7 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(500,510.25,-100,-100);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 8 successed');
        console.info(msg + ' RectUtils setRect 8 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeEmpty();
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 9 successed');
        console.info(msg + ' RectUtils setRect 9 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect2 = drawing.RectUtils.makeLtrb(200,400,300,500);
      rect = drawing.RectUtils.makeLtrb(200,400,300,500);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 10 successed');
        console.info(msg + ' RectUtils setRect 10 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
      try {
        drawing.RectUtils.setRect(rect!, rect2!);
        console.info(msg + ' RectUtils setRect 11 successed');
        console.info(msg + ' RectUtils setRect 11 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setRect 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsSetRectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1601
     * @tc.desc   testRectUtilsSetRectMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsSetRectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsSetRectMultipleCallsStatic';
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      for (let i = 0; i < 20; i += 1) {
        try {
          let rect2: common2D.Rect = { left: Math.random() *10, right: Math.random() *20, top: Math.random() *30, bottom: Math.random() *40 };
          drawing.RectUtils.setRect(rect!, rect2);
          console.info(msg + `RectUtils.setRect success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `RectUtils setRect error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsSetLtrbNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1700
     * @tc.desc   Test for testRectUtilsSetLtrbNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsSetLtrbNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsSetLtrbNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        drawing.RectUtils.setLtrb(rect!, 0,0,90,120);
        console.info(msg + ' RectUtils setLtrb 1 successed');
        console.info(msg + ' RectUtils setLtrb 1 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 10, 20, 20, 20);
        console.info(msg + ' RectUtils setLtrb 2 successed');
        console.info(msg + ' RectUtils setLtrb 2 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 10, 10, 10, 20);
        console.info(msg + ' RectUtils setLtrb 3 successed');
        console.info(msg + ' RectUtils setLtrb 3 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 10, 10, 10, 10);
        console.info(msg + ' RectUtils setLtrb 4 successed');
        console.info(msg + ' RectUtils setLtrb 4 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 0, 0, 300, 300);
        console.info(msg + ' RectUtils setLtrb 5 successed');
        console.info(msg + ' RectUtils setLtrb 5 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 0,100.2632,300.25474,300.2884);
        console.info(msg + ' RectUtils setLtrb 6 successed');
        console.info(msg + ' RectUtils setLtrb 6 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, -100,-100.98788,350.20,350);
        console.info(msg + ' RectUtils setLtrb 7 successed');
        console.info(msg + ' RectUtils setLtrb 7 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 500,510.25,-100,-100);
        console.info(msg + ' RectUtils setLtrb 8 successed');
        console.info(msg + ' RectUtils setLtrb 8 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        drawing.RectUtils.setLtrb(rect!, 0,0,0,0);
        console.info(msg + ' RectUtils setLtrb 9 successed');
        console.info(msg + ' RectUtils setLtrb 9 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(200,400,300,500);
      try {
        drawing.RectUtils.setLtrb(rect!, 200,400,300,500);
        console.info(msg + ' RectUtils setLtrb 10 successed');
        console.info(msg + ' RectUtils setLtrb 10 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 10 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
      try {
        drawing.RectUtils.setLtrb(rect!, Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
        console.info(msg + ' RectUtils setLtrb 11 successed');
        console.info(msg + ' RectUtils setLtrb 11 successed rect: ' + JSON.stringify(rect!));
      } catch (e) {
        console.info(msg + ` RectUtils setLtrb 11 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsSetLtrbMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1701
     * @tc.desc   testRectUtilsSetLtrbMultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsSetLtrbMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsSetLtrbMultipleCallsStatic';
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.setLtrb(rect!, Math.random() *10,Math.random() *20,Math.random() *10,Math.random() *10);
          console.info(msg + `RectUtils.setLtrb success step: ` + i);
        } catch (e) {
          console.info(msg + `RectUtils setLtrb error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    });
    /**
     * @tc.name   testRectUtilsSetEmptyNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_STATIC_1800
     * @tc.desc   Test for testRectUtilsSetEmptyNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRectUtilsSetEmptyNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const msg = 'testRectUtilsSetEmptyNormalStatic';
      let rect = drawing.RectUtils.makeEmpty();
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 1 successed');
        console.info(msg + ' RectUtils setEmpty 1 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 20, 20, 20);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 2 successed');
        console.info(msg + ' RectUtils setEmpty 2 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 20);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 3 successed');
        console.info(msg + ' RectUtils setEmpty 3 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(10, 10, 10, 10);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 4 successed');
        console.info(msg + ' RectUtils setEmpty 4 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0, 0, 300, 300);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 5 successed');
        console.info(msg + ' RectUtils setEmpty 5 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(0,100.2632,300.25474,300.2884);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 6 successed');
        console.info(msg + ' RectUtils setEmpty 6 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 6 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(-100,-100.98788,350.20,350);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 7 successed');
        console.info(msg + ' RectUtils setEmpty 7 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(500,510.25,-100,-100);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 8 successed');
        console.info(msg + ' RectUtils setEmpty 8 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      rect = drawing.RectUtils.makeLtrb(Number.MAX_VALUE,Number.MAX_VALUE,Number.MAX_VALUE+1,Number.MAX_VALUE+1);
      try {
        drawing.RectUtils.setEmpty(rect!);
        console.info(msg + ' RectUtils setEmpty 9 successed');
        console.info(msg + ' RectUtils setEmpty 9 successed rect: ' + JSON.stringify(rect!));
        expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` RectUtils setEmpty 9 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    });
    /**
     * @tc.name   testRectUtilsSetEmptyMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_RECTUTILS_1801
     * @tc.desc   testRectUtilsSetEmptyMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRectUtilsSetEmptyMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRectUtilsSetEmptyMultipleCalls';
      let rect = drawing.RectUtils.makeLtrb(0, 0, 100, 100);
      for (let i = 0; i < 20; i += 1) {
        try {
          drawing.RectUtils.setEmpty(rect!);
          console.info(msg + `RectUtils.setEmpty success step: ` + i);
          console.info(msg + ' RectUtils setEmpty  successed rect: ' + JSON.stringify(rect!));
          expect(rect!.left == 0 && rect!.top == 0 && rect!.right == 0 && rect!.bottom == 0).assertEqual(true);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + `RectUtils setEmpty error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
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