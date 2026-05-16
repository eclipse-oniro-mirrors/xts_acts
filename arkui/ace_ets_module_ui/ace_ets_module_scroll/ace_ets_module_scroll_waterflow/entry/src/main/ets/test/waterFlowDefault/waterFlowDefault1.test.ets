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

export default function waterFlowDefaultTest1() {
  describe('waterFlowDefaultTest1', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowDefaultTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/waterFlowDefault/waterFlowDefault1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("waterFlowDefault1" == pages.name)) {
          console.info("get waterFlowDefaultTest1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowDefaultTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowDefaultTest1 page error:" + err);
      }
      console.info("waterFlowDefaultTest1 beforeEach end");
      done();
    });

    // ========== columnsTemplate tests (string) ==========
    /**
     * @tc.name   waterColumnsTemplateNullUndefined_0100
     * @tc.number waterColumnsTemplateNullUndefined_0100
     * @tc.desc   Test WaterFlow columnsTemplate property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsTemplateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterColumnsTemplateNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsTemplateNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsTemplateNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // WaterFlow columnsTemplate 不设置
      expect(obj.$attrs.columnsTemplate).assertEqual("");
      console.info('[waterColumnsTemplateNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterColumnsTemplateNullUndefined_0200
     * @tc.number waterColumnsTemplateNullUndefined_0200
     * @tc.desc   Test WaterFlow columnsTemplate property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsTemplateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterColumnsTemplateNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsTemplate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsTemplateNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsTemplateNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // WaterFlow columnsTemplate 设置null
      expect(obj.$attrs.columnsTemplate).assertEqual("null");
      console.info('[waterColumnsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterColumnsTemplateNullUndefined_0300
     * @tc.number waterColumnsTemplateNullUndefined_0300
     * @tc.desc   Test WaterFlow columnsTemplate property undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsTemplateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterColumnsTemplateNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsTemplateNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsTemplateNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // WaterFlow columnsTemplate 设置undefined
      expect(obj.$attrs.columnsTemplate).assertEqual("undefined");
      console.info('[waterColumnsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterColumnsTemplateNullUndefined_0400
     * @tc.number waterColumnsTemplateNullUndefined_0400
     * @tc.desc   Test WaterFlow columnsTemplate property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsTemplateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[waterColumnsTemplateNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsTemplateNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsTemplateNullUndefined_0400] empty obj is: " + JSON.stringify(obj.$attrs.columnsTemplate));

      // 空字符串应该恢复为默认值（固定1列）
      expect(obj.$attrs.columnsTemplate).assertEqual("1fr");
      console.info('[waterColumnsTemplateNullUndefined_0400] END');
    })

    // ========== rowsTemplate tests (string) ==========
    /**
     * @tc.name   waterRowsTemplateNullUndefined_0100
     * @tc.number waterRowsTemplateNullUndefined_0100
     * @tc.desc   Test WaterFlow rowsTemplate property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsTemplateNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterRowsTemplateNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsTemplate_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsTemplateNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsTemplateNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // WaterFlow rowsTemplate 不设置
      expect(obj.$attrs.rowsTemplate).assertEqual("");
      console.info('[waterRowsTemplateNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterRowsTemplateNullUndefined_0200
     * @tc.number waterRowsTemplateNullUndefined_0200
     * @tc.desc   Test WaterFlow rowsTemplate property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsTemplateNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterRowsTemplateNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsTemplate_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsTemplateNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsTemplateNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // WaterFlow rowsTemplate 设置null
      expect(obj.$attrs.rowsTemplate).assertEqual("null");
      console.info('[waterRowsTemplateNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterRowsTemplateNullUndefined_0300
     * @tc.number waterRowsTemplateNullUndefined_0300
     * @tc.desc   Test WaterFlow rowsTemplate property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsTemplateNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterRowsTemplateNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsTemplate_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsTemplateNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsTemplateNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // WaterFlow rowsTemplate 设置undefined
      expect(obj.$attrs.rowsTemplate).assertEqual("undefined");
      console.info('[waterRowsTemplateNullUndefined_0300] END');
    })

    /**
     * @tc.name   waterRowsTemplateNullUndefined_0400
     * @tc.number waterRowsTemplateNullUndefined_0400
     * @tc.desc   Test WaterFlow rowsTemplate property with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsTemplateNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[waterRowsTemplateNullUndefined_0400] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsTemplate_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsTemplateNullUndefined_0400] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsTemplateNullUndefined_0400] empty obj is: " + JSON.stringify(obj.$attrs.rowsTemplate));

      // 空字符串应该恢复为默认值（固定1行）
      expect(obj.$attrs.rowsTemplate).assertEqual("1fr");
      console.info('[waterRowsTemplateNullUndefined_0400] END');
    })

    // ========== itemConstraintSize tests ==========
    /**
     * @tc.name   waterItemConstraintSizeNullUndefined_0100
     * @tc.number waterItemConstraintSizeNullUndefined_0100
     * @tc.desc   Test WaterFlow itemConstraintSize property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterItemConstraintSizeNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterItemConstraintSizeNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_itemConstraintSize_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterItemConstraintSizeNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterItemConstraintSizeNullUndefined_0100] no set is: " + JSON.stringify(obj.$attrs.itemConstraintSize));

      // WaterFlow itemConstraintSize 不设置
      expect(obj.$attrs.itemConstraintSize).assertEqual("0");
      console.info('[waterItemConstraintSizeNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterItemConstraintSizeNullUndefined_0200
     * @tc.number waterItemConstraintSizeNullUndefined_0200
     * @tc.desc   Test WaterFlow itemConstraintSize property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterItemConstraintSizeNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterItemConstraintSizeNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_itemConstraintSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterItemConstraintSizeNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterItemConstraintSizeNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.itemConstraintSize));

      // WaterFlow itemConstraintSize 设置null
      expect(obj.$attrs.itemConstraintSize).assertEqual("0");
      console.info('[waterItemConstraintSizeNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterItemConstraintSizeNullUndefined_0300
     * @tc.number waterItemConstraintSizeNullUndefined_0300
     * @tc.desc   Test WaterFlow itemConstraintSize property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterItemConstraintSizeNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterItemConstraintSizeNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_itemConstraintSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterItemConstraintSizeNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterItemConstraintSizeNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.itemConstraintSize));

      // WaterFlow itemConstraintSize 设置undefined
      expect(obj.$attrs.itemConstraintSize).assertEqual("0");
      console.info('[waterItemConstraintSizeNullUndefined_0300] END');
    })

    // ========== columnsGap tests ==========
    /**
     * @tc.name   waterColumnsGapNullUndefined_0100
     * @tc.number waterColumnsGapNullUndefined_0100
     * @tc.desc   Test WaterFlow columnsGap property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterColumnsGapNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsGapNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // WaterFlow columnsGap 不设置，默认值0
      expect(obj.$attrs.columnsGap).assertEqual("0.00vp");
      console.info('[waterColumnsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterColumnsGapNullUndefined_0200
     * @tc.number waterColumnsGapNullUndefined_0200
     * @tc.desc   Test WaterFlow columnsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterColumnsGapNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsGapNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // WaterFlow columnsGap 设置null
      expect(obj.$attrs.columnsGap).assertEqual("0.00px");
      console.info('[waterColumnsGapNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterColumnsGapNullUndefined_0300
     * @tc.number waterColumnsGapNullUndefined_0300
     * @tc.desc   Test WaterFlow columnsGap property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterColumnsGapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterColumnsGapNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_columnsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterColumnsGapNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterColumnsGapNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // WaterFlow columnsGap 设置undefined
      expect(obj.$attrs.columnsGap).assertEqual("0.00px");
      console.info('[waterColumnsGapNullUndefined_0300] END');
    })

    // ========== rowsGap tests ==========
    /**
     * @tc.name   waterRowsGapNullUndefined_0100
     * @tc.number waterRowsGapNullUndefined_0100
     * @tc.desc   Test WaterFlow rowsGap property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterRowsGapNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsGapNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // WaterFlow rowsGap 不设置，默认值0
      expect(obj.$attrs.rowsGap).assertEqual("0.00vp");
      console.info('[waterRowsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterRowsGapNullUndefined_0200
     * @tc.number waterRowsGapNullUndefined_0200
     * @tc.desc   Test WaterFlow rowsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterRowsGapNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsGapNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // WaterFlow rowsGap 设置null
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[waterRowsGapNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterRowsGapNullUndefined_0300
     * @tc.number waterRowsGapNullUndefined_0300
     * @tc.desc   Test WaterFlow rowsGap property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterRowsGapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterRowsGapNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_rowsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterRowsGapNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterRowsGapNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // WaterFlow rowsGap 设置undefined
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[waterRowsGapNullUndefined_0300] END');
    })

    // ========== layoutDirection tests (FlexDirection) ==========
    /**
     * @tc.name   waterLayoutDirectionNullUndefined_0100
     * @tc.number waterLayoutDirectionNullUndefined_0100
     * @tc.desc   Test WaterFlow layoutDirection property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterLayoutDirectionNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterLayoutDirectionNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('waterFlow_layoutDirection_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterLayoutDirectionNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[waterLayoutDirectionNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.layoutDirection));

      // WaterFlow scrollBarWidth 不设置
      expect(obj.$attrs.layoutDirection).assertEqual("FlexDirection.Column");
      console.info('[waterLayoutDirectionNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterLayoutDirectionNullUndefined_0200
     * @tc.number waterLayoutDirectionNullUndefined_0200
     * @tc.desc   Test WaterFlow layoutDirection property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterLayoutDirectionNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterLayoutDirectionNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('waterFlow_layoutDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterLayoutDirectionNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[waterLayoutDirectionNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.layoutDirection));

      // WaterFlow layoutDirection 设置null
      expect(obj.$attrs.layoutDirection).assertEqual("FlexDirection.Column");
      console.info('[waterLayoutDirectionNullUndefined_0200] END');
    })

    /**
     * @tc.name   waterLayoutDirectionNullUndefined_0300
     * @tc.number waterLayoutDirectionNullUndefined_0300
     * @tc.desc   Test WaterFlow layoutDirection property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterLayoutDirectionNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[waterLayoutDirectionNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('waterFlow_layoutDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterLayoutDirectionNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[waterLayoutDirectionNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.layoutDirection));

      // WaterFlow layoutDirection 设置undefined
      expect(obj.$attrs.layoutDirection).assertEqual("FlexDirection.Column");
      console.info('[waterLayoutDirectionNullUndefined_0300] END');
    })

    // ========== nestedScroll tests (Color|number|string) ==========
    /**
     * @tc.name   waterNestedScrollNullUndefined_0100
     * @tc.number waterNestedScrollNullUndefined_0100
     * @tc.desc   Test WaterFlow nestedScroll property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterNestedScrollNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[waterNestedScrollNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('waterFlow_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('waterFlow_nestedScroll_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[waterNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[waterNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[waterNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // WaterFlow nestedScroll 设置null
      expect(JSON.parse(strJsonCompare).$type).assertEqual('WaterFlow');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);
      console.info('[waterNestedScrollNullUndefined_0100] END');
    })

    /**
     * @tc.name   waterNestedScrollNullUndefined_0200
     * @tc.number SUB_ARKUI_GRID_nestedScroll_NULL_0300
     * @tc.desc   Test WaterFlow nestedScroll property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('waterNestedScrollNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[waterNestedScrollNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('waterFlow_nestedScroll_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('waterFlow_nestedScroll_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[waterNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollForward));
      console.info("[waterNestedScrollNullUndefined_0100] default obj is: " +
      JSON.stringify(objCompare.$attrs.nestedScroll.scrollBackward));
      console.info("[waterNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollForward));
      console.info("[waterNestedScrollNullUndefined_0100] null obj is: " +
      JSON.stringify(obj.$attrs.nestedScroll.scrollBackward));

      // WaterFlow nestedScroll 设置undefined
      expect(JSON.parse(strJsonCompare).$type).assertEqual('WaterFlow');
      expect(obj.$attrs.nestedScroll.scrollForward).assertEqual(objCompare.$attrs.nestedScroll.scrollForward);
      expect(obj.$attrs.nestedScroll.scrollBackward).assertEqual(objCompare.$attrs.nestedScroll.scrollBackward);

      console.info('[waterNestedScrollNullUndefined_0200] END');
    })
  })
}
