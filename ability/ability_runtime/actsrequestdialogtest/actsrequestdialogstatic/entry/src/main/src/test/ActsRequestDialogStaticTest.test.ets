/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, Level, beforeAll, afterEach } from '../../../hypium/index';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';
import CommonEventManager from '@ohos.commonEventManager';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { BusinessError, RecordData } from '@ohos.base';
import dialogRequest from '@ohos.app.ability.dialogRequest';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ProcessInfo } from 'app.processInfo';

const domain: int = 0x0000;
const tag: string = 'ActsRequestDialogStaticTest';
const TEST_SUITE_NAME: string = 'ActsRequestDialogStaticTest';
let testAbilityContext: common.UIAbilityContext;
let subscriber: CommonEventManager.CommonEventSubscriber;
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let commonEventSubscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_REQUEST_DIALOG_EVENT1", "ACTS_REQUEST_DIALOG_EVENT2"]
}
let processInfo: ProcessInfo = {
  pid: 0,
  processName: ''
}
const CASE_TIMEOUT = 3000;

export default function ActsRequestDialogStaticTest() {

  describe('ActsRequestDialogStaticTest', () => {
    console.info("====>in ActsRequestDialogTest====>");

    beforeAll(async() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.acts.example.requestdialog.static')
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(5000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   ACTS_requestDialog_static_0100
     * @tc.number ACTS_requestDialog_static_0100
     * @tc.desc   reguest dialog service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_requestDialog_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('ACTS_requestDialog_static_0100====<begin');
      let id: int;
      let resultCode: dialogRequest.ResultCode | undefined;
      try {
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`====>ACTS_requestDialog_static_0100 Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info("====>ACTS_requestDialog_static_0100 Subscribe CallBack data:====>" + JSON.stringify(commonEventData));
          if (commonEventData?.event == "ACTS_REQUEST_DIALOG_EVENT1") {
            console.info('====>ACTS_requestDialog_static_0100 ACTS_StartAbility_CommonEvent1 success=====>');
            await Utils.msSleep(500);
            console.info('====>ACTS_requestDialog_static_0100 processInfoCheck=====>');
            expect(AppStorage.get<boolean>("requestDialogSuccess")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestInfo")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestCallback")!).assertTrue();
            CommonEventManager.unsubscribe(subscriber, () => {
              console.info("====>UnSubscribe0100 CallBack====>");
            });
            done();
          }
        }

        CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber, SubscribeCallBack)
          })

        let want: Want = {
          bundleName: 'com.acts.example.requestdialog.static',
          abilityName: 'EntryAbility',
        };
        let result = (err: BusinessError | null, result: dialogRequest.RequestResult | undefined) => {
          console.info("====>ACTS_requestDialog_static_0100 request end + result:" + JSON.stringify(result));
          resultCode = result?.result;
        }

        testAbilityContext.requestDialogService(want, result)
      } catch (paramError) {
        console.info("====>ACTS_requestDialog_static_0100 requestDialogSerivce paramError====>");
      }

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_static_0100 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start ACTS_requestDialog_static_0100 timer id : ' + id);
    })

    /**
     * @tc.name   ACTS_requestDialog_static_0200
     * @tc.number ACTS_requestDialog_static_0200
     * @tc.desc   reguest dialog service
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_requestDialog_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('ACTS_requestDialog_static_0200====<begin');
      let id: int;
      let resultCode: dialogRequest.ResultCode | undefined;
      try {
        let SubscribeCallBack = (err: BusinessError | null, commonEventData: CommonEventManager.CommonEventData | undefined):void => {
          if (err) {
            console.info(`====>ACTS_requestDialog_static_0200 Failed to subscribe. Code is ${err.code}, message is ${err.message}`);
          }
          console.info("====>ACTS_requestDialog_static_0200 Subscribe CallBack data:====>" + JSON.stringify(commonEventData));
          if (commonEventData?.event == "ACTS_REQUEST_DIALOG_EVENT1") {
            console.info('====>ACTS_requestDialog_static_0200 ACTS_StartAbility_CommonEvent1 success=====>');
            await Utils.msSleep(500);
            console.info('====>ACTS_requestDialog_static_0200 processInfoCheck=====>');
            expect(AppStorage.get<boolean>("requestDialogSuccess")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestInfo")!).assertTrue();
            expect(AppStorage.get<boolean>("validRequestCallback")!).assertTrue();
            expect(typeof AppStorage.get<int>("windowRectLeft")!).assertEqual('int');
            expect(typeof AppStorage.get<int>("windowRectTop")!).assertEqual('int');
            expect(typeof AppStorage.get<int>("windowRectWidth")!).assertEqual('int');
            expect(typeof AppStorage.get<int>("windowRectHeight")!).assertEqual('int');
            CommonEventManager.unsubscribe(subscriber, () => {
              console.info("====>UnSubscribe0100 CallBack====>");
            });
            done();
          }
        }

        CommonEventManager.createSubscriber(commonEventSubscribeInfo)
          .then((data: CommonEventManager.CommonEventSubscriber | null) => {
            subscriber = data as CommonEventManager.CommonEventSubscriber;
            CommonEventManager.subscribe(subscriber, SubscribeCallBack)
          })

        let want: Want = {
          bundleName: 'com.acts.example.requestdialog.static',
          abilityName: 'EntryAbility',
        };
        let result = (err: BusinessError | null, result: dialogRequest.RequestResult | undefined) => {
          console.info("====>ACTS_requestDialog_static_0200 request end + result:" + JSON.stringify(result));
          resultCode = result?.result;
        }

        testAbilityContext.requestDialogService(want, result)
      } catch (paramError) {
        console.info("====>ACTS_requestDialog_static_0200 requestDialogSerivce paramError====>");
      }

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_static_0200 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start ACTS_requestDialog_static_0200 timer id : ' + id);
    })

    /**
     * @tc.name   ACTS_requestDialog_static_0300
     * @tc.number ACTS_requestDialog_static_0300
     * @tc.desc   reguest dialog service 16000001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_requestDialog_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('ACTS_requestDialog_static_0300====<begin');
      let id: int;
      let resultCode: dialogRequest.ResultCode | undefined;
      try {
        let want: Want = {
          bundleName: 'com.acts.example.requestdialog.static',
          abilityName: 'EntryAbilityError',
        };
        let result = (err: BusinessError | null, result: dialogRequest.RequestResult | undefined) => {
          if (err && err.code !== 0) {
            console.info(`====>ACTS_requestDialog_static_0300 request failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000001);
            done();
          } else {
            console.info("====>ACTS_requestDialog_static_0300 request end + result:" + JSON.stringify(result));
            resultCode = result?.result;
          }
        }

        testAbilityContext.requestDialogService(want, result)
      } catch (paramError) {
        console.info("====>ACTS_requestDialog_static_0300 requestDialogSerivce paramError====>");
      }

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_static_0300 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start ACTS_requestDialog_static_0300 timer id : ' + id);
    })

    /**
     * @tc.name   ACTS_requestDialog_static_0500
     * @tc.number ACTS_requestDialog_static_0500
     * @tc.desc   reguest dialog service 16000010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_requestDialog_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.log('ACTS_requestDialog_static_0500====<begin');
      let id: int;
      let resultCode: dialogRequest.ResultCode | undefined;
      try {
        let want: Want = {
          bundleName: 'com.acts.example.requestdialog.static',
          abilityName: 'EntryAbility',
          flags: -1
        };
        let result = (err: BusinessError | null, result: dialogRequest.RequestResult | undefined) => {
          if (err && err.code !== 0) {
            console.info(`====>ACTS_requestDialog_static_0500 request failed, code is ${err?.code}, message is ${err?.message}`);
            expect(err?.code).assertEqual(16000010);
            done();
          } else {
            console.info("====>ACTS_requestDialog_static_0500 request end + result:" + JSON.stringify(result));
            resultCode = result?.result;
          }
        }

        testAbilityContext.requestDialogService(want, result)
      } catch (paramError) {
        console.info("====>ACTS_requestDialog_static_0500 requestDialogSerivce paramError====>");
      }

      id = setTimeout(() => {
        console.log('ACTS_requestDialog_static_0500 timeout.');
        done();
      }, CASE_TIMEOUT);
      console.log('Start ACTS_requestDialog_static_0500 timer id : ' + id);
    })
  })
}