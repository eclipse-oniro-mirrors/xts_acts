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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../../MainAbility/common/Common';

export default function fillModeJsunit() {
  describe('fillModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info('fillModeTest beforeEach called');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/fillMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('beforeEach get fillMode state pages:' + JSON.stringify(pages));
        if (!('fillMode' == pages.name)) {
          console.info('beforeEach get fillMode state pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('beforeEach push fillMode page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('beforeEach push fillMode page error:' + err);
      }
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('fillMode test after each called');
    });

    /**
     * @tc.name   fillModeTest_0100
     * @tc.number fillModeTest_0100
     * @tc.desc   fillModeTest_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fillModeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('fillModeTest_0100 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_0100 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.fillMode).assertEqual(FillMode.Backwards);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 94,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_0100 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_0100 click result is: " + JSON.stringify(sendEventByKey('button', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_0100 END');
      done();
    });

    /**
     * @tc.name   fillModeTest_0200
     * @tc.number fillModeTest_0200
     * @tc.desc   fillModeTest_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fillModeTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('fillModeTest_0200 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_0200 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.fillMode).assertEqual(FillMode.Both);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 95,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_0200 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_0200 click result is: " + JSON.stringify(sendEventByKey('button1', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_0200 END');
      done();
    });

    /**
     * @tc.name   fillModeTest_0300
     * @tc.number fillModeTest_0300
     * @tc.desc   fillModeTest_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('fillModeTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('fillModeTest_0300 START');
      await CommonFunc.sleep(1500);
      let callback = (indexEvent: events_emitter.EventData) => {
        console.info("fillModeTest_0300 get state result is: " + JSON.stringify(indexEvent));
        expect(indexEvent.data?.fillMode).assertEqual(FillMode.None);
      }
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 96,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEvent, callback);
      } catch (err) {
        console.info("fillModeTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("fillModeTest_0300 click result is: " + JSON.stringify(sendEventByKey('button2', 10, "")));
      await CommonFunc.sleep(1000);
      console.info('fillModeTest_0300 END');
      done();
    });
  })
}