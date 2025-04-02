
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

export default function areaChangeJsunit() {
  describe('areaChangeTest', async () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/areaChange',
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        console.info("get areaChange state success " + JSON.stringify(pages));
        if (!("areaChange" == pages.name)) {
          console.info("get areaChange state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push areaChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push areaChange page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("areaChange after each called");
    });

    it('areaChangeTest_0300', 0, async (done: Function) => {
      console.info('areaChangeTest_0300 START');
      await Utils.sleep(1000);
      let callback = (backData: events_emitter.EventData) => {
        console.info("areaChangeTest_0300 get state result is: " + JSON.stringify(backData));
        expect(backData.data?.value).assertEqual('TextText');
        done()
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 61,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("areaChangeTest_0300 on events_emitter err : " + JSON.stringify(err));
      }

      console.info('areaChangeTest_0400 START');
      await Utils.sleep(1000);
      let callback1 = (eventData: events_emitter.EventData) => {
        console.info("areaChangeTest_0400 get state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.ACTION).assertEqual(true);
      }
      let indexEvent1: events_emitter.InnerEvent = {
        eventId: 62,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent1, callback1);
      } catch (err) {
        console.info("areaChangeTest_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("areaChangeTest_0300 click result is: " + JSON.stringify(sendEventByKey('text1', 10, "")));
    });
  })
}
