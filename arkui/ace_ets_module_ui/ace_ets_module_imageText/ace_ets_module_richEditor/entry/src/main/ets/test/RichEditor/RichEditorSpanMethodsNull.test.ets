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

export default function RichEditorSpanMethodsNullTest() {
  describe('RichEditorSpanMethodsNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSpanMethodsNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorSpanMethodsNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSpanMethodsNullTest state pages: " + JSON.stringify(pages));
        if (!("RichEditorSpanMethodsNull" == pages.name)) {
          console.info("get RichEditorSpanMethodsNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorSpanMethodsNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSpanMethodsNullTest page error: " + err);
      }
      done();
    })

    // ==================== addTextSpan 方法测试 ====================

    /**
     * @tc.name   richEditorAddTextSpanAllNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_ALL_NULL_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanAllNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanAllNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanAllNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanAllUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanAllUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanContentEmpty_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_CONTENT_EMPTY_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with empty string content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanContentEmpty_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentEmpty_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_content_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentEmpty_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanContentNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_CONTENT_NULL_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with content null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanContentNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_content_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanContentUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_CONTENT_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with content undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanContentUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_content_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanContentUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanOptionsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_OPTIONS_NULL_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with options null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanOptionsNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanOptionsNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddTextSpanOptionsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDTEXTSPAN_OPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addTextSpan method with options undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddTextSpanOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanOptionsUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addTextSpan_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddTextSpanOptionsUndefined_0100 END');
    });

    // ==================== addImageSpan 方法测试 ====================

    /**
     * @tc.name   richEditorAddImageSpanAllNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_ALL_NULL_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanAllNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanAllNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanAllNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddImageSpanAllUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanAllUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddImageSpanValueNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_VALUE_NULL_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanValueNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanValueNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanValueNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddImageSpanValueUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_VALUE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanValueUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanValueUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanValueUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddImageSpanOptionsNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_OPTIONS_NULL_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with options null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanOptionsNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanOptionsNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddImageSpanOptionsUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDIMAGESPAN_OPTIONS_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addImageSpan method with options undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddImageSpanOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanOptionsUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addImageSpan_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddImageSpanOptionsUndefined_0100 END');
    });

    // ==================== addBuilderSpan 方法测试 ====================

    /**
     * @tc.name   richEditorAddBuilderSpanAllNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDBUILDERS PAN_ALL_NULL_PARAM_001
     * @tc.desc   Test RichEditor addBuilderSpan method with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddBuilderSpanAllNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanAllNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addBuilderSpan_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanAllNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddBuilderSpanAllUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDBUILDERS PAN_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addBuilderSpan method with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddBuilderSpanAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addBuilderSpan_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanAllUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddBuilderSpanValueNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDBUILDERS PAN_VALUE_NULL_PARAM_001
     * @tc.desc   Test RichEditor addBuilderSpan method with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddBuilderSpanValueNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanValueNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addBuilderSpan_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddBuilderSpanValueNull_0100 END');
    });

    // ==================== addSymbolSpan 方法测试 ====================

    /**
     * @tc.name   richEditorAddSymbolSpanAllNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDSYMBOLSPAN_ALL_NULL_PARAM_001
     * @tc.desc   Test RichEditor addSymbolSpan method with all null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddSymbolSpanAllNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanAllNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addSymbolSpan_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanAllNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddSymbolSpanAllUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDSYMBOLSPAN_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addSymbolSpan method with all undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddSymbolSpanAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addSymbolSpan_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanAllUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorAddSymbolSpanValueNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDSYMBOLSPAN_VALUE_NULL_PARAM_001
     * @tc.desc   Test RichEditor addSymbolSpan method with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddSymbolSpanValueNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanValueNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addSymbolSpan_value_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanValueNull_0100 END');
    });

    /**
     * @tc.name   richEditorAddSymbolSpanValueUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_ADDSYMBOLSPAN_VALUE_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor addSymbolSpan method with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorAddSymbolSpanValueUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanValueUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_addSymbolSpan_value_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorAddSymbolSpanValueUndefined_0100 END');
    });

    // ==================== updateSpanStyle 方法测试 ====================

    /**
     * @tc.name   richEditorUpdateSpanStyleAllNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATES PANSTYLE_ALL_NULL_PARAM_001
     * @tc.desc   Test RichEditor updateSpanStyle method with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateSpanStyleAllNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleAllNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateSpanStyle_all_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleAllNull_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateSpanStyleAllUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATES PANSTYLE_ALL_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor updateSpanStyle method with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateSpanStyleAllUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleAllUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateSpanStyle_all_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleAllUndefined_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateSpanStyleTextNull_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATES PANSTYLE_TEXT_NULL_PARAM_001
     * @tc.desc   Test RichEditor updateSpanStyle method with text style null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateSpanStyleTextNull_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleTextNull_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateSpanStyle_text_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleTextNull_0100 END');
    });

    /**
     * @tc.name   richEditorUpdateSpanStyleTextUndefined_0100
     * @tc.number SUB_ARKUI_RICHEDITOR_UPDATES PANSTYLE_TEXT_UNDEFINED_PARAM_001
     * @tc.desc   Test RichEditor updateSpanStyle method with text style undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('richEditorUpdateSpanStyleTextUndefined_0100', Level.LEVEL1, async () => {
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleTextUndefined_0100 START');

      let strJson: string = getInspectorByKey('richEditor_updateSpanStyle_text_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('RichEditor');
      console.info('RichEditorSpanMethodsNullTest', 'richEditorUpdateSpanStyleTextUndefined_0100 END');
    });
  });
}
