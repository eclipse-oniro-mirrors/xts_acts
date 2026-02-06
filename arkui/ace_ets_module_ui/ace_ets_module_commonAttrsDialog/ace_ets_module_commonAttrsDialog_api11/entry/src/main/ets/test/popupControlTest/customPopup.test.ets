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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from "../../MainAbility/common/Common";
import events_emitter from '@ohos.events.emitter';

export default function customPopup() {
  describe('customPopup', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupControl/customPopup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get customPopup state success " + JSON.stringify(pages));
        if (!("customPopup" == pages.name)) {
          console.info("get customPopup state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push customPopup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push customPopup page error: " + err);
      }
      done()
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("customPopup after each called");
    });
    /**
     * @tc.number SUB_ACE_customPopup_0100
     * @tc.name customPopup_0100
     * @tc.desc arrowPointPosition
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('customPopup_0100', Level.LEVEL0, async (done: Function) => {
      console.info('customPopup_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent:events_emitter.EventData) => {
        console.info("customPopup_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.arrowPointPosition).assertEqual('Start');
        done();
      }
      let indexEvent:events_emitter.InnerEvent = {
        eventId: 67,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("customPopup_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("customPopup_0100 click result is: " + JSON.stringify(sendEventByKey('custom1', 10, "")));
      await Utils.sleep(1000);
      console.info("customPopup_0100 click Two result is: " + JSON.stringify(sendEventByKey('image', 10, "")));
      await Utils.sleep(1000);
      console.info('customPopup_0100 END');
    });
  })
}