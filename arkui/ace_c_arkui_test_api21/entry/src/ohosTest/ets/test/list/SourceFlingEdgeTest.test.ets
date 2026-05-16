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

export default function SourceFlingEdgeTest() {

  describe('SourceFlingEdgeTest', () => {

    /**
     * @tc.name   SourceFlingEdgeTest_0100
     * @tc.number SourceFlingEdgeTest_0100
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_DRAG.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceFlingEdgeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceFlingEdgeTest_0100] START');
      await Utils.pushPage(`list/SourceDragTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_source");
      let height = rect.bottom - rect.top;
      console.info("SourceFlingEdgeTest_0100 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.2);
      let y2 = Math.round(globalThis.winTop + rect.top + height*0.6);
      console.info("SourceFlingEdgeTest_0100  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.drag(centerX, y1, centerX, y2);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_source'); //ARKUI_SCROLL_SOURCE_DRAG
      console.info("[SourceFlingEdgeTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceFlingEdgeTest_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceFlingEdgeTest_0100] END');
      done();
    })

    /**
     * @tc.name   SourceFlingEdgeTest_0200
     * @tc.number SourceFlingEdgeTest_0200
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_FLING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceFlingEdgeTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceFlingEdgeTest_0200] START');
      await Utils.pushPage(`list/SourceFlingTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_source");
      let height = rect.bottom - rect.top;
      console.info("SourceFlingEdgeTest_0200 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.2);
      let y2 = Math.round(globalThis.winTop + rect.bottom - height*0.2);
      console.info("SourceFlingEdgeTest_0200  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.fling({
        x: centerX, y: y2
      }, {
        x: centerX, y: y1
      }, 5, 2000);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_source'); //ARKUI_SCROLL_SOURCE_FLING
      console.info("[SourceFlingEdgeTest_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceFlingEdgeTest_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceFlingEdgeTest_0200] END');
      done();
    })

    /**
     * @tc.name   SourceFlingEdgeTest_0300
     * @tc.number SourceFlingEdgeTest_0300
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_EDGE_EFFECT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceFlingEdgeTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceFlingEdgeTest_0300] START');
      await Utils.pushPage(`list/SourceEdgeTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_source");
      let height = rect.bottom - rect.top;
      console.info("SourceFlingEdgeTest_0300 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.1);
      let y2 = Math.round(globalThis.winTop + rect.top + height*0.7);
      console.info("SourceFlingEdgeTest_0300  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.fling({
        x: centerX, y: y1
      }, {
        x: centerX, y: y2
      }, 20, 4000);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_source'); //ARKUI_SCROLL_SOURCE_EDGE_EFFECT
      console.info("[SourceFlingEdgeTest_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceFlingEdgeTest_0300] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceFlingEdgeTest_0300] END');
      done();
    })

    /**
     * @tc.name   SourceFlingEdgeTest_0400
     * @tc.number SourceFlingEdgeTest_0400
     * @tc.desc   Test capi source: ARKUI_SCROLL_SOURCE_OTHER_USER_INPUT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SourceFlingEdgeTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[SourceFlingEdgeTest_0400] START');
      await Utils.pushPage(`list/SourceOtherTest`);
      await Utils.sleep(1000)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_source");
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let centerY = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("SourceFlingEdgeTest_0400  centerX= " +  centerX  + ", centerY = " + centerY);
      await driver.mouseScroll({x:centerX, y:centerY}, true, 5)
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_source'); //ARKUI_SCROLL_SOURCE_OTHER_USER_INPUT
      console.info("[SourceFlingEdgeTest_0400] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[SourceFlingEdgeTest_0400] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[SourceFlingEdgeTest_0400] END');
      done();
    })

  })
}