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
import accessibilityNdk from 'libaccessibilityndk.so'

const RESULT_SUCCESSFUL = 0
const RESULT_BAD_PARAMETER = -2

export default function AccessibilityNdkTest1() {
  describe('AccessibilityNdkTest1', () => {
    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallback0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ACCESSIBILITYPROVIDERREGISTERCALLBACK_0100
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallback0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallback0100 start====");
          let result: number = accessibilityNdk.RegisterCallback0100();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallback0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallback0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallback0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYPROVIDERREGISTERCALLBACK_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallback0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallback0200 start====");
          let result: number = accessibilityNdk.RegisterCallback0200();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallback0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallback0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallback0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYPROVIDERREGISTERCALLBACK_0300
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallback0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallback0300 start====");
          let result: number = accessibilityNdk.RegisterCallback0300();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallback0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallback0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYPROVIDERREGISTERCALLBACKWITHINSTANCE_0100
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0100 start====");
          let result: number = accessibilityNdk.RegisterCallbackWithInstance0100();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYPROVIDERREGISTERCALLBACKWITHINSTANCE_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0200 start====");
          let result: number = accessibilityNdk.RegisterCallbackWithInstance0200();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYPROVIDERREGISTERCALLBACKWITHINSTANCE_0300
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0300 start====");
          let result: number = accessibilityNdk.RegisterCallbackWithInstance0300();
          console.info(`====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityProviderRegisterCallbackWithInstance0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}