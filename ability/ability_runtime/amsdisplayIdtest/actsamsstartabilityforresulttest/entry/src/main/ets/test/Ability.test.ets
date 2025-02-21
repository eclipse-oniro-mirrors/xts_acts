/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'

var subscriberInfo_MainAbility = {
  events: ["ACTS_ConnectAbility_0100_CommonEvent", "ACTS_TerminateSelf_CommonEvent", "ACTS_TerminateSelf_CommonEvent9"]
};
const START_ABILITY_TIMEOUT = 5000;
console.debug("====>in Ability.test====>");

export default function abilityTest() {
  describe('ActsGetDisplayIdStartAbilityForResultTest', function () {
    function sleep(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    afterEach(async (done) => {
        console.debug('= ACTS_afterEach ====<begin');
        await sleep(2000);
        console.debug('= ACTS_afterEach ====<end');
        done();
    })

    console.debug("====>in ActsGetDisplayIdStartAbilityForResultTest====>");

    /*
    * @tc.number: ACTS_startAbilityForResult_0800
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify Get displayId to startAbilityForResult Ability
    */
    it('ACTS_startAbilityForResult_0800', 0, async function (done) {
      console.log('ACTS_startAbilityForResult_0800====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_startAbilityForResult_0800 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_startAbilityForResult_0800=====>');
          expect(data.parameters['displayId']).assertEqual(15);
          expect(data.parameters['windowMode']).assertEqual(0);
          done();
        }

        if (data.event == "ACTS_TerminateSelf_CommonEvent") {
          console.info('====> ACTS_startAbilityForResult_0800 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>ACTS_startAbilityForResult_0800 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.example.startabilityforresult',
            abilityName: 'com.example.startabilityforresult.MainAbility2',
          }, {
          windowMode: 0,
          displayId: 15
        }).then(() => {
          console.debug("====>ACTS_startAbilityForResult_0800 end====>");
        })
      })

      function unSubscribeCallback() {
        console.debug("====>UnSubscribe0800 CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_startAbilityForResult_0800 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start  ACTS_startAbilityForResult_0800 timer id : ' + id);

    })

    /*
    * @tc.number: ACTS_startAbilityForResult_0900
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify that the ability to startAbilityForResult when displayId is a string
    */
    it('ACTS_startAbilityForResult_0900', 0, async function (done) {
      console.log('ACTS_startAbilityForResult_0900====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_startAbilityForResult_0900 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck() {
          console.info('====> ACTS_startAbilityForResult_0900=====>');
          expect(data.parameters['displayId']).assertEqual(0);
          expect(data.parameters['windowMode']).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          done();
        }

        if (data.event == "ACTS_TerminateSelf_CommonEvent") {
          console.info('====> ACTS_startAbilityForResult_0900 start success=====>');
          clearTimeout(id);
          processInfoCheck();
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>ACTS_startAbilityForResult_0900 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.example.startabilityforresult',
            abilityName: 'com.example.startabilityforresult.MainAbility2',
          }, {
          windowMode: 0,
          displayId: undefined
        }).then(() => {
          console.debug("====>ACTS_startAbilityForResult_0900 end====>");
        }).catch((err) => {
          expect().assertFail();
          console.debug("====>ACTS_startAbilityForResult_0900 err====>" + err);
        })
      })

      function unSubscribeCallback() {
        console.debug("====>ACTS_startAbilityForResult_0900 UnSubscribe CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_startAbilityForResult_0900 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start  ACTS_startAbilityForResult_0900 timer id : ' + id);

    })

    /*
    * @tc.number: ACTS_startAbilityForResult_1000
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Validation parameters want to filter the DISPLAY_ID of parameters
    */
    it('ACTS_startAbilityForResult_1000', 0, async function (done) {
      console.log('ACTS_startAbilityForResult_1000====<begin');
      var subscriber;
      let id;

      function subscribeCallBack(err, data) {
        console.debug("====>ACTS_startAbilityForResult_1000 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_startAbilityForResult_1000=====>');
          expect(data.parameters['displayId']).assertEqual(0);
          expect(data.parameters['windowMode']).assertEqual(0);
          done();
        }

        if (data.event == "ACTS_TerminateSelf_CommonEvent") {
          console.info('====> ACTS_startAbilityForResult_1000 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>ACTS_startAbilityForResult_1000 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.example.startabilityforresult',
            abilityName: 'com.example.startabilityforresult.MainAbility2',
            parameters:
            {
              "ohos.aafwk.param.displayId": 10,
            }
          }, {
        }).then(() => {
          console.debug("====>ACTS_startAbilityForResult_1000 end====>");
        }).catch((err) => {
          expect().assertFail();
          console.debug("====>ACTS_startAbilityForResult_1000 err====>" + err);
        })
      })


      function unSubscribeCallback() {
        console.debug("====>ACTS_startAbilityForResult_1000 UnSubscribe CallBack====>");
      }

      function timeout() {
        expect().assertFail();
        console.log('ACTS_startAbilityForResult_1000 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start  ACTS_startAbilityForResult_1000 timer id : ' + id);

    })
  })
}