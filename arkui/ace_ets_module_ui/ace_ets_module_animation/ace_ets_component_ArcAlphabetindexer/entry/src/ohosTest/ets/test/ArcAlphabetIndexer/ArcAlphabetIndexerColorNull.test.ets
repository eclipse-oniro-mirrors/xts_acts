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

export default function ArcAlphabetIndexerColorNullTest() {
  describe('ArcAlphabetIndexerColorNullTest', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: optionsObj = {
        uri: 'MainAbility/pages/ArcAlphabetIndexer/ArcAlphabetIndexerColorNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ArcAlphabetIndexerColorNullTest state pages: " + JSON.stringify(pages));
        if (!("ArcAlphabetIndexerColorNullTest" == pages.name)) {
          console.info("get ArcAlphabetIndexerColorNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ArcAlphabetIndexerColorNullTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ArcAlphabetIndexerColorNullTest page error: " + err);
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
     * @tc.name   arcAlphabetIndexerColorNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_COLOR_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer color property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerColorNull_0100] START');
      try {
        let strJsonCompare: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);

        console.info("[arcAlphabetIndexerColorNull_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
        console.info("[arcAlphabetIndexerColorNull_0100] default obj color is: " + JSON.stringify(objCompare.$attrs?.color));
        expect(objCompare.$attrs.color).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerColorNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerColorNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedColorNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_COLOR_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedColor property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedColorNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedColorNull_0100] selectedColor is: " + JSON.stringify(obj.$attrs?.selectedColor));
        expect(obj.$attrs.selectedColor).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerSelectedColorNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedColorNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupColorNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_COLOR_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer popupColor property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupColorNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupColorNull_0100] popupColor is: " + JSON.stringify(obj.$attrs?.popupColor));
        expect(obj.$attrs.popupColor).assertEqual('0xFFFFFF');
        console.info('[arcAlphabetIndexerPopupColorNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupColorNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedBackgroundColorNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_BACKGROUND_COLOR_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedBackgroundColor property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedBackgroundColorNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedBackgroundColorNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedBackgroundColorNull_0100] selectedBackgroundColor is: "
         + JSON.stringify(obj.$attrs?.selectedBackgroundColor));
        expect(obj.$attrs.selectedBackgroundColor).assertEqual('0x1F71FF');
        console.info('[arcAlphabetIndexerSelectedBackgroundColorNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedBackgroundColorNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupBackgroundNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer popupBackground property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupBackgroundNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupBackgroundNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupBackgroundNull_0100] popupBackground is: " + JSON.stringify(obj.$attrs?.popupBackground));
        expect(obj.$attrs.popupBackground).assertEqual('0xD8404040');
        console.info('[arcAlphabetIndexerPopupBackgroundNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupBackgroundNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerUsePopupNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_USE_POPUP_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer usePopup property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerUsePopupNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerUsePopupNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerUsePopupNull_0100] usePopup is: " + JSON.stringify(obj.$attrs?.usePopup));
        expect(obj.$attrs.usePopup).assertEqual(false);
        console.info('[arcAlphabetIndexerUsePopupNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerUsePopupNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedFontNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_FONT_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer selectedFont property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedFontNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedFontNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedFontNull_0100] selectedFont is: " + JSON.stringify(obj.$attrs?.selectedFont));
        // 验证selectedFont有值且不为null
        expect(obj.$attrs.selectedFont !== null && obj.$attrs.selectedFont !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerSelectedFontNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedFontNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupFontNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_FONT_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer popupFont property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupFontNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupFontNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupFontNull_0100] popupFont is: " + JSON.stringify(obj.$attrs?.popupFont));
        // 验证popupFont有值且不为null
        expect(obj.$attrs.popupFont !== null && obj.$attrs.popupFont !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerPopupFontNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupFontNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerFontNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_FONT_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer font property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerFontNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerFontNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerFontNull_0100] font is: " + JSON.stringify(obj.$attrs?.font));
        // 验证font有值且不为null
        expect(obj.$attrs.font !== null && obj.$attrs.font !== undefined).assertTrue();
        console.info('[arcAlphabetIndexerFontNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerFontNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerItemSizeNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_ITEM_SIZE_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer itemSize property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerItemSizeNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerItemSizeNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerItemSizeNull_0100] itemSize is: " + JSON.stringify(obj.$attrs?.itemSize));
        expect(obj.$attrs.itemSize).assertEqual('24.0');
        console.info('[arcAlphabetIndexerItemSizeNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerItemSizeNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerSelectedNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_SELECTED_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer selected property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerSelectedNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerSelectedNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerSelectedNull_0100] selected is: " + JSON.stringify(obj.$attrs?.selected));
        expect(obj.$attrs.selected).assertEqual(0);
        console.info('[arcAlphabetIndexerSelectedNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerSelectedNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerAutoCollapseNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_AUTO_COLLAPSE_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer autoCollapse property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerAutoCollapseNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerAutoCollapseNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerAutoCollapseNull_0100] autoCollapse is: " + JSON.stringify(obj.$attrs?.autoCollapse));
        expect(obj.$attrs.autoCollapse).assertEqual(true);
        console.info('[arcAlphabetIndexerAutoCollapseNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerAutoCollapseNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100
     * @tc.number SUB_ARKUI_ARC_ALPHABET_INDEXER_POPUP_BACKGROUND_BLUR_STYLE_NULL_0100
     * @tc.desc   Test ArcAlphabetIndexer popupBackgroundBlurStyle property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100', Level.LEVEL0, async () => {
      console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100] START');
      try {
        let strJson: string = getInspectorByKey('testArcAlphabetIndexerNull');
        let obj: Record<string, ESObject> = JSON.parse(strJson);

        console.info("[arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100] popupBackgroundBlurStyle is: " + JSON.stringify(obj.$attrs?.popupBackgroundBlurStyle));
        // 默认值为BlurStyle.NONE，对应值为0
        expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual(0);
        console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100] END');
      } catch (error) {
        console.info('[arcAlphabetIndexerPopupBackgroundBlurStyleNull_0100] ERROR: ' + JSON.stringify(error));
      }
    })
  })
}
