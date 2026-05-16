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
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@system.router';
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function ArcAlphabetIndexerColorUndefinedTest() {
  describe('ArcAlphabetIndexerColorUndefinedTest', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ArcAlphabetIndexer/ArcAlphabetIndexerColorUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcAlphabetIndexerColorUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ArcAlphabetIndexerColorUndefinedTest" == pages.name)) {
          console.info("get ArcAlphabetIndexerColorUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcAlphabetIndexerColorUndefinedTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcAlphabetIndexerColorUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   arcAlphabetIndexerColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer color property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerColorUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerColorUndefined_0100] obj is: " + JSON.stringify(obj.$attrs));
        console.info("[arcAlphabetIndexerColorUndefined_0100] obj color is: " + JSON.stringify(obj.$attrs?.color));
        expect(obj.$attrs.color).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerColorUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerColorUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedColor property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedColorUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedColorUndefined_0100] selectedColor is: "
         + JSON.stringify(obj.$attrs?.selectedColor));
        expect(obj.$attrs.selectedColor).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerSelectedColorUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedColorUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer popupColor property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupColorUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupColorUndefined_0100] popupColor is: " + JSON.stringify(obj.$attrs?.popupColor));
        expect(obj.$attrs.popupColor).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerPopupColorUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupColorUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedBackgroundColorUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_BACKGROUND_COLOR_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedBackgroundColor property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedBackgroundColorUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedBackgroundColorUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedBackgroundColorUndefined_0100] selectedBackgroundColor is: " + JSON.stringify(obj.$attrs?.selectedBackgroundColor));
        expect(obj.$attrs.selectedBackgroundColor).assertEqual('0x1F71FF');
        console.info('[arcAlphabetIndexerSelectedBackgroundColorUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedBackgroundColorUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupBackgroundUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer popupBackground property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupBackgroundUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupBackgroundUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupBackgroundUndefined_0100] popupBackground is: "
         + JSON.stringify(obj.$attrs?.popupBackground));
        expect(obj.$attrs.popupBackground).assertEqual('0xD8404040');
        console.info('[arcAlphabetIndexerPopupBackgroundUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupBackgroundUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerUsePopupUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_USE_POPUP_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer usePopup property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerUsePopupUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerUsePopupUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerUsePopupUndefined_0100] usePopup is: " + JSON.stringify(obj.$attrs?.usePopup));
        expect(obj.$attrs.usePopup).assertEqual(false);
        console.info('[arcAlphabetIndexerUsePopupUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerUsePopupUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedFontUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_FONT_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedFont property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedFontUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedFontUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedFontUndefined_0100] selectedFont is: "
         + JSON.stringify(obj.$attrs?.selectedFont));
        // 验证selectedFont有值且不为null
        expect(obj.$attrs.selectedFont !== null && obj.$attrs.selectedFont !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerSelectedFontUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedFontUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupFontUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_FONT_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer popupFont property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupFontUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupFontUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupFontUndefined_0100] popupFont is: " + JSON.stringify(obj.$attrs?.popupFont));
        // 验证popupFont有值且不为null
        expect(obj.$attrs.popupFont !== null && obj.$attrs.popupFont !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerPopupFontUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupFontUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerFontUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_FONT_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer font property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerFontUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerFontUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerFontUndefined_0100] font is: " + JSON.stringify(obj.$attrs?.font));
        // 验证font有值且不为null
        expect(obj.$attrs.font !== null && obj.$attrs.font !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerFontUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerFontUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerItemSizeUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_ITEM_SIZE_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer itemSize property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerItemSizeUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerItemSizeUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerItemSizeUndefined_0100] itemSize is: " + JSON.stringify(obj.$attrs?.itemSize));
        expect(obj.$attrs.itemSize).assertEqual('24.0');
        console.info('[arcAlphabetIndexerItemSizeUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerItemSizeUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer selected property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedUndefined_0100] selected is: " + JSON.stringify(obj.$attrs?.selected));
        expect(obj.$attrs.selected).assertEqual(0);
        console.info('[arcAlphabetIndexerSelectedUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerAutoCollapseUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_AUTO_COLLAPSE_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer autoCollapse property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerAutoCollapseUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerAutoCollapseUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerAutoCollapseUndefined_0100] autoCollapse is: " + JSON.stringify(obj.$attrs?.autoCollapse));
        expect(obj.$attrs.autoCollapse).assertEqual(true);
        console.info('[arcAlphabetIndexerAutoCollapseUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerAutoCollapseUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_BLUR_STYLE_UNDEFINED_0100
     * @tc.desc   Test ArcAlphabetIndexer popupBackgroundBlurStyle property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerUndefined');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100] popupBackgroundBlurStyle is: "
         + JSON.stringify(obj.$attrs?.popupBackgroundBlurStyle));
        // 默认值为BlurStyle.NONE，对应值为0
        expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual(0);
        console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleUndefined_0100] ERROR: ' + JSON.stringify(error));
      }
    })
  })
}
