/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'

export default function waterFlowNestedScrollJsunit() {
  describe('waterFlow_NestedScrollTest', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowNestedScroll beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/waterFlowNestedScroll',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowNestedScroll state pages: " + JSON.stringify(pages));
        if (!("waterFlowNestedScroll" == pages.name)) {
          console.info("get waterFlowNestedScroll state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push waterFlowNestedScroll page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Stage_waterFlowNestedScroll01
     * @tc.name Test the properties of components
     * @tc.desc Set nestedScroll values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_waterFlowNestedScroll01', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUI_Stage_waterFlowNestedScroll01] START');
      await Utils.sleep(2000)
      let webRect = Utils.getComponentRect('ColumnSize');
      console.info(`ArkUI_Stage_waterFlowNestedScroll01 get webRect is:` + JSON.stringify(webRect));
      let x = Math.floor(Utils.getRectHorizontalCenterX(webRect))
      let y = Math.floor(Utils.getRectVerticalCenterY(webRect))
      let driver = Driver.create();
      await driver.swipe(Math.round(x), Math.round(y + vp2px(60)), Math.round(x), Math.round(y - vp2px(60)));
      console.info('[ArkUI_Stage_waterFlowNestedScroll01] driver.swipe end');
      try {
        let callBack = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 get result is:` + JSON.stringify(backData));
            expect(backData?.data?.ACTION).assertEqual(true)
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_waterFlowNestedScroll01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 77003,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_waterFlowNestedScroll01 err:` + JSON.stringify(err));
      }
      console.info(`ArkUI_Stage_waterFlowNestedScroll01 sendre:` + JSON.stringify(sendEventByKey('waterflowNestedScrollOptionsScrollTestButton', 10, '')));
    });
  })
}
