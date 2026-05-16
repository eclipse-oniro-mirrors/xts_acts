/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';

export default function TextInputPropertiesNullUndefined03Test() {
  describe('TextInputPropertiesNullUndefined03Test', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputPropertiesNullUndefined03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputPropertiesNullUndefined03Test state success " + JSON.stringify(pages));
        if (!("TextInputPropertiesNullUndefined03" == pages.name)) {
          console.info("get TextInputPropertiesNullUndefined03Test state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputPropertiesNullUndefined03Test page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputPropertiesNullUndefined03Test page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextInputPropertiesNullUndefined03Test after each called");
    });

    // ========== showPasswordIcon tests ==========

    /**
     * @tc.name   textInputShowPasswordIcon_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORDICON_TRUE_0100
     * @tc.desc   Test TextInput showPasswordIcon property with true, should display password icon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPasswordIcon_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPasswordIcon_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showPasswordIcon_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPasswordIcon_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPasswordIcon_true_0100] showPasswordIcon is: " + obj.$attrs.showPasswordIcon);

      expect(obj.$attrs.showPasswordIcon).assertEqual(true);
      console.info('[textInputShowPasswordIcon_true_0100] END');
    })

    /**
     * @tc.name   textInputShowPasswordIcon_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORDICON_FALSE_0100
     * @tc.desc   Test TextInput showPasswordIcon property with false, should not display password icon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPasswordIcon_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPasswordIcon_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showPasswordIcon_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPasswordIcon_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPasswordIcon_false_0100] showPasswordIcon is: " + obj.$attrs.showPasswordIcon);

      expect(obj.$attrs.showPasswordIcon).assertEqual(false);
      console.info('[textInputShowPasswordIcon_false_0100] END');
    })

    /**
     * @tc.name   textInputShowPasswordIcon_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORDICON_NULL_0100
     * @tc.desc   Test TextInput showPasswordIcon property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPasswordIcon_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPasswordIcon_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showPasswordIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showPasswordIcon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPasswordIcon_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowPasswordIcon_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPasswordIcon_null_0100] default showPasswordIcon is: " + objCompare.$attrs.showPasswordIcon);
      console.info("[textInputShowPasswordIcon_null_0100] null showPasswordIcon is: " + obj.$attrs.showPasswordIcon);

      // null 应该恢复为默认值
      expect(obj.$attrs.showPasswordIcon).assertEqual(objCompare.$attrs.showPasswordIcon);
      console.info('[textInputShowPasswordIcon_null_0100] END');
    })

    /**
     * @tc.name   textInputShowPasswordIcon_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORDICON_UNDEFINED_0100
     * @tc.desc   Test TextInput showPasswordIcon property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPasswordIcon_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPasswordIcon_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showPasswordIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showPasswordIcon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPasswordIcon_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowPasswordIcon_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPasswordIcon_undefined_0100] default showPasswordIcon is: " + objCompare.$attrs.showPasswordIcon);
      console.info("[textInputShowPasswordIcon_undefined_0100] undefined showPasswordIcon is: " + obj.$attrs.showPasswordIcon);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.showPasswordIcon).assertEqual(objCompare.$attrs.showPasswordIcon);
      console.info('[textInputShowPasswordIcon_undefined_0100] END');
    })

    // ========== showUnderline tests ==========

    /**
     * @tc.name   textInputShowUnderline_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNDERLINE_TRUE_0100
     * @tc.desc   Test TextInput showUnderline property with true, should display underline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnderline_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnderline_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showUnderline_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnderline_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnderline_true_0100] showUnderline is: " + obj.$attrs.showUnderline);

      expect(obj.$attrs.showUnderline).assertEqual(true);
      console.info('[textInputShowUnderline_true_0100] END');
    })

    /**
     * @tc.name   textInputShowUnderline_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNDERLINE_FALSE_0100
     * @tc.desc   Test TextInput showUnderline property with false, should not display underline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnderline_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnderline_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showUnderline_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnderline_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnderline_false_0100] showUnderline is: " + obj.$attrs.showUnderline);

      expect(obj.$attrs.showUnderline).assertEqual(false);
      console.info('[textInputShowUnderline_false_0100] END');
    })

    /**
     * @tc.name   textInputShowUnderline_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNDERLINE_NULL_0100
     * @tc.desc   Test TextInput showUnderline property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnderline_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnderline_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showUnderline_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showUnderline_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnderline_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowUnderline_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnderline_null_0100] default showUnderline is: " + objCompare.$attrs.showUnderline);
      console.info("[textInputShowUnderline_null_0100] null showUnderline is: " + obj.$attrs.showUnderline);

      // null 应该恢复为默认值
      expect(obj.$attrs.showUnderline).assertEqual(objCompare.$attrs.showUnderline);
      console.info('[textInputShowUnderline_null_0100] END');
    })

    /**
     * @tc.name   textInputShowUnderline_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNDERLINE_UNDEFINED_0100
     * @tc.desc   Test TextInput showUnderline property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnderline_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnderline_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showUnderline_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showUnderline_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnderline_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowUnderline_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnderline_undefined_0100] default showUnderline is: " + objCompare.$attrs.showUnderline);
      console.info("[textInputShowUnderline_undefined_0100] undefined showUnderline is: " + obj.$attrs.showUnderline);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.showUnderline).assertEqual(objCompare.$attrs.showUnderline);
      console.info('[textInputShowUnderline_undefined_0100] END');
    })

    // ========== enableAutoFill tests ==========

    /**
     * @tc.name   textInputEnableAutoFill_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILL_TRUE_0100
     * @tc.desc   Test TextInput enableAutoFill property with true, should enable auto fill
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFill_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFill_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enableAutoFill_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFill_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFill_true_0100] enableAutoFill is: " + obj.$attrs.enableAutoFill);

      expect(obj.$attrs.enableAutoFill).assertEqual(true);
      console.info('[textInputEnableAutoFill_true_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoFill_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILL_FALSE_0100
     * @tc.desc   Test TextInput enableAutoFill property with false, should disable auto fill
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFill_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFill_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enableAutoFill_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFill_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFill_false_0100] enableAutoFill is: " + obj.$attrs.enableAutoFill);

      expect(obj.$attrs.enableAutoFill).assertEqual(false);
      console.info('[textInputEnableAutoFill_false_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoFill_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILL_NULL_0100
     * @tc.desc   Test TextInput enableAutoFill property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFill_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFill_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoFill_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoFill_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFill_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoFill_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFill_null_0100] default enableAutoFill is: " + objCompare.$attrs.enableAutoFill);
      console.info("[textInputEnableAutoFill_null_0100] null enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoFill).assertEqual(objCompare.$attrs.enableAutoFill);
      console.info('[textInputEnableAutoFill_null_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoFill_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILL_UNDEFINED_0100
     * @tc.desc   Test TextInput enableAutoFill property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFill_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFill_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoFill_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoFill_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFill_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoFill_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFill_undefined_0100] default enableAutoFill is: " + objCompare.$attrs.enableAutoFill);
      console.info("[textInputEnableAutoFill_undefined_0100] undefined enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoFill).assertEqual(objCompare.$attrs.enableAutoFill);
      console.info('[textInputEnableAutoFill_undefined_0100] END');
    })

    // ========== showPassword tests ==========

    /**
     * @tc.name   textInputShowPassword_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORD_TRUE_0100
     * @tc.desc   Test TextInput showPassword property with true, should show password
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPassword_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPassword_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showPassword_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPassword_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPassword_true_0100] showPassword is: " + obj.$attrs.showPassword);

      expect(obj.$attrs.showPassword).assertEqual(true);
      console.info('[textInputShowPassword_true_0100] END');
    })

    /**
     * @tc.name   textInputShowPassword_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORD_FALSE_0100
     * @tc.desc   Test TextInput showPassword property with false, should hide password
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPassword_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPassword_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_showPassword_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPassword_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPassword_false_0100] showPassword is: " + obj.$attrs.showPassword);

      expect(obj.$attrs.showPassword).assertEqual(false);
      console.info('[textInputShowPassword_false_0100] END');
    })

    /**
     * @tc.name   textInputShowPassword_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORD_NULL_0100
     * @tc.desc   Test TextInput showPassword property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPassword_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPassword_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showPassword_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showPassword_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPassword_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowPassword_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPassword_null_0100] default showPassword is: " + objCompare.$attrs.showPassword);
      console.info("[textInputShowPassword_null_0100] null showPassword is: " + obj.$attrs.showPassword);

      // null 应该恢复为默认值
      expect(obj.$attrs.showPassword).assertEqual(objCompare.$attrs.showPassword);
      console.info('[textInputShowPassword_null_0100] END');
    })

    /**
     * @tc.name   textInputShowPassword_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWPASSWORD_UNDEFINED_0100
     * @tc.desc   Test TextInput showPassword property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowPassword_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowPassword_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showPassword_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showPassword_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowPassword_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowPassword_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowPassword_undefined_0100] default showPassword is: " + objCompare.$attrs.showPassword);
      console.info("[textInputShowPassword_undefined_0100] undefined showPassword is: " + obj.$attrs.showPassword);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.showPassword).assertEqual(objCompare.$attrs.showPassword);
      console.info('[textInputShowPassword_undefined_0100] END');
    })

    // ========== enablePreviewText tests ==========

    /**
     * @tc.name   textInputEnablePreviewText_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEPREVIEWTEXT_TRUE_0100
     * @tc.desc   Test TextInput enablePreviewText property with true, should enable preview text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnablePreviewText_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnablePreviewText_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enablePreviewText_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnablePreviewText_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnablePreviewText_true_0100] enablePreviewText is: " + obj.$attrs.enablePreviewText);

      expect(obj.$attrs.enablePreviewText).assertEqual(true);
      console.info('[textInputEnablePreviewText_true_0100] END');
    })

    /**
     * @tc.name   textInputEnablePreviewText_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEPREVIEWTEXT_FALSE_0100
     * @tc.desc   Test TextInput enablePreviewText property with false, should disable preview text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnablePreviewText_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnablePreviewText_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enablePreviewText_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnablePreviewText_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnablePreviewText_false_0100] enablePreviewText is: " + obj.$attrs.enablePreviewText);

      expect(obj.$attrs.enablePreviewText).assertEqual(false);
      console.info('[textInputEnablePreviewText_false_0100] END');
    })

    /**
     * @tc.name   textInputEnablePreviewText_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEPREVIEWTEXT_NULL_0100
     * @tc.desc   Test TextInput enablePreviewText property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnablePreviewText_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnablePreviewText_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enablePreviewText_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enablePreviewText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnablePreviewText_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnablePreviewText_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnablePreviewText_null_0100] default enablePreviewText is: " + objCompare.$attrs.enablePreviewText);
      console.info("[textInputEnablePreviewText_null_0100] null enablePreviewText is: " + obj.$attrs.enablePreviewText);

      // null 应该恢复为默认值
      expect(obj.$attrs.enablePreviewText).assertEqual(objCompare.$attrs.enablePreviewText);
      console.info('[textInputEnablePreviewText_null_0100] END');
    })

    /**
     * @tc.name   textInputEnablePreviewText_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEPREVIEWTEXT_UNDEFINED_0100
     * @tc.desc   Test TextInput enablePreviewText property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnablePreviewText_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnablePreviewText_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enablePreviewText_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enablePreviewText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnablePreviewText_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnablePreviewText_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnablePreviewText_undefined_0100] default enablePreviewText is: " + objCompare.$attrs.enablePreviewText);
      console.info("[textInputEnablePreviewText_undefined_0100] undefined enablePreviewText is: " + obj.$attrs.enablePreviewText);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enablePreviewText).assertEqual(objCompare.$attrs.enablePreviewText);
      console.info('[textInputEnablePreviewText_undefined_0100] END');
    })

    // ========== enableHapticFeedback tests ==========

    /**
     * @tc.name   textInputEnableHapticFeedback_true_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEHAPTICFEEDBACK_TRUE_0100
     * @tc.desc   Test TextInput enableHapticFeedback property with true, should enable haptic feedback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableHapticFeedback_true_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableHapticFeedback_true_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enableHapticFeedback_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableHapticFeedback_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableHapticFeedback_true_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[textInputEnableHapticFeedback_true_0100] END');
    })

    /**
     * @tc.name   textInputEnableHapticFeedback_false_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEHAPTICFEEDBACK_FALSE_0100
     * @tc.desc   Test TextInput enableHapticFeedback property with false, should disable haptic feedback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableHapticFeedback_false_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableHapticFeedback_false_0100] START');

      let strJson: string = getInspectorByKey('TextInput_enableHapticFeedback_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableHapticFeedback_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableHapticFeedback_false_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[textInputEnableHapticFeedback_false_0100] END');
    })

    /**
     * @tc.name   textInputEnableHapticFeedback_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEHAPTICFEEDBACK_NULL_0100
     * @tc.desc   Test TextInput enableHapticFeedback property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableHapticFeedback_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableHapticFeedback_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableHapticFeedback_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableHapticFeedback_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableHapticFeedback_null_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[textInputEnableHapticFeedback_null_0100] null enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[textInputEnableHapticFeedback_null_0100] END');
    })

    /**
     * @tc.name   textInputEnableHapticFeedback_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEHAPTICFEEDBACK_UNDEFINED_0100
     * @tc.desc   Test TextInput enableHapticFeedback property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableHapticFeedback_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableHapticFeedback_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableHapticFeedback_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableHapticFeedback_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableHapticFeedback_undefined_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[textInputEnableHapticFeedback_undefined_0100] undefined enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[textInputEnableHapticFeedback_undefined_0100] END');
    })
  })
}
