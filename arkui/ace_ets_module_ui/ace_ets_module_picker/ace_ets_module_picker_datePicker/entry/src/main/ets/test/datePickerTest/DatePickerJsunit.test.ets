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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../MainAbility/common/Utils';

export default function datePickerJsunit() {
  describe('datePickerJsunit', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePicker/datePickerneww',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get datePicker state success " + JSON.stringify(pages));
        if (!("datePickerneww" == pages.name)) {
          console.info("get datePicker state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(1000);
          console.info("push datePicker page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push datePicker page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("datePicker after each called");
    });

    /**
     * @tc.name   datePickerTest_0100
     * @tc.number datePickerTest_0100
     * @tc.desc   To test the datePicker type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('datePickerText_0100 START');
      let strJson = getInspectorByKey('datePicker');
      console.info("datePickerText_0100 component strJson:" + strJson);
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("datePickerText_0100 component obj is: " + JSON.stringify(obj));
      expect(obj.$type).assertEqual('DatePicker');
      console.info('datePickerTest_0200 END');
      done();
    });

    /**
     * @tc.name   datePickerTest_0300
     * @tc.number datePickerTest_0300
     * @tc.desc   To test the datePicker useMilitaryTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('datePickerTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('datePickerTest_0300 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "useMilitaryTime": "false",
          }
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 81,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("datePickerTest_0300 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("datePickerTest_0300 change component data error: " + (err as Error).message);
      }
      let callback = (indexEventOne: events_emitter.EventData) => {
        console.info("datePickerTest_0300 get state result is: " + JSON.stringify(indexEventOne));
        expect(indexEventOne.data?.useMilitaryTime).assertEqual('false');
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 80,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("datePickerTest_0300 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("datePickerTest_0300 click result is: " + JSON.stringify(sendEventByKey('datePicker', 10, "")));
      await Utils.sleep(2000);
      console.info('datePickerTest_0300 END');
      done();
    });
  })
}
