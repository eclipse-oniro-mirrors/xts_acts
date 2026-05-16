/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from './Utils';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../MainAbility/utils/Common';

export default function videoCallbackJsunit() {
  describe('videoCallbackJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("videoCallbackJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/videoCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get videoCallbackJsunit state pages: " + JSON.stringify(pages));
        if (!("VideoCallback" == pages.name)) {
          console.info("get VideoCallbackJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push VideoCallbackJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VideoCallbackJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   videoCallbackJsunit_0500
     * @tc.number SUB_ACE_ARKUI_VIDEO_OnStop_CALLBACK_0500
     * @tc.desc   Video onStop Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('videoCallbackJsunit_0500', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onStart');
        console.info('videoCallbackJsunit_0500 event: ' + event.data?.action);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50101,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let button = await driver.findComponent(ON.id('start'));
      await button.click();
      await CommonFunc.sleep(5000);

      let callback2 = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onStop');
        console.info('videoCallbackJsunit_0500 event: ' + event.data?.action);
      }
      let event2: events_emitter.InnerEvent = {
        eventId: 50102,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await button2.click();
      await CommonFunc.sleep(5000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.name   videoCallbackJsunit_0501
     * @tc.number SUB_ACE_ARKUI_VIDEO_OnStop_CALLBACK_0501
     * @tc.desc   Video onStop Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('videoCallbackJsunit_0501', Level.LEVEL0, async (done: Function) => {
      let driver = Driver.create();
      let callback = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onStart');
        console.info('videoCallbackJsunit_0501 event: ' + event.data?.action);
      }
      let event: events_emitter.InnerEvent = {
        eventId: 50101,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event, callback);
      let button = await driver.findComponent(ON.id('start'));
      await button.click();
      await CommonFunc.sleep(5000);

      let button3 = await driver.findComponent(ON.id('pause'));
      await button3.click();
      await CommonFunc.sleep(5000);

      let callback2 = (event: events_emitter.EventData) => {
        expect(event.data?.action).assertEqual('onStop');
        console.info('videoCallbackJsunit_0501 event: ' + event.data?.action);
      }
      let event2: events_emitter.InnerEvent = {
        eventId: 50102,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(event2, callback2);
      let button2 = await driver.findComponent(ON.id('stop'));
      await button2.click();
      await CommonFunc.sleep(5000);
      await driver.pressBack();
      done();
    });
  })
}