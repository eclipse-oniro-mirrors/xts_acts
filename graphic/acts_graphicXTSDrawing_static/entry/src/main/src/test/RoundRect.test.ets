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
import { getRandomNumber } from './Util.test';

export default function roundRectTest() {
  describe('DrawingTsRoundRectTest', () => {
    const DEFAULT = 0;

    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {

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
     * @tc.name   testRoundRectConstructorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0100
     * @tc.desc   Test for testRoundRectConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRoundRectConstructorNormalStatic';

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100.1, top : 100.1, right : 500.1, bottom : 300.1
        }, 50.1, 50.1);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : -100, top : -100, right : 500, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : -500, bottom : -300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, -50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, 50, -50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 100, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 100, bottom : 100
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testRoundRectConstructorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0103
     * @tc.desc   Test for testRoundRectConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRoundRectConstructorMultipleCallsStatic';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let roundRect = new drawing.RoundRect({
            left : getRandomNumber(0, 500), top : getRandomNumber(0, 500),
            right : getRandomNumber(0, 500), bottom : getRandomNumber(0, 500)
          }, getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' RoundRect succeeded');
        } catch( e ) {
          e = e as BusinessError;
          console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name   testRoundRectSetAndGetCornerNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0200
     * @tc.desc   Test for testRoundRectSetAndGetCornerNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectSetAndGetCornerNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectSetAndGetCornerNormalStatic';
      const roundRect_ = new drawing.RoundRect({
        left: 0,
        top: 0,
        right: 0,
        bottom: 0
      }, 0, 0);

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 150, 150);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        if(point1 == undefined) {
          console.info(msg + ' setAndGetCorner failed, point1：' + JSON.stringify(point1));
          expect().assertFail();
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(point2.x == 150 && point2.y == 150).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        if(point2 == undefined) {
          console.info(msg + ' setAndGetCorner failed, point2：' + JSON.stringify(point2));
          expect().assertFail();
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        if(point3 == undefined) {
          console.info(msg + ' setAndGetCorner failed, point3：' + JSON.stringify(point3));
          expect().assertFail();
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        }
        if(point4 == undefined) {
          console.info(msg + ' setAndGetCorner failed, point4：' + JSON.stringify(point4));
          expect().assertFail();
        }
        console.info(msg + ' setAndGetCorner succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100.1, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(Math.floor(point2.x) == 100 && Math.floor(point2.y) == 100).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        }
        console.info(msg + ' setAndGetCorner succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 0, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(point2.x == 0 && Math.floor(point2.y) == 100).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        }
        console.info(msg + ' setAndGetCorner succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100, 0);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(point2.x == 100 && point2.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        }
        console.info(msg + ' setAndGetCorner succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, -1, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(point2.x == -1 && Math.floor(point2.y) == 100).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        }
        console.info(msg + ' setAndGetCorner succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100, -1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        if (point1) {
          expect(point1.x == 0 && point1.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        }
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        if (point2) {
          expect(point2.x == 100 && Math.floor(point2.y) == -1).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        }
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        if (point3) {
          expect(point3.x == 0 && point3.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        }
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        if (point4) {
          expect(point4.x == 0 && point4.y == 0).assertTrue();
          console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
          console.info(msg + ' setAndGetCorner succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRoundRectSetAndGetCornerMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0203
     * @tc.desc   Test for testRoundRectSetAndGetCornerMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectSetAndGetCornerMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRoundRectSetAndGetCornerMultipleCallsStatic';
      const roundRect_ = new drawing.RoundRect({
        left: 0,
        top: 0,
        right: 0,
        bottom: 0
      }, 0, 0);
      let itemList: drawing.CornerPos[] = [
        drawing.CornerPos.TOP_LEFT_POS,
        drawing.CornerPos.TOP_RIGHT_POS,
        drawing.CornerPos.BOTTOM_RIGHT_POS,
        drawing.CornerPos.BOTTOM_LEFT_POS
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        try {
          roundRect_.setCorner(itemList[randomEnum], getRandomNumber(0, 500), getRandomNumber(0, 500));
          roundRect_.getCorner(itemList[randomEnum]);
          console.info(msg + ' setAndGetCorner succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAndGetCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        try {
          roundRect_.setCorner(itemList[randomEnum], getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' setCorner succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(4 * Math.random()).toInt();
        try {
          roundRect_.getCorner(itemList[randomEnum]);
          console.info(msg + ' getCorner succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getCorner errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testRoundRectOffsetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0300
     * @tc.desc   Test for testRoundRectOffsetNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectOffsetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectOffsetNormalStatic';
      const roundRect_ = new drawing.RoundRect({
        left: 0,
        top: 0,
        right: 0,
        bottom: 0
      }, 0, 0);

      try {
        roundRect_.offset(100, 100);
        console.info(msg + ' offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(100.1, 100.1);
        console.info(msg + ' offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(-100, 100);
        console.info(msg + ' offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(100.1, -100.1);
        console.info(msg + ' offset succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` offset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRoundRectOffsetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0303
     * @tc.desc   Test for testRoundRectOffsetMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectOffsetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRoundRectOffsetMultipleCallsStatic';
      const roundRect_ = new drawing.RoundRect({
        left: 0,
        top: 0,
        right: 0,
        bottom: 0
      }, 0, 0);

      for (let i = 0; i < 20; i++) {
        try {
          roundRect_.offset(getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' offset succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` offset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name   testRoundRectConstructor2NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0400
     * @tc.desc   Test for testRoundRectConstructor2NormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRoundRectConstructor2NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testRoundRectConstructor2NormalStatic';
      let roundRect: drawing.RoundRect = new drawing.RoundRect({
        left: 100,
        top: 100,
        right: 400,
        bottom: 400
      }, 0, 0);
      try {
        // let roundRect2 = new drawing.RoundRect(roundRect);
        console.info(msg + ' roundRect2 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` roundRect2 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 20, 20);
      roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 20, 20);
      roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 20, 20);
      roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 20, 20);
      try {
        // let roundRect3 = new drawing.RoundRect(roundRect);
        console.info(msg + ' roundRect3 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` roundRect3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      roundRect.setCorner(drawing.CornerPos.TOP_LEFT_POS, 10, 16);
      roundRect.setCorner(drawing.CornerPos.TOP_RIGHT_POS, 5, 30);
      roundRect.setCorner(drawing.CornerPos.BOTTOM_LEFT_POS, 30, 10);
      roundRect.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 40, 40);
      try {
        // let roundRect4 = new drawing.RoundRect(roundRect);
        console.info(msg + ' roundRect4 succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` roundRect4 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testRoundRectConstructor2MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0401
     * @tc.desc   testRoundRectConstructor2MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRoundRectConstructor2MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testRoundRectConstructor2MultipleCallsStatic';
      for (let i = 0; i < 20; i += 1) {
        try {
          let roundRect: drawing.RoundRect = new drawing.RoundRect({
            left: Math.random() * 10,
            top: Math.random() * 20,
            right: Math.random() * 30,
            bottom: Math.random() * 40
          }, Math.random() * 10, Math.random() * 20);
          // let roundRect2 = new drawing.RoundRect(roundRect);
          console.info(msg + `drawing RoundRect success step: ` + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg +
            `drawing RoundRect error. errorCode is: ${e.code} + errormsg is: ${e.message}} step: ${i}`);
          expect().assertFail()
        }
      }
    })
  });
}