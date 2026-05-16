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

export default function ListFlingEventTest() {

  describe('ListFlingEventTest', () => {

    /**
     * @tc.name   ListFlingEvent_0100
     * @tc.number ListFlingEvent_0100
     * @tc.desc   Test capi callback: NODE_SCROLL_EVENT_ON_WILL_START_FLING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListFlingEvent_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[ListFlingEvent_0100] START');
      await Utils.pushPage(`list/ListWillStartFlingTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_fling_event");
      let height = rect.bottom - rect.top;
      console.info("ListFlingEvent_0100 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.2);
      let y2 = Math.round(globalThis.winTop + rect.bottom - height*0.2);
      console.info("ListFlingEvent_0100  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.swipe(centerX, y2, centerX, y1);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_fling_event');
      console.info("[ListFlingEvent_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ListFlingEvent_0100] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");

      console.info('[ListFlingEvent_0100] END');
      done();
    })

    /**
     * @tc.name   ListFlingEvent_0200
     * @tc.number ListFlingEvent_0200
     * @tc.desc   Test capi callback: NODE_SCROLL_EVENT_ON_DID_STOP_FLING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListFlingEvent_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[ListFlingEvent_0100] START');
      await Utils.pushPage(`list/ListDidStopFlingTest`);
      await Utils.sleep(1500)
      let driver: Driver = Driver.create();
      let rect = Utils.getComponentRect("list_fling_event");
      let height = rect.bottom - rect.top;
      console.info("ListFlingEvent_0200 height is" + height);
      let centerX = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y1 = Math.round(globalThis.winTop + rect.top + height*0.2);
      let y2 = Math.round(globalThis.winTop + rect.bottom - height*0.2);
      console.info("ListFlingEvent_0100  centerX= " +  centerX  + ", y1 = " + y1  + ", y2 = " + y2);
      await driver.swipe(centerX, y2, centerX, y1,1000);
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('list_fling_event');
      console.info("[ListFlingEvent_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[ListFlingEvent_0200] backgroundColor: " + JSON.stringify(JSON.parse(strJson).$attrs.backgroundColor));
      expect(JSON.parse(strJson).$attrs.backgroundColor).assertEqual("#FF00FF00");
      console.info('[ListFlingEvent_0200] END');
      done();
    })

  })
}