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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { BusinessError } from '@ohos.base';
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0100
     * @tc.name      : testRoundRectConstructorNormalStatic
     * @tc.desc      : Test for testRoundRectConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRoundRectConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testRoundRectConstructorNormalStatic';

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100.1, top : 100.1, right : 500.1, bottom : 300.1
        }, 50.1, 50.1);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : -100, top : -100, right : 500, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : -500, bottom : -300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, -50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 500, bottom : 300
        }, 50, -50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 100, bottom : 300
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let roundRect = new drawing.RoundRect({
          left : 100, top : 100, right : 100, bottom : 100
        }, 50, 50);
        console.info(msg + ' RoundRect succeeded,roundRect:' + JSON.stringify(roundRect));
      } catch( e: BusinessError ) {
        console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_ROUNDRECT_STATIC_0103
     * @tc.name      : testRoundRectConstructorMultipleCallsStatic
     * @tc.desc      : Test for testRoundRectConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
        } catch( e: BusinessError ) {
          console.info(msg + ` RoundRect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect(e.code).assertEqual(401);
        }
      }
    });
  });
}