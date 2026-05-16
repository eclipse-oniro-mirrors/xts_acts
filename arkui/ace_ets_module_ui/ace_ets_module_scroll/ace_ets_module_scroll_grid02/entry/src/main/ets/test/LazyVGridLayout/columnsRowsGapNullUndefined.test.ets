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

export default function columnsRowsGapNullUndefined() {
  describe('columnsRowsGapNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("columnsRowsGapNullUndefined beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/LazyVGridLayout/columnsRowsGapNullUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnsRowsGapNullUndefined state pages:" + JSON.stringify(pages));
        if (!("columnsRowsGapNullUndefined" == pages.name)) {
          console.info("get columnsRowsGapNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push columnsRowsGapNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnsRowsGapNullUndefined page error:" + err);
      }
      console.info("columnsRowsGapNullUndefined beforeEach end");
      done();
    });

    // ========== columnsGap tests (LengthMetrics) ==========
    /**
     * @tc.name   columnsGapNullUndefined_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSGAP_NULL_0100
     * @tc.desc   Test LazyVGridLayout columnsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[columnsGapNullUndefined_0100] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_columnsGap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[columnsGapNullUndefined_0100] no set obj is: " + JSON.stringify(objCompare.$attrs.columnsGap));
      console.info("[columnsGapNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // LazyVGridLayout columnsGap 设置null，应恢复为默认值
      expect(obj.$attrs.columnsGap).assertEqual(objCompare.$attrs.columnsGap);
      console.info('[columnsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   columnsGapNullUndefined_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_COLUMNSGAP_NULL_0200
     * @tc.desc   Test LazyVGridLayout columnsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('columnsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[columnsGapNullUndefined_0200] START');
      let strJsonCompare: string = getInspectorByKey('lazyVGrid_columnsGap_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('lazyVGrid_columnsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[columnsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[columnsGapNullUndefined_0200] no set obj is: " + JSON.stringify(objCompare.$attrs.columnsGap));
      console.info("[columnsGapNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs.columnsGap));

      // LazyVGridLayout columnsGap 设置undefined，应恢复为默认值
      expect(obj.$attrs.columnsGap).assertEqual(objCompare.$attrs.columnsGap);
      console.info('[columnsGapNullUndefined_0200] END');
    })

    // ========== rowsGap tests (LengthMetrics) ==========
    /**
     * @tc.name   rowsGapNullUndefined_0100
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ROWSGAP_NULL_0100
     * @tc.desc   Test LazyVGridLayout rowsGap property with no set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowsGapNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[rowsGapNullUndefined_0100] START');
      let strJson: string = getInspectorByKey('lazyVGrid_rowsGap_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rowsGapNullUndefined_0100] type: " + JSON.stringify(obj.$type));
      console.info("[rowsGapNullUndefined_0100] no set obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // LazyVGridLayout rowsGap 不设置，默认值0vp
      expect(obj.$attrs.rowsGap).assertEqual("0.00vp");
      console.info('[rowsGapNullUndefined_0100] END');
    })

    /**
     * @tc.name   rowsGapNullUndefined_0200
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ROWSGAP_NULL_0200
     * @tc.desc   Test LazyVGridLayout rowsGap property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowsGapNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[rowsGapNullUndefined_0200] START');
      let strJson: string = getInspectorByKey('lazyVGrid_rowsGap_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rowsGapNullUndefined_0200] type: " + JSON.stringify(obj.$type));
      console.info("[rowsGapNullUndefined_0200] null obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // LazyVGridLayout rowsGap 设置null
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[rowsGapNullUndefined_0200] END');
    })

    /**
     * @tc.name   rowsGapNullUndefined_0300
     * @tc.number SUB_ARKUI_LAZYVGRIDLAYOUT_ROWSGAP_UNDEFINED_0300
     * @tc.desc   Test LazyVGridLayout rowsGap property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('rowsGapNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[rowsGapNullUndefined_0300] START');
      let strJson: string = getInspectorByKey('lazyVGrid_rowsGap_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[rowsGapNullUndefined_0300] type: " + JSON.stringify(obj.$type));
      console.info("[rowsGapNullUndefined_0300] undefined obj is: " + JSON.stringify(obj.$attrs.rowsGap));

      // LazyVGridLayout rowsGap 设置undefined
      expect(obj.$attrs.rowsGap).assertEqual("0.00px");
      console.info('[rowsGapNullUndefined_0300] END');
    })
  })
}
