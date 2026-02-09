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

export default function AccessibilityNdkTest6() {
  describe('AccessibilityNdkTest6', () => {

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetBlur0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBLUR_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetBlur0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBlur0100 start====");

          let result: number = accessibilityNdk.SetBlur0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBlur0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBlur0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetBlur0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBLUR_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetBlur0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBlur0200 start====");

          let result: number = accessibilityNdk.SetBlur0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBlur0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBlur0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetBlur0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETBLUR_0300
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetBlur0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetBlur0300 start====");

          let result: number = accessibilityNdk.SetBlur0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetBlur0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetBlur0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetHitTestBehavior0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHITTESTBEHAVIOR_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetHitTestBehavior0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0100 start====");

          let result: number = accessibilityNdk.SetHitTestBehavior0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetHitTestBehavior0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHITTESTBEHAVIOR_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetHitTestBehavior0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0200 start====");

          let result: number = accessibilityNdk.SetHitTestBehavior0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetHitTestBehavior0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHITTESTBEHAVIOR_0300
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetHitTestBehavior0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0300 start====");

          let result: number = accessibilityNdk.SetHitTestBehavior0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHitTestBehavior0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetEventType0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETEVENTTYPE_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetEventType0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEventType0100 start====");

          let result: number = accessibilityNdk.SetEventType0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEventType0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEventType0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetEventType0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETEVENTTYPE_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetEventType0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEventType0200 start====");

          let result: number = accessibilityNdk.SetEventType0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEventType0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEventType0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETTEXTANNOUNCEDFORACCESSIBILITY_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0100 start====");

          let result: number = accessibilityNdk.SetTextAnnouncedForAccessibility0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0100
          result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0100 catch err: " +
            err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETTEXTANNOUNCEDFORACCESSIBILITY_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0200 start====");

          let result: number = accessibilityNdk.SetTextAnnouncedForAccessibility0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0200
          result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetTextAnnouncedForAccessibility0200 catch err: " +
            err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetRequestFocusId0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETREQUESTFOCUSID_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetRequestFocusId0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0100 start====");

          let result: number = accessibilityNdk.SetRequestFocusId0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetRequestFocusId0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETREQUESTFOCUSID_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetRequestFocusId0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0200 start====");

          let result: number = accessibilityNdk.SetRequestFocusId0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetRequestFocusId0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetElementInfo0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ACCESSIBILITYELEMENTINFOSETELEMENTINFO_0100
     * @tc.desc   Verify whether it can register successfully and return the success code when valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetElementInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetElementInfo0100 start====");

          let result: number = accessibilityNdk.SetElementInfo0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetElementInfo0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetElementInfo0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetElementInfo0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETELEMENTINFO_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetElementInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetElementInfo0200 start====");

          let result: number = accessibilityNdk.SetElementInfo0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetElementInfo0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetElementInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIAccessibilityElementInfoSetElementInfo0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETELEMENTINFO_0300
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIAccessibilityElementInfoSetElementInfo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetElementInfo0300 start====");

          let result: number = accessibilityNdk.SetElementInfo0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetElementInfo0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetElementInfo0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.name   testOHArkUIFindAccessibilityActionArgumentByKey0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_FINDACCESSIBILITYACTIONARGUMENTBYKEY_0200
     * @tc.desc   Verify whether it can return the correct parameter error code when invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHArkUIFindAccessibilityActionArgumentByKey0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIFindAccessibilityActionArgumentByKey0200 start====");

          let result: number = accessibilityNdk.ActionArgumentByKey0200();
          console.info(`====>testOHArkUIFindAccessibilityActionArgumentByKey0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIFindAccessibilityActionArgumentByKey0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}