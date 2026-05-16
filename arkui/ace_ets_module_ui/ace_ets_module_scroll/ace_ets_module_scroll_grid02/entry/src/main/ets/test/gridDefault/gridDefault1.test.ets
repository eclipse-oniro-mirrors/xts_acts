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

export default function gridDefaultTest1() {
  describe('gridDefaultTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("gridDefaultTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridDefault/gridDefault1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("gridDefault1" == pages.name)) {
          console.info("get gridDefaultTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridDefaultTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridDefaultTest1 page error:" + err);
      }
      console.info("gridDefaultTest1 beforeEach end");
      done();
    });

    // ========== columnsTemplate tests (string) ==========
    /**
     * @tc.name   gridColumnsTemplateNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_COLUMNSTEMPLATE_NULL_0100
     * @tc.desc   Test Grid columnsTemplate property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsTemplateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridColumnsTemplateNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_columnsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsTemplateNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsTemplateNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // Grid columnsTemplate 不设置
      expect(obj.$attrs.columnsTemplate).assertEqual("");
      console.info('[gridColumnsTemplateNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridColumnsTemplateNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_COLUMNSTEMPLATE_NULL_0200
     * @tc.desc   Test Grid columnsTemplate property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsTemplateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridColumnsTemplateNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_columnsTemplate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsTemplateNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsTemplateNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // Grid columnsTemplate 设置null
      expect(obj.$attrs.columnsTemplate).assertEqual("null");
      console.info('[gridColumnsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColumnsTemplateNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_COLUMNSTEMPLATE_NULL_0300
     * @tc.desc   Test Grid columnsTemplate propertyndefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsTemplateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridColumnsTemplateNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_columnsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsTemplateNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsTemplateNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // Grid columnsTemplate 设置undefined
      expect(obj.$attrs.columnsTemplate).assertEqual("undefined");
      console.info('[gridColumnsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColumnsTemplateNullUndefined_0400
     * @tc.number SUB_ARKUI_GRID_COLUMNSTEMPLATE_NULL_0400
     * @tc.desc   Test Grid columnsTemplate property with empty string, should restore to default value (固定1列)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsTemplateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridColumnsTemplateNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('grid_columnsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsTemplateNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsTemplateNullUndefined_0400] empty obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // 空字符串应该恢复为默认值（固定1列）
      expect(obj.$attrs.columnsTemplate).assertEqual("1fr");
      console.info('[gridColumnsTemplateNullUndefined_0400] END');
    })

    // ========== rowsTemplate tests (string) ==========
    /**
     * @tc.name   gridRowsTemplateNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_ROWSTEMPLATE_NULL_0100
     * @tc.desc   Test Grid rowsTemplate property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsTemplateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridRowsTemplateNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_rowsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsTemplateNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsTemplateNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // Grid rowsTemplate 不设置
      expect(obj.$attrs.rowsTemplate).assertEqual("");
      console.info('[gridRowsTemplateNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridRowsTemplateNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_ROWSTEMPLATE_NULL_0200
     * @tc.desc   Test Grid rowsTemplate property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsTemplateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridRowsTemplateNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_rowsTemplate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsTemplateNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsTemplateNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // Grid rowsTemplate 设置null
      expect(obj.$attrs.rowsTemplate).assertEqual("null");
      console.info('[gridRowsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridRowsTemplateNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_ROWSTEMPLATE_NULL_0300
     * @tc.desc   Test Grid rowsTemplate property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsTemplateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridRowsTemplateNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_rowsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsTemplateNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsTemplateNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // Grid rowsTemplate 设置undefined
      expect(obj.$attrs.rowsTemplate).assertEqual("undefined");
      console.info('[gridRowsTemplateNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridRowsTemplateNullUndefined_0400
     * @tc.number SUB_ARKUI_GRID_ROWSTEMPLATE_NULL_0400
     * @tc.desc   Test Grid rowsTemplate property with empty string, should restore to default value (固定1行)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsTemplateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridRowsTemplateNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('grid_rowsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsTemplateNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsTemplateNullUndefined_0400] empty obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // 空字符串应该恢复为默认值（固定1行）
      expect(obj.$attrs.rowsTemplate).assertEqual("1fr");
      console.info('[gridRowsTemplateNullUndefined_0400] END');
    })

    // ========== columnsGap tests ==========
    /**
     * @tc.name   gridColumnsGapNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_COLUMNSGAP_NULL_0100
     * @tc.desc   Test Grid columnsGap property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridColumnsGapNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_columnsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsGapNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // Grid columnsGap 不设置，默认值0
      expect(obj.$attrs.columnsGap).assertEqual("0.00vp");
      console.info('[gridColumnsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridColumnsGapNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_COLUMNSGAP_NULL_0200
     * @tc.desc   Test Grid columnsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridColumnsGapNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_columnsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsGapNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // Grid columnsGap 设置null
      expect(obj.$attrs.columnsGap).assertEqual("0.00px");
      console.info('[gridColumnsGapNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColumnsGapNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_COLUMNSGAP_NULL_0300
     * @tc.desc   Test Grid columnsGap property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColumnsGapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridColumnsGapNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_columnsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColumnsGapNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridColumnsGapNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // Grid columnsGap 设置undefined
      expect(obj.$attrs.columnsGap).assertEqual("0.00px");
      console.info('[gridColumnsGapNullUndefined_0300] END');
    })

    // ========== rowsGap tests ==========
    /**
     * @tc.name   gridRowsGapNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_ROWSGAP_NULL_0100
     * @tc.desc   Test Grid rowsGap property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridRowsGapNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_rowsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsGapNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // Grid rowsGap 不设置，默认值0
      expect(obj.$attrs.rowsGap).assertEqual("0.00vp");
      console.info('[gridRowsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridRowsGapNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_ROWSGAP_NULL_0200
     * @tc.desc   Test Grid rowsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridRowsGapNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_rowsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsGapNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // Grid rowsGap 设置null
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[gridRowsGapNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridRowsGapNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_ROWSGAP_NULL_0300
     * @tc.desc   Test Grid rowsGap property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowsGapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridRowsGapNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_rowsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowsGapNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridRowsGapNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // Grid rowsGap 设置undefined
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[gridRowsGapNullUndefined_0300] END');
    })

    // ========== scrollBarWidth tests (number|string) ==========
    /**
     * @tc.name   gridScrollBarWidthNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_SCROLLBARWIDTH_NULL_0100
     * @tc.desc   Test Grid scrollBarWidth property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarWidthNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridScrollBarWidthNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_scrollBarWidth_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarWidthNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarWidthNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // Grid scrollBarWidth 不设置
      expect(obj.$attrs.scrollBarWidth).assertEqual("4.00vp");
      console.info('[gridScrollBarWidthNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridScrollBarWidthNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_SCROLLBARWIDTH_NULL_0200
     * @tc.desc   Test Grid scrollBarWidth property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarWidthNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridScrollBarWidthNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarWidth_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarWidthNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarWidthNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[gridScrollBarWidthNullUndefined_0200] empty obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[gridScrollBarWidthNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridScrollBarWidthNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_SCROLLBARWIDTH_NULL_0300
     * @tc.desc   Test Grid scrollBarWidth property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarWidthNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridScrollBarWidthNullUndefined_0300] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarWidthNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarWidthNullUndefined_0300] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[gridScrollBarWidthNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // Grid scrollBarWidth 设置null
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[gridScrollBarWidthNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridScrollBarWidthNullUndefined_0400
     * @tc.number SUB_ARKUI_GRID_SCROLLBARWIDTH_NULL_0400
     * @tc.desc   Test Grid scrollBarWidth property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarWidthNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridScrollBarWidthNullUndefined_0400] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarWidthNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarWidthNullUndefined_0400] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarWidth));
      console.info("[gridScrollBarWidthNullUndefined_0400] undefined obj is: " + JSON.stringify(obj.$attrs.scrollBarWidth));

      // Grid scrollBarWidth 设置undefined
      expect(obj.$attrs.scrollBarWidth).assertEqual(objCompare.$attrs.scrollBarWidth);
      console.info('[gridScrollBarWidthNullUndefined_0400] END');
    })

    // ========== scrollBarColor tests (Color|number|string) ==========
    /**
     * @tc.name   gridScrollBarColorNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_SCROLLBARCOLOR_NULL_0100
     * @tc.desc   Test Grid scrollBarColor property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarColorNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridScrollBarColorNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarColor_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarColorNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarColorNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[gridScrollBarColorNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[gridScrollBarColorNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridScrollBarColorNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_SCROLLBARCOLOR_NULL_0200
     * @tc.desc   Test Grid scrollBarColor property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarColorNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridScrollBarColorNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarColorNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarColorNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[gridScrollBarColorNullUndefined_0200] empty obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // Grid scrollBarColor 设置null
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[gridScrollBarColorNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridScrollBarColorNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_SCROLLBARCOLOR_NULL_0300
     * @tc.desc   Test Grid scrollBarColor property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarColorNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridScrollBarColorNullUndefined_0300] START');
      let strJsonCompare: string = getInspectorByKey('grid_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('grid_scrollBarColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarColorNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarColorNullUndefined_0300] default obj is: " + JSON.stringify(objCompare.$attrs.scrollBarColor));
      console.info("[gridScrollBarColorNullUndefined_0300] null obj is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // Grid scrollBarColor 设置undefined
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[gridScrollBarColorNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridScrollBarColorNullUndefined_0400
     * @tc.number gridScrollBarColorNullUndefined_0400
     * @tc.desc   Test Grid scrollBarColor property with number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarColorNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridScrollBarColorNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('grid_scrollBarColor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarColorNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarColorNullUndefined_0400] number is: " + JSON.stringify(obj.$attrs.scrollBarColor));

      // Grid scrollBarColor 设置number
      expect(obj.$attrs.scrollBarColor).assertEqual("#FFFFF000");
      console.info('[gridScrollBarColorNullUndefined_0400] END');
    })

    // ========== scrollBar tests ==========
    /**
     * @tc.name   gridScrollBarNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_SCROLLBAR_NULL_0100
     * @tc.desc   Test Grid scrollBar property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridScrollBarNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_scrollBar_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // Grid scrollBar 不设置，默认值Auto
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[gridScrollBarNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridScrollBarNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_SCROLLBAR_NULL_0200
     * @tc.desc   Test Grid scrollBar property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridScrollBarNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_scrollBar_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // Grid scrollBar 设置null
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[gridScrollBarNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridScrollBarNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_SCROLLBAR_NULL_0300
     * @tc.desc   Test Grid scrollBar property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollBarNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridScrollBarNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_scrollBar_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridScrollBarNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridScrollBarNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.scrollBar));

      // Grid scrollBar 设置undefined
      expect(obj.$attrs.scrollBar).assertEqual("BarState.Auto");
      console.info('[gridScrollBarNullUndefined_0300] END');
    })

    // ========== cachedCount tests ==========
    /**
     * @tc.name   gridCachedCountNullUndefined_0100
     * @tc.number SUB_ARKUI_GRID_CACHEDCOUNT_NULL_0100
     * @tc.desc   Test Grid cachedCount property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCachedCountNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridCachedCountNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('grid_cachedCount_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCachedCountNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[gridCachedCountNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // Grid cachedCount 不设置，默认值1
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[gridCachedCountNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridCachedCountNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_CACHEDCOUNT_NULL_0200
     * @tc.desc   Test Grid cachedCount property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCachedCountNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridCachedCountNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('grid_cachedCount_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCachedCountNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[gridCachedCountNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // Grid cachedCount 设置null
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[gridCachedCountNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridCachedCountNullUndefined_0300
     * @tc.number SUB_ARKUI_GRID_CACHEDCOUNT_NULL_0300
     * @tc.desc   Test Grid cachedCount property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCachedCountNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridCachedCountNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('grid_cachedCount_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCachedCountNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[gridCachedCountNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.cachedCount));

      // Grid cachedCount 设置undefined
      expect(obj.$attrs.cachedCount).assertEqual(1);
      console.info('[gridCachedCountNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridCachedCountNullUndefined_0400
     * @tc.number gridCachedCountNullUndefined_0400
     * @tc.desc   Test Grid cachedCount show property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridCachedCountNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridCachedCountNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('grid_cachedCount_show_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridCachedCountNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[gridCachedCountNullUndefined_0400] show false is: " + JSON.stringify(obj.$attrs.cachedCount));

      // Grid cachedCount show 设置false
      expect(obj.$attrs.cachedCount).assertEqual(2);
      console.info('[gridCachedCountNullUndefined_0400] END');
    })
  })
}
