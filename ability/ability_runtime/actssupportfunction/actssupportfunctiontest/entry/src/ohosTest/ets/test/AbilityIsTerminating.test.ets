/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEvent';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import common from '@ohos.app.ability.common';

export default function AbilityIsTerminatingTest() {

  describe('AbilityIsTerminatingTest', () => {

    let TAG = "";
    let sleepTimeOne = 1000;
    afterEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, 1000);
    })
    /*
     * @tc.number  : SUB_AA_OpenHarmony_IsTerminating_0100
     * @tc.name    : Verify the isTerminating interface
     * @tc.desc    : Terminate ability through terminateSelf.
     */
    it('SUB_AA_OpenHarmony_IsTerminating_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_IsTerminating_0100 == ';
      console.log(TAG + "begin");
      let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      let status1: boolean = false;
      let status2: boolean = false;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onWindowStageCreate", "onForeground", "onDestroy"];
      let onDestroy = "Stage_SupportFunction_MainAbility_onDestroy";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onDestroy]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onDestroy) {
            status1 = data?.parameters?.isTerminating1;
            status2 = data?.parameters?.isTerminating2;
            lifeList = data?.parameters?.lifeList;

            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stagesupportfunction",
        abilityName: "MainAbility",
        parameters: {
          number: 1
        }
      }
      await context.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_IsTerminating_0200
     * @tc.name    : Verify the isTerminating interface
     * @tc.desc    : Terminate ability through terminateSelfWithResult.
     */
    it('SUB_AA_OpenHarmony_IsTerminating_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_IsTerminating_0200 == ';
      console.log(TAG + "begin");

      let status1: boolean = false;
      let status2: boolean = false;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onWindowStageCreate", "onForeground", "onDestroy"];
      let onDestroy = "Stage_SupportFunction_MainAbility_onDestroy";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onDestroy]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onDestroy) {
            status1 = data?.parameters?.isTerminating1;
            status2 = data?.parameters?.isTerminating2;
            lifeList = data?.parameters?.lifeList;

            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stagesupportfunction",
        abilityName: "MainAbility",
        parameters: {
          number: 2
        }
      }
      let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;

      await context.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : SUB_AA_OpenHarmony_IsTerminating_0500
     * @tc.name    : Verify the isTerminating interface
     * @tc.desc    : Terminate ability with the back key.
     */
    it('SUB_AA_OpenHarmony_IsTerminating_0500', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_IsTerminating_0500 == ';
      console.log(TAG + "begin");

      let status1: boolean = false;
      let status2: boolean = false;
      let lifeList: string[] = [];
      let listCheck = ["onCreate", "onWindowStageCreate", "onForeground", "onDestroy"];
      let onCreate = "Stage_SupportFunction_MainAbility_onCreate";
      let onDestroy = "Stage_SupportFunction_MainAbility_onDestroy";

      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [onCreate, onDestroy]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        subscriber = data;

        commonEventManager.subscribe(subscriber, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == onCreate) {
            setTimeout(async () => {
              let abilitydelegator = AbilityDelegatorRegistry.getAbilityDelegator();
              let cmd = "uinput -K -d 2 -u 2";
              await abilitydelegator.executeShellCommand(cmd).then((data) => {
                console.log(TAG + "executeShellCommand : data : " + data.stdResult);
                console.log(TAG + "executeShellCommand : data : " + data.exitCode);
              }).catch((error: BusinessError) => {
                console.log(TAG + "executeShellCommand error : " + JSON.stringify(error));
              });
            }, sleepTimeOne);
          }

          if (data.event == onDestroy) {
            status1 = data?.parameters?.isTerminating1;
            status2 = data?.parameters?.isTerminating2;
            lifeList = data?.parameters?.lifeList;

            setTimeout(async () => {
              commonEventManager.unsubscribe(subscriber, async (err, data) => {
                console.log(TAG + "UnSubscribeInfoCallback : " + JSON.stringify(data));
                expect(JSON.stringify(lifeList)).assertEqual(JSON.stringify(listCheck));
                expect(status1).assertFalse();
                expect(status2).assertTrue();
                done();
              });
            }, sleepTimeOne);
          }
        });
      }).catch((error: BusinessError) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })

      let wantNum: Want = {
        bundleName: "ohos.acts.aafwk.test.stagesupportfunction",
        abilityName: "MainAbility"
      }
      let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      await context.startAbility(wantNum).then((data) => {
        console.log(TAG + "startAbility data = " + JSON.stringify(data));
      }).catch((error: BusinessError) => {
        console.log(TAG + "startAbility error = " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })
  })
}