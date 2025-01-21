/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.ets'

export default function checkBoxGroupPartJsunit() {
  describe('checkBoxGroupPartTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/checkBoxGroup',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get checkBoxGroup state success " + JSON.stringify(pages));
        if (!("checkBoxGroup" == pages.name)) {
          console.info("get checkBoxGroup state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push checkBoxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push checkBoxGroup page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("checkBoxGroupPart after each called");
    });

    it('testcheckBoxGroupPart0011', 0, async function (done) {
      console.info('checkBoxGroupPart testcheckBoxGroupPart0011 START');
      await Utils.sleep(2000);
      try {
        console.info("testcheckBoxGroupPart_0011 click result is: " + JSON.stringify(sendEventByKey('CheckboxGroup', 10, "")));
        let strJson = getInspectorByKey('Checkbox2');
        console.info("[testcheckBoxGroupPart0011] component select strJson:" + strJson);
        let obj = JSON.parse(strJson);
        expect(obj.$type).assertEqual('Checkbox');
        expect(obj.$attrs.select).assertEqual("false");
      } catch (err) {
        console.info("testcheckBoxGroupPart_0011 on click err : " + JSON.stringify(err));
      }
      console.info('testcheckBoxGroupPart0011 END');
      console.info("testcheckBoxGroup0001 click result is: " + JSON.stringify(sendEventByKey('CheckboxGroup', 10, "")));
      done();
    });

    it('testcheckBoxGroup0001', 0, async function (done) {
      console.info('checkBoxGroup testcheckBoxGroup0001 START');
      await Utils.sleep(2000);
      try {
        console.info("testcheckBoxGroup0001 click result is: " + JSON.stringify(sendEventByKey('CheckboxGroup', 10, "")));
        var innerEvent = {
          eventId: 60301,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testcheckBoxGroup0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.STATUS).assertEqual(0);
          done();
        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testcheckBoxGroup0001 on click err : " + JSON.stringify(err));
      }
      console.info('testcheckBoxGroup0001 END');
    })
  })
}

