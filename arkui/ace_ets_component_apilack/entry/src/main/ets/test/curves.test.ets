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

import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function curvesStepsJsunit() {
  describe('curvesStepsTest', function () {

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
      console.info('[curvesStepsTest] before each called')

      let result;
      let options = {
        uri: 'MainAbility/pages/curves'
      }
      try {
        result = router.push(options)
        console.info("push curves page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push curves page error " + JSON.stringify(result));
      }
      await Utils.sleep(4000)
      done()
    });

    /**
    * run after testcase
    */
    afterAll(async function () {
      console.info('[curvesStepsTest] after each called')
      await Utils.sleep(1000)
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testcurvesSteps0001
     * @tc.desic         acecurvesStepsEtsTest0001
     */
    it('testcurvesSteps0001', 0, async function (done) {
      console.info('curvesSteps testcurvesSteps0001 START');
      var innerEvent = {
        eventId: 60229,
        priority: events_emitter.EventPriority.LOW
      }
      var callback = (eventData) => {
        try{
          console.info("callback success" );
          console.info("curveApi eventData.data.curveApi result is: " + eventData.data.curveApi);
          expect(eventData.data.curveApi).assertEqual("callBackSuccess");
          console.info("curveApi end");
        }catch(err){
          console.info("curveApi on events_emitter err : " + JSON.stringify(err));
        }
        done();
      }
      try{
        console.info("curveApi click result is: " + JSON.stringify(sendEventByKey('stepsText', 10, "")));
        events_emitter.on(innerEvent, callback);
      }catch(err){
        console.info("curveApi on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
