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

export default function TextSpecialAttrsNullTest() {
  describe('TextSpecialAttrsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSpecialAttrsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextSpecialAttrsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSpecialAttrsNullTest state pages: " + JSON.stringify(pages));
        if (!("TextSpecialAttrsNull" == pages.name)) {
          console.info("get TextSpecialAttrsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSpecialAttrsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSpecialAttrsNullTest page error: " + err);
      }
      done();
    })

    // ==================== fallbackLineSpacing 属性测试 ====================

    /**
     * @tc.name   textFallbackLineSpacingNull_0100
     * @tc.number SUB_ARKUI_TEXT_FALLBACKLINESPACING_NULL_PARAM_001
     * @tc.desc   Test Text fallbackLineSpacing property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFallbackLineSpacingNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textFallbackLineSpacingNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialAttrs_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_fallbackLineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objDefault.$attrs.fallbackLineSpacing);

      console.info('TextSpecialAttrsNullTest', 'textFallbackLineSpacingNull_0100 END');
    });

    /**
     * @tc.name   textFallbackLineSpacingUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_FALLBACKLINESPACING_UNDEFINED_PARAM_001
     * @tc.desc   Test Text fallbackLineSpacing property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textFallbackLineSpacingUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textFallbackLineSpacingUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialAttrs_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_fallbackLineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objDefault.$attrs.fallbackLineSpacing);

      console.info('TextSpecialAttrsNullTest', 'textFallbackLineSpacingUndefined_0100 END');
    });

    // ==================== compressLeadingPunctuation 属性测试 ====================

    /**
     * @tc.name   textCompressLeadingPunctuationNull_0100
     * @tc.number SUB_ARKUI_TEXT_COMPRESSLEADINGPUNCTUATION_NULL_PARAM_001
     * @tc.desc   Test Text compressLeadingPunctuation property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textCompressLeadingPunctuationNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textCompressLeadingPunctuationNull_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialAttrs_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_compressLeadingPunctuation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objDefault.$attrs.compressLeadingPunctuation);

      console.info('TextSpecialAttrsNullTest', 'textCompressLeadingPunctuationNull_0100 END');
    });

    /**
     * @tc.name   textCompressLeadingPunctuationUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_COMPRESSLEADINGPUNCTUATION_UNDEFINED_PARAM_001
     * @tc.desc   Test Text compressLeadingPunctuation property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textCompressLeadingPunctuationUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textCompressLeadingPunctuationUndefined_0100 START');

      let strJsonDefault: string = getInspectorByKey('text_specialAttrs_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      let strJson: string = getInspectorByKey('text_compressLeadingPunctuation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objDefault.$attrs.compressLeadingPunctuation);

      console.info('TextSpecialAttrsNullTest', 'textCompressLeadingPunctuationUndefined_0100 END');
    });

    // ==================== selectedDragPreviewStyle 属性测试 ====================

    /**
     * @tc.name   textSelectedDragPreviewStyleNull_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTEDDRAGPREVIEWSTYLE_NULL_PARAM_001
     * @tc.desc   Test Text selectedDragPreviewStyle property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textSelectedDragPreviewStyleNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textSelectedDragPreviewStyleNull_0100 START');

      let strJson: string = getInspectorByKey('text_selectedDragPreviewStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedDragPreviewStyle).assertContain('#');

      console.info('TextSpecialAttrsNullTest', 'textSelectedDragPreviewStyleNull_0100 END');
    });

    /**
     * @tc.name   textSelectedDragPreviewStyleUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTEDDRAGPREVIEWSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text selectedDragPreviewStyle property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textSelectedDragPreviewStyleUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textSelectedDragPreviewStyleUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_selectedDragPreviewStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.selectedDragPreviewStyle).assertContain('#');

      console.info('TextSpecialAttrsNullTest', 'textSelectedDragPreviewStyleUndefined_0100 END');
    });

    // ==================== textDirection 属性测试 ====================

    /**
     * @tc.name   textTextDirectionNull_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTDIRECTION_NULL_PARAM_001
     * @tc.desc   Test Text textDirection property with null parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextDirectionNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textTextDirectionNull_0100 START');

      let strJson: string = getInspectorByKey('text_textDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.textDirection).assertEqual('DEFAULT');

      console.info('TextSpecialAttrsNullTest', 'textTextDirectionNull_0100 END');
    });

    /**
     * @tc.name   textTextDirectionUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_TEXTDIRECTION_UNDEFINED_PARAM_001
     * @tc.desc   Test Text textDirection property with undefined parameter should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textTextDirectionUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textTextDirectionUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_textDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.textDirection).assertEqual('DEFAULT');

      console.info('TextSpecialAttrsNullTest', 'textTextDirectionUndefined_0100 END');
    });

    // ==================== setStyledString 方法测试 ====================

    /**
     * @tc.name   textSetStyledStringNull_0100
     * @tc.number SUB_ARKUI_TEXT_SETSTYLEDSTRING_NULL_PARAM_001
     * @tc.desc   Test Text setStyledString method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textSetStyledStringNull_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textSetStyledStringNull_0100 START');

      let strJson: string = getInspectorByKey('text_setStyledString_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.content).assertEqual('');

      console.info('TextSpecialAttrsNullTest', 'textSetStyledStringNull_0100 END');
    });

    /**
     * @tc.name   textSetStyledStringUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SETSTYLEDSTRING_UNDEFINED_PARAM_001
     * @tc.desc   Test Text setStyledString method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('textSetStyledStringUndefined_0100', Level.LEVEL0, async () => {
      console.info('TextSpecialAttrsNullTest', 'textSetStyledStringUndefined_0100 START');

      let strJson: string = getInspectorByKey('text_setStyledString_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      expect(obj.$attrs.content).assertEqual('');

      console.info('TextSpecialAttrsNullTest', 'textSetStyledStringUndefined_0100 END');
    });
  });
}
