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

export default function RichEditorSpecialOptionsNullTest() {
  describe('RichEditorSpecialOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSpecialOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorSpecialOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSpecialOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorSpecialOptionsNull" == pages.name)) {
          console.info("get RichEditorSpecialOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorSpecialOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSpecialOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== copyOptions 属性测试 ====================

    /**
     * @tc.name   richEditorCopyOptionsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_COPYOPTIONS_NULL_PARAM_001
     * @tc.desc   Test RichEditor copyOptions property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCopyOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCopyOptionsNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_copyOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.copyOptions).assertEqual(objDefault.$attrs.copyOptions);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCopyOptionsNull_0100 END');
    });

    /**
     * @tc.name   richEditorCopyOptionsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_COPYOPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor copyOptions property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCopyOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCopyOptionsUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_copyOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.copyOptions).assertEqual(objDefault.$attrs.copyOptions);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCopyOptionsUndefined_0100 END');
    });

    // ==================== customKeyboard 属性测试 ====================

    /**
     * @tc.name   richEditorCustomKeyboardNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_CUSTOMKEYBOARD_NULL_PARAM_001
     * @tc.desc   Test RichEditor customKeyboard property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCustomKeyboardNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCustomKeyboardNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_customKeyboard_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.customKeyboard).assertEqual(objDefault.$attrs.customKeyboard);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCustomKeyboardNull_0100 END');
    });

    /**
     * @tc.name   richEditorCustomKeyboardUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_CUSTOMKEYBOARD_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor customKeyboard property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCustomKeyboardUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCustomKeyboardUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_customKeyboard_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.customKeyboard).assertEqual(objDefault.$attrs.customKeyboard);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorCustomKeyboardUndefined_0100 END');
    });

    // ==================== enableDataDetector 属性测试 ====================

    /**
     * @tc.name   richEditorEnableDataDetectorNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESDATADETECTOR_NULL_PARAM_001
     * @tc.desc   Test RichEditor enableDataDetector property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableDataDetectorNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnableDataDetectorNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableDataDetector).assertEqual(objDefault.$attrs.enableDataDetector);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnableDataDetectorNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnableDataDetectorUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESDATADETECTOR_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enableDataDetector property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableDataDetectorUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnableDataDetectorUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableDataDetector).assertEqual(objDefault.$attrs.enableDataDetector);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnableDataDetectorUndefined_0100 END');
    });

    // ==================== enablePreviewText 属性测试 ====================

    /**
     * @tc.name   richEditorEnablePreviewTextNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEPREVIEWTEXT_NULL_PARAM_001
     * @tc.desc   Test RichEditor enablePreviewText property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnablePreviewTextNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnablePreviewTextNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enablePreviewText_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enablePreviewText).assertEqual(objDefault.$attrs.enablePreviewText);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnablePreviewTextNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnablePreviewTextUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEPREVIEWTEXT_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enablePreviewText property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnablePreviewTextUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnablePreviewTextUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_specialOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enablePreviewText_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enablePreviewText).assertEqual(objDefault.$attrs.enablePreviewText);

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorEnablePreviewTextUndefined_0100 END');
    });

    // ==================== bindSelectionMenu 方法测试 ====================

    /**
     * @tc.name   richEditorBindSelectionMenuNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BINDSELECTIONMENU_NULL_PARAM_001
     * @tc.desc   Test RichEditor bindSelectionMenu method with null content parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorBindSelectionMenuNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorBindSelectionMenuNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_bindSelectionMenu_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"menuType":0');

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorBindSelectionMenuNull_0100 END');
    });

    /**
     * @tc.name   richEditorBindSelectionMenuUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_BINDSELECTIONMENU_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor bindSelectionMenu method with undefined content parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorBindSelectionMenuUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorBindSelectionMenuUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_bindSelectionMenu_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"menuType":0');

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorBindSelectionMenuUndefined_0100 END');
    });
  });
}
