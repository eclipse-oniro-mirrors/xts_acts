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

export default function scrollEnablePagingJsunit() {
  describe('scroll_enablePagingTest', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollEnablePaging beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/scrollEnablePaging',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollEnablePaging state pages: " + JSON.stringify(pages));
        if (!("scrollEnablePaging" == pages.name)) {
          console.info("get scrollEnablePaging state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(1000);
        }
      } catch (err) {
        console.error("push scrollEnablePaging page error: " + err);
      }
      done();
    });

    /**
     * @tc.number ArkUI_Stage_scrollEnablePaging01
     * @tc.name Test the properties of components
     * @tc.desc Set scrollEnablePaging values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_scrollEnablePaging01', Level.LEVEL0, async (done: Function) => {
      console.info('[ArkUI_Stage_scrollEnablePaging01] START');
      await Utils.sleep(2000)
      let scrollRect = Utils.getComponentRect('ScrollTest');
      console.info(`ArkUI_Stage_scrollEnablePaging01 get scrollRect is:` + JSON.stringify(scrollRect));
      let x = Utils.getRectHorizontalCenterX(scrollRect)
      let y = Utils.getRectVerticalCenterY(scrollRect)
      let driver = Driver.create();
      await driver.swipe(Math.floor(x), Math.floor(scrollRect['bottom']) - 50, Math.floor(x), Math.floor(scrollRect['top']) + 50);
      console.info('[ArkUI_Stage_scrollEnablePaging01] driver.swipe end');
      await Utils.sleep(2000)
      try {
        let callBack = (backData: events_emitter.EventData) => {
          try {
            console.info(`ArkUI_Stage_scrollEnablePaging01 get result is:` + JSON.stringify(backData));
            expect(backData?.data?.itemNumber).assertEqual(7)
            console.info(`ArkUI_Stage_scrollEnablePaging01 END`);
          } catch (err) {
            console.info(`ArkUI_Stage_scrollEnablePaging01 err:` + JSON.stringify(err));
          }
          done()
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 79002,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(innerEvent, callBack)
      } catch (err) {
        console.info(`ArkUI_Stage_scrollEnablePaging01 err:` + JSON.stringify(err));
      }
      await driver.click(x, y);
    });
  })
}
