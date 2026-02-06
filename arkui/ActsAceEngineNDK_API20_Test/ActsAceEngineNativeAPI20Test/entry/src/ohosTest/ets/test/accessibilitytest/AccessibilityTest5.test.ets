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

export default function AccessibilityNdkTest5() {
  describe('AccessibilityNdkTest5', () => {

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSTARTITEMINDEX_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetStartItemIndex0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetStartItemIndex0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0100 start====");

          let result: number = accessibilityNdk.SetStartItemIndex0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSTARTITEMINDEX_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetStartItemIndex0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetStartItemIndex0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0200 start====");

          let result: number = accessibilityNdk.SetStartItemIndex0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetStartItemIndex0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETENDITEMINDEX_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEndItemIndex0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEndItemIndex0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0100 start====");

          let result: number = accessibilityNdk.SetEndItemIndex0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETENDITEMINDEX_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEndItemIndex0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEndItemIndex0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0200 start====");

          let result: number = accessibilityNdk.SetEndItemIndex0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEndItemIndex0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETITEMCOUNT_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetItemCount0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetItemCount0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetItemCount0100 start====");

          let result: number = accessibilityNdk.SetEndItemIndex0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetItemCount0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetItemCount0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETITEMCOUNT_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetItemCount0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetItemCount0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetItemCount0200 start====");

          let result: number = accessibilityNdk.SetEndItemIndex0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetItemCount0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetItemCount0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYOFFSET_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityOffset0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYOFFSET_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityOffset0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOffset0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYGROUP_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityGroup0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYGROUP_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityGroup0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityGroup0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYLEVEL_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityLevel0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYLEVEL_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityLevel0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYLEVEL_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0300 start====");

          let result: number = accessibilityNdk.SetAccessibilityLevel0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityLevel0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETZINDEX_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetZIndex0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetZIndex0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetZIndex0100 start====");

          let result: number = accessibilityNdk.SetZIndex0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetZIndex0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetZIndex0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETZINDEX_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetZIndex0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetZIndex0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetZIndex0200 start====");

          let result: number = accessibilityNdk.SetZIndex0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetZIndex0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetZIndex0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYOPACITY_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityOpacity0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYOPACITY_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityOpacity0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYOPACITY_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0300 start====");

          let result: number = accessibilityNdk.SetAccessibilityOpacity0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityOpacity0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDCOLOR_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundColor0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundColor0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0100 start====");

          let result: number = accessibilityNdk.SetBackgroundColor0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDCOLOR_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundColor0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundColor0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0200 start====");

          let result: number = accessibilityNdk.SetBackgroundColor0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDCOLOR_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundColor0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundColor0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0300 start====");

          let result: number = accessibilityNdk.SetBackgroundColor0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundColor0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDIMAGE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundImage0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundImage0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0100 start====");

          let result: number = accessibilityNdk.SetBackgroundImage0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDIMAGE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundImage0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundImage0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0200 start====");

          let result: number = accessibilityNdk.SetBackgroundImage0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

   /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBACKGROUNDIMAGE_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetBackgroundImage0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetBackgroundImage0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0300 start====");

          let result: number = accessibilityNdk.SetBackgroundImage0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBackgroundImage0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}