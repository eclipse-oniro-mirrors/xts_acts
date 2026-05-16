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
import { Driver, ON } from '@ohos.UiTest';

export default function SearchPropertiesNullUndefinedTest() {
  describe('SearchPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchPropertiesNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("SearchPropertiesNullUndefined" == pages.name)) {
          console.info("get SearchPropertiesNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchPropertiesNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchPropertiesNullUndefinedTest page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   searchFontColor_null_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTCOLOR_NULL_0100
     * @tc.desc   Test Search fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontColor_null_0100', Level.LEVEL2, async () => {
      console.info('[searchFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[searchFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[searchFontColor_null_0100] END');
    })

    /**
     * @tc.name   searchFontColor_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test Search fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[searchFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[searchFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   searchFontColor_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test Search fontColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFontColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[searchFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[searchFontColor_empty_0100] END');
    })

    /**
     * @tc.name   searchSearchIcon_null_0100
     * @tc.number SUB_ARKUI_SEARCH_SEARCHICON_NULL_0100
     * @tc.desc   Test Search searchIcon property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSearchIcon_null_0100', Level.LEVEL2, async () => {
      console.info('[searchSearchIcon_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_searchIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_searchIcon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSearchIcon_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSearchIcon_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSearchIcon_null_0100] default searchIcon is: " + JSON.stringify(objCompare.$attrs.searchIcon));
      console.info("[searchSearchIcon_null_0100] null searchIcon is: " + JSON.stringify(obj.$attrs.searchIcon));

      // null 应该恢复为默认值
      expect(obj.$attrs.searchIcon.size).assertEqual(objCompare.$attrs.searchIcon.size);
      expect(obj.$attrs.searchIcon.color).assertEqual(objCompare.$attrs.searchIcon.color);
      expect(obj.$attrs.searchIcon.src).assertEqual(objCompare.$attrs.searchIcon.src);
      console.info('[searchSearchIcon_null_0100] END');
    })

    /**
     * @tc.name   searchSearchIcon_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SEARCHICON_UNDEFINED_0100
     * @tc.desc   Test Search searchIcon property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSearchIcon_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchSearchIcon_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_searchIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_searchIcon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSearchIcon_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSearchIcon_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSearchIcon_undefined_0100] default searchIcon is: " + JSON.stringify(objCompare.$attrs.searchIcon));
      console.info("[searchSearchIcon_undefined_0100] undefined searchIcon is: " + JSON.stringify(obj.$attrs.searchIcon));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.searchIcon.size).assertEqual(objCompare.$attrs.searchIcon.size);
      expect(obj.$attrs.searchIcon.color).assertEqual(objCompare.$attrs.searchIcon.color);
      expect(obj.$attrs.searchIcon.src).assertEqual(objCompare.$attrs.searchIcon.src);
      console.info('[searchSearchIcon_undefined_0100] END');
    })

    /**
     * @tc.name   searchCancelButton_null_0100
     * @tc.number SUB_ARKUI_SEARCH_CANCELBUTTON_NULL_0100
     * @tc.desc   Test Search cancelButton property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCancelButton_null_0100', Level.LEVEL2, async () => {
      console.info('[searchCancelButton_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_cancelButton_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_cancelButton_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCancelButton_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCancelButton_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCancelButton_null_0100] default cancelButton is: " + JSON.stringify(objCompare.$attrs.cancelButton));
      console.info("[searchCancelButton_null_0100] null cancelButton is: " + JSON.stringify(obj.$attrs.cancelButton));

      // null 应该恢复为默认值
      expect(obj.$attrs.cancelButton.style).assertEqual(objCompare.$attrs.cancelButton.style);
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(objCompare.$attrs.cancelButton.icon.size);
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(objCompare.$attrs.cancelButton.icon.color);
      expect(obj.$attrs.cancelButton.icon.src).assertEqual(objCompare.$attrs.cancelButton.icon.src);
      console.info('[searchCancelButton_null_0100] END');
    })

    /**
     * @tc.name   searchCancelButton_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_CANCELBUTTON_UNDEFINED_0100
     * @tc.desc   Test Search cancelButton property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCancelButton_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchCancelButton_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_cancelButton_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_cancelButton_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCancelButton_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCancelButton_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCancelButton_undefined_0100] default cancelButton is: " + JSON.stringify(objCompare.$attrs.cancelButton));
      console.info("[searchCancelButton_undefined_0100] undefined cancelButton is: " + JSON.stringify(obj.$attrs.cancelButton));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.cancelButton.style).assertEqual(objCompare.$attrs.cancelButton.style);
      expect(obj.$attrs.cancelButton.icon.size).assertEqual(objCompare.$attrs.cancelButton.icon.size);
      expect(obj.$attrs.cancelButton.icon.color).assertEqual(objCompare.$attrs.cancelButton.icon.color);
      expect(obj.$attrs.cancelButton.icon.src).assertEqual(objCompare.$attrs.cancelButton.icon.src);
      console.info('[searchCancelButton_undefined_0100] END');
    })

    /**
     * @tc.name   searchEnableSelectedDataDetector_null_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_NULL_0100
     * @tc.desc   Test Search enableSelectedDataDetector property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableSelectedDataDetector_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableSelectedDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableSelectedDataDetector_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableSelectedDataDetector_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableSelectedDataDetector_null_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[searchEnableSelectedDataDetector_null_0100] null enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[searchEnableSelectedDataDetector_null_0100] END');
    })

    /**
     * @tc.name   searchEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLESELECTEDDATADETECTOR_UNDEFINED_0100
     * @tc.desc   Test Search enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableSelectedDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableSelectedDataDetector_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableSelectedDataDetector_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[searchEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[searchEnableSelectedDataDetector_undefined_0100] END');
    })

    /**
     * @tc.name   searchTextIndent_null_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTINDENT_NULL_0100
     * @tc.desc   Test Search textIndent property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextIndent_null_0100', Level.LEVEL2, async () => {
      console.info('[searchTextIndent_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textIndent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextIndent_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextIndent_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextIndent_null_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[searchTextIndent_null_0100] null textIndent is: " + obj.$attrs.textIndent);

      // null 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[searchTextIndent_null_0100] END');
    })

    /**
     * @tc.name   searchTextIndent_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTINDENT_UNDEFINED_0100
     * @tc.desc   Test Search textIndent property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextIndent_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchTextIndent_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textIndent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextIndent_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextIndent_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextIndent_undefined_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[searchTextIndent_undefined_0100] undefined textIndent is: " + obj.$attrs.textIndent);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[searchTextIndent_undefined_0100] END');
    })

    /**
     * @tc.name   searchInputFilter_null_0100
     * @tc.number SUB_ARKUI_SEARCH_INPUTFILTER_NULL_0100
     * @tc.desc   Test Search inputFilter property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchInputFilter_null_0100', Level.LEVEL2, async () => {
      console.info('[searchInputFilter_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_inputFilter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchInputFilter_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchInputFilter_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchInputFilter_null_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[searchInputFilter_null_0100] null inputFilter is: " + obj.$attrs.inputFilter);

      // null 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[searchInputFilter_null_0100] END');
    })

    /**
     * @tc.name   searchInputFilter_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_INPUTFILTER_UNDEFINED_0100
     * @tc.desc   Test Search inputFilter property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchInputFilter_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchInputFilter_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_inputFilter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchInputFilter_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchInputFilter_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchInputFilter_undefined_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[searchInputFilter_undefined_0100] undefined inputFilter is: " + obj.$attrs.inputFilter);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[searchInputFilter_undefined_0100] END');
    })

    /**
     * @tc.name   searchSelectedBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTEDBACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test Search selectedBackgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectedBackgroundColor_null_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectedBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectedBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectedBackgroundColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectedBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectedBackgroundColor_null_0100] default selectedBackgroundColor is: " + objCompare.$attrs.selectedBackgroundColor);
      console.info("[searchSelectedBackgroundColor_null_0100] null selectedBackgroundColor is: " + obj.$attrs.selectedBackgroundColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[searchSelectedBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   searchSelectedBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTEDBACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test Search selectedBackgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectedBackgroundColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectedBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectedBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectedBackgroundColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectedBackgroundColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectedBackgroundColor_undefined_0100] default selectedBackgroundColor is: " + objCompare.$attrs.selectedBackgroundColor);
      console.info("[searchSelectedBackgroundColor_undefined_0100] undefined selectedBackgroundColor is: " + obj.$attrs.selectedBackgroundColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[searchSelectedBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   searchCaretStyle_null_0100
     * @tc.number SUB_ARKUI_SEARCH_CARETSTYLE_NULL_0100
     * @tc.desc   Test Search caretStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCaretStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[searchCaretStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_caretStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCaretStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCaretStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCaretStyle_null_0100] default caretStyle is: " + JSON.stringify(objCompare.$attrs.caretStyle));
      console.info("[searchCaretStyle_null_0100] null caretStyle is: " + JSON.stringify(obj.$attrs.caretStyle));

      // null 应该恢复为默认值
      expect(obj.$attrs.caretStyle.color).assertEqual(objCompare.$attrs.caretStyle.color);
      expect(obj.$attrs.caretStyle.width).assertEqual(objCompare.$attrs.caretStyle.width);
      console.info('[searchCaretStyle_null_0100] END');
    })

    /**
     * @tc.name   searchCaretStyle_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_CARETSTYLE_UNDEFINED_0100
     * @tc.desc   Test Search caretStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCaretStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchCaretStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_caretStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCaretStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCaretStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCaretStyle_undefined_0100] default caretStyle is: " + JSON.stringify(objCompare.$attrs.caretStyle));
      console.info("[searchCaretStyle_undefined_0100] undefined caretStyle is: " + JSON.stringify(obj.$attrs.caretStyle));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.caretStyle.color).assertEqual(objCompare.$attrs.caretStyle.color);
      expect(obj.$attrs.caretStyle.width).assertEqual(objCompare.$attrs.caretStyle.width);
      console.info('[searchCaretStyle_undefined_0100] END');
    })

    /**
     * @tc.name   searchPlaceholderColor_null_0100
     * @tc.number SUB_ARKUI_SEARCH_PLACEHOLDERCOLOR_NULL_0100
     * @tc.desc   Test Search placeholderColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchPlaceholderColor_null_0100', Level.LEVEL2, async () => {
      console.info('[searchPlaceholderColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_placeholderColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchPlaceholderColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchPlaceholderColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchPlaceholderColor_null_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[searchPlaceholderColor_null_0100] null placeholderColor is: " + obj.$attrs.placeholderColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let nullColor: string = obj.$attrs.placeholderColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[searchPlaceholderColor_null_0100] END');
    })

    /**
     * @tc.name   searchPlaceholderColor_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_PLACEHOLDERCOLOR_UNDEFINED_0100
     * @tc.desc   Test Search placeholderColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchPlaceholderColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchPlaceholderColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_placeholderColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchPlaceholderColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchPlaceholderColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchPlaceholderColor_undefined_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[searchPlaceholderColor_undefined_0100] undefined placeholderColor is: " + obj.$attrs.placeholderColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let undefinedColor: string = obj.$attrs.placeholderColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[searchPlaceholderColor_undefined_0100] END');
    })

    /**
     * @tc.name   searchPlaceholderFont_null_0100
     * @tc.number SUB_ARKUI_SEARCH_PLACEHOLDERFONT_NULL_0100
     * @tc.desc   Test Search placeholderFont property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchPlaceholderFont_null_0100', Level.LEVEL2, async () => {
      console.info('[searchPlaceholderFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_placeholderFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchPlaceholderFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchPlaceholderFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchPlaceholderFont_null_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[searchPlaceholderFont_null_0100] null placeholderFont is: " + obj.$attrs.placeholderFont);

      // null 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[searchPlaceholderFont_null_0100] END');
    })

    /**
     * @tc.name   searchPlaceholderFont_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_PLACEHOLDERFONT_UNDEFINED_0100
     * @tc.desc   Test Search placeholderFont property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchPlaceholderFont_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchPlaceholderFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_placeholderFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchPlaceholderFont_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchPlaceholderFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchPlaceholderFont_undefined_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[searchPlaceholderFont_undefined_0100] undefined placeholderFont is: " + obj.$attrs.placeholderFont);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[searchPlaceholderFont_undefined_0100] END');
    })

    /**
     * @tc.name   searchTextFont_null_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTFONT_NULL_0100
     * @tc.desc   Test Search textFont property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextFont_null_0100', Level.LEVEL2, async () => {
      console.info('[searchTextFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextFont_null_0100] default textFont is: " + objCompare.$attrs.textFont);
      console.info("[searchTextFont_null_0100] null textFont is: " + obj.$attrs.textFont);

      // null 应该恢复为默认值
      expect(JSON.parse(obj.$attrs.textFont).fontSize).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontSize);
      expect(JSON.parse(obj.$attrs.textFont).fontStyle).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontStyle);
      expect(JSON.parse(obj.$attrs.textFont).fontWeight).assertEqual('FontWeight.Normal');
      expect(JSON.parse(obj.$attrs.textFont).fontFamily).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontFamily);
      console.info('[searchTextFont_null_0100] END');
    })

    /**
     * @tc.name   searchTextFont_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTFONT_UNDEFINED_0100
     * @tc.desc   Test Search textFont property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextFont_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchTextFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextFont_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextFont_undefined_0100] default textFont is: " + objCompare.$attrs.textFont);
      console.info("[searchTextFont_undefined_0100] undefined textFont is: " + obj.$attrs.textFont);

      // undefined 应该恢复为默认值
      expect(JSON.parse(obj.$attrs.textFont).fontSize).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontSize);
      expect(JSON.parse(obj.$attrs.textFont).fontStyle).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontStyle);
      expect(JSON.parse(obj.$attrs.textFont).fontWeight).assertEqual('FontWeight.Normal');
      expect(JSON.parse(obj.$attrs.textFont).fontFamily).assertEqual(JSON.parse(objCompare.$attrs.textFont).fontFamily);
      console.info('[searchTextFont_undefined_0100] END');
    })

    /**
     * @tc.name   searchEnterKeyType_null_0100
     * @tc.number SUB_ARKUI_SEARCH_ENTERKEYTYPE_NULL_0100
     * @tc.desc   Test Search enterKeyType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnterKeyType_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEnterKeyType_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enterKeyType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnterKeyType_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnterKeyType_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnterKeyType_null_0100] default enterKeyType is: " + objCompare.$attrs.enterKeyType);
      console.info("[searchEnterKeyType_null_0100] null enterKeyType is: " + obj.$attrs.enterKeyType);

      // null 应该恢复为默认值
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[searchEnterKeyType_null_0100] END');
    })

    /**
     * @tc.name   searchEnterKeyType_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENTERKEYTYPE_UNDEFINED_0100
     * @tc.desc   Test Search enterKeyType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnterKeyType_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEnterKeyType_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enterKeyType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnterKeyType_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnterKeyType_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnterKeyType_undefined_0100] default enterKeyType is: " + objCompare.$attrs.enterKeyType);
      console.info("[searchEnterKeyType_undefined_0100] undefined enterKeyType is: " + obj.$attrs.enterKeyType);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[searchEnterKeyType_undefined_0100] END');
    })

    /**
     * @tc.name   searchCopyOption_null_0100
     * @tc.number SUB_ARKUI_SEARCH_COPYOPTION_NULL_0100
     * @tc.desc   Test Search copyOption property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCopyOption_null_0100', Level.LEVEL2, async () => {
      console.info('[searchCopyOption_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_copyOption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCopyOption_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCopyOption_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCopyOption_null_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[searchCopyOption_null_0100] null copyOption is: " + obj.$attrs.copyOption);

      // null 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[searchCopyOption_null_0100] END');
    })

    /**
     * @tc.name   searchCopyOption_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_COPYOPTION_UNDEFINED_0100
     * @tc.desc   Test Search copyOption property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCopyOption_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchCopyOption_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_copyOption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCopyOption_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCopyOption_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCopyOption_undefined_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[searchCopyOption_undefined_0100] undefined copyOption is: " + obj.$attrs.copyOption);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[searchCopyOption_undefined_0100] END');
    })

    /**
     * @tc.name   searchMaxLength_null_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXLENGTH_NULL_0100
     * @tc.desc   Test Search maxLength property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxLength_null_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxLength_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxLength_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxLength_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxLength_null_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[searchMaxLength_null_0100] null maxLength is: " + obj.$attrs.maxLength);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[searchMaxLength_null_0100] END');
    })

    /**
     * @tc.name   searchMaxLength_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXLENGTH_UNDEFINED_0100
     * @tc.desc   Test Search maxLength property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxLength_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxLength_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxLength_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxLength_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxLength_undefined_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[searchMaxLength_undefined_0100] undefined maxLength is: " + obj.$attrs.maxLength);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[searchMaxLength_undefined_0100] END');
    })

    /**
     * @tc.name   searchTextAlign_null_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTALIGN_NULL_0100
     * @tc.desc   Test Search textAlign property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextAlign_null_0100', Level.LEVEL2, async () => {
      console.info('[searchTextAlign_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextAlign_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextAlign_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextAlign_null_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[searchTextAlign_null_0100] null textAlign is: " + obj.$attrs.textAlign);

      // null 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[searchTextAlign_null_0100] END');
    })

    /**
     * @tc.name   searchTextAlign_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTALIGN_UNDEFINED_0100
     * @tc.desc   Test Search textAlign property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextAlign_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchTextAlign_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextAlign_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextAlign_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextAlign_undefined_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[searchTextAlign_undefined_0100] undefined textAlign is: " + obj.$attrs.textAlign);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[searchTextAlign_undefined_0100] END');
    })

    /**
     * @tc.name   searchMinFontSize_null_0100
     * @tc.number SUB_ARKUI_SEARCH_MINFONTSIZE_NULL_0100
     * @tc.desc   Test Search minFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMinFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[searchMinFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_minFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMinFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMinFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMinFontSize_null_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[searchMinFontSize_null_0100] null minFontSize is: " + obj.$attrs.minFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[searchMinFontSize_null_0100] END');
    })

    /**
     * @tc.name   searchMinFontSize_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_MINFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test Search minFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMinFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchMinFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_minFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMinFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMinFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMinFontSize_undefined_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[searchMinFontSize_undefined_0100] undefined minFontSize is: " + obj.$attrs.minFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[searchMinFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   searchMinFontSize_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_MINFONTSIZE_EMPTY_0100
     * @tc.desc   Test Search minFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMinFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchMinFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_minFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMinFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMinFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMinFontSize_empty_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[searchMinFontSize_empty_0100] empty minFontSize is: " + obj.$attrs.minFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[searchMinFontSize_empty_0100] END');
    })

    /**
     * @tc.name   searchMaxFontSize_null_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXFONTSIZE_NULL_0100
     * @tc.desc   Test Search maxFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxFontSize_null_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[searchMaxFontSize_null_0100] null maxFontSize is: " + obj.$attrs.maxFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[searchMaxFontSize_null_0100] END');
    })

    /**
     * @tc.name   searchMaxFontSize_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test Search maxFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxFontSize_undefined_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[searchMaxFontSize_undefined_0100] undefined maxFontSize is: " + obj.$attrs.maxFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[searchMaxFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   searchMaxFontSize_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXFONTSIZE_EMPTY_0100
     * @tc.desc   Test Search maxFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxFontSize_empty_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[searchMaxFontSize_empty_0100] empty maxFontSize is: " + obj.$attrs.maxFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[searchMaxFontSize_empty_0100] END');
    })
  })
}
