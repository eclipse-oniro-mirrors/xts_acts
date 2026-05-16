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

export default function RichEditorOtherOptionsNullTest() {
  describe('RichEditorOtherOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOtherOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorOtherOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOtherOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorOtherOptionsNull" == pages.name)) {
          console.info("get RichEditorOtherOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorOtherOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOtherOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== undoStyle 属性测试 ====================

    /**
     * @tc.name   richEditorUndoStyleNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UNDOSTYLE_NULL_PARAM_001
     * @tc.desc   Test RichEditor undoStyle property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUndoStyleNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorUndoStyleNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_undoStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.undoStyle).assertEqual(objDefault.$attrs.undoStyle);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorUndoStyleNull_0100 END');
    });

    /**
     * @tc.name   richEditorUndoStyleUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UNDOSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor undoStyle property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUndoStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorUndoStyleUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_undoStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.undoStyle).assertEqual(objDefault.$attrs.undoStyle);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorUndoStyleUndefined_0100 END');
    });

    // ==================== singleLine 属性测试 ====================

    /**
     * @tc.name   richEditorSingleLineNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SINGLELINE_NULL_PARAM_001
     * @tc.desc   Test RichEditor singleLine property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSingleLineNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorSingleLineNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_singleLine_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.singleLine).assertEqual(objDefault.$attrs.singleLine);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorSingleLineNull_0100 END');
    });

    /**
     * @tc.name   richEditorSingleLineUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SINGLELINE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor singleLine property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSingleLineUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorSingleLineUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_singleLine_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.singleLine).assertEqual(objDefault.$attrs.singleLine);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorSingleLineUndefined_0100 END');
    });

    // ==================== selectedDragPreviewStyle 属性测试 ====================

    /**
     * @tc.name   richEditorSelectedDragPreviewStyleNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SELECTEDDRAGPREVIEWSTYLE_NULL_PARAM_001
     * @tc.desc   Test RichEditor selectedDragPreviewStyle property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSelectedDragPreviewStyleNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorSelectedDragPreviewStyleNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_selectedDragPreviewStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objDefault.$attrs.selectedDragPreviewStyle);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorSelectedDragPreviewStyleNull_0100 END');
    });

    /**
     * @tc.name   richEditorSelectedDragPreviewStyleUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SELECTEDDRAGPREVIEWSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor selectedDragPreviewStyle property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSelectedDragPreviewStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorSelectedDragPreviewStyleUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_selectedDragPreviewStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objDefault.$attrs.selectedDragPreviewStyle);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorSelectedDragPreviewStyleUndefined_0100 END');
    });

    // ==================== compressLeadingPunctuation 属性测试 ====================

    /**
     * @tc.name   richEditorCompressLeadingPunctuationNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_COMPRESSLEADINGPUNCTUATION_NULL_PARAM_001
     * @tc.desc   Test RichEditor compressLeadingPunctuation property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCompressLeadingPunctuationNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorCompressLeadingPunctuationNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_compressLeadingPunctuation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objDefault.$attrs.compressLeadingPunctuation);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorCompressLeadingPunctuationNull_0100 END');
    });

    /**
     * @tc.name   richEditorCompressLeadingPunctuationUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_COMPRESSLEADINGPUNCTUATION_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor compressLeadingPunctuation property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorCompressLeadingPunctuationUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorOtherOptionsNullTest', 'richEditorCompressLeadingPunctuationUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_otherOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_compressLeadingPunctuation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objDefault.$attrs.compressLeadingPunctuation);

      console.info('RichEditorOtherOptionsNullTest', 'richEditorCompressLeadingPunctuationUndefined_0100 END');
    });

    // ==================== RichEditorSpanType 枚举测试 ====================

    /**
     * @tc.name   richEditorSpanTypeIMAGE_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_RichEditorSpanType_IMAGE_001
     * @tc.desc   Test RichEditor RichEditorSpanType.IMAGE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSpanTypeIMAGE_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorSpanTypeIMAGE_0100 START');

      let strJson: string = getInspectorByKey('richEditor_RichEditorSpanType_IMAGE');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"spanType":1');

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorSpanTypeIMAGE_0100 END');
    });

    /**
     * @tc.name   richEditorSpanTypeMIXED_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_RichEditorSpanType_MIXED_001
     * @tc.desc   Test RichEditor RichEditorSpanType.MIXED
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSpanTypeMIXED_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpecialOptionsNullTest', 'richEditorSpanTypeMIXED_0100 START');

      let strJson: string = getInspectorByKey('richEditor_RichEditorSpanType_MIXED');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.bindSelectionMenu).assertContain('"spanType":2');

      console.info('RichEditorSpecialOptionsNullTest', 'richEditorSpanTypeMIXED_0100 END');
    });
  });
}
