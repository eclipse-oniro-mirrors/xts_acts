/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';
import events_emitter from '@ohos.events.emitter';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';


export default function customDialogControllerJsunit() {
  describe('customDialogControllerTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/customDialogController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customDialogController state success " + JSON.stringify(pages));
        if (!("customDialogController" == pages.name)) {
          console.info("get customDialogController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(4000);
          console.info("push customDialogController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customDialogController page error " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("customDialogControllers after each called");
    });
    /**
     * @tc.number    testCustomDialogControllers_100
     * @tc.name      testCustomDialogControllers_100
     * @tc.desc      set api
     * @tc.level:    Level 1
     * @tc.type :
     * @tc.size :
     */

    it('testCustomDialogControllers_100', Level.LEVEL2, async (done: Function) => {
      console.info('[testCustomDialogControllers_100] START');
      let driver = await Driver.create()
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[testClickEvent001] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true)
        done();
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 236,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testClickEvent001] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testClickEvent001] sendEventByKey ' + JSON.stringify(sendEventByKey('dialogController', 10, "")));
      await Utils.sleep(1000)
      await driver.pressBack();
      console.info('[testClickEvent001] testSendTouchEvent END');
    });

  })
}