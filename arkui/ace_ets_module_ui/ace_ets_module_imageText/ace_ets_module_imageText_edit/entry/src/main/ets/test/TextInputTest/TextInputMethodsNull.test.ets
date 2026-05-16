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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextInputMethodsNullTest() {
  describe('TextInputMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextInputMethodsNull" == pages.name)) {
          console.info("get TextInputMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== contentType 方法测试 ====================

    /**
     * @tc.name   textInputContentTypeNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_NULL_PARAM_001
     * @tc.desc   Test TextInput contentType method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputContentTypeNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputContentTypeNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_contentType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.contentType).assertContain('ContentType');
      console.info('TextInputMethodsNullTest', 'textInputContentTypeNull_0100 END');
    });

    /**
     * @tc.name   textInputContentTypeUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CONTENTTYPE_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInput contentType method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputContentTypeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputContentTypeUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_contentType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.contentType).assertContain('ContentType');
      console.info('TextInputMethodsNullTest', 'textInputContentTypeUndefined_0100 END');
    });

    // ==================== onTextSelectionChange 方法测试 ====================

    /**
     * @tc.name   textInputOnTextSelectionChangeNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONTEXTSELECTIONCHANGE_NULL_PARAM_001
     * @tc.desc   Test TextInput onTextSelectionChange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputOnTextSelectionChangeNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputOnTextSelectionChangeNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_onTextSelectionChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputOnTextSelectionChangeNull_0100 END');
    });

    /**
     * @tc.name   textInputOnTextSelectionChangeUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONTEXTSELECTIONCHANGE_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInput onTextSelectionChange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputOnTextSelectionChangeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputOnTextSelectionChangeUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_onTextSelectionChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputOnTextSelectionChangeUndefined_0100 END');
    });

    // ==================== customKeyboard 方法测试 ====================

    /**
     * @tc.name   textInputCustomKeyboardNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CUSTOMKEYBOARD_NULL_PARAM_001
     * @tc.desc   Test TextInput customKeyboard method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputCustomKeyboardNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputCustomKeyboardNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_customKeyboard_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputCustomKeyboardNull_0100 END');
    });

    /**
     * @tc.name   textInputCustomKeyboardUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CUSTOMKEYBOARD_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInput customKeyboard method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputCustomKeyboardUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputCustomKeyboardUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_customKeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputCustomKeyboardUndefined_0100 END');
    });

    // ==================== showCounter 方法测试 ====================

    /**
     * @tc.name   textInputShowCounterNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWCOUNTER_NULL_PARAM_001
     * @tc.desc   Test TextInput showCounter method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputShowCounterNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputShowCounterNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_showCounter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.showCounter.value).assertEqual(false);
      console.info('TextInputMethodsNullTest', 'textInputShowCounterNull_0100 END');
    });

    /**
     * @tc.name   textInputShowCounterUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWCOUNTER_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInput showCounter method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputShowCounterUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputShowCounterUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_showCounter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.showCounter.value).assertEqual(false);
      console.info('TextInputMethodsNullTest', 'textInputShowCounterUndefined_0100 END');
    });

    // ==================== onWillChange 方法测试 ====================

    /**
     * @tc.name   textInputOnWillChangeNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONWILLCHANGE_NULL_PARAM_001
     * @tc.desc   Test TextInput onWillChange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputOnWillChangeNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputOnWillChangeNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_onWillChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputOnWillChangeNull_0100 END');
    });

    /**
     * @tc.name   textInputOnWillChangeUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ONWILLCHANGE_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInput onWillChange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputOnWillChangeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputMethodsNullTest', 'textInputOnWillChangeUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_onWillChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputMethodsNullTest', 'textInputOnWillChangeUndefined_0100 END');
    });
  });
}
