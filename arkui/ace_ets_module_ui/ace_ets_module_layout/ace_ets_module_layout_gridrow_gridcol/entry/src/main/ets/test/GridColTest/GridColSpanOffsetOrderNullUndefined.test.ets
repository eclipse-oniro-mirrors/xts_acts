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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function GridColSpanOffsetOrderNullUndefinedTest() {
  describe('GridColSpanOffsetOrderNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("GridColSpanOffsetOrderNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridCol/GridColSpanOffsetOrderNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridColSpanOffsetOrderNullUndefined state pages:" + JSON.stringify(pages));
        if (!("GridColSpanOffsetOrderNullUndefined" == pages.name)) {
          console.info("get GridColSpanOffsetOrderNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridColSpanOffsetOrderNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridColSpanOffsetOrderNullUndefined page error:" + err);
      }
      console.info("GridColSpanOffsetOrderNullUndefined beforeAll end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   gridColSpanNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDCOL_SPAN_NULL_0100
     * @tc.desc   Test GridCol span property with null, should restore to default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColSpanNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridColSpanNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_span_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_span_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColSpanNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColSpanNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 1
      expect(obj.$attrs.span).assertEqual(objCompare.$attrs.span);
      expect(objCompare.$attrs.span).assertEqual('1');
      console.info('[gridColSpanNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridColSpanNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDCOL_SPAN_UNDEFINED_0100
     * @tc.desc   Test GridCol span property with undefined, should restore to default value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColSpanNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridColSpanNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_span_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_span_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColSpanNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColSpanNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 1
      expect(obj.$attrs.span).assertEqual(objCompare.$attrs.span);
      expect(objCompare.$attrs.span).assertEqual('1');
      console.info('[gridColSpanNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColSpanNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDCOL_SPAN_VALID_0100
     * @tc.desc   Test GridCol span property with valid value 2, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColSpanNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridColSpanNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('gridcol_span_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColSpanNullUndefined_0300] valid obj is: " + JSON.stringify(obj.$attrs));

      // 有效的span值 2 应该被正确设置
      expect(obj.$attrs.span).assertEqual('2');
      console.info('[gridColSpanNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridColOffsetNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDCOL_OFFSET_NULL_0100
     * @tc.desc   Test GridCol gridColOffset property with null, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOffsetNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridColOffsetNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_offset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_offset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOffsetNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColOffsetNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 0
      expect(obj.$attrs.gridColOffset).assertEqual(objCompare.$attrs.gridColOffset);
      expect(objCompare.$attrs.gridColOffset).assertEqual('0');
      console.info('[gridColOffsetNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridColOffsetNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDCOL_OFFSET_UNDEFINED_0100
     * @tc.desc   Test GridCol gridColOffset property with undefined, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOffsetNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridColOffsetNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_offset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_offset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOffsetNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColOffsetNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 0
      expect(obj.$attrs.gridColOffset).assertEqual(objCompare.$attrs.gridColOffset);
      expect(objCompare.$attrs.gridColOffset).assertEqual('0');
      console.info('[gridColOffsetNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColOffsetNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDCOL_OFFSET_VALID_0100
     * @tc.desc   Test GridCol gridColOffset property with valid value 1, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOffsetNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridColOffsetNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('gridcol_offset_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOffsetNullUndefined_0300] valid obj is: " + JSON.stringify(obj.$attrs));

      // 有效的gridColOffset值 1 应该被正确设置
      expect(obj.$attrs.gridColOffset).assertEqual('1');
      console.info('[gridColOffsetNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridColOrderNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDCOL_ORDER_NULL_0100
     * @tc.desc   Test GridCol order property with null, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOrderNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridColOrderNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_order_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_order_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOrderNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColOrderNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 0
      expect(obj.$attrs.order).assertEqual(objCompare.$attrs.order);
      expect(objCompare.$attrs.order).assertEqual('0');
      console.info('[gridColOrderNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridColOrderNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDCOL_ORDER_UNDEFINED_0100
     * @tc.desc   Test GridCol order property with undefined, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOrderNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridColOrderNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('gridcol_order_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridcol_order_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOrderNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridColOrderNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 0
      expect(obj.$attrs.order).assertEqual(objCompare.$attrs.order);
      expect(objCompare.$attrs.order).assertEqual('0');
      console.info('[gridColOrderNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridColOrderNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDCOL_ORDER_VALID_0100
     * @tc.desc   Test GridCol order property with valid value 1, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridColOrderNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridColOrderNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('gridcol_order_valid');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridColOrderNullUndefined_0300] valid obj is: " + JSON.stringify(obj.$attrs));

      // 有效的order值 1 应该被正确设置
      expect(obj.$attrs.order).assertEqual('1');
      console.info('[gridColOrderNullUndefined_0300] END');
    })
  })
}
