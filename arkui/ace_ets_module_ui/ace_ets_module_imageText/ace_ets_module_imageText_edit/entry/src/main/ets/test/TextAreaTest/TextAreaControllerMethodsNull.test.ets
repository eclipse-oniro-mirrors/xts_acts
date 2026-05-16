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

export default function TextAreaControllerMethodsNullTest() {
  describe('TextAreaControllerMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextAreaControllerMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextArea/TextAreaControllerMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaControllerMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaControllerMethodsNull" == pages.name)) {
          console.info("get TextAreaControllerMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaControllerMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaControllerMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== caretPosition 方法测试 ====================

    /**
     * @tc.name   textAreaCaretPositionNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETPOSITION_NULL_PARAM_001
     * @tc.desc   Test TextAreaController caretPosition method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaCaretPositionNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaCaretPositionNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_caretPosition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaCaretPositionNull_0100 END');
    });

    /**
     * @tc.name   textAreaCaretPositionUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETPOSITION_UNDEFINED_PARAM_001
     * @tc.desc   Test TextAreaController caretPosition method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaCaretPositionUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaCaretPositionUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_caretPosition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaCaretPositionUndefined_0100 END');
    });

    // ==================== setTextSelection 方法测试 ====================

    /**
     * @tc.name   textAreaSetTextSelectionStartNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SETTEXTSELECTION_START_NULL_PARAM_001
     * @tc.desc   Test TextAreaController setTextSelection method with null selectionStart parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaSetTextSelectionStartNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionStartNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_setTextSelection_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionStartNull_0100 END');
    });

    /**
     * @tc.name   textAreaSetTextSelectionStartUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SETTEXTSELECTION_START_UNDEFINED_PARAM_001
     * @tc.desc   Test TextAreaController setTextSelection method with undefined selectionStart parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaSetTextSelectionStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_setTextSelection_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionStartUndefined_0100 END');
    });

    /**
     * @tc.name   textAreaSetTextSelectionEndNull_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SETTEXTSELECTION_END_NULL_PARAM_001
     * @tc.desc   Test TextAreaController setTextSelection method with null selectionEnd parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaSetTextSelectionEndNull_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionEndNull_0100 START');

      let strJson: string = getInspectorByKey('textArea_setTextSelection_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionEndNull_0100 END');
    });

    /**
     * @tc.name   textAreaSetTextSelectionEndUndefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SETTEXTSELECTION_END_UNDEFINED_PARAM_001
     * @tc.desc   Test TextAreaController setTextSelection method with undefined selectionEnd parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textAreaSetTextSelectionEndUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionEndUndefined_0100 START');

      let strJson: string = getInspectorByKey('textArea_setTextSelection_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextArea');
      console.info('TextAreaControllerMethodsNullTest', 'textAreaSetTextSelectionEndUndefined_0100 END');
    });
  });
}
