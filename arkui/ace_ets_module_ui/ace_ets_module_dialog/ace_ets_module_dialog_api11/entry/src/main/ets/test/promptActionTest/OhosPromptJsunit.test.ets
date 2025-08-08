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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';

export default function ohosPromptJsunit() {
  describe('appInfoTest_four_3', () => {
    beforeEach(async (done: Function) => {
      console.info("OhosPrompt beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ohosPrompt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get OhosPrompt state pages:" + JSON.stringify(pages));
        if (!("ohosPrompt " == pages.name)) {
          console.info("get OhosPrompt  state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push OhosPrompt  page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push OhosPrompt  page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("OhosPrompt each called");
    });

    it('test_OhosPrompt_001', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000)
      let callback = (eventData: events_emitter.EventData) => {
        console.info("[test_OhosPrompt_001] get event state result is: " + JSON.stringify(eventData));
        expect(eventData.data?.matrix1).assertEqual("[100, 10]")
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 142,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("[test_OhosPrompt_001] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[test_OhosPrompt_001] sendEventByKey ' + JSON.stringify(sendEventByKey('rotate5', 10, "")));
      await Utils.sleep(1000)
      console.info('[test_OhosPrompt_001] testSendTouchEvent END');
      done();
    });
  })
}




