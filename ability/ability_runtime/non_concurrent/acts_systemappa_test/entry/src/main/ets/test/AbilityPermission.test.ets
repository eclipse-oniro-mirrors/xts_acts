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
// @ts-nocheck
import osaccount from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'
var AbilityPermission1 = {
  events: ["ACTS_AbilityPermission_0100_Start_CommonEvent"]
}
var AbilityPermission3 = {
  events: ["ACTS_AbilityPermission_0300_Start_CommonEvent"]
}
var AbilityPermission6 = {
  events: ["ACTS_AbilityPermission_0600_Start_CommonEvent"]
}
const START_ABILITY_TIMEOUT = 3000;
export default function abilityPermissionTest() {
  describe('ActsAbilityPermissionTest', function () {
    var osAccountManager = osaccount.getAccountManager();
    var userA;
    var userB; 
    beforeAll(async function(done){
      osAccountManager.getOsAccountLocalIdFromProcess().then((data)=>{
       userA = data
       userB=userA+1
       console.log("userA=====>"+userA)
       done()
      });
     
    })
    afterAll(async function(done){
      await osAccountManager.removeOsAccount(userB, (err)=>{
        console.debug("====>remove localId: " + userB + " err:" + JSON.stringify(err));
        expect(err.code).assertEqual(0);
        done();
      })
    })

    /*
     * @tc.number: ACTS_AbilityPermission_0100
     * @tc.name: In non-concurrent mode, if the target application is not the current user, it is forbidden to start
     * @tc.desc: Start an ability that belongs to the current user with the current user
     */
    it('ACTS_AbilityPermission_0100', 0, async function (done) {
      console.log("ACTS_AbilityPermission_0100====>callback start====>")
      var Subscriber;
      var flag = true;

      function SubscribeCallBack(err, data) {
        console.debug("ACTS_AbilityPermission_0100====>Subscribe CallBack data:====>" + JSON.stringify(data));
        expect(data.event == 'ACTS_AbilityPermission_0100_Start_CommonEvent').assertTrue()
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(AbilityPermission1).then(async (data) => {
        console.debug("ACTS_AbilityPermission_0100====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
        console.debug("====>start startAbility_100====>");
        await globalThis.abilityContext.startAbilityWithAccount(
          {
            bundleName: 'com.example.actsabilitypermissiontest',
            abilityName: 'com.example.actsabilitypermissiontest.MainAbility2'
          }, userA, () => {
          console.debug("====>startAbility end_100====>");
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("ACTS_AbilityPermission_0100====>UnSubscribe CallBack====>"+flag);
        done();
      }
      setTimeout(()=>{
        if (flag == true) {
          expect().assertFail();
          console.debug('in ACTS_AbilityPermission_0100====>timeout====>'+flag);
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
        console.debug('ACTS_AbilityPermission_0100====>timeout====>');
        }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number: ACTS_AbilityPermission_0300
     * @tc.name: In non-concurrent mode, if the target application is not the current user, it is forbidden to start
     * @tc.desc: Start an ability under user U101 with the current user
     */
    it('ACTS_AbilityPermission_0300', 0, async function (done) {
      console.log("ACTS_AbilityPermission_0300====>callback start====>")
      var Subscriber
      var flag = 0;
      console.debug("====>get AccountManager finish====");

      function SubscribeCallBack(err, data) {
        console.debug("ACTS_AbilityPermission_0300====>Subscribe CallBack data:====>" + JSON.stringify(data));
        expect(data.event == 'ACTS_AbilityPermission_0300_Start_CommonEvent').assertTrue()
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      commonEvent.createSubscriber(AbilityPermission3).then(async (data) => {
        console.debug("ACTS_AbilityPermission_0300====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBack);
        console.debug("====>start startAbility_0300====>");
        await globalThis.abilityContext.startAbilityWithAccount(
          {
            bundleName: 'com.example.actssystemappuonehundredonerelytest',
            abilityName: 'com.example.actssystemappuonehundredonerelytest.MainAbility'
          }, userA ).then().catch((err) => {
          console.debug("ACTS_AbilityPermission_0300====>" + err)

          console.debug("====>startAbility end_0300====>");
        })
      })
      function UnSubscribeCallback() {
        if(flag == 0) {
          expect().assertFail();
        }
        console.debug("ACTS_AbilityPermission_0300====>UnSubscribe CallBack====>");
        done();
      }
      function timeout() {
        console.debug('ACTS_AbilityPermission_0300====>timeout====>');
        if(flag == 0){
          flag = 1;
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number: ACTS_AbilityPermission_0600
     * @tc.name: In non-concurrent mode, if the target application is not the current user, it is forbidden to start
     * @tc.desc: Bind a U101 Ability with the current user
     */
    it('ACTS_AbilityPermission_0600', 0, async function (done) {
      console.log("ACTS_AbilityPermission_0600====>callback start====>")
      let Subscriber
      let connId
      function onConnectCallbackC(element, remote) {
        console.log('ACTS_AbilityPermission_0600_Start_CommonEvent onConnectCallback====> element=' + JSON.stringify(element));
        console.log('ACTS_AbilityPermission_0600_Start_CommonEvent onConnectCallback====> remote=' + JSON.stringify(remote));
        expect().assertFail();
      }
      function onDisconnectCallbackC(element) {
        console.log('onDisconnectCallback====> element=' + JSON.stringify(element));
      }
      function onFailedCallbackC(code) {
        console.log('onFailedCallback====> code=' + JSON.stringify(code))
      }
      function SubscribeCallBackF(err, data) {
        console.debug("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
      }
      function UnSubscribeCallbackF() {
        console.debug("====>UnSubscribeCallback====>");
      }
      commonEvent.createSubscriber(AbilityPermission6).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        Subscriber = data;
        commonEvent.subscribe(Subscriber, SubscribeCallBackF);
      })
      console.debug("====>0600start connectAbility====>");
      connId = await globalThis.abilityContext.connectAbilityWithAccount(
        {
          bundleName: 'com.example.actssystemappuonehundredonerelytest',
          abilityName: 'com.example.actssystemappuonehundredonerelytest.ServiceAbility',
          action: "StartAbilityPromise"
        }, userA, {
        onConnect: onConnectCallbackC,
        onDisconnect: onDisconnectCallbackC,
        onFailed: onFailedCallbackC
      })
      console.debug("====>number is====>" + JSON.stringify(connId));
      setTimeout(() =>{
        console.debug('in ACTS_AbilityPermission_0600_Start_CommonEvent timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallbackF)
        done()
      }, START_ABILITY_TIMEOUT);
    })
  })
}