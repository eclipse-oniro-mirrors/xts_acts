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

export default function popup() {
  describe('popup', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupControl/popup'
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get bindPopup state success " + JSON.stringify(pages));
        if (!("popup" == pages.name)) {
          console.info("get bindPopup state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push bindPopup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push bindPopup page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("bindPopup after each called");
    });
    /**
     * @tc.number SUB_ACE_popup_0100
     * @tc.name popup_0100
     * @tc.desc arrowWidth,arrowHeight,arrowPointPosition
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('popup_0100', Level.LEVEL0, async (done: Function) => {
      console.info('popup_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("popup_0100 get state result is: " + JSON.stringify(indexEvent));
        console.info("zxr " + JSON.stringify(indexEvent.data?.arrowPointPosition));
        expect(indexEvent.data?.arrowWidth).assertEqual('20px');
        expect(indexEvent.data?.arrowHeight).assertEqual('20px');
        expect(indexEvent.data?.arrowPointPosition).assertEqual('Start');
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 65,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("popup_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("popup_0100 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await Utils.sleep(1000);
      console.info('popup_0100 END');
      done();
    });
  })
}