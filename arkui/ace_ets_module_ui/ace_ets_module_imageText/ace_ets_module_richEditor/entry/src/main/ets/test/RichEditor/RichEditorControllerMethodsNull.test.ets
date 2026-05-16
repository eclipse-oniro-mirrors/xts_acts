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

export default function RichEditorControllerMethodsNullTest() {
  describe('RichEditorControllerMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorControllerMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorControllerMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorControllerMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorControllerMethodsNull" == pages.name)) {
          console.info("get RichEditorControllerMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorControllerMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorControllerMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== setCaretOffset 方法测试 ====================

    /**
     * @tc.name   richEditorSetCaretOffsetNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETCARETOFFSET_NULL_PARAM_001
     * @tc.desc   Test RichEditor setCaretOffset method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetCaretOffsetNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetCaretOffsetNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setCaretOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetCaretOffsetNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetCaretOffsetUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETCARETOFFSET_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setCaretOffset method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetCaretOffsetUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetCaretOffsetUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setCaretOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetCaretOffsetUndefined_0100 END');
    });

    // ==================== setTypingStyle 方法测试 ====================

    /**
     * @tc.name   richEditorSetTypingStyleNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETTYPINGSTYLE_NULL_PARAM_001
     * @tc.desc   Test RichEditor setTypingStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetTypingStyleNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingStyleNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setTypingStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingStyleNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetTypingStyleUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETTYPINGSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setTypingStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetTypingStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setTypingStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingStyleUndefined_0100 END');
    });

    // ==================== setTypingParagraphStyle 方法测试 ====================

    /**
     * @tc.name   richEditorSetTypingParagraphStyleNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETTYPINGPARAGRAPHSTYLE_NULL_PARAM_001
     * @tc.desc   Test RichEditor setTypingParagraphStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetTypingParagraphStyleNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingParagraphStyleNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setTypingParagraphStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingParagraphStyleNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetTypingParagraphStyleUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETTYPINGPARAGRAPHSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setTypingParagraphStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetTypingParagraphStyleUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingParagraphStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setTypingParagraphStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetTypingParagraphStyleUndefined_0100 END');
    });

    // ==================== setSelection 方法测试 ====================

    /**
     * @tc.name   richEditorSetSelectionBothNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_BOTH_NULL_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with both null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionBothNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionBothNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_both_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionBothNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionBothUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_BOTH_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with both undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionBothUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionBothUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_both_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionBothUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionStartNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_START_NULL_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with start null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionStartNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionStartNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionStartNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionStartUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_START_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with start undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionStartUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionEndNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_END_NULL_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with end null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionEndNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionEndNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionEndNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionEndUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_END_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with end undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionEndUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionEndUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionEndUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionOptionsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_OPTIONS_NULL_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with options null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionOptionsNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionOptionsNull_0100 END');
    });

    /**
     * @tc.name   richEditorSetSelectionOptionsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_SETSELECTION_OPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor setSelection method with options undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorSetSelectionOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionOptionsUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_setSelection_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$type).assertEqual('RichEditor');

      console.info('RichEditorControllerMethodsNullTest', 'richEditorSetSelectionOptionsUndefined_0100 END');
    });
  });
}
