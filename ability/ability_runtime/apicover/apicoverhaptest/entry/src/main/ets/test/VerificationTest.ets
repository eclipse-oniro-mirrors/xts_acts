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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent';
import AbilityConstant from "@ohos.app.ability.AbilityConstant";
import appManager from "@ohos.application.appManager";
import wantConstant from '@ohos.ability.wantConstant';

var INVALID_PARAM = 401
var TAG
export default function verificationTest(){

  describe('VerificationTestTest', function() {

    /*
         * @tc.number  SUB_AA_OpenHarmony_HasWindowFocus_0100
         * @tc.name    Start ability to judge whether there is window focus.
         * @tc.desc    Function test
         * @tc.level   3
         */
    it('SUB_AA_OpenHarmony_HasWindowFocus_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_HasWindowFocus_0100 ==>';

      try {
        let flags = false
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_MainAbility_HasWindowFocus", "Fa_MainAbility_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_MainAbility_HasWindowFocus") {
            flags = data.parameters.hasWindowFocus
          }
          if (data.event == "Fa_MainAbility_onDestroy") {
            expect(flags).assertTrue();
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.fasupplement',
          abilityName: 'ohos.acts.aafwk.test.fasupplement.MainAbility'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
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

    /*
     * @tc.number  SUB_AA_OpenHarmony_AbilityConstant_0200
     * @tc.name    The startAbility interface starts the ability, not the start of call or continue.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_AbilityConstant_0200', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_AbilityConstant_0200 ==>';

      try {
        let launchWant = undefined
        let lastRequestWant = undefined
        let launchReason = undefined
        let lastExitReason = undefined
        let subscriber = null
        let subscribeInfo = {
          events: ["Stage_MainAbility3_onCreate", "Stage_MainAbility3_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Stage_MainAbility3_onCreate") {
            launchWant = data.parameters.launchWant
            lastRequestWant = data.parameters.lastRequestWant
            launchReason = data.parameters.launchReason
            lastExitReason = data.parameters.lastExitReason
          }
          if (data.event == "Stage_MainAbility3_onDestroy") {
            expect(launchWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
            expect(lastRequestWant.bundleName).assertEqual("ohos.acts.aafwk.test.stagesupplement");
            expect(launchReason != AbilityConstant.LaunchReason.CALL).assertTrue()
            expect(launchReason != AbilityConstant.LaunchReason.CONTINUATION).assertTrue()
            expect(lastExitReason != AbilityConstant.LastExitReason.UNKNOWN).assertTrue()
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility3'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
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

    /*
     * @tc.number  SUB_AA_OpenHarmony_AppManagerTest_0100
     * @tc.name    Whether the user is conducting stability test verification.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_AppManagerTest_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_AppManagerTest_0100 ==>';
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

    /*
     * @tc.number  SUB_AA_OpenHarmony_GetScreenDensity_0100
     * @tc.name    Start ability and get resolution.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_GetScreenDensity_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_GetScreenDensity_0100 ==>';

      try {
        let screenDensity = undefined
        let subscriber = null
        let subscribeInfo = {
          events: ["Stage_MainAbility4_onCreate", "Stage_MainAbility4_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Stage_MainAbility4_onCreate") {
            screenDensity = data.parameters.screenDensity
          }
          if (data.event == "Stage_MainAbility4_onDestroy") {
	    expect(typeof screenDensity).assertEqual("number");
            expect(screenDensity).assertLarger(0);
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility4'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
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

    /*
     * @tc.number  SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100
     * @tc.name    FA model is not configured with permission for authorization verification.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_RequestPermissionsFromUser_0100 ==>';

      try {
        let permissionRequestResult = null
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_MainAbility2_onCreate", "Fa_MainAbility2_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_MainAbility2_onCreate") {
            permissionRequestResult = data.parameters.permissionRequestResult
          }
          if (data.event == "Fa_MainAbility2_onDestroy") {
            console.info(TAG + "===PermissionRequestResult===" + JSON.stringify(permissionRequestResult))
            expect(permissionRequestResult.requestCode).assertEqual(1);
            expect(JSON.stringify(permissionRequestResult.permissions)).assertEqual(JSON.stringify(["ohos.permission.CAMERA"]));
            expect(JSON.stringify(permissionRequestResult.authResults)).assertEqual(JSON.stringify([2]));
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.fasupplement',
          abilityName: 'ohos.acts.aafwk.test.fasupplement.MainAbility2'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
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

    /*
    * @tc.number  SUB_AA_OpenHarmony_SetMissionLabel_0100
    * @tc.name    Verify setMissionLabel that the input parameter is undefined.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_OpenHarmony_SetMissionLabel_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_SetMissionLabel_0100 ==>';
      let label = undefined;
      let code1 = 0;
      let code2 = 0;

      try {
        await globalThis.abilityContext.setMissionLabel(label).then((data) => {
          console.info(TAG + "setMissionLabel data = " + JSON.stringify(data));
        }).catch((err) => {
          code1 = err.code
          console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        });
      } catch (err) {
        console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        expect(err.code).assertEqual(INVALID_PARAM);
      }

      try {
        await globalThis.abilityContext.setMissionLabel(label, (err, data) => {
          code2 = err.code
          console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
          console.info(TAG + "setMissionLabel data = " + JSON.stringify(data));
        })
      } catch (err) {
        console.info(TAG + "setMissionLabel err = " + JSON.stringify(err));
        expect(err.code).assertEqual(INVALID_PARAM);
      }

      done();
    })

    /*
    * @tc.number  SUB_AA_OpenHarmony_IsTerminating_0100
    * @tc.name    Verification ability destroy status query.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_OpenHarmony_IsTerminating_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_IsTerminating_0100 ==>';

      try {
        let status1 = undefined
        let status2 = undefined
        let subscriber = null
        let subscribeInfo = {
          events: ["Stage_MainAbility5_onCreate", "Stage_MainAbility5_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Stage_MainAbility5_onCreate") {
            status1 = data.parameters.isTerminating
          }
          if (data.event == "Stage_MainAbility5_onDestroy") {
            status2 = data.parameters.isTerminating
            expect(status1).assertFalse();
            expect(status2).assertTrue();
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility5'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
          console.info(TAG + "startAbility err = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
    * @tc.number  SUB_AA_OpenHarmony_StartAbilityLife_0100
    * @tc.name    Ability startup and termination will not trigger the migration lifecycle.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_OpenHarmony_StartAbilityLife_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_StartAbilityLife_0100 ==>';

      try {
        let list = ["Stage_MainAbility9_onCreate","Stage_MainAbility9_onWindowStageCreate",
        "Stage_MainAbility9_onForeground","Stage_MainAbility9_onBackground",
        "Stage_MainAbility9_onWindowStageDestroy","Stage_MainAbility9_onDestroy"]
        let value = ""
        let status = false
        let subscriber = null
        let subscribeInfo = {
          events: ["Stage_MainAbility9_onContinue", "Stage_MainAbility9_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Stage_MainAbility9_onContinue") {
            status = true
          }
          if (data.event == "Stage_MainAbility9_onDestroy") {
            let lifeList = data.parameters.lifeList
            expect(JSON.stringify(list)).assertEqual(JSON.stringify(lifeList));
            expect(AbilityConstant.OnContinueResult.AGREE).assertEqual(0);
            expect(AbilityConstant.OnContinueResult.REJECT).assertEqual(1);
            expect(AbilityConstant.OnContinueResult.MISMATCH).assertEqual(2);
            expect(value).assertEqual(undefined);
            expect(status).assertFalse();
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        function UnSubscribeInfoCallback(err, data) {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let wantNum = {
          bundleName: 'ohos.acts.aafwk.test.stagesupplement',
          abilityName: 'MainAbility9'
        }
        globalThis.abilityContext.startAbility(wantNum).then((data) => {
          value = globalThis.abilityContext.restoreWindowStage(undefined);
          console.info(TAG + "startAbility data = " + JSON.stringify(data) + ";" + JSON.stringify(data));
        }).catch((err) => {
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
