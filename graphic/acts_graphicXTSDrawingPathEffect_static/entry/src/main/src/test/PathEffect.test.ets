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
import { getRandomNumber } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function pathEffectTest() {
  describe('DrawingTsPathEffectTest', () => {
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
     * @tc.name   testCreateDashPathEffectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0100
     * @tc.desc   Test for testCreateDashPathEffectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDashPathEffectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testCreateDashPathEffectNormalStatic';

      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], 5);
        console.info(msg + ' createDashPathEffect with [10, 5], 5 successed');
        if(effect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], 5.52);
        console.info(msg + ' createDashPathEffect with [10, 5], 5.52 successed');
        if(effect == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let effect = drawing.PathEffect.createDashPathEffect([10, 5], 0);
        console.info(msg + ' createDashPathEffect with [10, 5], 0 successed');
        if(effect == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let effect = drawing.PathEffect.createDashPathEffect([10.52, 5.522], 0);
        console.info(msg + ' createDashPathEffect with [10.52, 5.522], 0 successed');
        if(effect == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testCreateDashPathEffectNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0101
     * @tc.desc   Test for testCreateDashPathEffectNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectNullStatic';
      try {
        drawing.PathEffect.createDashPathEffect([], 5);
        console.info(msg + ' createDashPathEffect with [], 5 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testCreateDashPathEffectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0103
     * @tc.desc   Test for testCreateDashPathEffectMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDashPathEffectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testCreateDashPathEffectMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        const randomValues = [Math.random() * 10, Math.random() * 10];
        const randomValue = Math.random() * 10;

        try {
          drawing.PathEffect.createDashPathEffect(randomValues, randomValue);
          console.info(`${msg} createDashPathEffect with [${randomValues}], ${randomValue} succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} createDashPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testcreateCornerPathEffectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0200
     * @tc.desc   Test for testcreateCornerPathEffectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testcreateCornerPathEffectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testcreateCornerPathEffectNormalStatic';
      try {
        let effect = drawing.PathEffect.createCornerPathEffect(1);
        console.info(msg + ' createCornerPathEffect with [10, 5], 5 successed');
        if(effect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createCornerPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let effect = drawing.PathEffect.createCornerPathEffect(30.1);
        console.info(msg + ' createCornerPathEffect with [10, 5], 5.52 successed');
        if(effect == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createCornerPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testcreateCornerPathEffectAbnormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0202
     * @tc.desc   Test for testcreateCornerPathEffectAbnormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testcreateCornerPathEffectAbnormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testcreateCornerPathEffectAbnormalStatic';
      try {
        drawing.PathEffect.createCornerPathEffect(0);
        console.info(msg + ' createCornerPathEffect with [10, 5, 10, 5], 5, 5 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createCornerPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        drawing.PathEffect.createCornerPathEffect(-1);
        console.info(msg + ' createCornerPathEffect with [10, 5, 10, 5] successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createCornerPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testcreateCornerPathEffectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PATHEFFECT_STATIC_0203
     * @tc.desc   Test for testcreateCornerPathEffectMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testcreateCornerPathEffectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testcreateCornerPathEffectMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        try {
          drawing.PathEffect.createCornerPathEffect(getRandomNumber(0, Number.MAX_SAFE_INTEGER));
          console.info(`${msg} createCornerPathEffect succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} createCornerPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  })
}