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

export default function SearchPropertiesNullUndefined02Test() {
  describe('SearchPropertiesNullUndefined02Test', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchPropertiesNullUndefined02Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/SearchPropertiesNullUndefined02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchPropertiesNullUndefined02Test state pages: " + JSON.stringify(pages));
        if (!("SearchPropertiesNullUndefined02" == pages.name)) {
          console.info("get SearchPropertiesNullUndefined02Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchPropertiesNullUndefined02Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchPropertiesNullUndefined02Test page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   searchMinFontScale_null_0100
     * @tc.number SUB_ARKUI_SEARCH_MINFONTSCALE_NULL_0100
     * @tc.desc   Test Search minFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMinFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[searchMinFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_minFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMinFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMinFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMinFontScale_null_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[searchMinFontScale_null_0100] null minFontScale is: " + obj.$attrs.minFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[searchMinFontScale_null_0100] END');
    })

    /**
     * @tc.name   searchMinFontScale_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_MINFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test Search minFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMinFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchMinFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_minFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMinFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMinFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMinFontScale_undefined_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[searchMinFontScale_undefined_0100] undefined minFontScale is: " + obj.$attrs.minFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[searchMinFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   searchMaxFontScale_null_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXFONTSCALE_NULL_0100
     * @tc.desc   Test Search maxFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxFontScale_null_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[searchMaxFontScale_null_0100] null maxFontScale is: " + obj.$attrs.maxFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[searchMaxFontScale_null_0100] END');
    })

    /**
     * @tc.name   searchMaxFontScale_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_MAXFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test Search maxFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchMaxFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchMaxFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_maxFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchMaxFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchMaxFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchMaxFontScale_undefined_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[searchMaxFontScale_undefined_0100] undefined maxFontScale is: " + obj.$attrs.maxFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[searchMaxFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   searchDecoration_null_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_NULL_0100
     * @tc.desc   Test Search decoration property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchDecoration_null_0100', Level.LEVEL2, async () => {
      console.info('[searchDecoration_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_decoration_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecoration_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchDecoration_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecoration_null_0100] default decoration is: " + JSON.stringify(objCompare.$attrs.decoration));
      console.info("[searchDecoration_null_0100] null decoration is: " + JSON.stringify(obj.$attrs.decoration));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.decoration)).assertEqual(JSON.stringify(objCompare.$attrs.decoration));
      console.info('[searchDecoration_null_0100] END');
    })

    /**
     * @tc.name   searchDecoration_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_DECORATION_UNDEFINED_0100
     * @tc.desc   Test Search decoration property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchDecoration_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchDecoration_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_decoration_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchDecoration_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchDecoration_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchDecoration_undefined_0100] default decoration is: " + JSON.stringify(objCompare.$attrs.decoration));
      console.info("[searchDecoration_undefined_0100] undefined decoration is: " + JSON.stringify(obj.$attrs.decoration));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.decoration)).assertEqual(JSON.stringify(objCompare.$attrs.decoration));
      console.info('[searchDecoration_undefined_0100] END');
    })

    /**
     * @tc.name   searchLetterSpacing_null_0100
     * @tc.number SUB_ARKUI_SEARCH_LETTERSPACING_NULL_0100
     * @tc.desc   Test Search letterSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLetterSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[searchLetterSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_letterSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLetterSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLetterSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLetterSpacing_null_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[searchLetterSpacing_null_0100] null letterSpacing is: " + obj.$attrs.letterSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[searchLetterSpacing_null_0100] END');
    })

    /**
     * @tc.name   searchLetterSpacing_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_LETTERSPACING_UNDEFINED_0100
     * @tc.desc   Test Search letterSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLetterSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchLetterSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_letterSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLetterSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLetterSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLetterSpacing_undefined_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[searchLetterSpacing_undefined_0100] undefined letterSpacing is: " + obj.$attrs.letterSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[searchLetterSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   searchLetterSpacing_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_LETTERSPACING_EMPTY_0100
     * @tc.desc   Test Search letterSpacing property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLetterSpacing_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchLetterSpacing_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_letterSpacing_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLetterSpacing_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLetterSpacing_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLetterSpacing_empty_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[searchLetterSpacing_empty_0100] empty letterSpacing is: " + obj.$attrs.letterSpacing);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[searchLetterSpacing_empty_0100] END');
    })

    /**
     * @tc.name   searchLineHeight_null_0100
     * @tc.number SUB_ARKUI_SEARCH_LINEHEIGHT_NULL_0100
     * @tc.desc   Test Search lineHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLineHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[searchLineHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_lineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLineHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLineHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLineHeight_null_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[searchLineHeight_null_0100] null lineHeight is: " + obj.$attrs.lineHeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[searchLineHeight_null_0100] END');
    })

    /**
     * @tc.name   searchLineHeight_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_LINEHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Search lineHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLineHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchLineHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_lineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLineHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLineHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLineHeight_undefined_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[searchLineHeight_undefined_0100] undefined lineHeight is: " + obj.$attrs.lineHeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[searchLineHeight_undefined_0100] END');
    })

    /**
     * @tc.name   searchLineHeight_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_LINEHEIGHT_EMPTY_0100
     * @tc.desc   Test Search lineHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchLineHeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchLineHeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_lineHeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchLineHeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchLineHeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchLineHeight_empty_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[searchLineHeight_empty_0100] empty lineHeight is: " + obj.$attrs.lineHeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[searchLineHeight_empty_0100] END');
    })

    /**
     * @tc.name   searchEditMenuOptions_null_0100
     * @tc.number SUB_ARKUI_SEARCH_EDITMENUOPTIONS_NULL_0100
     * @tc.desc   Test Search editMenuOptions property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEditMenuOptions_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEditMenuOptions_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_editMenuOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_editMenuOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEditMenuOptions_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEditMenuOptions_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEditMenuOptions_null_0100] default editMenuOptions is: " + JSON.stringify(objCompare.$attrs.editMenuOptions));
      console.info("[searchEditMenuOptions_null_0100] null editMenuOptions is: " + JSON.stringify(obj.$attrs.editMenuOptions));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.editMenuOptions)).assertEqual(JSON.stringify(objCompare.$attrs.editMenuOptions));
      console.info('[searchEditMenuOptions_null_0100] END');
    })

    /**
     * @tc.name   searchEditMenuOptions_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_EDITMENUOPTIONS_UNDEFINED_0100
     * @tc.desc   Test Search editMenuOptions property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEditMenuOptions_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEditMenuOptions_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_editMenuOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_editMenuOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEditMenuOptions_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEditMenuOptions_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEditMenuOptions_undefined_0100] default editMenuOptions is: " + JSON.stringify(objCompare.$attrs.editMenuOptions));
      console.info("[searchEditMenuOptions_undefined_0100] undefined editMenuOptions is: " + JSON.stringify(obj.$attrs.editMenuOptions));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.editMenuOptions)).assertEqual(JSON.stringify(objCompare.$attrs.editMenuOptions));
      console.info('[searchEditMenuOptions_undefined_0100] END');
    })

    /**
     * @tc.name   searchAutoCapitalizationMode_null_0100
     * @tc.number SUB_ARKUI_SEARCH_AUTOCAPITALIZATIONMODE_NULL_0100
     * @tc.desc   Test Search autoCapitalizationMode property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchAutoCapitalizationMode_null_0100', Level.LEVEL2, async () => {
      console.info('[searchAutoCapitalizationMode_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_autoCapitalizationMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchAutoCapitalizationMode_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchAutoCapitalizationMode_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchAutoCapitalizationMode_null_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[searchAutoCapitalizationMode_null_0100] null autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // null 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[searchAutoCapitalizationMode_null_0100] END');
    })

    /**
     * @tc.name   searchAutoCapitalizationMode_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_AUTOCAPITALIZATIONMODE_UNDEFINED_0100
     * @tc.desc   Test Search autoCapitalizationMode property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchAutoCapitalizationMode_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchAutoCapitalizationMode_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_autoCapitalizationMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchAutoCapitalizationMode_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchAutoCapitalizationMode_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchAutoCapitalizationMode_undefined_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[searchAutoCapitalizationMode_undefined_0100] undefined autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[searchAutoCapitalizationMode_undefined_0100] END');
    })

    /**
     * @tc.name   searchStopBackPress_null_0100
     * @tc.number SUB_ARKUI_SEARCH_STOPBACKPRESS_NULL_0100
     * @tc.desc   Test Search stopBackPress property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStopBackPress_null_0100', Level.LEVEL2, async () => {
      console.info('[searchStopBackPress_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_stopBackPress_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStopBackPress_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStopBackPress_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStopBackPress_null_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[searchStopBackPress_null_0100] null stopBackPress is: " + obj.$attrs.stopBackPress);

      // null 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[searchStopBackPress_null_0100] END');
    })

    /**
     * @tc.name   searchStopBackPress_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_STOPBACKPRESS_UNDEFINED_0100
     * @tc.desc   Test Search stopBackPress property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStopBackPress_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchStopBackPress_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_stopBackPress_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStopBackPress_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStopBackPress_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStopBackPress_undefined_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[searchStopBackPress_undefined_0100] undefined stopBackPress is: " + obj.$attrs.stopBackPress);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[searchStopBackPress_undefined_0100] END');
    })

    /**
     * @tc.name   searchKeyboardAppearance_null_0100
     * @tc.number SUB_ARKUI_SEARCH_KEYBOARDAPPEARANCE_NULL_0100
     * @tc.desc   Test Search keyboardAppearance property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchKeyboardAppearance_null_0100', Level.LEVEL2, async () => {
      console.info('[searchKeyboardAppearance_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_keyboardAppearance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchKeyboardAppearance_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchKeyboardAppearance_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchKeyboardAppearance_null_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[searchKeyboardAppearance_null_0100] null keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // null 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[searchKeyboardAppearance_null_0100] END');
    })

    /**
     * @tc.name   searchKeyboardAppearance_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_KEYBOARDAPPEARANCE_UNDEFINED_0100
     * @tc.desc   Test Search keyboardAppearance property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchKeyboardAppearance_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchKeyboardAppearance_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_keyboardAppearance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchKeyboardAppearance_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchKeyboardAppearance_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchKeyboardAppearance_undefined_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[searchKeyboardAppearance_undefined_0100] undefined keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[searchKeyboardAppearance_undefined_0100] END');
    })

    /**
     * @tc.name   searchStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEWIDTH_NULL_0100
     * @tc.desc   Test Search strokeWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeWidth_null_0100', Level.LEVEL2, async () => {
      console.info('[searchStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStrokeWidth_null_0100] default strokeWidth is: " + JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info("[searchStrokeWidth_null_0100] null strokeWidth is: " + JSON.stringify(obj.$attrs.strokeWidth));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.strokeWidth)).assertEqual(JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info('[searchStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   searchStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test Search strokeWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeWidth_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStrokeWidth_undefined_0100] default strokeWidth is: " + JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info("[searchStrokeWidth_undefined_0100] undefined strokeWidth is: " + JSON.stringify(obj.$attrs.strokeWidth));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.strokeWidth)).assertEqual(JSON.stringify(objCompare.$attrs.strokeWidth));
      console.info('[searchStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   searchStrokeColor_null_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKECOLOR_NULL_0100
     * @tc.desc   Test Search strokeColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeColor_null_0100', Level.LEVEL2, async () => {
      console.info('[searchStrokeColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_strokeColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStrokeColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStrokeColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStrokeColor_null_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[searchStrokeColor_null_0100] null strokeColor is: " + obj.$attrs.strokeColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[searchStrokeColor_null_0100] END');
    })

    /**
     * @tc.name   searchStrokeColor_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKECOLOR_UNDEFINED_0100
     * @tc.desc   Test Search strokeColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchStrokeColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_strokeColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStrokeColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStrokeColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStrokeColor_undefined_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[searchStrokeColor_undefined_0100] undefined strokeColor is: " + obj.$attrs.strokeColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[searchStrokeColor_undefined_0100] END');
    })

    /**
     * @tc.name   searchStrokeColor_empty_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKECOLOR_EMPTY_0100
     * @tc.desc   Test Search strokeColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[searchStrokeColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_strokeColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchStrokeColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchStrokeColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchStrokeColor_empty_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[searchStrokeColor_empty_0100] empty strokeColor is: " + obj.$attrs.strokeColor);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[searchStrokeColor_empty_0100] END');
    })

    /**
     * @tc.name   searchEnableAutoSpacing_null_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEAUTOSPACING_NULL_0100
     * @tc.desc   Test Search enableAutoSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableAutoSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableAutoSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableAutoSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableAutoSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableAutoSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableAutoSpacing_null_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[searchEnableAutoSpacing_null_0100] null enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[searchEnableAutoSpacing_null_0100] END');
    })

    /**
     * @tc.name   searchEnableAutoSpacing_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEAUTOSPACING_UNDEFINED_0100
     * @tc.desc   Test Search enableAutoSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableAutoSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableAutoSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableAutoSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableAutoSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableAutoSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableAutoSpacing_undefined_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[searchEnableAutoSpacing_undefined_0100] undefined enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[searchEnableAutoSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   searchIncludeFontPadding_null_0100
     * @tc.number SUB_ARKUI_SEARCH_INCLUDEFONTPADDING_NULL_0100
     * @tc.desc   Test Search includeFontPadding property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchIncludeFontPadding_null_0100', Level.LEVEL2, async () => {
      console.info('[searchIncludeFontPadding_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_includeFontPadding_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchIncludeFontPadding_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchIncludeFontPadding_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchIncludeFontPadding_null_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[searchIncludeFontPadding_null_0100] null includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // null 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[searchIncludeFontPadding_null_0100] END');
    })

    /**
     * @tc.name   searchIncludeFontPadding_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_INCLUDEFONTPADDING_UNDEFINED_0100
     * @tc.desc   Test Search includeFontPadding property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchIncludeFontPadding_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchIncludeFontPadding_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_includeFontPadding_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchIncludeFontPadding_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchIncludeFontPadding_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchIncludeFontPadding_undefined_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[searchIncludeFontPadding_undefined_0100] undefined includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[searchIncludeFontPadding_undefined_0100] END');
    })

    /**
     * @tc.name   searchFallbackLineSpacing_null_0100
     * @tc.number SUB_ARKUI_SEARCH_FALLBACKLINESPACING_NULL_0100
     * @tc.desc   Test Search fallbackLineSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFallbackLineSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[searchFallbackLineSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fallbackLineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFallbackLineSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFallbackLineSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFallbackLineSpacing_null_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[searchFallbackLineSpacing_null_0100] null fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[searchFallbackLineSpacing_null_0100] END');
    })

    /**
     * @tc.name   searchFallbackLineSpacing_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_FALLBACKLINESPACING_UNDEFINED_0100
     * @tc.desc   Test Search fallbackLineSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchFallbackLineSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchFallbackLineSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_fallbackLineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchFallbackLineSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchFallbackLineSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchFallbackLineSpacing_undefined_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[searchFallbackLineSpacing_undefined_0100] undefined fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[searchFallbackLineSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   searchCompressLeadingPunctuation_null_0100
     * @tc.number SUB_ARKUI_SEARCH_COMPRESSLEADINGPUNCTUATION_NULL_0100
     * @tc.desc   Test Search compressLeadingPunctuation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCompressLeadingPunctuation_null_0100', Level.LEVEL2, async () => {
      console.info('[searchCompressLeadingPunctuation_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_compressLeadingPunctuation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCompressLeadingPunctuation_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCompressLeadingPunctuation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCompressLeadingPunctuation_null_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[searchCompressLeadingPunctuation_null_0100] null compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // null 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[searchCompressLeadingPunctuation_null_0100] END');
    })

    /**
     * @tc.name   searchCompressLeadingPunctuation_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_COMPRESSLEADINGPUNCTUATION_UNDEFINED_0100
     * @tc.desc   Test Search compressLeadingPunctuation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchCompressLeadingPunctuation_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchCompressLeadingPunctuation_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_compressLeadingPunctuation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchCompressLeadingPunctuation_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchCompressLeadingPunctuation_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchCompressLeadingPunctuation_undefined_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[searchCompressLeadingPunctuation_undefined_0100] undefined compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[searchCompressLeadingPunctuation_undefined_0100] END');
    })

    /**
     * @tc.name   searchSelectedDragPreviewStyle_null_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTEDDRAGPREVIEWSTYLE_NULL_0100
     * @tc.desc   Test Search selectedDragPreviewStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectedDragPreviewStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectedDragPreviewStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectedDragPreviewStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectedDragPreviewStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectedDragPreviewStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectedDragPreviewStyle_null_0100] default selectedDragPreviewStyle is: " + JSON.stringify(objCompare.$attrs.selectedDragPreviewStyle));
      console.info("[searchSelectedDragPreviewStyle_null_0100] null selectedDragPreviewStyle is: " + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.selectedDragPreviewStyle)).assertEqual(JSON.stringify(objCompare.$attrs.selectedDragPreviewStyle));
      console.info('[searchSelectedDragPreviewStyle_null_0100] END');
    })

    /**
     * @tc.name   searchSelectedDragPreviewStyle_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTEDDRAGPREVIEWSTYLE_UNDEFINED_0100
     * @tc.desc   Test Search selectedDragPreviewStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectedDragPreviewStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectedDragPreviewStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectedDragPreviewStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectedDragPreviewStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectedDragPreviewStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectedDragPreviewStyle_undefined_0100] default selectedDragPreviewStyle is: " + JSON.stringify(objCompare.$attrs.selectedDragPreviewStyle));
      console.info("[searchSelectedDragPreviewStyle_undefined_0100] undefined selectedDragPreviewStyle is: " + JSON.stringify(obj.$attrs.selectedDragPreviewStyle));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.selectedDragPreviewStyle)).assertEqual(JSON.stringify(objCompare.$attrs.selectedDragPreviewStyle));
      console.info('[searchSelectedDragPreviewStyle_undefined_0100] END');
    })

    /**
     * @tc.name   searchTextDirection_null_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTDIRECTION_NULL_0100
     * @tc.desc   Test Search textDirection property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextDirection_null_0100', Level.LEVEL2, async () => {
      console.info('[searchTextDirection_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextDirection_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextDirection_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextDirection_null_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[searchTextDirection_null_0100] null textDirection is: " + obj.$attrs.textDirection);

      // null 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[searchTextDirection_null_0100] END');
    })

    /**
     * @tc.name   searchTextDirection_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_TEXTDIRECTION_UNDEFINED_0100
     * @tc.desc   Test Search textDirection property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchTextDirection_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchTextDirection_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_textDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchTextDirection_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchTextDirection_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchTextDirection_undefined_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[searchTextDirection_undefined_0100] undefined textDirection is: " + obj.$attrs.textDirection);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[searchTextDirection_undefined_0100] END');
    })

    /**
     * @tc.name   searchSelectionMenuHidden_null_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTIONMENUHIDDEN_NULL_0100
     * @tc.desc   Test Search selectionMenuHidden property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectionMenuHidden_null_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectionMenuHidden_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectionMenuHidden_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectionMenuHidden_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectionMenuHidden_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectionMenuHidden_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectionMenuHidden_null_0100] default selectionMenuHidden is: " + objCompare.$attrs.selectionMenuHidden);
      console.info("[searchSelectionMenuHidden_null_0100] null selectionMenuHidden is: " + obj.$attrs.selectionMenuHidden);

      // null 应该恢复为默认值
      expect(obj.$attrs.selectionMenuHidden).assertEqual(objCompare.$attrs.selectionMenuHidden);
      console.info('[searchSelectionMenuHidden_null_0100] END');
    })

    /**
     * @tc.name   searchSelectionMenuHidden_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTIONMENUHIDDEN_UNDEFINED_0100
     * @tc.desc   Test Search selectionMenuHidden property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectionMenuHidden_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectionMenuHidden_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_selectionMenuHidden_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_selectionMenuHidden_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectionMenuHidden_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchSelectionMenuHidden_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectionMenuHidden_undefined_0100] default selectionMenuHidden is: " + objCompare.$attrs.selectionMenuHidden);
      console.info("[searchSelectionMenuHidden_undefined_0100] undefined selectionMenuHidden is: " + obj.$attrs.selectionMenuHidden);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.selectionMenuHidden).assertEqual(objCompare.$attrs.selectionMenuHidden);
      console.info('[searchSelectionMenuHidden_undefined_0100] END');
    })

    /**
     * @tc.name   searchSelectionMenuHidden_true_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTIONMENUHIDDEN_TRUE_0100
     * @tc.desc   Test Search selectionMenuHidden property with true, should set to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectionMenuHidden_true_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectionMenuHidden_true_0100] START');

      let strJson: string = getInspectorByKey('Search_selectionMenuHidden_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectionMenuHidden_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectionMenuHidden_true_0100] selectionMenuHidden is: " + obj.$attrs.selectionMenuHidden);

      // true 应该设置为 true
      expect(obj.$attrs.selectionMenuHidden).assertEqual('true');
      console.info('[searchSelectionMenuHidden_true_0100] END');
    })

    /**
     * @tc.name   searchSelectionMenuHidden_false_0100
     * @tc.number SUB_ARKUI_SEARCH_SELECTIONMENUHIDDEN_FALSE_0100
     * @tc.desc   Test Search selectionMenuHidden property with false, should set to false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchSelectionMenuHidden_false_0100', Level.LEVEL2, async () => {
      console.info('[searchSelectionMenuHidden_false_0100] START');

      let strJson: string = getInspectorByKey('Search_selectionMenuHidden_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchSelectionMenuHidden_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchSelectionMenuHidden_false_0100] selectionMenuHidden is: " + obj.$attrs.selectionMenuHidden);

      // false 应该设置为 false
      expect(obj.$attrs.selectionMenuHidden).assertEqual('false');
      console.info('[searchSelectionMenuHidden_false_0100] END');
    })

    /**
     * @tc.name   searchEnableHapticFeedback_null_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEHAPTICFEEDBACK_NULL_0100
     * @tc.desc   Test Search enableHapticFeedback property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableHapticFeedback_null_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableHapticFeedback_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableHapticFeedback_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableHapticFeedback_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableHapticFeedback_null_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[searchEnableHapticFeedback_null_0100] null enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[searchEnableHapticFeedback_null_0100] END');
    })

    /**
     * @tc.name   searchEnableHapticFeedback_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEHAPTICFEEDBACK_UNDEFINED_0100
     * @tc.desc   Test Search enableHapticFeedback property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableHapticFeedback_undefined_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableHapticFeedback_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Search_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Search_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableHapticFeedback_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[searchEnableHapticFeedback_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableHapticFeedback_undefined_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[searchEnableHapticFeedback_undefined_0100] undefined enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[searchEnableHapticFeedback_undefined_0100] END');
    })

    /**
     * @tc.name   searchEnableHapticFeedback_true_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEHAPTICFEEDBACK_TRUE_0100
     * @tc.desc   Test Search enableHapticFeedback property with true, should set to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableHapticFeedback_true_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableHapticFeedback_true_0100] START');

      let strJson: string = getInspectorByKey('Search_enableHapticFeedback_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableHapticFeedback_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableHapticFeedback_true_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // true 应该设置为 true
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[searchEnableHapticFeedback_true_0100] END');
    })

    /**
     * @tc.name   searchEnableHapticFeedback_false_0100
     * @tc.number SUB_ARKUI_SEARCH_ENABLEHAPTICFEEDBACK_FALSE_0100
     * @tc.desc   Test Search enableHapticFeedback property with false, should set to false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchEnableHapticFeedback_false_0100', Level.LEVEL2, async () => {
      console.info('[searchEnableHapticFeedback_false_0100] START');

      let strJson: string = getInspectorByKey('Search_enableHapticFeedback_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[searchEnableHapticFeedback_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[searchEnableHapticFeedback_false_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // false 应该设置为 false
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[searchEnableHapticFeedback_false_0100] END');
    })
  })
}
