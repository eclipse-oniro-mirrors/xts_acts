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
import router from '@ohos.router';
import Utils from '../Utils';
import events_emitter from '@ohos.events.emitter';

export default function placementJsunit(){
  describe('placementJsunit', () =>{
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/placement',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get placement state success " + JSON.stringify(pages));
        if (!("placement" == pages.name)) {
          console.info("get placement state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(3000);
          console.info("push placement page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push placement page error " + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("placement after each called");
    });

    it('placementTest_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('placementTest_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("placementTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.placement).assertEqual(Placement.TopLeft);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 157,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("placementTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_0100 click result is: " + JSON.stringify(sendEventByKey('button',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_0100 clickOne result is: " + JSON.stringify(sendEventByKey('image',10,"")));
      console.info('placementTest_0100 END');
    });

    it('placementTest_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('placementTest_0200 START');
      await Utils.sleep(1500);
      let callbackOne = (indexEventOne: events_emitter.EventData) => {
        console.info("placementTest_0200 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data?.placement).assertEqual(Placement.TopRight);
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 158,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callbackOne);
      } catch (err) {
        console.info("placementTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_0200 click result is: " + JSON.stringify(sendEventByKey('button1',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_0200 clickOne result is: " + JSON.stringify(sendEventByKey('image1',10,"")));
      console.info('placementTest_0200 END');
      done();
    });

    it('placementTest_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('placementTest_0300 START');
      await Utils.sleep(1500);
      let callbackTwo = (indexEventTwo: events_emitter.EventData) => {
        console.info("placementTest_0300 get state result is: " + JSON.stringify(indexEventTwo));
        expect(indexEventTwo.data?.placement).assertEqual(Placement.BottomLeft);
      }
      let indexEventTwo: events_emitter.InnerEvent = {
        eventId: 159,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventTwo, callbackTwo);
      } catch (err) {
        console.info("placementTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_0300 click result is: " + JSON.stringify(sendEventByKey('button2',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_0300 clickOne result is: " + JSON.stringify(sendEventByKey('image2',10,"")));
      console.info('placementTest_0300 END');
      done();
    });

    it('placementTest_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('placementTest_0400 START');
      await Utils.sleep(1500);
      let callbackThree = (indexEventThree: events_emitter.EventData) => {
        console.info("placementTest_0400 get state result is: " + JSON.stringify(indexEventThree));
        expect(indexEventThree.data?.placement).assertEqual(Placement.BottomRight);
      }
      let indexEventThree: events_emitter.InnerEvent = {
        eventId: 160,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventThree, callbackThree);
      } catch (err) {
        console.info("placementTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("placementTest_0400 click result is: " + JSON.stringify(sendEventByKey('button3',10,"")));
      await Utils.sleep(1500);
      console.info("placementTest_0400 clickOne result is: " + JSON.stringify(sendEventByKey('image3',10,"")));
      console.info('placementTest_0400 END');
      done();
    });
  })
}