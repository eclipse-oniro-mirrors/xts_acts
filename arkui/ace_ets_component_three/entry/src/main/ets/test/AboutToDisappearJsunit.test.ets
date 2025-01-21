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
import { describe, beforeEach, afterEach,  it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';

export default function aboutToDisappearJsunit() {
  describe('aboutToDisappearTest', () => {
    beforeEach(async (done: Function) => {
      console.info("aboutToDisappear beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/aboutToDisappear',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get aboutToDisappear state pages:" + JSON.stringify(pages));
        if (!("aboutToDisappear" == pages.name)) {
          console.info("get aboutToDisappear state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push aboutToDisappear page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push aboutToDisappear page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("aboutToDisappear after each called");
    });

    it('aboutToDisappearTest_0100', 0, async (done: Function) => {
      console.info('aboutToDisappearTest_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("aboutToDisappearTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.ACTION).assertEqual(false);
        done();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 49,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("aboutToDisappearTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("aboutToDisappearTest_0100 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      await Utils.sleep(1000);
      console.info('aboutToDisappearTest_0100 END');
    });
  })
}
