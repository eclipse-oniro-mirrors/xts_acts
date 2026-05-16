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

export default function TextAreaMethodsNullTest() {
  describe('TextAreaMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaMethodsNull" == pages.name)) {
          console.info("get TextAreaMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== onTextSelectionChange 方法测试 ====================

    /**
     * @tc.name   textAreaOnTextSelectionChangeNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONTEXTSELECTIONCHANGE_NULL_PARAM_001
     * @tc.desc   Test TextArea onTextSelectionChange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnTextSelectionChangeNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnTextSelectionChangeNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_onTextSelectionChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnTextSelectionChangeNull_0100 END');
    });

    /**
     * @tc.name   textAreaOnTextSelectionChangeUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONTEXTSELECTIONCHANGE_UNDEFINED_PARAM_001
     * @tc.desc   Test TextArea onTextSelectionChange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnTextSelectionChangeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnTextSelectionChangeUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_onTextSelectionChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnTextSelectionChangeUndefined_0100 END');
    });

    // ==================== showCounter 方法测试 ====================

    /**
     * @tc.name   textAreaShowCounterNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHOWCOUNTER_NULL_PARAM_001
     * @tc.desc   Test TextArea showCounter method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaShowCounterNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaShowCounterNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_showCounter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.showCounter.value).assertEqual(false);
      console.info('TextAreaMethodsNullTest', 'textAreaShowCounterNull_0100 END');
    });

    /**
     * @tc.name   textAreaShowCounterUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SHOWCOUNTER_UNDEFINED_PARAM_001
     * @tc.desc   Test TextArea showCounter method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaShowCounterUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaShowCounterUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_showCounter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.showCounter.value).assertEqual(false);
      console.info('TextAreaMethodsNullTest', 'textAreaShowCounterUndefined_0100 END');
    });

    // ==================== customKeyboard 方法测试 ====================

    /**
     * @tc.name   textAreaCustomKeyboardNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CUSTOMKEYBOARD_NULL_PARAM_001
     * @tc.desc   Test TextArea customKeyboard method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaCustomKeyboardNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaCustomKeyboardNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_customKeyboard_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaCustomKeyboardNull_0100 END');
    });

    /**
     * @tc.name   textAreaCustomKeyboardUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CUSTOMKEYBOARD_UNDEFINED_PARAM_001
     * @tc.desc   Test TextArea customKeyboard method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaCustomKeyboardUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaCustomKeyboardUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_customKeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaCustomKeyboardUndefined_0100 END');
    });

    // ==================== onWillChange 方法测试 ====================

    /**
     * @tc.name   textAreaOnWillChangeNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONWILLCHANGE_NULL_PARAM_001
     * @tc.desc   Test TextArea onWillChange method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnWillChangeNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillChangeNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_onWillChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillChangeNull_0100 END');
    });

    /**
     * @tc.name   textAreaOnWillChangeUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONWILLCHANGE_UNDEFINED_PARAM_001
     * @tc.desc   Test TextArea onWillChange method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnWillChangeUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillChangeUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_onWillChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillChangeUndefined_0100 END');
    });

    // ==================== onWillAttachIME 方法测试 ====================

    /**
     * @tc.name   textAreaOnWillAttachIMENull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONWILLATTACHIME_NULL_PARAM_001
     * @tc.desc   Test TextArea onWillAttachIME method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnWillAttachIMENull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillAttachIMENull_0100 START');

      let strJson: string = getInspectorByKey('textArea_onWillAttachIME_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillAttachIMENull_0100 END');
    });

    /**
     * @tc.name   textAreaOnWillAttachIMEUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ONWILLATTACHIME_UNDEFINED_PARAM_001
     * @tc.desc   Test TextArea onWillAttachIME method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaOnWillAttachIMEUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillAttachIMEUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_onWillAttachIME_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaMethodsNullTest', 'textAreaOnWillAttachIMEUndefined_0100 END');
    });
  });
}
