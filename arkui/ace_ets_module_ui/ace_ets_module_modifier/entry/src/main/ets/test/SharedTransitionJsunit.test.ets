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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import Utils from './Utils';

export default function sharedTransitionJsunit() {
  describe('common_sharedTransitionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("sharedTransition beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/sharedTransition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sharedTransition state pages:" + JSON.stringify(pages));
        if (!("sharedTransition" == pages.name)) {
          console.info("get sharedTransition state pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push sharedTransition page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("sharedTransition after each called");
    });

    /**
     * @tc.number sharedTransitionTest_0100
     * @tc.name Test the properties of components
     * @tc.desc Set sharedTransition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('sharedTransitionTest_0100', 0, async (done: Function) => {
      console.info('sharedTransitionTest_0100 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "duration": 2000,
            "delay": 5,
            "type": SharedTransitionEffectType.Exchange
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 194,
          priority: events_emitter.EventPriority.LOW
        }
        events_emitter.emit(indexEvent, eventData);
        await Utils.sleep(2500);
      } catch (err) {
        console.log("sharedTransitionTest_0100 change component data error: " + err.message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        console.info("sharedTransitionTest_0100 get state result is: " + JSON.stringify(indexEventOne));
        try {
          expect(indexEventOne.data?.duration).assertEqual(2000);
          expect(indexEventOne.data?.delay).assertEqual(5);
          expect(indexEventOne.data?.type).assertEqual(SharedTransitionEffectType.Exchange);
        } catch (err) {
          console.info("sharedTransitionTest_0100 error: " + err.message);
        }

      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 193,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("sharedTransitionTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("sharedTransitionTest_0100 click result is: " + JSON.stringify(sendEventByKey('Navigator', 10, "")));
      await Utils.sleep(2000);
      console.info('sharedTransitionTest_0100 END');
      done();
    });
  })
}