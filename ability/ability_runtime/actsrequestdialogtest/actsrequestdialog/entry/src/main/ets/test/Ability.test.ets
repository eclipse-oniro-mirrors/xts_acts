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
import { describe, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'

var subscriberInfo = {
  events: ["ACTS_REQUEST_DIALOG_EVENT1", "ACTS_REQUEST_DIALOG_EVENT2"]
};

const CASE_TIMEOUT = 3000;
console.info("====>in Ability.test====>");

export default function abilityTest() {
  describe('ActsRequestDialogTest', function () {
    console.info("====>in ActsRequestDialogTest====>");

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    /*
    * @tc.number: ACTS_requestDialog_0100
    * @tc.name: Start Recent Ability with no callback.
    * @tc.desc: reguest dialog service
    */
    it('ACTS_requestDialog_0100', 0, async function (done) {
      console.log('ACTS_requestDialog_0100====<begin');
      var subscriber;
      let id;
      let resultCode;

      async function subscribeCallBack(err, data) {
        console.info("====>ACTS_requestDialog_0100 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_requestDialog_0100 processInfoCheck=====>');
          expect(globalThis.requestDialogSuccess).assertTrue();
          expect(globalThis.validRequestInfo).assertTrue();
          expect(globalThis.validRequestCallback).assertTrue();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          done();
        }

        if (data.event == "ACTS_REQUEST_DIALOG_EVENT1") {
          console.info('====> ACTS_startRecent_0100 ACTS_StartAbility_CommonEvent1 success=====>');

          await sleep(500);
          processInfoCheck(data);
        }
      }

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.info("====>ACTS_requestDialog_0100 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        try {
            globalThis.abilityContext.requestDialogService(
            {
                bundleName: 'com.acts.example.requestdialog',
                abilityName: 'com.acts.example.requestdialog.MainAbility2',
            }, (data) => {
                console.info("====>ACTS_requestDialog_0100 request end + data:" + JSON.stringify(data));
                resultCode = data.result;
            })
        } catch (paramError) {
            console.info("====>ACTS_requestDialog_0100 requestDialogSerivce paramError====>");
        }
      })

      function unSubscribeCallback() {
        console.info("====>UnSubscribe0100 CallBack====>");
      }

      function timeout() {
        console.log('ACTS_requestDialog_0100 timeout.');
        done();
      }

      id = setTimeout(timeout, CASE_TIMEOUT);
      console.log('Start  ACTS_requestDialog_0100 timer id : ' + id);
    })

    /*
    * @tc.number: ACTS_requestDialog_0200
    * @tc.name: Start Recent Ability with no permission.
    * @tc.desc: reguest dialog service
    */
    it('ACTS_requestDialog_0200', 0, async function (done) {
      console.log('ACTS_requestDialog_0200====<begin');
      var subscriber;
      let id;
      let resultCode;

      async function subscribeCallBack(err, data) {
        console.info("====>ACTS_requestDialog_0200 Subscribe CallBack data:====>" + JSON.stringify(data));

        async function processInfoCheck(data) {
          console.info('====> ACTS_requestDialog_0200 processInfoCheck=====>');
          expect(globalThis.requestDialogSuccess).assertTrue();
          expect(globalThis.validRequestInfo).assertTrue();
          expect(globalThis.validRequestCallback).assertTrue();
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          done();
        }

        if (data.event == "ACTS_REQUEST_DIALOG_EVENT1") {
          console.info('====> ACTS_requestDialog_0200 ACTS_StartAbility_CommonEvent1 success=====>');

          await sleep(500);
          processInfoCheck(data);
        }
      }

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.info("====>ACTS_requestDialog_0200 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
        try {
            await globalThis.abilityContext.requestDialogService(
            {
                bundleName: 'com.acts.example.requestdialog',
                abilityName: 'com.acts.example.requestdialog.MainAbility2',
            }).then((data) => {
                console.info("====>ACTS_requestDialog_0200 request end + data:" + JSON.stringify(data));
                resultCode = data.result;
            })
        } catch (paramError) {
            console.info("====>ACTS_requestDialog_0200 requestDialogSerivce paramError====>");
        }
      })

      function unSubscribeCallback() {
        console.info("====>UnSubscribe0200 CallBack====>");
      }

      function timeout() {
        console.log('ACTS_requestDialog_0200 timeout.');
        done();
      }

      id = setTimeout(timeout, CASE_TIMEOUT);
      console.log('Start  ACTS_requestDialog_0200 timer id : ' + id);
    })
  })
}