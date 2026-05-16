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

export default function RichEditorDataDetectorOptionsNullTest() {
  describe('RichEditorDataDetectorOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorDataDetectorOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorDataDetectorOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDataDetectorOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorDataDetectorOptionsNull" == pages.name)) {
          console.info("get RichEditorDataDetectorOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDataDetectorOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDataDetectorOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== dataDetectorConfig 属性测试 ====================

    /**
     * @tc.name   richEditorDataDetectorConfigNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DATADETECTORCONFIG_NULL_PARAM_001
     * @tc.desc   Test RichEditor dataDetectorConfig property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDataDetectorConfigNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorDataDetectorConfigNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_dataDetectorConfig_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.dataDetectorConfig).assertEqual('');

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorDataDetectorConfigNull_0100 END');
    });

    /**
     * @tc.name   richEditorDataDetectorConfigUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_DATADETECTORCONFIG_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor dataDetectorConfig property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorDataDetectorConfigUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorDataDetectorConfigUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_dataDetectorConfig_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.dataDetectorConfig).assertEqual('');

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorDataDetectorConfigUndefined_0100 END');
    });

    // ==================== enableSelectedDataDetector 属性测试 ====================

    /**
     * @tc.name   richEditorEnableSelectedDataDetectorNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESELECTEDDATADETECTOR_NULL_PARAM_001
     * @tc.desc   Test RichEditor enableSelectedDataDetector property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableSelectedDataDetectorNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorEnableSelectedDataDetectorNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableSelectedDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objDefault.$attrs.enableSelectedDataDetector);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorEnableSelectedDataDetectorNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnableSelectedDataDetectorUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLESELECTEDDATADETECTOR_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enableSelectedDataDetector property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableSelectedDataDetectorUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorEnableSelectedDataDetectorUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableSelectedDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objDefault.$attrs.enableSelectedDataDetector);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorEnableSelectedDataDetectorUndefined_0100 END');
    });

    // ==================== placeholder 属性测试 ====================

    /**
     * @tc.name   richEditorPlaceholderNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PLACEHOLDER_NULL_PARAM_001
     * @tc.desc   Test RichEditor placeholder property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorPlaceholderNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_placeholder_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.placeholder).assertEqual(objDefault.$attrs.placeholder);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderNull_0100 END');
    });

    /**
     * @tc.name   richEditorPlaceholderUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PLACEHOLDER_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor placeholder property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorPlaceholderUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_placeholder_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.placeholder).assertEqual(objDefault.$attrs.placeholder);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorPlaceholderEmpty_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_PLACEHOLDER_EMPTY_PARAM_001
     * @tc.desc   Test RichEditor placeholder property with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorPlaceholderEmpty_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderEmpty_0100 START');

      let strJson: string = getInspectorByKey('richEditor_placeholder_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.placeholder).assertEqual('');

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorPlaceholderEmpty_0100 END');
    });

    // ==================== caretColor 属性测试 ====================

    /**
     * @tc.name   richEditorCaretColorNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_CARETCOLOR_NULL_PARAM_001
     * @tc.desc   Test RichEditor caretColor property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCaretColorNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorCaretColorNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_caretColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.caretColor).assertEqual(objDefault.$attrs.caretColor);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorCaretColorNull_0100 END');
    });

    /**
     * @tc.name   richEditorCaretColorUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_CARETCOLOR_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor caretColor property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCaretColorUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorCaretColorUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_caretColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.caretColor).assertEqual(objDefault.$attrs.caretColor);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorCaretColorUndefined_0100 END');
    });

    // ==================== selectedBackgroundColor 属性测试 ====================

    /**
     * @tc.name   richEditorSelectedBackgroundColorNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SELECTEDBACKGROUNDCOLOR_NULL_PARAM_001
     * @tc.desc   Test RichEditor selectedBackgroundColor property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSelectedBackgroundColorNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorSelectedBackgroundColorNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_selectedBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objDefault.$attrs.selectedBackgroundColor);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorSelectedBackgroundColorNull_0100 END');
    });

    /**
     * @tc.name   richEditorSelectedBackgroundColorUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SELECTEDBACKGROUNDCOLOR_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor selectedBackgroundColor property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSelectedBackgroundColorUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorSelectedBackgroundColorUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_dataDetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_selectedBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objDefault.$attrs.selectedBackgroundColor);

      console.info('RichEditorDataDetectorOptionsNullTest', 'richEditorSelectedBackgroundColorUndefined_0100 END');
    });
  });
}
