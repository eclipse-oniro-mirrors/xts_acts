/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'
import osaccount from '@ohos.account.osAccount'

var subscriberInfo_MainAbility = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent","ACTS_TerminateSelf_CommonEvent"]
};
var osAccountManager
const START_ABILITY_TIMEOUT = 6000;
console.debug("====>in Ability.test====>");
export default function abilityTest() {
  console.debug("====>in function abilityTest====>");
  describe('ActsInterfaceMultiUsersThirdTest', function () {

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0100
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, {
            windowMode:0
          }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbility_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0200
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0200', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }, {
            windowMode:0
          }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbility_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0300
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, {
            windowMode:0
          },(err,data) => {
            console.debug("====>startAbility err:====>" + JSON.stringify(err));
            console.debug("====>startAbility end====>" );
        })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbility_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0400
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0400', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })
        console.debug("====>start startAbility====>");
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          }, {
          windowMode:0
        },() => {
          console.debug("====>startAbility end====>" );
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbility_0400 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0500
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0500', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }).then((data)=>{
            console.debug("====>startAbility end====>");
            console.debug("====>data is====>" + JSON.stringify(data));
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbility_0500 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0600
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0600', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbility_0600 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0700
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0700', 0, async function (done) {
      let Subscriber
      var flag = true
      var startresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
          startresult = true
        }
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            },(err,data) => {
              console.debug("====>startAbility err:====>" + JSON.stringify(err));
              console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbility_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0800
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0800', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
        })
        console.debug("====>start startAbility====>");
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          },() => {
          console.debug("====>startAbility end====>" );
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbility_0800 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0100
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0100', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbilityForResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }, {
        windowMode:0
      }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0200
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0200', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbilityForResult_0200 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }, {
        windowMode:0
      }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0300
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0300', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbilityForResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        },{
        windowMode : 0
      },(err,data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0400
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0400', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbilityForResult_0400 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }, {
        windowMode:0
      },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0500
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0500', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbilityForResult_0500 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0600
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0600', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbilityForResult_0600 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0700
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0700', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_ThirdPartyStartAbilityForResult_0700 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        },(err,data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0800
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0800', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_ThirdPartyStartAbilityForResult_0800 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0100
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(promise)
     */
    it('ACTS_TerminateSelf_0100', 0, async function (done) {
      let Subscriber
      var flag = true
      var terminateresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          terminateresult = true
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        flag = false
        expect(terminateresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelf_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0200
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(promise)
     */
    it('ACTS_TerminateSelf_0200', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            }).then(()=>{
            console.debug("====>startAbility end====>");
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_TerminateSelf_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0300
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(callback)
     */
    it('ACTS_TerminateSelf_0300', 0, async function (done) {
      let Subscriber
      var flag = true
      var terminateresult = false
      function SubscribeCallBack (err, data) {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
        console.debug("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        if(data.event == "ACTS_TerminateSelf_CommonEvent"){
          terminateresult = true
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }

      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        flag = false
        console.debug("====>UnSubscribeCallback====>");
        expect(terminateresult).assertEqual(true);
        done();
      }

      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelf_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0400
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability failed.(callback)
     */
    it('ACTS_TerminateSelf_0400', 0, async function (done) {
      let Subscriber
      function SubscribeCallBack (err, data) {
        expect().assertFail();
        console.debug("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.debug("====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.error',
              abilityName: 'com.acts.error.MainAbility2'
            },() => {
            console.debug("====>startAbility end====>" );
          })
        })
      })

      function UnSubscribeCallback() {
        console.debug("====>UnSubscribeCallback====>");
        done();
      }

      function timeout() {
        console.debug('ACTS_TerminateSelf_0400 - timeout');
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0100', 0, async function (done) {
      var flag = true
      function timeout() {
        if(flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelfWithResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        flag = false
        console.debug("====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0200
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0200', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_TerminateSelfWithResult_0200 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }).then((data)=>{
        console.debug("====>startAbilityForResult end====>");
        expect().assertFail();
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0300
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0300', 0, async function (done) {
      var flag = true
      function timeout() {
        if (flag == true) {
          expect().assertFail();
          console.debug('ACTS_TerminateSelfWithResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        },(err,data)=>{
        flag = false
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0400
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0400', 0, async function (done) {
      function timeout() {
        console.debug('ACTS_TerminateSelfWithResult_0400 - timeout');
        done();
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        },(err,data)=>{
        expect().assertFail();
        console.debug("====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want.action).assertEqual('ACTION')
        done();
      })
    })
  })
}