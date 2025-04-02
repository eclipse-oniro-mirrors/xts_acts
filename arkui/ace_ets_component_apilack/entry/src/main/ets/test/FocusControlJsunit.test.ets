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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function focusControlJsunit() {
  describe('focusControlTest', () => {
    beforeEach(async () => {
      console.info("focusControlTest beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/focusControl',
      }
      // let result = '';
      try {
        router.clear();
        let pages = router.getState();
        console.info("get focus state pages: " + JSON.stringify(pages));
        if (!("focusControl" == pages.name)) {
          console.info("get focus state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push focus page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push focus page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("focus after each called");
    })

    it('testFocusOnTouch01', 0, async () => {
      console.info('[testFocusOnTouch01] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch01] get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.value).assertEqual('FocusOnTouchGrpBtn')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60232,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch01 click result is: " + JSON.stringify(sendEventByKey('OnTouchGrpBtn', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch01] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch01] testSendTouchEvent END');
    });

    it('testFocusOnTouch02', 0, async () => {
      console.info('[testFocusOnTouch02] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch02] get event state result is: " + JSON.stringify(eventData))
          expect(eventData.data?.value).assertEqual('FocusOnTouchBtn1')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60233,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch02 click result is: " + JSON.stringify(sendEventByKey('OnTouchBtn1', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch02] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch02] testSendTouchEvent END');
    });

    it('testFocusOnTouch03', 0, async () => {
      console.info('[testFocusOnTouch03] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch03] get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.value).assertEqual('FocusOnTouchBtn2')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60234,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch03 click result is: " + JSON.stringify(sendEventByKey('OnTouchBtn2', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch03] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch03] testSendTouchEvent END');
    });

    it('testFocusOnTouch04', 0, async () => {
      console.info('[testFocusOnTouch04] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch04] get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.value).assertEqual('OnTouchBtn3')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60235,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch04 click result is: " + JSON.stringify(sendEventByKey('OnTouchBtn3', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch04] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch04] testSendTouchEvent END');
    });

    it('testFocusOnTouch05', 0, async () => {
      console.info('[testFocusOnTouch05] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testFocusOnTouch05] get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.value).assertEqual('OnTouchBtn4')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60236,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        console.info("testFocusOnTouch05 click result is: " + JSON.stringify(sendEventByKey('OnTouchBtn4', 10, "")));
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testFocusOnTouch05] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testFocusOnTouch05] testSendTouchEvent END');
    });

    it('testDefaultFocus06', 0, async () => {
      console.info('[testDefaultFocus06] START');
      await Utils.sleep(1000);
      let callback = (eventData: events_emitter.EventData) => {
        if (eventData != null) {
          console.info("[testDefaultFocus06] get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data?.value).assertEqual('defaultFocus')
        }
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 60237,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[testDefaultFocus06] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testDefaultFocus06] END');
    });
  })
}