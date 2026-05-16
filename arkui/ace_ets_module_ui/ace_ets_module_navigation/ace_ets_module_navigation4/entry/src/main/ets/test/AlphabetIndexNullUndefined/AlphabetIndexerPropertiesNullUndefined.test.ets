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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY } from '@ohos.UiTest';

export default function AlphabetIndexerPropertiesNullUndefinedTest() {
  describe('AlphabetIndexerPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TabsAttributeNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlphabetIndexNullUndefined/AlphabetIndexerPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlphabetIndexerPropertiesNullUndefined state pages:" + JSON.stringify(pages));
        if (!("AlphabetIndexerPropertiesNullUndefined" == pages.name)) {
          console.info("get AlphabetIndexerPropertiesNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlphabetIndexerPropertiesNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlphabetIndexerPropertiesNullUndefined page error:" + err);
      }
      console.info("AlphabetIndexerPropertiesNullUndefined beforeEach end");
      done();
    });

    beforeEach(() => {
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AlphabetIndexerPropertiesNullUndefined after each called");
    })

    afterAll(async () => {
    })

    /**
     * @tc.name   alphabetIndexerColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_COLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer color property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_color_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerColor_null_0100] default color is: " + objCompare.$attrs.color);
      console.info("[alphabetIndexerColor_null_0100] null color is: " + obj.$attrs.color);

      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[alphabetIndexerColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_COLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer color property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_color_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_color_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerColor_undefined_0100] default color is: " + objCompare.$attrs.color);
      console.info("[alphabetIndexerColor_undefined_0100] undefined color is: " + obj.$attrs.color);

      expect(obj.$attrs.color).assertEqual(objCompare.$attrs.color);
      console.info('[alphabetIndexerColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelectedColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTEDCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer selectedColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelectedColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelectedColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selectedColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelectedColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelectedColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelectedColor_null_0100] default selectedColor is: " +
      objCompare.$attrs.selectedColor);
      console.info("[alphabetIndexerSelectedColor_null_0100] null selectedColor is: " + obj.$attrs.selectedColor);

      expect(obj.$attrs.selectedColor).assertEqual(objCompare.$attrs.selectedColor);
      console.info('[alphabetIndexerSelectedColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelectedColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTEDCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer selectedColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelectedColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelectedColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selectedColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelectedColor_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelectedColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelectedColor_undefined_0100] default selectedColor is: " +
      objCompare.$attrs.selectedColor);
      console.info("[alphabetIndexerSelectedColor_undefined_0100] undefined selectedColor is: " +
      obj.$attrs.selectedColor);

      expect(obj.$attrs.selectedColor).assertEqual(objCompare.$attrs.selectedColor);
      console.info('[alphabetIndexerSelectedColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupColor_null_0100] default popupColor is: " + objCompare.$attrs.popupColor);
      console.info("[alphabetIndexerPopupColor_null_0100] null popupColor is: " + obj.$attrs.popupColor);

      expect(obj.$attrs.popupColor).assertEqual(objCompare.$attrs.popupColor);
      console.info('[alphabetIndexerPopupColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupColor_undefined_0100] default popupColor is: " + objCompare.$attrs.popupColor);
      console.info("[alphabetIndexerPopupColor_undefined_0100] undefined popupColor is: " + obj.$attrs.popupColor);

      expect(obj.$attrs.popupColor).assertEqual(objCompare.$attrs.popupColor);
      console.info('[alphabetIndexerPopupColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelectedBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTEDBACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer selectedBackgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelectedBackgroundColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelectedBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selectedBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelectedBackgroundColor_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelectedBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelectedBackgroundColor_null_0100] default selectedBackgroundColor is: " +
      objCompare.$attrs.selectedBackgroundColor);
      console.info("[alphabetIndexerSelectedBackgroundColor_null_0100] null selectedBackgroundColor is: " +
      obj.$attrs.selectedBackgroundColor);

      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[alphabetIndexerSelectedBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelectedBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTEDBACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer selectedBackgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelectedBackgroundColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelectedBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selectedBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelectedBackgroundColor_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelectedBackgroundColor_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelectedBackgroundColor_undefined_0100] default selectedBackgroundColor is: " +
      objCompare.$attrs.selectedBackgroundColor);
      console.info("[alphabetIndexerSelectedBackgroundColor_undefined_0100] undefined selectedBackgroundColor is: " +
      obj.$attrs.selectedBackgroundColor);

      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[alphabetIndexerSelectedBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupBackground_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPBACKGROUND_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupBackground property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupBackground_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupBackground_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupBackground_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupBackground_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupBackground_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupBackground_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupBackground_null_0100] default popupBackground is: " +
      objCompare.$attrs.popupBackground);
      console.info("[alphabetIndexerPopupBackground_null_0100] null popupBackground is: " + obj.$attrs.popupBackground);

      expect(obj.$attrs.popupBackground).assertEqual(objCompare.$attrs.popupBackground);
      console.info('[alphabetIndexerPopupBackground_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupBackground_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPBACKGROUND_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupBackground property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupBackground_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupBackground_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupBackground_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupBackground_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupBackground_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupBackground_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupBackground_undefined_0100] default popupBackground is: " +
      objCompare.$attrs.popupBackground);
      console.info("[alphabetIndexerPopupBackground_undefined_0100] undefined popupBackground is: " +
      obj.$attrs.popupBackground);

      expect(obj.$attrs.popupBackground).assertEqual(objCompare.$attrs.popupBackground);
      console.info('[alphabetIndexerPopupBackground_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerUsingPopup_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_USINGPOPUP_NULL_0100
     * @tc.desc   Test AlphabetIndexer usingPopup property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerUsingPopup_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerUsingPopup_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_usingPopup_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_usingPopup_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerUsingPopup_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerUsingPopup_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerUsingPopup_null_0100] default usingPopup is: " + objCompare.$attrs.usingPopup);
      console.info("[alphabetIndexerUsingPopup_null_0100] null usingPopup is: " + obj.$attrs.usingPopup);

      expect(obj.$attrs.usingPopup).assertEqual(objCompare.$attrs.usingPopup);
      console.info('[alphabetIndexerUsingPopup_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerUsingPopup_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_USINGPOPUP_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer usingPopup property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerUsingPopup_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerUsingPopup_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_usingPopup_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_usingPopup_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerUsingPopup_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerUsingPopup_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerUsingPopup_undefined_0100] default usingPopup is: " + objCompare.$attrs.usingPopup);
      console.info("[alphabetIndexerUsingPopup_undefined_0100] undefined usingPopup is: " + obj.$attrs.usingPopup);

      expect(obj.$attrs.usingPopup).assertEqual(objCompare.$attrs.usingPopup);
      console.info('[alphabetIndexerUsingPopup_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerItemSize_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ITEMSIZE_NULL_0100
     * @tc.desc   Test AlphabetIndexer itemSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerItemSize_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerItemSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_itemSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_itemSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerItemSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerItemSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerItemSize_null_0100] default itemSize is: " + objCompare.$attrs.itemSize);
      console.info("[alphabetIndexerItemSize_null_0100] null itemSize is: " + obj.$attrs.itemSize);

      expect(obj.$attrs.itemSize).assertEqual('16.00vp');
      console.info('[alphabetIndexerItemSize_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerItemSize_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ITEMSIZE_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer itemSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerItemSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerItemSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_itemSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_itemSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerItemSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerItemSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerItemSize_undefined_0100] default itemSize is: " + objCompare.$attrs.itemSize);
      console.info("[alphabetIndexerItemSize_undefined_0100] undefined itemSize is: " + obj.$attrs.itemSize);

      expect(obj.$attrs.itemSize).assertEqual('16.00vp');
      console.info('[alphabetIndexerItemSize_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerAlignStyle_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ALIGNSTYLE_NULL_0100
     * @tc.desc   Test AlphabetIndexer alignStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerAlignStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerAlignStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_alignStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_alignStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerAlignStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerAlignStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerAlignStyle_null_0100] default alignStyle is: " + objCompare.$attrs.alignStyle);
      console.info("[alphabetIndexerAlignStyle_null_0100] null alignStyle is: " + obj.$attrs.alignStyle);

      expect(obj.$attrs.alignStyle).assertEqual(objCompare.$attrs.alignStyle);
      console.info('[alphabetIndexerAlignStyle_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerAlignStyle_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ALIGNSTYLE_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer alignStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerAlignStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerAlignStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_alignStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_alignStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerAlignStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerAlignStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerAlignStyle_undefined_0100] default alignStyle is: " + objCompare.$attrs.alignStyle);
      console.info("[alphabetIndexerAlignStyle_undefined_0100] undefined alignStyle is: " + obj.$attrs.alignStyle);

      expect(obj.$attrs.alignStyle).assertEqual(objCompare.$attrs.alignStyle);
      console.info('[alphabetIndexerAlignStyle_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelected_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTED_NULL_0100
     * @tc.desc   Test AlphabetIndexer selected property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelected_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelected_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selected_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelected_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelected_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelected_null_0100] default selected is: " + objCompare.$attrs.selected);
      console.info("[alphabetIndexerSelected_null_0100] null selected is: " + obj.$attrs.selected);

      expect(obj.$attrs.selected).assertEqual(objCompare.$attrs.selected);
      console.info('[alphabetIndexerSelected_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerSelected_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_SELECTED_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer selected property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerSelected_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerSelected_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_selected_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_selected_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerSelected_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerSelected_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerSelected_undefined_0100] default selected is: " + objCompare.$attrs.selected);
      console.info("[alphabetIndexerSelected_undefined_0100] undefined selected is: " + obj.$attrs.selected);

      expect(obj.$attrs.selected).assertEqual(objCompare.$attrs.selected);
      console.info('[alphabetIndexerSelected_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupPosition_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPPOSITION_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupPosition property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupPosition_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupPosition_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupPosition_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupPosition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupPosition_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupPosition_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupPosition_null_0100] default popupPosition is: " +
      objCompare.$attrs.popupPosition);
      console.info("[alphabetIndexerPopupPosition_null_0100] null popupPosition is: " + obj.$attrs.popupPosition);

      expect(JSON.stringify(obj.$attrs.popupPosition)).assertEqual(JSON.stringify(objCompare.$attrs.popupPosition));
      console.info('[alphabetIndexerPopupPosition_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupPosition_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPPOSITION_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupPosition property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupPosition_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupPosition_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupPosition_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupPosition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupPosition_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupPosition_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupPosition_undefined_0100] default popupPosition is: " +
      objCompare.$attrs.popupPosition);
      console.info("[alphabetIndexerPopupPosition_undefined_0100] undefined popupPosition is: " +
      obj.$attrs.popupPosition);

      expect(JSON.stringify(obj.$attrs.popupPosition)).assertEqual(JSON.stringify(objCompare.$attrs.popupPosition));
      console.info('[alphabetIndexerPopupPosition_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupSelectedColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPSELECTEDCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupSelectedColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupSelectedColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupSelectedColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupSelectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupSelectedColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupSelectedColor_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupSelectedColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupSelectedColor_null_0100] default popupSelectedColor is: " +
      objCompare.$attrs.popupSelectedColor);
      console.info("[alphabetIndexerPopupSelectedColor_null_0100] null popupSelectedColor is: " +
      obj.$attrs.popupSelectedColor);

      expect(obj.$attrs.popupSelectedColor).assertEqual(objCompare.$attrs.popupSelectedColor);
      console.info('[alphabetIndexerPopupSelectedColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupSelectedColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPSELECTEDCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupSelectedColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupSelectedColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupSelectedColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupSelectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupSelectedColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupSelectedColor_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupSelectedColor_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupSelectedColor_undefined_0100] default popupSelectedColor is: " +
      objCompare.$attrs.popupSelectedColor);
      console.info("[alphabetIndexerPopupSelectedColor_undefined_0100] undefined popupSelectedColor is: " +
      obj.$attrs.popupSelectedColor);

      expect(obj.$attrs.popupSelectedColor).assertEqual(objCompare.$attrs.popupSelectedColor);
      console.info('[alphabetIndexerPopupSelectedColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupUnselectedColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPUNSELECTEDCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupUnselectedColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupUnselectedColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupUnselectedColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupUnselectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupUnselectedColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupUnselectedColor_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupUnselectedColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupUnselectedColor_null_0100] default popupUnselectedColor is: " +
      objCompare.$attrs.popupUnselectedColor);
      console.info("[alphabetIndexerPopupUnselectedColor_null_0100] null popupUnselectedColor is: " +
      obj.$attrs.popupUnselectedColor);

      expect(obj.$attrs.popupUnselectedColor).assertEqual(objCompare.$attrs.popupUnselectedColor);
      console.info('[alphabetIndexerPopupUnselectedColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupUnselectedColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPUNSELECTEDCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupUnselectedColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupUnselectedColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupUnselectedColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupUnselectedColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupUnselectedColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupUnselectedColor_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupUnselectedColor_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupUnselectedColor_undefined_0100] default popupUnselectedColor is: " +
      objCompare.$attrs.popupUnselectedColor);
      console.info("[alphabetIndexerPopupUnselectedColor_undefined_0100] undefined popupUnselectedColor is: " +
      obj.$attrs.popupUnselectedColor);

      expect(obj.$attrs.popupUnselectedColor).assertEqual(objCompare.$attrs.popupUnselectedColor);
      console.info('[alphabetIndexerPopupUnselectedColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemFont_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMFONT_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupItemFont property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemFont_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetizerPopupItemFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemFont_null_0100] default popupItemFont is: " +
      objCompare.$attrs.popupItemFont);
      console.info("[alphabetIndexerPopupItemFont_null_0100] null popupItemFont is: " + obj.$attrs.popupItemFont);

      expect(obj.$attrs.popupItemFont).assertEqual(objCompare.$attrs.popupItemFont);
      console.info('[alphabetIndexerPopupItemFont_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemFont_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMFONT_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupItemFont property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemFont_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupItemFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemFont_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemFont_undefined_0100] default popupItemFont is: " +
      objCompare.$attrs.popupItemFont);
      console.info("[alphabetIndexerPopupItemFont_undefined_0100] undefined popupItemFont is: " +
      obj.$attrs.popupItemFont);

      expect(obj.$attrs.popupItemFont).assertEqual(objCompare.$attrs.popupItemFont);
      console.info('[alphabetIndexerPopupItemFont_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMBACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupItemBackgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemBackgroundColor_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupItemBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemBackgroundColor_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemBackgroundColor_null_0100] default popupItemBackgroundColor is: " +
      objCompare.$attrs.popupItemBackgroundColor);
      console.info("[alphabetIndexerPopupItemBackgroundColor_null_0100] null popupItemBackgroundColor is: " +
      obj.$attrs.popupItemBackgroundColor);

      expect(obj.$attrs.popupItemBackgroundColor).assertEqual(objCompare.$attrs.popupItemBackgroundColor);
      console.info('[alphabetIndexerPopupItemBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMBACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupItemBackgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemBackgroundColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupItemBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemBackgroundColor_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemBackgroundColor_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemBackgroundColor_undefined_0100] default popupItemBackgroundColor is: " +
      objCompare.$attrs.popupItemBackgroundColor);
      console.info("[alphabetIndexerPopupItemBackgroundColor_undefined_0100] undefined popupItemBackgroundColor is: " +
      obj.$attrs.popupItemBackgroundColor);

      expect(obj.$attrs.popupItemBackgroundColor).assertEqual(objCompare.$attrs.popupItemBackgroundColor);
      console.info('[alphabetIndexerPopupItemBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerAutoCollapse_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_AUTOCOLLAPSE_NULL_0100
     * @tc.desc   Test AlphabetIndexer autoCollapse property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerAutoCollapse_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerAutoCollapse_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_autoCollapse_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_autoCollapse_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerAutoCollapse_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerAutoCollapse_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerAutoCollapse_null_0100] default autoCollapse is: " +
      objCompare.$attrs.autoCollapse);
      console.info("[alphabetIndexerAutoCollapse_null_0100] null autoCollapse is: " + obj.$attrs.autoCollapse);

      expect(obj.$attrs.autoCollapse).assertEqual('true');
      console.info('[alphabetIndexerAutoCollapse_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerAutoCollapse_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_AUTOCOLLAPSE_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer autoCollapse property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerAutoCollapse_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerAutoCollapse_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_autoCollapse_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_autoCollapse_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerAutoCollapse_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerAutoCollapse_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerAutoCollapse_undefined_0100] default autoCollapse is: " +
      objCompare.$attrs.autoCollapse);
      console.info("[alphabetIndexerAutoCollapse_undefined_0100] undefined autoCollapse is: " +
      obj.$attrs.autoCollapse);

      expect(obj.$attrs.autoCollapse).assertEqual('true');
      console.info('[alphabetIndexerAutoCollapse_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemBorderRadius_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMBORDERRADIUS_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupItemBorderRadius property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemBorderRadius_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupItemBorderRadius_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemBorderRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemBorderRadius_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemBorderRadius_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemBorderRadius_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemBorderRadius_null_0100] default popupItemBorderRadius is: " +
      objCompare.$attrs.popupItemBorderRadius);
      console.info("[alphabetIndexerPopupItemBorderRadius_null_0100] null popupItemBorderRadius is: " +
      obj.$attrs.popupItemBorderRadius);

      expect(obj.$attrs.popupItemBorderRadius).assertEqual(objCompare.$attrs.popupItemBorderRadius);
      console.info('[alphabetIndexerPopupItemBorderRadius_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupItemBorderRadius_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPITEMBORDERRADIUS_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupItemBorderRadius property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupItemBorderRadius_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupItemBorderRadius_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupItemBorderRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupItemBorderRadius_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupItemBorderRadius_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupItemBorderRadius_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupItemBorderRadius_undefined_0100] default popupItemBorderRadius is: " +
      objCompare.$attrs.popupItemBorderRadius);
      console.info("[alphabetIndexerPopupItemBorderRadius_undefined_0100] undefined popupItemBorderRadius is: " +
      obj.$attrs.popupItemBorderRadius);

      expect(obj.$attrs.popupItemBorderRadius).assertEqual(objCompare.$attrs.popupItemBorderRadius);
      console.info('[alphabetIndexerPopupItemBorderRadius_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerItemBorderRadius_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ITEMBORDERRADIUS_NULL_0100
     * @tc.desc   Test AlphabetIndexer itemBorderRadius property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerItemBorderRadius_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerItemBorderRadius_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_itemBorderRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_itemBorderRadius_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerItemBorderRadius_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerItemBorderRadius_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerItemBorderRadius_null_0100] default itemBorderRadius is: " +
      objCompare.$attrs.itemBorderRadius);
      console.info("[alphabetIndexerItemBorderRadius_null_0100] null itemBorderRadius is: " +
      obj.$attrs.itemBorderRadius);

      expect(obj.$attrs.itemBorderRadius).assertEqual(objCompare.$attrs.itemBorderRadius);
      console.info('[alphabetIndexerItemBorderRadius_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerItemBorderRadius_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ITEMBORDERRADIUS_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer itemBorderRadius property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerItemBorderRadius_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerItemBorderRadius_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_itemBorderRadius_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_itemBorderRadius_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerItemBorderRadius_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerItemBorderRadius_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerItemBorderRadius_undefined_0100] default itemBorderRadius is: " +
      objCompare.$attrs.itemBorderRadius);
      console.info("[alphabetIndexerItemBorderRadius_undefined_0100] undefined itemBorderRadius is: " +
      obj.$attrs.itemBorderRadius);

      expect(obj.$attrs.itemBorderRadius).assertEqual(objCompare.$attrs.itemBorderRadius);
      console.info('[alphabetIndexerItemBorderRadius_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupBackgroundBlurStyle_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPBACKGROUNDBLURSTYLE_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupBackgroundBlurStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupBackgroundBlurStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupBackgroundBlurStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupBackgroundBlurStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupBackgroundBlurStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupBackgroundBlurStyle_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_null_0100] default popupBackgroundBlurStyle is: " +
      objCompare.$attrs.popupBackgroundBlurStyle);
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_null_0100] null popupBackgroundBlurStyle is: " +
      obj.$attrs.popupBackgroundBlurStyle);

      expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual(objCompare.$attrs.popupBackgroundBlurStyle);
      console.info('[alphabetIndexerPopupBackgroundBlurStyle_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupBackgroundBlurStyle_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPBACKGROUNDBLURSTYLE_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupBackgroundBlurStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupBackgroundBlurStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupBackgroundBlurStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupBackgroundBlurStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] default popupBackgroundBlurStyle is: " +
      objCompare.$attrs.popupBackgroundBlurStyle);
      console.info("[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] undefined popupBackgroundBlurStyle is: " +
      obj.$attrs.popupBackgroundBlurStyle);

      expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual(objCompare.$attrs.popupBackgroundBlurStyle);
      console.info('[alphabetIndexerPopupBackgroundBlurStyle_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupTitleBackground_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPTITLEBACKGROUND_NULL_0100
     * @tc.desc   Test AlphabetIndexer popupTitleBackground property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupTitleBackground_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupTitleBackground_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupTitleBackground_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupTitleBackground_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupTitleBackground_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupTitleBackground_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupTitleBackground_null_0100] default popupTitleBackground is: " +
      objCompare.$attrs.popupTitleBackground);
      console.info("[alphabetIndexerPopupTitleBackground_null_0100] null popupTitleBackground is: " +
      obj.$attrs.popupTitleBackground);

      expect(obj.$attrs.popupTitleBackground).assertEqual(objCompare.$attrs.popupTitleBackground);
      console.info('[alphabetIndexerPopupTitleBackground_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerPopupTitleBackground_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_POPUPTITLEBACKGROUND_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer popupTitleBackground property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerPopupTitleBackground_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerPopupTitleBackground_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_popupTitleBackground_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_popupTitleBackground_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerPopupTitleBackground_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerPopupTitleBackground_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerPopupTitleBackground_undefined_0100] default popupTitleBackground is: " +
      objCompare.$attrs.popupTitleBackground);
      console.info("[alphabetIndexerPopupTitleBackground_undefined_0100] undefined popupTitleBackground is: " +
      obj.$attrs.popupTitleBackground);

      expect(obj.$attrs.popupTitleBackground).assertEqual(objCompare.$attrs.popupTitleBackground);
      console.info('[alphabetIndexerPopupTitleBackground_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerEnableHapticFeedback_null_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ENABLEHAPTICFEEDBACK_NULL_0100
     * @tc.desc   Test AlphabetIndexer enableHapticFeedback property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerEnableHapticFeedback_null_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerEnableHapticFeedback_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerEnableHapticFeedback_null_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerEnableHapticFeedback_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerEnableHapticFeedback_null_0100] default enableHapticFeedback is: " +
      objCompare.$attrs.enableHapticFeedback);
      console.info("[alphabetIndexerEnableHapticFeedback_null_0100] null enableHapticFeedback is: " +
      obj.$attrs.enableHapticFeedback);

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[alphabetIndexerEnableHapticFeedback_null_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerEnableHapticFeedback_undefined_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ENABLEHAPTICFEEDBACK_UNDEFINED_0100
     * @tc.desc   Test AlphabetIndexer enableHapticFeedback property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerEnableHapticFeedback_undefined_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerEnableHapticFeedback_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerEnableHapticFeedback_undefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerEnableHapticFeedback_undefined_0100] undefined obj is: " +
      JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerEnableHapticFeedback_undefined_0100] default enableHapticFeedback is: " +
      objCompare.$attrs.enableHapticFeedback);
      console.info("[alphabetIndexerEnableHapticFeedback_undefined_0100] undefined enableHapticFeedback is: " +
      obj.$attrs.enableHapticFeedback);

      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[alphabetIndexerEnableHapticFeedback_undefined_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerEnableHapticFeedback_false_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ENABLEHAPTICFEEDBACK_FALSE_0100
     * @tc.desc   Test AlphabetIndexer enableHapticFeedback property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerEnableHapticFeedback_false_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerEnableHapticFeedback_false_0100] START');

      let strJson: string = getInspectorByKey('AlphabetIndexer_enableHapticFeedback_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerEnableHapticFeedback_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerEnableHapticFeedback_false_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[alphabetIndexerEnableHapticFeedback_false_0100] END');
    })

    /**
     * @tc.name   alphabetIndexerItemSize_empty_0100
     * @tc.number SUB_ARKUI_ALPHABETINDEXER_ITEMSIZE_EMPTY_0100
     * @tc.desc   Test AlphabetIndexer itemSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('alphabetIndexerItemSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[alphabetIndexerItemSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('AlphabetIndexer_itemSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('AlphabetIndexer_itemSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[alphabetIndexerItemSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[alphabetIndexerItemSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[alphabetIndexerItemSize_empty_0100] default itemSize is: " + objCompare.$attrs.itemSize);
      console.info("[alphabetIndexerItemSize_empty_0100] empty itemSize is: " + obj.$attrs.itemSize);

      expect(obj.$attrs.itemSize).assertEqual('16.00vp');
      console.info('[alphabetIndexerItemSize_empty_0100] END');
    })
  })
}
