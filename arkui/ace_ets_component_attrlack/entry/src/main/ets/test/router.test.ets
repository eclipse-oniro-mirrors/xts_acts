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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'
import events_emitter from '@ohos.events.emitter';

export default function routerStandardJsunit() {
  describe('routerStandardTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'MainAbility/pages/router',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get router state success " + JSON.stringify(pages));
        if (!("router" == pages.name)) {
          console.info("get router state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push router page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push router page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("routerStandard after each called");
    });

    it('testrouterStandard0011', 0, async function (done) {
      console.info('routerStandard testrouterStandard0011 START');
      await Utils.sleep(2000);
      try {
        var standardEvent = {
          eventId: 101,
          priority: events_emitter.EventPriority.LOW
        }
        var callback1 = (eventData) => {
          console.info("testrouterStandard_0011 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data.ArrayData).assertEqual("45");
        
        }
        events_emitter.on(standardEvent, callback1);
        console.info("testrouterStandard_0011 click result1 is: " + JSON.stringify(sendEventByKey('StandardText', 10, "")));
        await Utils.sleep(2000);
        console.info("testrouterStandard_0011 click result2 is: " + JSON.stringify(sendEventByKey('DataText', 10, "")));
        await Utils.sleep(2000);  
      } catch (err) {
        console.info("testrouterStandard_0011 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrouterStandard0011 END');
      done();
    });

    it('testrouterSingle0001', 0, async function (done) {
      console.info('routerSingle testrouterSingle0001 START');
      await Utils.sleep(2000);
      try {
        var singleEvent = {
          eventId: 102,
          priority: events_emitter.EventPriority.LOW
        }
        var callback2 = (eventData) => {
          console.info("testrouterSingle_0001 get event data is: " + JSON.stringify(eventData));
          expect(eventData.data.ArrayData).assertEqual("46");
        }
        events_emitter.on(singleEvent, callback2);
        console.info("testrouterSingle_0001 click result1 is: " + JSON.stringify(sendEventByKey('SingleText', 10, "")));
        await Utils.sleep(2000);
        console.info("testrouterSingle_0001 click result2 is: " + JSON.stringify(sendEventByKey('SingleDataText', 10, "")));
        await Utils.sleep(2000);
      } catch (err) {
        console.info("testrouterSingle_0001 on events_emitter err : " + JSON.stringify(err));
      }
      console.info('testrouterSingle_0001 END');
      done();
    });
  })
}
