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
import Utils from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function timeStampJsunit() {
  describe('timeStampTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePicker/timeStamp',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get timeStamp state success " + JSON.stringify(pages));
        if (!("timeStamp" == pages.name)) {
          console.info("get timeStamp state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push timeStamp page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push timeStamp page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(2000);
      console.info("timeStamp after each called");
    });

    /**
     * @tc.name   timeStampTest_0100
     * @tc.number timeStampTest_0100
     * @tc.desc   To test the timePicker eventData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('timeStampTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('timeStampTest_0100 START');
      await Utils.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("timeStampTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(isNaN(indexEvent.data?.Text)).assertFalse();
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 230,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("timeStampTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("timeStampTest_0100 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await Utils.sleep(1500);
      console.info('timeStampTest_0100 END');
      done();
    });
  })
}