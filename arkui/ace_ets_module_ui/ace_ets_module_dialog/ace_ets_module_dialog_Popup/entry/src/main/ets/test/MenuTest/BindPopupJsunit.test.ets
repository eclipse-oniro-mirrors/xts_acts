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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";
import events_emitter from '@ohos.events.emitter';

export default function bindPopupTest(){
  describe('bindPopupTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/bindPopup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindPopup state success " + JSON.stringify(pages));
        if (!("bindPopup" == pages.name)) {
          console.info("get bindPopup state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(1000);
          console.info("push bindPopup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindPopup page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("bindPopup after each called");
    });
   /**
     * @tc.number    bindPopupTest_0100
     * @tc.name      bindPopupTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('bindPopupTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('bindPopupTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("bindPopupTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.enableArrow).assertEqual(true);
        expect(indexEvent.data?.maskColor).assertEqual(0x33000000);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 67,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("bindPopupTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_0100 click result is: " + JSON.stringify(sendEventByKey('button',10,"")));
      await CommonFunc.sleep(1000);
      console.info("bindPopupTest_0100 click Two result is: " + JSON.stringify(sendEventByKey('image',10,"")));
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('bindPopupTest_0100 END');
    });
   /**
     * @tc.number    bindPopupTest_0200
     * @tc.name      bindPopupTest_0200
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('bindPopupTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('bindPopupTest_0200 START');
      let driver = await Driver.create()
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "enableArrow": false,
            "maskColor": 0x33000009
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 68,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("bindPopupTest_0200 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("bindPopupTest_0200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(1500);
      let callbackOne = (indexEventOne: events_emitter.EventData) => {
        console.info("bindPopupTest_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data?.enableArrow).assertEqual(false);
        expect(indexEventOne.data?.maskColor).assertEqual(0x33000009);
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 66,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("bindPopupTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_0200 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('bindPopupTest_0200 END');
      done();
    });
   /**
     * @tc.number    bindPopupTest_0300
     * @tc.name      bindPopupTest_0300
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('bindPopupTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('bindPopupTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("bindPopupTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.placementOnTop).assertEqual(false);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 65,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("bindPopupTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("bindPopupTest_0300 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('bindPopupTest_0300 END');
      done();
    });
  })
}