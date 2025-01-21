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
import Utils from './Utils.ets'
import events_emitter from '@ohos.events.emitter';

export default function unitsModuleNameJsunit() {
  describe('unitsModuleNameTest', function () {
    beforeEach(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/units',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get units state success " + JSON.stringify(pages));
        if (!("units" == pages.name)) {
          console.info("get units state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push units page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push units page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("unitsModuleName after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testunitsModuleName0001
     * @tc.desic         aceunitsModuleNameEtsTest0001
     */
    it('testunitsModuleName0001', 0, async function (done) {
      console.info('unitsModuleName testunitsModuleName0001 START');
      await Utils.sleep(2000);
      try {
        console.info("testunitsModuleName0001 click result is: " + JSON.stringify(sendEventByKey('moduleNameText', 10, "")));
        var innerEvent = {
          eventId: 60310,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testunitsModuleName0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.ModuleName).assertFalse();
        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsModuleName0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsModuleName0001 END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testunitsGlobalPosition0001
     * @tc.desic         aceunitsGlobalPositionEtsTest0001
     */
    it('testunitsGlobalPosition0001', 0, async function (done) {
      console.info('unitsModuleName testunitsGlobalPosition0001 START');
      await Utils.sleep(2000);
      try {
        console.info("testunitsGlobalPosition0001 click result is: " + JSON.stringify(sendEventByKey('globalPositionText', 10, "")));
        var innerEvent = {
          eventId: 60311,
          priority: events_emitter.EventPriority.LOW
        }
        var callback = (eventData) => {
          console.info("testunitsGlobalPosition0001 get event state result is: " + JSON.stringify(eventData));
          expect(eventData.data.Result).assertEqual(true);
        }
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("testunitsGlobalPosition0001 on click err : " + JSON.stringify(err));
      }
      console.info('testunitsGlobalPosition0001 END');
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         testunitsMinWidth0001
     * @tc.desic         aceunitsMinWidthEtsTest0001
     */
    it('testunitsMinWidth0001', 0, async function (done) {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minWidthText');
      console.info("[testunitsMinWidth0001] component constraintSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      var subobj = JSON.parse(obj.$attrs.constraintSize);
      console.info('[testunitsMinWidth0001] constraintSize value :' + subobj.minWidth);
      expect(subobj.minWidth).assertEqual('200.00vp');
      console.info("[testunitsMinWidth0001] constraintSize value :" + obj.$attrs.constraintSize);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testunitsMinWidth0002
     * @tc.desic         aceunitsMinWidthEtsTest0002
     */
    it('testunitsMinWidth0002', 0, async function (done) {
      console.info('unitsModuleName testunitsMinWidth0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('minWidthText');
      console.info("[testunitsMinWidth0002] component constraintSize strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      let constraintSize = JSON.parse(obj.$attrs.constraintSize);
      console.info("[testunitsMinWidth0002] constraintSize is : " + constraintSize);
      expect(obj.$attrs.constraintSize.minWidth).assertEqual(undefined);
      console.info("[testunitsMinWidth0002] constraintSize value :" + obj.$attrs.constraintSize);
      done();
    });
  })
}
