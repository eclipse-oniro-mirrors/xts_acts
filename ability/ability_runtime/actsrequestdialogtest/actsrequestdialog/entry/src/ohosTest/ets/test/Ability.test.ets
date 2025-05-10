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

import { describe, it, expect, Level } from '@ohos/hypium';
import commonEvent from '@ohos.commonEvent';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import dialogRequest from '@ohos.app.ability.dialogRequest';

let subscriberInfo: commonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_REQUEST_DIALOG_EVENT1", "ACTS_REQUEST_DIALOG_EVENT2"]
};

const CASE_TIMEOUT = 3000;
console.info("====>in Ability.test====>");

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsRequestDialogTest', () => {
    console.info("====>in ActsRequestDialogTest====>");
    /*
    * @tc.number: ACTS_requestDialog_0100
    * @tc.name: Start Recent Ability with no callback.
    * @tc.desc: reguest dialog service
    */
    it('ACTS_requestDialog_0100', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_requestDialog_0100====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let resultCode: dialogRequest.ResultCode;

      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.info("====>ACTS_requestDialog_0100 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.info("====>ACTS_requestDialog_0100 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "ACTS_REQUEST_DIALOG_EVENT1") {
            console.info('====> ACTS_startRecent_0100 ACTS_StartAbility_CommonEvent1 success=====>');
            await sleep(500);
            console.info('====> ACTS_requestDialog_0100 processInfoCheck=====>');
            expect(AppStorage.get<boolean>("requestDialogSuccess")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestInfo")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestCallback")!).assertTrue();
            commonEvent.unsubscribe(subscriber, () => {
              console.info("====>UnSubscribe0100 CallBack====>");
            });
            done();
          }
        });
        try {
          AppStorage.get<common.UIAbilityContext>("abilityContext")!.requestDialogService(
            {
              bundleName: 'com.acts.example.requestdialog',
              abilityName: 'com.acts.example.requestdialog.MainAbility2',
            }, (err, data) => {
            console.info("====>ACTS_requestDialog_0100 request end + data:" + JSON.stringify(data));
            resultCode = data.result;
          })
        } catch (paramError) {
          console.info("====>ACTS_requestDialog_0100 requestDialogSerivce paramError====>");
        }
      })

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_0100 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start  ACTS_requestDialog_0100 timer id : ' + id);
    })

    /*
    * @tc.number: ACTS_requestDialog_0200
    * @tc.name: Start Recent Ability with no permission.
    * @tc.desc: reguest dialog service
    */
    it('ACTS_requestDialog_0200', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_requestDialog_0200====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let resultCode: dialogRequest.ResultCode;
      commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.info("====>ACTS_requestDialog_0200 Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.info("====>ACTS_requestDialog_0200 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "ACTS_REQUEST_DIALOG_EVENT1") {
            console.info('====> ACTS_requestDialog_0200 ACTS_StartAbility_CommonEvent1 success=====>');
            await sleep(500);
            console.info('====> ACTS_requestDialog_0200 processInfoCheck=====>');
            expect(AppStorage.get<boolean>("requestDialogSuccess")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestInfo")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestCallback")!).assertTrue();
            expect(typeof AppStorage.get<number>("windowRectLeft")!).assertEqual('number');
            expect(typeof AppStorage.get<number>("windowRectTop")!).assertEqual('number');
            expect(typeof AppStorage.get<number>("windowRectWidth")!).assertEqual('number');
            expect(typeof AppStorage.get<number>("windowRectHeight")!).assertEqual('number');
            commonEvent.unsubscribe(subscriber, () => {
              console.info("====>UnSubscribe0200 CallBack====>");
            });
            done();
          }
        });
        try {
          await AppStorage.get<common.UIAbilityContext>("abilityContext")!.requestDialogService(
            {
              bundleName: 'com.acts.example.requestdialog',
              abilityName: 'com.acts.example.requestdialog.MainAbility2',
            })
            .then((data) => {
              console.info("====>ACTS_requestDialog_0200 request end + data:" + JSON.stringify(data));
              resultCode = data.result;
            })
        } catch (paramError) {
          console.info("====>ACTS_requestDialog_0200 requestDialogSerivce paramError====>");
        }
      })

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_0200 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start  ACTS_requestDialog_0200 timer id : ' + id);
    })
  })
}