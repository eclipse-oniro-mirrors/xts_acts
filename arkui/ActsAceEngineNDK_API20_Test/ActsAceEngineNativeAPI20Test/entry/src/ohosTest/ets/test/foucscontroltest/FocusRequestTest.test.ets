/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE = 150001;
const ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR = 150002;
const ARKUI_ERROR_CODE_FOCUS_NON_EXISTENT = 150003;
export default function FocusControlTest() {
  describe('FocusControlTest', () => {

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIFocusRequest_0100
       * @tc.name       : testOHArkUIFocusRequest0100
       * @tc.desc       : testing OH_ArkUI_FocusRequest interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIFocusRequest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIFocusRequest0100 start====");
          let result: number = nativerenderndk.FocusControlTest_001()
          console.info(`====>testOHArkUIFocusRequest0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIFocusRequest0100 catch err: " + err);
          expect(false).assertEqual(1);
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIFocusRequest_0200
     * @tc.name       : testOHArkUIFocusRequest0200
     * @tc.desc       : testing OH_ArkUI_FocusRequest interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUIFocusRequest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIFocusRequest0200 start====");
          let result: number = nativerenderndk.FocusControlTest_002()
          console.info(`====>testOHArkUIFocusRequest0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIFocusRequest0200 catch err: " + err);
          expect(false).assertEqual(1);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIFocusRequest_0300
       * @tc.name       : testOHArkUIFocusRequest0300
       * @tc.desc       : testing OH_ArkUI_FocusRequest interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
    */
    it('testOHArkUIFocusRequest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIFocusRequest0300 start====");
          let result: number = nativerenderndk.FocusControlTest_003()
          console.info(`====>testOHArkUIFocusRequest0300 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIFocusRequest0300 catch err: " + err);
          expect(false).assertEqual(1);
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIFocusRequest_0400
    * @tc.name       : testOHArkUIFocusRequest0400
    * @tc.desc       : testing OH_ArkUI_FocusRequest interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIFocusRequest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIFocusRequest0400 start====");
          let result: number = nativerenderndk.FocusControlTest_004()
          console.info(`====>testOHArkUIFocusRequest0400 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIFocusRequest0400 catch err: " + err);
          expect(false).assertEqual(1);
        }
      })

  })
}