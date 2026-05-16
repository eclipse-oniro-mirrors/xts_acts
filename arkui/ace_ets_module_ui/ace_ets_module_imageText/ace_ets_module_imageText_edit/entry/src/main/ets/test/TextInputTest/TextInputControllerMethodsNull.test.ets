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

export default function TextInputControllerMethodsNullTest() {
  describe('TextInputControllerMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextInputControllerMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextInput/TextInputControllerMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputControllerMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextInputControllerMethodsNull" == pages.name)) {
          console.info("get TextInputControllerMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextInputControllerMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputControllerMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== setTextSelection 方法测试 ====================

    /**
     * @tc.name   textInputSetTextSelectionStartNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SETTEXTSELECTION_START_NULL_PARAM_001
     * @tc.desc   Test TextInputController setTextSelection method with null selectionStart parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputSetTextSelectionStartNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionStartNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_setTextSelection_start_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionStartNull_0100 END');
    });

    /**
     * @tc.name   textInputSetTextSelectionStartUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SETTEXTSELECTION_START_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInputController setTextSelection method with undefined selectionStart parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputSetTextSelectionStartUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionStartUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_setTextSelection_start_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionStartUndefined_0100 END');
    });

    /**
     * @tc.name   textInputSetTextSelectionEndNull_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SETTEXTSELECTION_END_NULL_PARAM_001
     * @tc.desc   Test TextInputController setTextSelection method with null selectionEnd parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputSetTextSelectionEndNull_0100', Level.LEVEL1, async () => {
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionEndNull_0100 START');

      let strJson: string = getInspectorByKey('textInput_setTextSelection_end_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionEndNull_0100 END');
    });

    /**
     * @tc.name   textInputSetTextSelectionEndUndefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SETTEXTSELECTION_END_UNDEFINED_PARAM_001
     * @tc.desc   Test TextInputController setTextSelection method with undefined selectionEnd parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('textInputSetTextSelectionEndUndefined_0100', Level.LEVEL1, async () => {
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionEndUndefined_0100 START');

      let strJson: string = getInspectorByKey('textInput_setTextSelection_end_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('TextInput');
      console.info('TextInputControllerMethodsNullTest', 'textInputSetTextSelectionEndUndefined_0100 END');
    });
  });
}
