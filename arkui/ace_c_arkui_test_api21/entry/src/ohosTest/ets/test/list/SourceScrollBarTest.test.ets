/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect, Component } from '@ohos.UiTest';

export default function SourceScrollBarTest() {

  describe('SourceScrollBarTest', () => {

    /**
     * @tc.name   SourceScrollBarTest_0100
     * @tc.number SourceScrollBarTest_0100
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_SCROLL_BAR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceScrollBarTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceScrollBarTest_0100] START');
      await Utils.pushPage(`list/SourceBarTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_bar_source");
      let top = rect.top;
      let right = rect.right;
      console.info("SourceScrollBarTest_0100 top =" + top  + ", right = " + right);
      let barX = Math.round(globalThis.winLeft + rect.right - vp2px(40));
      let y1 = Math.round(globalThis.winTop + rect.top + vp2px(40));
      let y2 = Math.round(globalThis.winTop + rect.top + vp2px(80));
      console.info("SourceScrollBarTest_0100  barX= " +  barX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.drag(barX, y1, barX, y2, 300);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_bar_source'); //ARKUI_SCROLL_SOURCE_SCROLL_BAR
      console.info("[SourceScrollBarTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceScrollBarTest_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceScrollBarTest_0100] END');
      done();
    })

    /**
     * @tc.name   SourceScrollBarTest_0200
     * @tc.number SourceScrollBarTest_0200
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_SCROLL_BAR_FLING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceScrollBarTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceScrollBarTest_0200] START');
      await Utils.pushPage(`list/SourceBarFlingTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_bar_source");
      let top = rect.top;
      let right = rect.right;
      console.info("SourceScrollBarTest_0200 top =" + top  + ", right = " + right);
      let barX = Math.round(globalThis.winLeft + rect.right - vp2px(40));
      let y1 = Math.round(globalThis.winTop + rect.top + vp2px(40));
      let y2 = Math.round(globalThis.winTop + rect.top + vp2px(80));
      console.info("SourceScrollBarTest_0200  barX= " +  barX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.drag(barX, y1, barX, y2, 1000);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_bar_source'); //ARKUI_SCROLL_SOURCE_SCROLL_BAR_FLING
      console.info("[SourceScrollBarTest_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceScrollBarTest_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceScrollBarTest_0200] END');
      done();
    })

  })
}