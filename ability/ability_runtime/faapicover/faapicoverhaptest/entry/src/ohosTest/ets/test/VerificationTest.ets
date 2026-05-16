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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

import ability_featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEventManager';
import appManager from "@ohos.application.appManager";
import wantConstant from '@ohos.ability.wantConstant';
import rpc from "@ohos.rpc";
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import {BusinessError} from "@ohos.base";
let TAG = "test"
export default function verificationTest(){

  describe('VerificationTestTest', () => {

    let sleepTimeOne = 1000;
    let TAG1 = "SUB_AA_OpenHarmony == ";
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    afterEach(async (done: Function) => {
      console.log(TAG1 + "afterEach called");
      let cmd = "aa force-stop ohos.acts.aafwk.test.faauxiliary";
      await abilityDelegator.executeShellCommand(cmd).then((data) => {
        console.log(TAG1 + "executeShellCommand : data : " + data.stdResult);
        console.log(TAG1 + "executeShellCommand : data : " + data.exitCode);
      }).catch((error:BusinessError) => {
        console.log(TAG1 + "executeShellCommand error : " + JSON.stringify(error));
      })

      setTimeout(() => {
        console.log(TAG1 + "afterEach end");
        done();
      }, sleepTimeOne);
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_HasWindowFocus_0100
     * @tc.number SUB_AA_OpenHarmony_Test_HasWindowFocus_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_HasWindowFocus_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_HasWindowFocus_0100 ==>';

      try {
        let flags = false
        let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
        let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility_HasWindowFocus", "Fa_Auxiliary_MainAbility_onDestroy"]
        }
        let SubscribeInfoCallback = (err: BusinessError, data: commonEvent.CommonEventData) => {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility_HasWindowFocus") {
            flags = data.parameters?.hasWindowFocus
          }
          if (data.event == "Fa_Auxiliary_MainAbility_onDestroy") {
            expect(flags).assertTrue();
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
          }
        }
        let UnSubscribeInfoCallback = ()=> {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        await ability_featureAbility.startAbility({
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility'
          }
        }).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err:BusinessError) => {
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

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_AppManagerTest_0100
     * @tc.number SUB_AA_OpenHarmony_Test_AppManagerTest_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_AppManagerTest_0100', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100
     * @tc.number SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_StartAbilityFlags_0100 ==>';

      try {
        let list1:string[] = []
        let list2 = ["Fa_Auxiliary_MainAbility4_onDestroy"]
        let number1 = undefined
        let number3: number | undefined = undefined
        let code1 = 536870912
        let code2 = 2048
        let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
        let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility4_onCreate", "Fa_Auxiliary_MainAbility4_onDestroy"]
        }
        let SubscribeInfoCallback = (err: BusinessError, data: commonEvent.CommonEventData)  =>{
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility4_onCreate") {
            number1 = data.parameters?.flags
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
        let UnSubscribeInfoCallback = () => {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        await ability_featureAbility.startAbility({
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility3',
            flags: wantConstant.Flags.FLAG_ABILITY_CONTINUATION
          }
        }).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err:BusinessError) => {
          number3 = err.code
          console.info(TAG + "startAbility err = " + JSON.stringify(err));
        });

        await ability_featureAbility.startAbility({
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility4',
            flags: wantConstant.Flags.FLAG_ABILITY_MISSION_TOP
          }
        }).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err:BusinessError) => {
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

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_GetWindow_0100
     * @tc.number SUB_AA_OpenHarmony_Test_GetWindow_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_GetWindow_0100', Level.LEVEL0, async (done: Function) => {
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

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_GetWindow_0200
     * @tc.number SUB_AA_OpenHarmony_Test_GetWindow_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_GetWindow_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_GetWindow_0200 ==>';
      try {
        ability_featureAbility.getWindow().then((data) => {
          console.info(TAG + "getWindow data = " + data);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.info(TAG + "getWindow err = " + err);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(TAG + "getWindow catch err = " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100
     * @tc.number SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_TerminateSelfWithResult_0100 ==>';
      try {
        let resultCode: number | undefined = undefined
        let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
        let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
          events: ["Fa_Auxiliary_MainAbility6_onDestroy"]
        }
        let SubscribeInfoCallback = (err: BusinessError, data: commonEvent.CommonEventData) => {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_MainAbility6_onDestroy") {
            setTimeout(()=>{
              expect(resultCode).assertEqual(661);
              commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback)
            }, 1000)
          }
        }
        let UnSubscribeInfoCallback = () => {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        await ability_featureAbility.startAbilityForResult({
          want: {
            bundleName: 'ohos.acts.aafwk.test.faauxiliary',
            abilityName: 'ohos.acts.aafwk.test.faauxiliary.MainAbility6'
          }
        }).then((data) => {
          console.info(TAG + "startAbilityForResult data = " + JSON.stringify(data));
          resultCode = data.resultCode
        }).catch((err: BusinessError) => {
          console.info(TAG + "startAbilityForResult err = " + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(TAG + "getWindow catch err = " + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_ServiceAbility_0100
     * @tc.number SUB_AA_OpenHarmony_Test_ServiceAbility_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_ServiceAbility_0100', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_ServiceAbility_0100 ==>';

      try {
        let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
        let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
          events: ["Fa_Auxiliary_ServiceAbility_onCommand"]
        }
        let SubscribeInfoCallback = (err: BusinessError, data: commonEvent.CommonEventData)  => {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_ServiceAbility_onCommand") {
            commonEvent.unsubscribe(subscriber, UnSubscribeInfoCallback);
          }
        }
        let UnSubscribeInfoCallback = () => {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        await ability_featureAbility.startAbility({
          want: {
            bundleName: 'com.example.faapicoverhaptest',
            abilityName: 'com.example.faapicoverhaptest.ServiceAbility'
          }
        }).then((data) => {
          console.info(TAG + "startAbility data = " + JSON.stringify(data));
        }).catch((err:BusinessError) => {
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

    /**
     * @tc.name   SUB_AA_OpenHarmony_Test_ServiceAbility_0200
     * @tc.number SUB_AA_OpenHarmony_Test_ServiceAbility_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AA_OpenHarmony_Test_ServiceAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = 'SUB_AA_OpenHarmony_Test_ServiceAbility_0200 ==>';

      try {
        let liseList:string[] = []
        let liseListCheck = ["onConnect","onDisconnect"]
        let flag1 = false
        let flag2 = false
        let flag3 = false
        let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
        let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
          events: ["Fa_Auxiliary_ServiceAbility2_onConnect", "Fa_Auxiliary_ServiceAbility2_onDisconnect"]
        }
        let SubscribeInfoCallback = async (err: BusinessError, data: commonEvent.CommonEventData)  => {
          console.info(TAG + "===SubscribeInfoCallback===" + JSON.stringify(data))
          if (data.event == "Fa_Auxiliary_ServiceAbility2_onConnect") {
            liseList.push("onConnect")
            await ability_featureAbility.disconnectAbility(num).then((data) => {
              console.info(TAG + "disconnectAbility data = " + JSON.stringify(data));
            }).catch((err:BusinessError) => {
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
        let UnSubscribeInfoCallback = () => {
          console.info(TAG + "===UnSubscribeInfoCallback===")
          done()
        }
        commonEvent.createSubscriber(subscribeInfo, (err, data) => {
          console.info(TAG + "===CreateSubscriberCallback===")
          subscriber = data
          commonEvent.subscribe(subscriber, SubscribeInfoCallback)
        })

        let num = ability_featureAbility.connectAbility({
          bundleName: 'com.example.faapicoverhaptest',
          abilityName: 'com.example.faapicoverhaptest.ServiceAbility2'
        }, {
          onConnect: (elementName, proxy) => {
            flag1 = true
            console.info(TAG + 'Ext onConnect SUCCESS, elementName = ' + JSON.stringify(elementName));
            if (proxy == null) {
              console.info(TAG + 'Ext proxy == null');
              return;
            }
          },
          onDisconnect: (elementName) => {
            flag2 = true
            console.info(TAG + 'Ext onDisconnect, elementName = ' + JSON.stringify(elementName));
          },
          onFailed: (number) => {
            flag3 = true
            console.info(TAG + 'Ext onFailed, number = ' + number);
          }
        })
      } catch (err) {
        console.info(TAG + "catch err = " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
