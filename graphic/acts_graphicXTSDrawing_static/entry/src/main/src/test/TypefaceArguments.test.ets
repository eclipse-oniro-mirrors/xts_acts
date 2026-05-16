/**
 * @tc.name   testTypefaceArgumentsConstructorNormalStatic
 * @tc.number testTypefaceArgumentsConstructorNormalStatic
 * @tc.desc   testTypefaceArgumentsConstructorNormalStatic
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
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
import { BusinessError } from '@ohos.base';

export default function typefaceTest() {
  describe('DrawingTsTypefaceArgumentsTest', () => {

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0100
     * @tc.name      : testTypefaceArgumentsConstructorNormalStatic
     * @tc.desc      : Test for testTypefaceArgumentsConstructorNormalStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTypefaceArgumentsConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTypefaceArgumentsConstructorNormalStatic';
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        console.info(msg + ' TypefaceArguments successed');
      } catch (e: BusinessError) {
        console.info(msg + ` TypefaceArguments errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0101
     * @tc.name      : testTypefaceArgumentsConstructorMultipleCallsStatic
     * @tc.desc      : Test for testTypefaceArgumentsConstructorMultipleCallsStatic.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testTypefaceArgumentsConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypefaceArgumentsConstructorMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          console.info(msg + ' TypefaceArguments successed step: ' + i);
        } catch (e: BusinessError) {
          console.info(msg + ` TypefaceArguments errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
  })
}