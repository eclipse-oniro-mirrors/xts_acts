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
import appManager from '@ohos.application.appManager'
import osaccount from '@ohos.account.osAccount'
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let subscriberInfo_MainAbility:commonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_InterfaceMultiUsers_0100_Start_CommonEvent","ACTS_TerminateSelf_CommonEvent"]
};
let subscriberInfo_killprocess:commonEventManager.CommonEventSubscribeInfo = {
  events:["ACTS_KillProcess"]
}
//let osAccountManager
const START_ABILITY_TIMEOUT = 10000;
console.debug("====>in Ability.test====>");
export default function abilityTest() {

  let sleep = (ms:number): Promise<void> => {
    return new Promise((resolve) => setTimeout(resolve, ms));
  }

  console.debug("====>in function abilityTest====>");
  describe('ActsInterfaceMultiUsersTest', () => {
    // afterAll(function() {
    //   osAccountManager = osaccount.getAccountManager();
    //   console.debug("====>get AccountManager finish====");
    //   osAccountManager.activateOsAccount(100, (err)=>{
    //     console.debug("====>activateOsAccount localId: 100 err:" + JSON.stringify(err));
        // osAccountManager.removeOsAccount(101, (err)=>{
        //   console.debug("====>remove localId: 101" + " err:" + JSON.stringify(err));
        // })
    //   })
    // })

    let id:number = 0;
    beforeAll(async (done:Function) => {
        console.log("ACTS_InterfaceMultiUsers beforeAll called");
        let myReason = 'test FaShowOnLockTest';
        let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.log("ACTS_InterfaceMultiUsers Request suspension delay will time out.");
        })
        id = delayInfo.requestId;
        console.log("ACTS_InterfaceMultiUsers requestId is : " + id);
        setTimeout(() => {
            console.log("ACTS_InterfaceMultiUsers beforeAll end");
            done();
        }, 1000);
    })
        
    afterAll(async (done:Function) => {
        console.log("ACTS_InterfaceMultiUsers afterAll called");
        backgroundTaskManager.cancelSuspendDelay(id);
        setTimeout(() => {
            console.log("ACTS_InterfaceMultiUsers afterAll end");
            done();
        }, 1000);
    })

    afterEach(async (done:Function) => {
        console.error("ACTS_InterfaceMultiUsers afterEach called");
        setTimeout(() => {
            done();
        }, 500);
    })

    console.debug("====>in ACTS_InterfaceMultiUsers====>");
    /*
     * @tc.number  : ACTS_startAbility_2000
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_startAbility_2000', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2000'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let startresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
              startresult = true
            }
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          });
          console.debug(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }, {
            windowMode:0
          }).then((data:common.AbilityResult)=>{
            console.debug(TAG + "====>startAbility end====>");
            console.debug(TAG + "====>data is====>" + JSON.stringify(data));
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        console.debug(TAG + "====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbility_2000 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_2200
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(promise)
     */
    it('ACTS_startAbility_2200', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2200';
      await globalThis.abilityContext.startAbility(
      {
        bundleName: 'com.acts.error',
        abilityName: 'com.acts.error.MainAbility2'
      }, {
        windowMode:0
      }).then(()=>{
        console.debug(TAG + "====>startAbility end====>");
      }).catch((err:BusinessError) => {
        console.info(TAG + 'ACTS_startAbility_2200 - error');
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_startAbility_2400
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(callback)
     */
    it('ACTS_startAbility_2400', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2400'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let startresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
              startresult = true
            }
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          });
          console.debug(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }, {
            windowMode:0
          },() => {
            console.debug(TAG + "====>startAbility end====>" );
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        flag = false
        console.debug(TAG + "====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbility_2400 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_startAbility_2600
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(callback)
     */
    it('ACTS_startAbility_2600', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2600';
      console.debug(TAG + "====>start startAbility====>");
      try {
        await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility2'
        }, {
          windowMode:0
        },(err:BusinessError) => {
          console.info(TAG + "====>startAbility end====>" );
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_startAbility_2600 - error');
      }
    })

    /*
     * @tc.number  : ACTS_startAbility_2800
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(promise)
     */
    it('ACTS_startAbility_2800', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2800'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let startresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
              startresult = true
            }
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          });
          console.debug(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }).then((data:common.AbilityResult)=>{
            console.debug(TAG + "====>startAbility end====>");
            console.debug(TAG + "====>data is====>" + JSON.stringify(data));
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        console.debug(TAG + "====>UnSubscribeCallback====>");
        flag = false
        expect(startresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbility_2800 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_startAbility_2900
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(callback)
     */
    it('ACTS_startAbility_2900', 0, async (done:Function) => {
      let TAG = 'ACTS_startAbility_2900'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let startresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent"){
              startresult = true
            }
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          });
          console.debug(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            },() => {
            console.debug(TAG + "====>startAbility end====>" );
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        flag = false
        console.debug(TAG + "====>UnSubscribeCallback====>");
        expect(startresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbility_2900 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0100
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_StartAbilityForResult_0100', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0100'
      let flag = true
      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'AMS_startAbilityForResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }, {
        windowMode:0
      }).then((data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
        flag = false
        console.debug(TAG + "====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0200
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_StartAbilityForResult_0200', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0200';
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
      {
        bundleName: 'com.acts.error',
        abilityName: 'com.acts.error.MainAbility3',
      }, {
        windowMode:0,
      }).then((err:BusinessError, data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
      }).catch((err:BusinessError) => {
        console.info(TAG + 'ACTS_startAbilityForResult_0200 - error');
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0300
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_StartAbilityForResult_0300', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0300'
      let flag = true
      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbilityForResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },{
          windowMode : 0,
        },(err:BusinessError, data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0400
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_StartAbilityForResult_0400', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0400';
      console.debug(TAG + "====>start startAbilityForResult====>");
      try {
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility3',
          }, {
          windowMode:0
        },(err:BusinessError, data:common.AbilityResult)=>{
          console.debug(TAG + "====>startAbilityForResult end====>");
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_startAbilityForResult_0400 - error');
      }
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0500
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_StartAbilityForResult_0500', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0500'
      let flag = true
      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'AMS_startAbilityForResult_0500 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }).then((data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
        flag = false
        console.debug(TAG + "====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_StartAbilityForResult_0700
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_StartAbilityForResult_0700', 0, async (done:Function) => {
      let TAG = 'ACTS_StartAbilityForResult_0700'
      let flag = true
      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_startAbilityForResult_0700 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },(err:BusinessError, data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
        flag = false
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0100
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(promise)
     */
    it('ACTS_TerminateSelf_0100', 0, async (done:Function) => {
      let TAG = 'ACTS_TerminateSelf_0100'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let terminateresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_TerminateSelf_CommonEvent"){
              terminateresult = true
              console.debug(TAG + "====>terminateresult is:====>" + JSON.stringify(terminateresult));
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          });
          console.debug(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            }).then(()=>{
            console.debug(TAG + "====>startAbility end====>");
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        console.debug(TAG + "====>UnSubscribeCallback====>");
        flag = false
        expect(terminateresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_TerminateSelf_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0300
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(callback)
     */
    it('ACTS_TerminateSelf_0300', 0, async (done:Function) => {
      let TAG = 'ACTS_TerminateSelf_0300'
      let Subscriber:commonEventManager.CommonEventSubscriber
      let flag = true
      let terminateresult = false

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.debug(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async(SubscribeInfo)=>{
          console.debug(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent").assertTrue();
            console.debug(TAG + "====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
            if(data.event == "ACTS_TerminateSelf_CommonEvent"){
              terminateresult = true
              commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            }
          });
          console.debug(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiuserstest',
              abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility2'
            },() => {
            console.debug(TAG + "====>startAbility end====>" );
          })
        })
      })

      let UnSubscribeCallback = ():void => {
        flag = false
        console.debug(TAG + "====>UnSubscribeCallback====>");
        expect(terminateresult).assertEqual(true);
        done();
      }

      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_TerminateSelf_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback)
        }
      }

      setTimeout(timeout, START_ABILITY_TIMEOUT);

    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0100', 0, async (done:Function) => {
      let TAG = 'ACTS_TerminateSelfWithResult_0100'
      let flag = true
      let timeout = ():void => {
        if(flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_TerminateSelfWithResult_0100 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        }).then((data:common.AbilityResult)=>{
        console.debug(TAG + "====>startAbilityForResult end====>");
        flag = false
        console.debug(TAG + "====>data.resultCode is====>"+JSON);
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0300
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0300', 0, async (done:Function) => {
      await sleep(2000);
      let TAG = 'ACTS_TerminateSelfWithResult_0300'
      let flag = true
      let timeout = ():void => {
        if (flag == true) {
          expect().assertFail();
          console.debug(TAG + 'ACTS_TerminateSelfWithResult_0300 - timeout');
          done();
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.debug(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiuserstest',
          abilityName: 'com.acts.actsinterfacemultiuserstest.MainAbility3',
        },(err:BusinessError, data:common.AbilityResult)=>{
        flag = false
        console.debug(TAG + "====>startAbilityForResult end====>");
        expect(data.resultCode).assertEqual(1)
        expect(data.want!.action).assertEqual('ACTION')
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(promise)
     */
    it('ACTS_ThirdPartyKillProcess_0100', 0, async (done:Function) => {
      let TAG = 'ACTS_ThirdPartyKillProcess_0100'
      console.debug(TAG + "====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap',
          abilityName: 'com.acts.killprocessthirdhap.MainAbility'
        }).then(()=>{
        console.debug(TAG + "====>startAbility end====>");
      })
      setTimeout(()=>{
        appManager.getProcessRunningInfos().then((data)=> {
          console.info(TAG + '====>ACTS_KillProcess_0100 getProcessRunningInfos=====>' + JSON.stringify(data))
          let i:number = 0
          for(i = 0; i<data.length ;i++){
            if (data[i].processName=='com.acts.killprocessthirdhap'){
              console.info(TAG + '====>has com.acts.killprocessthirdhap=====>')
              break
            }
          }
          console.log(TAG + '====>i is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
            expect().assertFail()
          }
         })
      },1000)
        setTimeout(()=> {
          appManager.getProcessRunningInfos().then((data) => {
            console.info(TAG + '====>ACTS_KillProcess_0100 getProcessRunningInfos2=====>' + JSON.stringify(data))
            let i:number = 0
            for (i = 0; i < data.length; i++) {
              if (data[i].processName == 'com.acts.killprocessthirdhap') {
                break
              }
            }
            console.log(TAG + '====>i2 is:====>' + JSON.stringify(i))
            if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
              expect().assertFail()
            }
            done()
          })
        },15000)
    })

    /*
     * @tc.number  : ACTS_ThirdPartyKillProcess_0200
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result failed.(callback)
     */
    it('ACTS_ThirdPartyKillProcess_0200', 0, async (done:Function) => {
      let TAG = 'ACTS_ThirdPartyKillProcess_0200'
      console.debug(TAG + "====>start startAbility====>");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.killprocessthirdhap2',
          abilityName: 'com.acts.killprocessthirdhap2.MainAbility'
        }).then(() => {
        console.debug(TAG + "====>startAbility end====>");
      })
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0200 getProcessRunningInfos=====>' + JSON.stringify(data))
          let i:number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              console.info('====>has com.acts.killprocessthirdhap2=====>')
              break
            }
          }
          console.log(TAG + '====>i is:====>' + JSON.stringify(i))
          if (i == data.length && data[i].processName != 'com.acts.killprocessthirdhap2') {
            expect().assertFail()
          }
        })
      },1000)
      setTimeout(() => {
        appManager.getProcessRunningInfos().then((data) => {
          console.info(TAG + '====>ACTS_KillProcess_0200 getProcessRunningInfos2=====>' + JSON.stringify(data))
          let i:number = 0
          for (i = 0; i < data.length; i++) {
            if (data[i].processName == 'com.acts.killprocessthirdhap2') {
              break
            }
          }
          console.log(TAG + '====>i2 is:====>' + JSON.stringify(i))
          if(i==data.length && data[i].processName!='com.acts.killprocessthirdhap'){
            expect().assertFail()
          }
          done()
        })
      },15000)
    })
  })
}