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

export default function GridRowAlignItemsNullUndefinedTest() {
  describe('GridRowAlignItemsNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      console.info("GridRowAlignItemsNullUndefined beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GridRow/GridRowAlignItemsNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridRowAlignItemsNullUndefined state pages:" + JSON.stringify(pages));
        if (!("GridRowAlignItemsNullUndefined" == pages.name)) {
          console.info("get GridRowAlignItemsNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridRowAlignItemsNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridRowAlignItemsNullUndefined page error:" + err);
      }
      console.info("GridRowAlignItemsNullUndefined beforeAll end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   gridRowAlignItemsNullUndefined_0100
     * @tc.number SUB_ARKUI_GRIDROW_ALIGNITEMS_NULL_0100
     * @tc.desc   Test GridRow alignItems property with null, should restore to default value ItemAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowAlignItemsNullUndefined_0100', Level.LEVEL0, async () => {
      console.info('[gridRowAlignItemsNullUndefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('gridrow_alignitems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridrow_alignitems_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowAlignItemsNullUndefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridRowAlignItemsNullUndefined_0100] null obj is: " + JSON.stringify(obj.$attrs));

      // null 应该恢复为默认值 ItemAlign.Start
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      expect(objCompare.$attrs.alignItems).assertEqual('ItemAlign.Start');
      console.info('[gridRowAlignItemsNullUndefined_0100] END');
    })

    /**
     * @tc.name   gridRowAlignItemsNullUndefined_0200
     * @tc.number SUB_ARKUI_GRIDROW_ALIGNITEMS_UNDEFINED_0100
     * @tc.desc   Test GridRow alignItems property with undefined, should restore to default value ItemAlign.Start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowAlignItemsNullUndefined_0200', Level.LEVEL0, async () => {
      console.info('[gridRowAlignItemsNullUndefined_0200] START');

      let strJsonCompare: string = getInspectorByKey('gridrow_alignitems_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('gridrow_alignitems_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowAlignItemsNullUndefined_0200] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[gridRowAlignItemsNullUndefined_0200] undefined obj is: " + JSON.stringify(obj.$attrs));

      // undefined 应该恢复为默认值 ItemAlign.Start
      expect(obj.$attrs.alignItems).assertEqual(objCompare.$attrs.alignItems);
      expect(objCompare.$attrs.alignItems).assertEqual('ItemAlign.Start');
      console.info('[gridRowAlignItemsNullUndefined_0200] END');
    })

    /**
     * @tc.name   gridRowAlignItemsNullUndefined_0300
     * @tc.number SUB_ARKUI_GRIDROW_ALIGNITEMS_START_0100
     * @tc.desc   Test GridRow alignItems property with ItemAlign.Start, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowAlignItemsNullUndefined_0300', Level.LEVEL0, async () => {
      console.info('[gridRowAlignItemsNullUndefined_0300] START');

      let strJson: string = getInspectorByKey('gridrow_alignitems_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowAlignItemsNullUndefined_0300] Start obj is: " + JSON.stringify(obj.$attrs));

      // ItemAlign.Start 应该被正确设置
      expect(obj.$attrs.alignItems).assertEqual('ItemAlign.Start');
      console.info('[gridRowAlignItemsNullUndefined_0300] END');
    })

    /**
     * @tc.name   gridRowAlignItemsNullUndefined_0400
     * @tc.number SUB_ARKUI_GRIDROW_ALIGNITEMS_CENTER_0100
     * @tc.desc   Test GridRow alignItems property with ItemAlign.Center, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowAlignItemsNullUndefined_0400', Level.LEVEL0, async () => {
      console.info('[gridRowAlignItemsNullUndefined_0400] START');

      let strJson: string = getInspectorByKey('gridrow_alignitems_center');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowAlignItemsNullUndefined_0400] Center obj is: " + JSON.stringify(obj.$attrs));

      // ItemAlign.Center 应该被正确设置
      expect(obj.$attrs.alignItems).assertEqual('ItemAlign.Center');
      console.info('[gridRowAlignItemsNullUndefined_0400] END');
    })

    /**
     * @tc.name   gridRowAlignItemsNullUndefined_0500
     * @tc.number SUB_ARKUI_GRIDROW_ALIGNITEMS_END_0100
     * @tc.desc   Test GridRow alignItems property with ItemAlign.End, should be set correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridRowAlignItemsNullUndefined_0500', Level.LEVEL0, async () => {
      console.info('[gridRowAlignItemsNullUndefined_0500] START');

      let strJson: string = getInspectorByKey('gridrow_alignitems_end');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[gridRowAlignItemsNullUndefined_0500] End obj is: " + JSON.stringify(obj.$attrs));

      // ItemAlign.End 应该被正确设置
      expect(obj.$attrs.alignItems).assertEqual('ItemAlign.End');
      console.info('[gridRowAlignItemsNullUndefined_0500] END');
    })
  })
}
