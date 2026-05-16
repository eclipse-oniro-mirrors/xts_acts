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

export default function RichEditorInputOptionsNullTest() {
  describe('RichEditorInputOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorInputOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorInputOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorInputOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorInputOptionsNull" == pages.name)) {
          console.info("get RichEditorInputOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorInputOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorInputOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== enterKeyType 属性测试 ====================

    /**
     * @tc.name   richEditorEnterKeyTypeNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENTERKEYTYPE_NULL_PARAM_001
     * @tc.desc   Test RichEditor enterKeyType property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnterKeyTypeNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEnterKeyTypeNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enterKeyType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enterKeyType).assertEqual(objDefault.$attrs.enterKeyType);

      console.info('RichEditorInputOptionsNullTest', 'richEditorEnterKeyTypeNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnterKeyTypeUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENTERKEYTYPE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enterKeyType property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnterKeyTypeUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEnterKeyTypeUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enterKeyType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enterKeyType).assertEqual(objDefault.$attrs.enterKeyType);

      console.info('RichEditorInputOptionsNullTest', 'richEditorEnterKeyTypeUndefined_0100 END');
    });

    // ==================== barState 属性测试 ====================

    /**
     * @tc.name   richEditorBarStateNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BARSTATE_NULL_PARAM_001
     * @tc.desc   Test RichEditor barState property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorBarStateNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorBarStateNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_barState_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.barState).assertEqual(objDefault.$attrs.barState);

      console.info('RichEditorInputOptionsNullTest', 'richEditorBarStateNull_0100 END');
    });

    /**
     * @tc.name   richEditorBarStateUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BARSTATE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor barState property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorBarStateUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorBarStateUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_barState_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.barState).assertEqual(objDefault.$attrs.barState);

      console.info('RichEditorInputOptionsNullTest', 'richEditorBarStateUndefined_0100 END');
    });

    // ==================== enableHapticFeedback 属性测试 ====================

    /**
     * @tc.name   richEditorEnableHapticFeedbackNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEHAPTICFEEDBACK_NULL_PARAM_001
     * @tc.desc   Test RichEditor enableHapticFeedback property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableHapticFeedbackNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEnableHapticFeedbackNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objDefault.$attrs.enableHapticFeedback);

      console.info('RichEditorInputOptionsNullTest', 'richEditorEnableHapticFeedbackNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnableHapticFeedbackUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEHAPTICFEEDBACK_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enableHapticFeedback property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableHapticFeedbackUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEnableHapticFeedbackUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objDefault.$attrs.enableHapticFeedback);

      console.info('RichEditorInputOptionsNullTest', 'richEditorEnableHapticFeedbackUndefined_0100 END');
    });

    // ==================== editMenuOptions 属性测试 ====================

    /**
     * @tc.name   richEditorEditMenuOptionsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_EDITMENUOPTIONS_NULL_PARAM_001
     * @tc.desc   Test RichEditor editMenuOptions property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEditMenuOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEditMenuOptionsNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_editMenuOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.editMenuOptions).assertUndefined();

      console.info('RichEditorInputOptionsNullTest', 'richEditorEditMenuOptionsNull_0100 END');
    });

    /**
     * @tc.name   richEditorEditMenuOptionsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_EDITMENUOPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor editMenuOptions property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEditMenuOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorEditMenuOptionsUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_editMenuOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.editMenuOptions).assertUndefined();

      console.info('RichEditorInputOptionsNullTest', 'richEditorEditMenuOptionsUndefined_0100 END');
    });

    // ==================== onWillAttachIME 属性测试 ====================

    /**
     * @tc.name   richEditorOnWillAttachIMENull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ONWILLATTACHIME_NULL_PARAM_001
     * @tc.desc   Test RichEditor onWillAttachIME property with null parameter should clear callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorOnWillAttachIMENull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorOnWillAttachIMENull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_onWillAttachIME_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.onWillAttachIME).assertEqual(objDefault.$attrs.onWillAttachIME);

      console.info('RichEditorInputOptionsNullTest', 'richEditorOnWillAttachIMENull_0100 END');
    });

    /**
     * @tc.name   richEditorOnWillAttachIMEUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ONWILLATTACHIME_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor onWillAttachIME property with undefined parameter should clear callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorOnWillAttachIMEUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorInputOptionsNullTest', 'richEditorOnWillAttachIMEUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_inputOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_onWillAttachIME_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.onWillAttachIME).assertEqual(objDefault.$attrs.onWillAttachIME);

      console.info('RichEditorInputOptionsNullTest', 'richEditorOnWillAttachIMEUndefined_0100 END');
    });
  });
}
