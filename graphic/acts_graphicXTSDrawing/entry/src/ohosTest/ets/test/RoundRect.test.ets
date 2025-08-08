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
import { getEnumCount, getRandomNumber } from './utils';

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0100
     * @tc.name      : testRoundRectConstructorNormal
     * @tc.desc      : Test for testRoundRectConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRoundRectConstructorNormal', DEFAULT, () => {
      const msg = 'testRoundRectConstructorNormal';

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0101
     * @tc.name      : testRoundRectConstructorNull
     * @tc.desc      : Test for testRoundRectConstructorNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectConstructorNull', DEFAULT, () => {
      const msg = 'testRoundRectConstructorNull';
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0103
     * @tc.name      : testRoundRectConstructorMultipleCalls
     * @tc.desc      : Test for testRoundRectConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectConstructorMultipleCalls', DEFAULT, () => {
      const msg = 'testRoundRectConstructorMultipleCalls';

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let roundRect = new drawing.RoundRect({
            left : getRandomNumber(0, 500), top : getRandomNumber(0, 500),
            right : getRandomNumber(0, 500), bottom : getRandomNumber(0, 500)
          }, getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' RoundRect succeeded');
        } catch( e ) {
          console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0200
     * @tc.name      : testRoundRectSetAndGetCornerNormal
     * @tc.desc      : Test for testRoundRectSetAndGetCornerNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRoundRectSetAndGetCornerNormal', DEFAULT, () => {
      const msg = 'testRoundRectSetAndGetCornerNormal';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 150, 150);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point2.x == 150 && point2.y == 150).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100.1, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(Math.floor(point2.x) == 100 && Math.floor(point2.y) == 100).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 0, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point2.x == 0 && Math.floor(point2.y) == 100).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100, 0);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point2.x == 100 && point2.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, -1, 100.1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point2.x == -1 && Math.floor(point2.y) == 100).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 100, -1);
        let point1 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_LEFT_POS);
        expect(point1.x == 0 && point1.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded, point1：' + JSON.stringify(point1));
        let point2 = roundRect_.getCorner(drawing.CornerPos.BOTTOM_RIGHT_POS);
        expect(point2.x == 100 && Math.floor(point2.y) == -1).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point2：' + JSON.stringify(point2));
        let point3 = roundRect_.getCorner(drawing.CornerPos.TOP_LEFT_POS);
        expect(point3.x == 0 && point3.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point33：' + JSON.stringify(point3));
        let point4 = roundRect_.getCorner(drawing.CornerPos.TOP_RIGHT_POS);
        expect(point4.x == 0 && point4.y == 0).assertTrue();
        console.info(msg + ' setAndGetCorner succeeded，point4：' + JSON.stringify(point4));
        console.info(msg + ' setAndGetCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0201
     * @tc.name      : testRoundRectSetAndGetCornerNull
     * @tc.desc      : Test for testRoundRectSetAndGetCornerNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectSetAndGetCornerNull', DEFAULT, () => {
      const msg = 'testRoundRectSetAndGetCornerNull';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      try {
        roundRect_.setCorner(null, 150, 150);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, null, 150);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 150, null);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.setCorner(undefined, 150, 150);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, undefined, 150);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.setCorner(drawing.CornerPos.BOTTOM_RIGHT_POS, 150, undefined);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.getCorner(null);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.getCorner(undefined);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0203
     * @tc.name      : testRoundRectSetAndGetCornerMultipleCalls
     * @tc.desc      : Test for testRoundRectSetAndGetCornerMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectSetAndGetCornerMultipleCalls', DEFAULT, () => {
      const msg = 'testRoundRectSetAndGetCornerMultipleCalls';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.CornerPos));
        try {
          roundRect_.setCorner(randomEnum, getRandomNumber(0, 500), getRandomNumber(0, 500));
          roundRect_.getCorner(randomEnum);
          console.info(msg + ' setAndGetCorner succeeded');
        } catch( e ) {
          console.info(msg + ` setAndGetCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.CornerPos));
        try {
          roundRect_.setCorner(randomEnum, getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' setCorner succeeded');
        } catch( e ) {
          console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

      for ( let i = 0 ; i < 20 ; i ++ ) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.CornerPos));
        try {
          roundRect_.getCorner(randomEnum);
          console.info(msg + ' getCorner succeeded');
        } catch( e ) {
          console.info(msg + ` getCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0204
     * @tc.name      : testRoundRectSetAndGetCornerAbnormal
     * @tc.desc      : Test for testRoundRectSetAndGetCornerAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectSetAndGetCornerAbnormal', DEFAULT, () => {
      const msg = 'testRoundRectSetAndGetCornerAbnormal';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      try {
        roundRect_.setCorner(10, 150, 150);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.getCorner(10);
        console.info(msg + ' setCorner succeeded');
      } catch( e ) {
        console.info(msg + ` setCorner errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0300
     * @tc.name      : testRoundRectOffsetNormal
     * @tc.desc      : Test for testRoundRectOffsetNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRoundRectOffsetNormal', DEFAULT, () => {
      const msg = 'testRoundRectOffsetNormal';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      try {
        roundRect_.offset(100, 100);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(100.1, 100.1);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(- 100, 100);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        roundRect_.offset(100.1, - 100.1);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0301
     * @tc.name      : testRoundRectOffsetNull
     * @tc.desc      : Test for testRoundRectOffsetNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectOffsetNull', DEFAULT, () => {
      const msg = 'testRoundRectOffsetNull';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      try {
        roundRect_.offset(null, 100);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.offset(100, null);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.offset(undefined, 100);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        roundRect_.offset(100, undefined);
        console.info(msg + ' offset succeeded');
      } catch( e ) {
        console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_0303
     * @tc.name      : testRoundRectOffsetMultipleCalls
     * @tc.desc      : Test for testRoundRectOffsetMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRoundRectOffsetMultipleCalls', DEFAULT, () => {
      const msg = 'testRoundRectOffsetMultipleCalls';
      const roundRect_ = new drawing.RoundRect({
        left : 0, top : 0, right : 0, bottom : 0
      }, 0, 0);

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          roundRect_.offset(getRandomNumber(0, 500), getRandomNumber(0, 500));
          console.info(msg + ' offset succeeded');
        } catch( e ) {
          console.info(msg + ` offset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
  });
}