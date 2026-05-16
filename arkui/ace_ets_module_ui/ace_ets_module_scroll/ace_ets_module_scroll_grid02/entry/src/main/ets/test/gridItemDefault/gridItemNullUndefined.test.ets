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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridItemNullUndefinedTest() {
  describe('gridItemNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gridItemNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridItemDefault/gridItemNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gridItemNullUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("gridItemNullUndefined" == pages.name)) {
          console.info("get gridItemNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridItemNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridItemNullUndefinedTest page error:" + err);
      }
      console.info("gridItemNullUndefinedTest beforeEach end");
      done();
    });

    // ========== rowStart tests (number) ==========
    /**
     * @tc.name   gridItemRowStartNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_ROWSTART_NULL_0100
     * @tc.desc   Test GridItem rowStart property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowStartNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemRowStartNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_rowStart_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowStartNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowStartNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowStart));

      // GridItem rowStart 不设置
      expect(obj.$attrs.rowStart).assertEqual("0");
      console.info('[gridItemRowStartNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemRowStartNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_ROWSTART_NULL_0200
     * @tc.desc   Test GridItem rowStart property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowStartNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemRowStartNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_rowStart_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowStartNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowStartNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowStart));

      // GridItem rowStart 设置null，应恢复为默认值
      expect(obj.$attrs.rowStart).assertEqual("0");
      console.info('[gridItemRowStartNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemRowStartNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_ROWSTART_UNDEFINED_0300
     * @tc.desc   Test GridItem rowStart property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowStartNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemRowStartNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_rowStart_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowStartNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowStartNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowStart));

      // GridItem rowStart 设置undefined，应恢复为默认值
      expect(obj.$attrs.rowStart).assertEqual("0");
      console.info('[gridItemRowStartNullUndefined_0300] END');
    })

    // ========== rowEnd tests (number) ==========
    /**
     * @tc.name   gridItemRowEndNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_ROWEND_NULL_0100
     * @tc.desc   Test GridItem rowEnd property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowEndNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemRowEndNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_rowEnd_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowEndNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowEndNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowEnd));

      // GridItem rowEnd 不设置
      expect(obj.$attrs.rowEnd).assertEqual("0");
      console.info('[gridItemRowEndNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemRowEndNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_ROWEND_NULL_0200
     * @tc.desc   Test GridItem rowEnd property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowEndNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemRowEndNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_rowEnd_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowEndNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowEndNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowEnd));

      // GridItem rowEnd 设置null，应恢复为默认值
      expect(obj.$attrs.rowEnd).assertEqual("0");
      console.info('[gridItemRowEndNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemRowEndNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_ROWEND_UNDEFINED_0300
     * @tc.desc   Test GridItem rowEnd property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemRowEndNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemRowEndNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_rowEnd_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemRowEndNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemRowEndNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowEnd));

      // GridItem rowEnd 设置undefined，应恢复为默认值
      expect(obj.$attrs.rowEnd).assertEqual("0");
      console.info('[gridItemRowEndNullUndefined_0300] END');
    })

    // ========== columnStart tests (number) ==========
    /**
     * @tc.name   gridItemColumnStartNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNSTART_NULL_0100
     * @tc.desc   Test GridItem columnStart property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnStartNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemColumnStartNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_columnStart_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnStartNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnStartNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnStart));

      // GridItem columnStart 不设置
      expect(obj.$attrs.columnStart).assertEqual("0");
      console.info('[gridItemColumnStartNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemColumnStartNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNSTART_NULL_0200
     * @tc.desc   Test GridItem columnStart property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnStartNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemColumnStartNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_columnStart_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnStartNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnStartNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnStart));

      // GridItem columnStart 设置null，应恢复为默认值
      expect(obj.$attrs.columnStart).assertEqual("0");
      console.info('[gridItemColumnStartNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemColumnStartNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNSTART_UNDEFINED_0300
     * @tc.desc   Test GridItem columnStart property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnStartNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemColumnStartNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_columnStart_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnStartNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnStartNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnStart));

      // GridItem columnStart 设置undefined，应恢复为默认值
      expect(obj.$attrs.columnStart).assertEqual("0");
      console.info('[gridItemColumnStartNullUndefined_0300] END');
    })

    // ========== columnEnd tests (number) ==========
    /**
     * @tc.name   gridItemColumnEndNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNEND_NULL_0100
     * @tc.desc   Test GridItem columnEnd property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnEndNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemColumnEndNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_columnEnd_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnEndNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnEndNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnEnd));

      // GridItem columnEnd 不设置
      expect(obj.$attrs.columnEnd).assertEqual("0");
      console.info('[gridItemColumnEndNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemColumnEndNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNEND_NULL_0200
     * @tc.desc   Test GridItem columnEnd property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnEndNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemColumnEndNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_columnEnd_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnEndNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnEndNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnEnd));

      // GridItem columnEnd 设置null，应恢复为默认值
      expect(obj.$attrs.columnEnd).assertEqual("0");
      console.info('[gridItemColumnEndNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemColumnEndNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_COLUMNEND_UNDEFINED_0300
     * @tc.desc   Test GridItem columnEnd property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemColumnEndNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemColumnEndNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_columnEnd_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemColumnEndNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemColumnEndNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnEnd));

      // GridItem columnEnd 设置undefined，应恢复为默认值
      expect(obj.$attrs.columnEnd).assertEqual("0");
      console.info('[gridItemColumnEndNullUndefined_0300] END');
    })

    // ========== selectable tests (boolean) ==========
    /**
     * @tc.name   gridItemSelectableNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTABLE_NULL_0100
     * @tc.desc   Test GridItem selectable property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectableNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemSelectableNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_selectable_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectableNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectableNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.selectable));

      // GridItem selectable 不设置，默认值true
      expect(obj.$attrs.selectable).assertEqual("true");
      console.info('[gridItemSelectableNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemSelectableNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTABLE_NULL_0200
     * @tc.desc   Test GridItem selectable property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectableNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemSelectableNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_selectable_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectableNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectableNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.selectable));

      // GridItem selectable 设置null，应恢复为默认值true
      expect(obj.$attrs.selectable).assertEqual("true");
      console.info('[gridItemSelectableNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemSelectableNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTABLE_UNDEFINED_0300
     * @tc.desc   Test GridItem selectable property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectableNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemSelectableNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_selectable_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectableNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectableNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.selectable));

      // GridItem selectable 设置undefined，应恢复为默认值true
      expect(obj.$attrs.selectable).assertEqual("true");
      console.info('[gridItemSelectableNullUndefined_0300] END');
    })

    // ========== selected tests (boolean) ==========
    /**
     * @tc.name   gridItemSelectedNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTED_NULL_0100
     * @tc.desc   Test GridItem selected property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectedNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemSelectedNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_selected_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectedNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectedNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.selected));

      // GridItem selected 不设置，默认值false
      expect(obj.$attrs.selected).assertEqual("false");
      console.info('[gridItemSelectedNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemSelectedNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTED_NULL_0200
     * @tc.desc   Test GridItem selected property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectedNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemSelectedNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_selected_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectedNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectedNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.selected));

      // GridItem selected 设置null，应恢复为默认值false
      expect(obj.$attrs.selected).assertEqual("false");
      console.info('[gridItemSelectedNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemSelectedNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_SELECTED_UNDEFINED_0300
     * @tc.desc   Test GridItem selected property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemSelectedNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemSelectedNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_selected_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemSelectedNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemSelectedNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.selected));

      // GridItem selected 设置undefined，应恢复为默认值false
      expect(obj.$attrs.selected).assertEqual("false");
      console.info('[gridItemSelectedNullUndefined_0300] END');
    })

    // ========== GridItemOptions (style) tests ==========
    /**
     * @tc.name   gridItemOptionsNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDITEM_OPTIONS_NULL_0100
     * @tc.desc   Test GridItem GridItemOptions property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemOptionsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridItemOptionsNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('gridItem_options_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemOptionsNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemOptionsNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.style));

      // GridItem GridItemOptions 不设置，默认值GridItemStyle.NONE (0)
      expect(obj.$attrs.style).assertEqual("NONE");
      console.info('[gridItemOptionsNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridItemOptionsNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDITEM_OPTIONS_NULL_0200
     * @tc.desc   Test GridItem GridItemOptions property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemOptionsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridItemOptionsNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('gridItem_options_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemOptionsNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemOptionsNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.style));

      // GridItem GridItemOptions 设置null，应恢复为默认值GridItemStyle.NONE (0)
      expect(obj.$attrs.style).assertEqual("NONE");
      console.info('[gridItemOptionsNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridItemOptionsNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDITEM_OPTIONS_UNDEFINED_0300
     * @tc.desc   Test GridItem GridItemOptions property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridItemOptionsNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridItemOptionsNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('gridItem_options_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridItemOptionsNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridItemOptionsNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.style));

      // GridItem GridItemOptions 设置undefined，应恢复为默认值GridItemStyle.NONE (0)
      expect(obj.$attrs.style).assertEqual("NONE");
      console.info('[gridItemOptionsNullUndefined_0300] END');
    })
  })
}