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
import AbilityConstant from "@ohos.app.ability.AbilityConstant";
import appManager from "@ohos.application.appManager";
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import Want from '@ohos.app.ability.Want';
import { UiDriver, BY, Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

let INVALID_PARAM = 401;
let TAG: string;

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

let driver1:Driver;
export default function verificationTest() {
  describe('VerificationTestTest', () => {
    beforeAll(async()=>{
      try{
        driver1 = await Driver.create();
        let allowed = await driver1.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      }catch{
        console.info("VerificationTestTest beforeAll create driver error" );
      }
    })
    beforeEach(async (done: Function) => {
      TAG = 'beforeEach ==>';
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility({
        bundleName: 'com.example.facoverhaptest',
        abilityName: 'com.example.facoverhaptest.MainAbility'
      })
        .then((data) => {
          console.info(TAG + "startAbility com.example.apicoverhaptest.MainAbility = " + JSON.stringify(data));
          setTimeout(() => {
            done();
          }, 1000);
        })
    })

    afterEach(async (done: Function) => {
      try{
        done();
      }catch{
        console.info("VerificationTestTest afterEach delayMs error" );
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_HasWindowFocus_0100
     * @tc.number SUB_AA_OpenHarmony_HasWindowFocus_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_HasWindowFocus_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_HasWindowFocus_0100 ==>';
      console.info(TAG + " start");
      try {
        let flags = false;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Fa_MainAbility_HasWindowFocus", "Fa_MainAbility_onDestroy"]
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===");
          subscriber = data;
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Fa_MainAbility_HasWindowFocus") {
              flags = data.parameters?.hasWindowFocus;
            }
            if (data.event == "Fa_MainAbility_onDestroy") {
              expect(flags).assertTrue();
              commonEvent.unsubscribe(subscriber, () => {
                console.info(TAG + "===UnSubscribeInfoCallback===");
                done();
              })
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.fasupplement',
          abilityName: 'ohos.acts.aafwk.test.fasupplement.MainAbility'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_AbilityConstant_0200
     * @tc.number SUB_AA_OpenHarmony_AbilityConstant_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_AbilityConstant_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_AbilityConstant_0200 ==>';
      console.info(TAG + " start");
      try {
        let launchWant: ESObject = undefined;
        let lastRequestWant: ESObject = undefined;
        let launchReason: ESObject = undefined;
        let lastExitReason: ESObject = undefined;
        let launchUTCTime: ESObject = undefined;
        let launchUptime: ESObject = undefined;
        let specifiedId: ESObject = undefined;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Stage_MainAbility3_onCreate", "Stage_MainAbility3_onDestroy"]
        }

        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===");
          subscriber = data;
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Stage_MainAbility3_onCreate") {
              launchWant = data.parameters?.launchWant;
              lastRequestWant = data.parameters?.lastRequestWant;
              launchReason = data.parameters?.launchReason;
              lastExitReason = data.parameters?.lastExitReason;
              launchUTCTime = data.parameters?.launchUTCTime;
              launchUptime = data.parameters?.launchUptime;
              specifiedId = data.parameters?.specifiedId;
            }
            if (data.event == "Stage_MainAbility3_onDestroy") {
              expect(launchWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
              expect(lastRequestWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
              expect(launchReason != AbilityConstant.LaunchReason.CALL).assertTrue();
              expect(launchReason != AbilityConstant.LaunchReason.CONTINUATION).assertTrue();
              expect(lastExitReason != AbilityConstant.LastExitReason.UNKNOWN).assertTrue();
              expect(launchUTCTime > 0).assertTrue();
              expect(launchUptime > 0).assertTrue();
              expect(!specifiedId).assertTrue();
              commonEvent.unsubscribe(subscriber, () => {
                console.info(TAG + "===UnSubscribeInfoCallback===");
                done();
              })
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility3'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  /**
    * @tc.name   SUB_AA_OpenHarmony_AbilityConstant_0300
    * @tc.number SUB_AA_OpenHarmony_AbilityConstant_0300
    * @tc.desc   Function test
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_AA_OpenHarmony_AbilityConstant_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_AbilityConstant_0300 ==>';
      console.info(TAG + " start");
      try {
        let launchWant: ESObject = undefined;
        let lastRequestWant: ESObject = undefined;
        let launchReason: ESObject = undefined;
        let lastExitReason: ESObject = undefined;
        let specifiedId: ESObject = undefined;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Stage_MainAbility6_onCreate", "Stage_MainAbility6_onDestroy"]
        }

        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===");
          subscriber = data;
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Stage_MainAbility6_onCreate") {
              launchWant = data.parameters?.launchWant;
              lastRequestWant = data.parameters?.lastRequestWant;
              launchReason = data.parameters?.launchReason;
              lastExitReason = data.parameters?.lastExitReason;
              if(JSON.stringify(data).indexOf('specifiedId') != -1){
                specifiedId = data.parameters?.specifiedId;
                expect(specifiedId).assertEqual("onAcceptWant");
              }
            }
            if (data.event == "Stage_MainAbility6_onDestroy") {
              expect(launchWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
              expect(lastRequestWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
              expect(launchReason != AbilityConstant.LaunchReason.CALL).assertTrue();
              expect(launchReason != AbilityConstant.LaunchReason.CONTINUATION).assertTrue();
              expect(lastExitReason != AbilityConstant.LastExitReason.UNKNOWN).assertTrue();
              commonEvent.unsubscribe(subscriber, () => {
                console.info(TAG + "===UnSubscribeInfoCallback===");
                done();
              })
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility6'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_AppManagerTest_0100
     * @tc.number SUB_AA_OpenHarmony_AppManagerTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_AppManagerTest_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_AppManagerTest_0100 ==>';
      console.info(TAG + " start");
      try {
        appManager.isRunningInStabilityTest((err, data) => {
          console.info(TAG + "isRunningInStabilityTest err = " + JSON.stringify(err));
          console.info(TAG + "isRunningInStabilityTest data = " + data);
          expect(data).assertFalse();
          done();
        })
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_GetScreenDensity_0100
     * @tc.number SUB_AA_OpenHarmony_GetScreenDensity_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_GetScreenDensity_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_GetScreenDensity_0100 ==>';
      try {
        let screenDensity: ESObject;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Stage_MainAbility4_onCreate", "Stage_MainAbility4_onDestroy"]
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===");
          subscriber = data;
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Stage_MainAbility4_onCreate") {
              screenDensity = data.parameters?.screenDensity;
            }
            if (data.event == "Stage_MainAbility4_onDestroy") {
              expect(typeof screenDensity).assertEqual("number");
              expect(screenDensity).assertLarger(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(TAG + "===UnSubscribeInfoCallback===");
                done();
              })
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility4'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum,  {displayId: 0})
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100
     * @tc.number SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100 ==>';
      console.info(TAG + " start");
      try {
        let permissionRequestResult: ESObject;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Fa_MainAbility2_onCreate", "Fa_MainAbility2_onDestroy"]
        }

        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Fa_MainAbility2_onCreate") {
              permissionRequestResult = data.parameters?.permissionRequestResult;
            }
            if (data.event == "Fa_MainAbility2_onDestroy") {
              console.info(TAG + "===PermissionRequestResult===" + JSON.stringify(permissionRequestResult));
              expect(permissionRequestResult.requestCode).assertEqual(1);
              expect(JSON.stringify(permissionRequestResult.permissions))
                .assertEqual(JSON.stringify(["ohos.permission.CAMERA"]));
              expect(JSON.stringify(permissionRequestResult.authResults)).assertEqual(JSON.stringify([2]));
              commonEvent.unsubscribe(subscriber, () => {
                console.info(TAG + "===UnSubscribeInfoCallback===");
                done();
              });
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.fasupplement',
          abilityName: 'ohos.acts.aafwk.test.fasupplement.MainAbility2'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_AA_OpenHarmony_RequestPermissionsFromUser_0200
     * @tc.number SUB_AA_OpenHarmony_RequestPermissionsFromUser_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_RequestPermissionsFromUser_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_RequestPermissionsFromUser_0200 ==>';
      console.info(TAG + " start");
      try {
        console.info(TAG + `come in driveFn`);
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        let driver = await UiDriver.create();
        console.info(TAG + `driver is ${JSON.stringify(driver)}`);
        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.fasupplement',
          abilityName: 'ohos.acts.aafwk.test.fasupplement.MainAbility3',
        }
        await AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            console.info(TAG + "startAbility data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            expect().assertFail();
          });
        await sleep(2000);
        console.info(TAG + `UiDriver start`);
        let button = await driver.findComponent(BY.text('允许'));
        if(button == null){
          console.info(TAG + "findComponent err , permission dialog is empty ");
          let cmd = "hidumper -s WindowManagerService -a'-a'";
          await abilityDelegator.executeShellCommand(cmd);
          expect().assertFail();
          done();
        }
        console.info(TAG + `button is ${JSON.stringify(button)}`);
        await sleep(100);
        console.info(TAG + `start click`);
        try{await button.click();}catch(e){
          console.info(TAG + `fail click ` + JSON.stringify(e));
        }
        console.info(TAG + `end click`);
        await sleep(2000);
        console.info(TAG + `end`);
        done();
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_SetMissionLabel_0100
     * @tc.number SUB_AA_OpenHarmony_SetMissionLabel_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_SetMissionLabel_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_SetMissionLabel_0100 ==>';
      console.info(TAG + " start");
      let label: undefined = undefined;
      let code1 = 0;
      let code2 = 0;

      try {
        await AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label)
          .then((data) => {
            console.info(TAG + "setMissionLabel data = " + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            code1 = err.code;
            console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
          });
      } catch (err) {
        console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        expect(err.code).assertEqual(INVALID_PARAM);
      }

      try {
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label, (err, data) => {
          code2 = err.code;
          console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
          console.info(TAG + "setMissionLabel data = " + JSON.stringify(data));
        })
      } catch (err) {
        console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        expect(err.code).assertEqual(INVALID_PARAM);
      }

      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_SetMissionLabel_0300
     * @tc.number SUB_AA_OpenHarmony_SetMissionLabel_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_SetMissionLabel_0300', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_SetMissionLabel_0300 ==>';
      console.info(TAG + " start");
      let label = "testlabel";
      let missionLabelUpdatedFlag = false;

      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label)
        .then((data) => {
          console.info(TAG + "setMissionLabel data = " + JSON.stringify(data));
          missionLabelUpdatedFlag = true;
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        });
      await sleep(500);
      expect(missionLabelUpdatedFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_SetMissionLabel_0400
     * @tc.number SUB_AA_OpenHarmony_SetMissionLabel_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_SetMissionLabel_0400', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_SetMissionLabel_0400 ==>';
      console.info(TAG + " start");
      let label1 = "testlabel1";
      let label2 = "testlabel2";
      let missionLabelUpdatedCount = 0;

      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label1)
        .then((data) => {
          console.info(TAG + "setMissionLabel1 data = " + JSON.stringify(data));
          missionLabelUpdatedCount++;
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "setMissionLabel1 err = " + JSON.stringify(err));
        });
      await AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label2)
        .then((data) => {
          console.info(TAG + "setMissionLabel2 data = " + JSON.stringify(data));
          missionLabelUpdatedCount++;
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "setMissionLabel2 err = " + JSON.stringify(err));
        });
      await sleep(500);
      expect(missionLabelUpdatedCount).assertEqual(2);

      missionLabelUpdatedCount = 0;
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label1, (err, data) => {
        console.info(TAG + "setMissionLabel1 err = " + JSON.stringify(err));
        console.info(TAG + "setMissionLabel1 data = " + JSON.stringify(data));
        if (err.code == 0) {
          missionLabelUpdatedCount++;
        }
      })
      AppStorage.get<common.UIAbilityContext>("abilityContext")!.setMissionLabel(label2, (err, data) => {
        console.info(TAG + "setMissionLabel2 err = " + JSON.stringify(err));
        console.info(TAG + "setMissionLabel2 data = " + JSON.stringify(data));
        if (err.code == 0) {
          missionLabelUpdatedCount++;
        }
      })
      await sleep(500);
      expect(missionLabelUpdatedCount).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_StartAbilityLife_0100
     * @tc.number SUB_AA_OpenHarmony_StartAbilityLife_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_StartAbilityLife_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_StartAbilityLife_0100 ==>';
      console.info(TAG + " start");

      try {
        let list = ["Stage_MainAbility9_onCreate", "Stage_MainAbility9_onWindowStageCreate",
          "Stage_MainAbility9_onForeground", "Stage_MainAbility9_onBackground",
          "Stage_MainAbility9_onWindowStageDestroy", "Stage_MainAbility9_onDestroy"]
        let value: ESObject = "";
        let status = false;
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["Stage_MainAbility9_onContinue", "Stage_MainAbility9_onDestroy"]
        }

        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===");
          subscriber = data;
          commonEvent.subscribe(subscriber, (err, data) => {
            console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data));
            if (data.event == "Stage_MainAbility9_onContinue") {
              status = true;
            }
            if (data.event == "Stage_MainAbility9_onDestroy") {
              let lifeList: ESObject = data.parameters?.lifeList;
              expect(JSON.stringify(list)).assertEqual(JSON.stringify(lifeList));
              expect(AbilityConstant.OnContinueResult.AGREE).assertEqual(0);
              expect(AbilityConstant.OnContinueResult.REJECT).assertEqual(1);
              expect(AbilityConstant.OnContinueResult.MISMATCH).assertEqual(2);
              expect(value).assertEqual(undefined);
              expect(status).assertFalse();
              commonEvent.unsubscribe(subscriber, () => {
              });
              console.info(TAG + "===UnSubscribeInfoCallback===");
              done();
            }
          })
        })

        let wantNum: Want = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility9'
        }
        AppStorage.get<common.UIAbilityContext>("abilityContext")!.startAbility(wantNum)
          .then((data) => {
            value = AppStorage.get<common.UIAbilityContext>("abilityContext")!.restoreWindowStage(undefined);
            console.info(TAG + "startAbility data = " + JSON.stringify(data) + ";" + JSON.stringify(data));
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "startAbility err = " + JSON.stringify(err));
            if (err.code != 16000017) {
              expect().assertFail();
              done();
            }
          });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}