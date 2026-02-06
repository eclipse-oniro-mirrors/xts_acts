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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function transitionJsunit() {
  describe('common_transitionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("text beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/transition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get transition state pages:" + JSON.stringify(pages));
        if (!("transition" == pages.name)) {
          console.info("get transition state pages.name:" + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push transition page error:" + JSON.stringify(err));
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("transition after each called");
    });

    /**
     * @tc.number transitionTest_0200
     * @tc.name Test the properties of components
     * @tc.desc Set transition values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('transitionTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('transitionTest_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 233,
        priority: events_emitter.EventPriority.LOW
      }
      await Utils.sleep(1000);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("transitionTest_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.btn1).assertEqual(false);
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("transitionTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("transitionTest_0200 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await Utils.sleep(1000);
      console.info('transitionTest_0200 END');
      done();
    });
  })
}