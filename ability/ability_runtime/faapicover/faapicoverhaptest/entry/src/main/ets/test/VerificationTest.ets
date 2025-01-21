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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"

import ability_featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';
import appManager from "@ohos.application.appManager";
import wantConstant from '@ohos.ability.wantConstant';
import rpc from "@ohos.rpc";
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

var TAG
export default function verificationTest(){

  describe('VerificationTestTest', function() {

    let sleepTimeOne = 1000;
    let TAG1 = "SUB_AA_OpenHarmony == ";
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    afterEach(async (done) => {
      console.log(TAG1 + "afterEach called");
      let cmd = "aa force-stop ohos.acts.aafwk.test.faauxiliary";
      await abilityDelegator.executeShellCommand(cmd).then((data) => {
        console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
      }).catch((error) => {
        console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
      })

      setTimeout(() => {
        console.log(TAG1 + "afterEach end");
        done();
      }, sleepTimeOne);
    })

    /*
         * @tc.number  SUB_AA_OpenHarmony_Test_HasWindowFocus_0100
         * @tc.name    Start ability to judge whether there is window focus.
         * @tc.desc    Function test
         * @tc.level   3
         */
    it('SUB_AA_OpenHarmony_Test_HasWindowFocus_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_HasWindowFocus_0100 ==>';

      try {
        let flags = false
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility_HasWindowFocus", "Fa_Auxiliary_MainAbility_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility_HasWindowFocus") {
            flags = data.parameters.hasWindowFocus
          }
          if (data.event == "Fa_Auxiliary_MainAbility_onDestroy") {
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
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility'
          }
        }
        await ability_featureAbility.startAbility(wantNum).then((data) => {
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
     * @tc.number  SUB_AA_OpenHarmony_Test_AppManagerTest_0100
     * @tc.name    Whether the user is conducting stability test verification.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_Test_AppManagerTest_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_AppManagerTest_0100 ==>';
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
    * @tc.number  SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100
    * @tc.name    Validate the input parameter flags of startAbility.
    * @tc.desc    Function test
    * @tc.level   3
    */
    it('SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100 ==>';

      try {
        let list1 = []
        let list2 = ["Fa_Auxiliary_MainAbility4_onDestroy"]
        let number1 = undefined
        let number3 = undefined
        let code1 = 536870912
        let code2 = 2048
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility4_onCreate", "Fa_Auxiliary_MainAbility4_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility4_onCreate") {
            number1 = data.parameters.flags
          }
          if (data.event == "Fa_Auxiliary_MainAbility4_onDestroy") {
            list1[0] = "Fa_Auxiliary_MainAbility4_onDestroy"
          }
          if (JSON.stringify(list1) == JSON.stringify(list2)) {
            expect(number3).assertEqual(1);
            expect(number1).assertEqual(code1);
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

        let wantNum1 = {
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility3',
            flags: wantConstant.Flags.FLAG_ABILITY_CONTINUATION
          }
        }
        await ability_featureAbility.startAbility(wantNum1).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err) => {
          number3 = err.code
          console.info(TAG + "startAbility err = " + JSON.stringify(err));
        });

        let wantNum2 = {
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility4',
            flags: wantConstant.Flags.FLAG_ABILITY_MISSION_TOP
          }
        }
        await ability_featureAbility.startAbility(wantNum2).then((data) => {
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
     * @tc.number  SUB_AA_OpenHarmony_Test_GetWindow_0100
     * @tc.name    Call GetWindow interface.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_Test_GetWindow_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_GetWindow_0100 ==>';
      try {
        ability_featureAbility.getWindow((err, data) => {
          console.info(TAG + "getWindow err = " + JSON.stringify(err));
          console.info(TAG + "getWindow data = " + data);
          done();
        })
      } catch (err) {
        console.info(TAG + "getWindow catch err = " + JSON.stringify(err));
        done();
      }
    })

    /*
     * @tc.number  SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100
     * @tc.name    CTerminate ability through TerminateSelfWithResult.
     * @tc.desc    Function test
     * @tc.level   3
     */
    it('SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100 ==>';
      try {
        let resultCode = undefined
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility6_onDestroy"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility6_onDestroy") {
            setTimeout(()=>{
              expect(resultCode).assertEqual(661);
              commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            }, 1000)
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
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility6'
          }
        }
        await ability_featureAbility.startAbilityForResult(wantNum).then((data) => {
          console.info(TAG + "startAbilityForResult data = " + JSON.stringify(data));
          resultCode = data.resultCode
        }).catch((err) => {
          console.info(TAG + "startAbilityForResult err = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(TAG + "getWindow catch err = " + JSON.stringify(err));
        done();
      }
    })

    /*
   * @tc.number  SUB_AA_OpenHarmony_Test_ServiceAbility_0100
   * @tc.name    Start and stop serviceability.
   * @tc.desc    Function test
   * @tc.level   3
   */
    it('SUB_AA_OpenHarmony_Test_ServiceAbility_0100', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_ServiceAbility_0100 ==>';

      try {
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_Auxiliary_ServiceAbility_onCommand"]
        }
        function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_ServiceAbility_onCommand") {
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
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
          want: {
            bundleName: 'com.example.faapicoverhaptest',
            abilityName: 'com.example.faapicoverhaptest.ServiceAbility'
          }
        }
        await ability_featureAbility.startAbility(wantNum).then((data) => {
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
   * @tc.number  SUB_AA_OpenHarmony_Test_ServiceAbility_0200
   * @tc.name    Bind and unbind serviceability.
   * @tc.desc    Function test
   * @tc.level   3
   */
    it('SUB_AA_OpenHarmony_Test_ServiceAbility_0200', 0, async function(done) {
      TAG = 'SUB_AA_OpenHarmony_Test_ServiceAbility_0200 ==>';

      try {
        let liseList = []
        let liseListCheck = ["onConnect","onDisconnect"]
        let flag1 = false
        let flag2 = false
        let flag3 = false
        let subscriber = null
        let subscribeInfo = {
          events: ["Fa_Auxiliary_ServiceAbility2_onConnect", "Fa_Auxiliary_ServiceAbility2_onDisconnect"]
        }
        async function SubscribeInfoCallback(err, data) {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_ServiceAbility2_onConnect") {
            liseList.push("onConnect")
            await ability_featureAbility.disconnectAbility(num).then((data) => {
              console.info(TAG + "disconnectAbility data = " + JSON.stringify(data));
            }).catch((err) => {
              console.info(TAG + "disconnectAbility err = " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }
          if (data.event == "Fa_Auxiliary_ServiceAbility2_onDisconnect") {
            liseList.push("onDisconnect")

            setTimeout(()=>{
              expect(JSON.stringify(liseList)).assertEqual(JSON.stringify(liseListCheck));
              expect(flag1).assertTrue();
              expect(flag2).assertTrue();
              expect(flag3).assertFalse();
              commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
            }, 1000)
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

        let options = {
          onConnect: function (elementName, proxy) {
            flag1 = true
            console.info(TAG + 'Ext onConnect SUCCESS, elementName = ' + JSON.stringify(elementName));
            if (proxy == null) {
              console.info(TAG + 'Ext proxy == null');
              return;
            }
            let option = new rpc.MessageOption();
            let data = new rpc.MessageParcel();
            let reply = new rpc.MessageParcel();
            data.writeInt(1);
            data.writeInt(99);
            proxy.sendRequest(1, data, reply, option, (result) => {
              let msg = result.reply.readInt();
              console.info(TAG + 'Ext connect, msg = ' + msg);
            });
          },
          onDisconnect: function (elementName) {
            flag2 = true
            console.info(TAG + 'Ext onDisconnect, elementName = ' + JSON.stringify(elementName));
          },
          onFailed: function (number) {
            flag3 = true
            console.info(TAG + 'Ext onFailed, number = ' + number);
          }
        };
        let wantNum = {
          bundleName: 'com.example.faapicoverhaptest',
          abilityName: 'com.example.faapicoverhaptest.ServiceAbility2'
        }
        let num = ability_featureAbility.connectAbility(wantNum, options)
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
