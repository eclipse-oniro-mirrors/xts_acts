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

export default function AccessibilityNdkTest2() {
  describe('AccessibilityNdkTest2', () => {

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETELEMENTID_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetElementId0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters are
     *               passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetElementId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetElementId0100 start====");

          let result: number = accessibilityNdk.SetElementId0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetElementId0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetElementId0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETELEMENTID_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetElementId0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters are
     *               passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetElementId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetElementId0200 start====");

          let result: number = accessibilityNdk.SetElementId0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetElementId0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetElementId0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETPARENTID_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetParentId0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetParentId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetParentId0100 start====");

          let result: number = accessibilityNdk.SetParentId0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetParentId0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetParentId0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETPARENTID_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetParentId0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetParentId0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetParentId0200 start====");

          let result: number = accessibilityNdk.SetParentId0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetParentId0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetParentId0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCOMPONENTTYPE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetComponentType0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetComponentType0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetComponentType0100 start====");

          let result: number = accessibilityNdk.SetComponentType0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetComponentType0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetComponentType0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCOMPONENTTYPE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetComponentType0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetComponentType0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetComponentType0200 start====");

          let result: number = accessibilityNdk.SetComponentType0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetComponentType0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetComponentType0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCOMPONENTTYPE_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetComponentType0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetComponentType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetComponentType0300 start====");

          let result: number = accessibilityNdk.SetComponentType0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetComponentType0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetComponentType0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCONTENTS_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetContents0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetContents0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetContents0100 start====");

          let result: number = accessibilityNdk.SetContents0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetContents0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetContents0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCONTENTS_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetContents0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetContents0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetContents0200 start====");

          let result: number = accessibilityNdk.SetContents0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetContents0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetContents0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCONTENTS_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetContents0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetContents0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetContents0300 start====");

          let result: number = accessibilityNdk.SetContents0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetContents0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetContents0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHINTTEXT_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetHintText0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetHintText0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHintText0100 start====");

          let result: number = accessibilityNdk.SetHintText0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHintText0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHintText0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHINTTEXT_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetHintText0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetHintText0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHintText0200 start====");

          let result: number = accessibilityNdk.SetHintText0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHintText0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHintText0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETHINTTEXT_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetHintText0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetHintText0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetHintText0300 start====");

          let result: number = accessibilityNdk.SetHintText0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetHintText0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetHintText0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYTEXT_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityText0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityText0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityText0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYTEXT_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityText0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityText0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityText0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYTEXT_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityText0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityText0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0300 start====");

          let result: number = accessibilityNdk.SetAccessibilityText0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityText0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYDESCRIPTION_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0100 start====");

          let result: number = accessibilityNdk.SetAccessibilityDescription0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0100
                        result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYDESCRIPTION_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0200 start====");

          let result: number = accessibilityNdk.SetAccessibilityDescription0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0200
                        result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0200 " +
                        "catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYDESCRIPTION_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0300 start====");

          let result: number = accessibilityNdk.SetAccessibilityDescription0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0300
                        result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityDescription0300 " +
            "catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHILDNODEIDS_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChildNodeIds0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChildNodeIds0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0100 start====");

          let result: number = accessibilityNdk.SetChildNodeIds0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHILDNODEIDS_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChildNodeIds0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChildNodeIds0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0200 start====");

          let result: number = accessibilityNdk.SetChildNodeIds0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHILDNODEIDS_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChildNodeIds0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChildNodeIds0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0300 start====");

          let result: number = accessibilityNdk.SetChildNodeIds0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHILDNODEIDS_0400
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChildNodeIds0400
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChildNodeIds0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0400 start====");

          let result: number = accessibilityNdk.SetChildNodeIds0400();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0400 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChildNodeIds0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETOPERATIONACTIONS_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetOperationActions0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetOperationActions0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetOperationActions0100 start====");

          let result: number = accessibilityNdk.SetOperationActions0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetOperationActions0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetOperationActions0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETOPERATIONACTIONS_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetOperationActions0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetOperationActions0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetOperationActions0200 start====");

          let result: number = accessibilityNdk.SetOperationActions0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetOperationActions0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetOperationActions0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETOPERATIONACTIONS_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetOperationActions0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetOperationActions0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetOperationActions0300 start====");

          let result: number = accessibilityNdk.SetOperationActions0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetOperationActions0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetOperationActions0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETOPERATIONACTIONS_0400
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetOperationActions0400
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetOperationActions0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetOperationActions0400 start====");

          let result: number = accessibilityNdk.SetOperationActions0400();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetOperationActions0400 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetOperationActions0400 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSCREENRECT_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetScreenRect0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetScreenRect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetScreenRect0100 start====");

          let result: number = accessibilityNdk.SetScreenRect0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetScreenRect0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetScreenRect0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSCREENRECT_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetScreenRect0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetScreenRect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetScreenRect0200 start====");

          let result: number = accessibilityNdk.SetScreenRect0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetScreenRect0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetScreenRect0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSCREENRECT_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetScreenRect0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetScreenRect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetScreenRect0300 start====");

          let result: number = accessibilityNdk.SetScreenRect0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetScreenRect0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetScreenRect0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}