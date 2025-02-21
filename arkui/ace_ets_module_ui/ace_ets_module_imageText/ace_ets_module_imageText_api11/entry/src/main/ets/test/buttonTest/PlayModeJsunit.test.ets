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
import { describe, beforeEach, afterEach, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../MainAbility/common/Common';

export default function playModeJsunit() {
  describe('playModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("playMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/button/playMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get playMode state pages:" + JSON.stringify(pages));
        if (!("playMode" == pages.name)) {
          console.info("get playMode state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push playMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push playMode page error:" + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("playMode after each called");
    });

    it('playModeTest_0100', 0, async (done: Function) => {
      console.info('playModeTest_0100 START');
      await CommonFunc.sleep(1500);
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 161,
        priority: events_emitter.EventPriority.LOW
      }
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("playModeTest_0100 get state result is: " + JSON.stringify(indexEvent))
        expect(indexEvent.data?.playMode).assertEqual(PlayMode.AlternateReverse)
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("playModeTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("playModeTest_0100 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(2000);
      console.info('playModeTest_0100 END');
      done();
    });
  })
}