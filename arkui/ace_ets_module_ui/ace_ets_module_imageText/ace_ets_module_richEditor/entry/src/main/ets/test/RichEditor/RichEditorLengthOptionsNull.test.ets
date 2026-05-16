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

export default function RichEditorLengthOptionsNullTest() {
  describe('RichEditorLengthOptionsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLengthOptionsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorLengthOptionsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLengthOptionsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorLengthOptionsNull" == pages.name)) {
          console.info("get RichEditorLengthOptionsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorLengthOptionsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLengthOptionsNullTest page error: " + err);
      }
      done();
    })

    // ==================== maxLength 属性测试 ====================

    /**
     * @tc.name   richEditorMaxLengthNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_MAXLENGTH_NULL_PARAM_001
     * @tc.desc   Test RichEditor maxLength property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorMaxLengthNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLengthNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_maxLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.maxLength).assertEqual(objDefault.$attrs.maxLength);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLengthNull_0100 END');
    });

    /**
     * @tc.name   richEditorMaxLengthUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_MAXLENGTH_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor maxLength property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorMaxLengthUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLengthUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_maxLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.maxLength).assertEqual(objDefault.$attrs.maxLength);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLengthUndefined_0100 END');
    });

    // ==================== maxLines 属性测试 ====================

    /**
     * @tc.name   richEditorMaxLinesNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_MAXLINES_NULL_PARAM_001
     * @tc.desc   Test RichEditor maxLines property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorMaxLinesNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLinesNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_maxLines_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(0).assertLess(obj.$attrs.maxLines);
      expect(0).assertLess(objDefault.$attrs.maxLines);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLinesNull_0100 END');
    });

    /**
     * @tc.name   richEditorMaxLinesUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_MAXLINES_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor maxLines property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorMaxLinesUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLinesUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_maxLines_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(0).assertLess(obj.$attrs.maxLines);
      expect(0).assertLess(objDefault.$attrs.maxLines);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorMaxLinesUndefined_0100 END');
    });

    // ==================== enableAutoSpacing 属性测试 ====================

    /**
     * @tc.name   richEditorEnableAutoSpacingNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEAUTOSPACING_NULL_PARAM_001
     * @tc.desc   Test RichEditor enableAutoSpacing property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableAutoSpacingNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorEnableAutoSpacingNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableAutoSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableAutoSpacing).assertEqual(objDefault.$attrs.enableAutoSpacing);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorEnableAutoSpacingNull_0100 END');
    });

    /**
     * @tc.name   richEditorEnableAutoSpacingUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ENABLEAUTOSPACING_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor enableAutoSpacing property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorEnableAutoSpacingUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorEnableAutoSpacingUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_enableAutoSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.enableAutoSpacing).assertEqual(objDefault.$attrs.enableAutoSpacing);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorEnableAutoSpacingUndefined_0100 END');
    });

    // ==================== keyboardAppearance 属性测试 ====================

    /**
     * @tc.name   richEditorKeyboardAppearanceNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_KEYBOARDAPPEARANCE_NULL_PARAM_001
     * @tc.desc   Test RichEditor keyboardAppearance property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorKeyboardAppearanceNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorKeyboardAppearanceNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_keyboardAppearance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.keyboardAppearance).assertEqual(objDefault.$attrs.keyboardAppearance);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorKeyboardAppearanceNull_0100 END');
    });

    /**
     * @tc.name   richEditorKeyboardAppearanceUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_KEYBOARDAPPEARANCE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor keyboardAppearance property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorKeyboardAppearanceUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorKeyboardAppearanceUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_keyboardAppearance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.keyboardAppearance).assertEqual(objDefault.$attrs.keyboardAppearance);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorKeyboardAppearanceUndefined_0100 END');
    });

    // ==================== stopBackPress 属性测试 ====================

    /**
     * @tc.name   richEditorStopBackPressNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STOPBACKPRESS_NULL_PARAM_001
     * @tc.desc   Test RichEditor stopBackPress property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorStopBackPressNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorStopBackPressNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_stopBackPress_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.stopBackPress).assertEqual(objDefault.$attrs.stopBackPress);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorStopBackPressNull_0100 END');
    });

    /**
     * @tc.name   richEditorStopBackPressUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_STOPBACKPRESS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor stopBackPress property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorStopBackPressUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorLengthOptionsNullTest', 'richEditorStopBackPressUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('richEditor_lengthOptions_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('richEditor_stopBackPress_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.stopBackPress).assertEqual(objDefault.$attrs.stopBackPress);

      console.info('RichEditorLengthOptionsNullTest', 'richEditorStopBackPressUndefined_0100 END');
    });
  });
}
