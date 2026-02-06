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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import osaccount from '@ohos.account.osAccount'
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let subscriberInfo_MainAbility: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent",
    "ACTS_TerminateSelf_CommonEvent"
  ]
};
let TAG = ""
let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;

export default function abilityTest() {
  console.info("====>in function abilityTest====>");

  let sleep = (ms: number): Promise<void> => {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  describe('ActsInterfaceMultiUsersThirdTest', () => {

    afterEach((done: Function) => {
      if (Subscriber) {
        commonEvent.unsubscribe(Subscriber, () => {
          done()
        });
      } else {
        done()
      }
    })
    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0100
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0100', Level.LEVEL0, async (done: Function) => {
      let startresult = false
      TAG = "ACTS_ThirdPartyStartAbility_0100";
      console.info(TAG + " start");
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        console.info(TAG + " data is " + JSON.stringify(data));
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          startresult = true
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(startresult).assertEqual(true);
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, {
            windowMode: 0
          }).then((data: common.AbilityResult) => {
            console.info(TAG + "====>startAbility end====>");
            console.info(TAG + "====>data is====>" + JSON.stringify(data));
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0200
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0200";
      console.info(TAG + " start");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility2'
        }, {
        windowMode: 0
      }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbility end====>");
      }).catch((err: BusinessError) => {
        console.info(TAG + 'ACTS_ThirdPartyStartAbility_0200 - error ' + JSON.stringify(err));
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0300
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0300";
      console.info(TAG + " start");
      let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
      let startresult = false;
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        console.info(TAG + "====> Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          startresult = true
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(startresult).assertEqual(true);
          done();
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, {
            windowMode: 0
          }, (err: BusinessError, data: common.AbilityResult) => {
            console.info(TAG + "====>startAbility err:====>" + JSON.stringify(err));
            console.info(TAG + "====>startAbility end====>");
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0400
     * @tc.name    : start new ability
     * @tc.desc    : Start an ability with the parameter startability with options failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0400";
      console.info(TAG + " start");
      try {
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          }, {
          windowMode: 0
        }, (err: BusinessError) => {
          console.info(TAG + "====>startAbility end====>");
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_ThirdPartyStartAbility_0400 - error');
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0500
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0500";
      console.info(TAG + " start");
      let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
      let startresult = false;
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        console.info(TAG + "====> Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          startresult = true
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(startresult).assertEqual(true);
          done();
        }
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }).then((data: common.AbilityResult) => {
            console.info(TAG + "====>startAbility end====>");
            console.info(TAG + "====>data is====>" + JSON.stringify(data));
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0600
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbility_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0600";
      console.info(TAG + " start");
      await globalThis.abilityContext.startAbility(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility2'
        }).then(() => {
        console.info(TAG + "====>startAbility end====>");
      }).catch((err: BusinessError) => {
        console.info(TAG + 'ACTS_ThirdPartyStartAbility_0600 - error');
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0700
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0700";
      console.info(TAG + " start");
      let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
      let startresult = false;
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        console.info(TAG + "====> Subscribe CallBack data:====>" + JSON.stringify(data));
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          startresult = true
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(startresult).assertEqual(true);
          done();
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, (err: BusinessError, data: common.AbilityResult) => {
            console.info(TAG + "====>startAbility err:====>" + JSON.stringify(err));
            console.info(TAG + "====>startAbility end====>");
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbility_0800
     * @tc.name    : start new ability
     * @tc.desc    : Starting mainability2 with startability failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbility_0800', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbility_0800";
      console.info(TAG + " start");
      try {
        await globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility2'
          }, (err: BusinessError) => {
          console.info(TAG + "====>startAbility end====>" + JSON.stringify(err));
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_ThirdPartyStartAbility_0800 - timeout' + JSON.stringify(err));
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0100
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0100";
      console.info(TAG + " start");
      console.info(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }, {
        windowMode: 0
      }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0200
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0200";
      console.info(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }, {
        windowMode: 0
      }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>" + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.info(TAG + 'ACTS_ThirdPartyStartAbilityForResult_0200 - error' + JSON.stringify(err));
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0300
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0300";
      console.info(TAG + "====>start startAbilityForResult====>");
      await sleep(2000);
      console.info("====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }, {
        windowMode: 0
      }, (err: BusinessError, data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>" + JSON.stringify(err));
        console.info(TAG + "====>startAbilityForResult end====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0400
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0400";
      console.info(TAG + "====>start startAbilityForResult====>");
      try {
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility3',
          }, {
          windowMode: 0
        }, (err: BusinessError, data: common.AbilityResult) => {
          console.info(TAG + "====>startAbilityForResult end data====>" + JSON.stringify(data));
          console.info(TAG + "====>startAbilityForResult end err====>" + JSON.stringify(err));
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_ThirdPartyStartAbilityForResult_0400 - error' + JSON.stringify(err));
      }
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0500
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0500";
      console.info(TAG + "====>start startAbilityForResult====>");
      await sleep(2000);
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>");
        console.info(TAG + "====>data.result is====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0600
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(promise)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0600";
      console.info(TAG + "====>start startAbilityForResult====>");
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.error',
          abilityName: 'com.acts.error.MainAbility3',
        }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>");
      }).catch((err: BusinessError) => {
        console.info(TAG + 'ACTS_ThirdPartyStartAbilityForResult_0600 - error' + JSON.stringify(err));
        expect(err.code == 16000001).assertTrue();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0700
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult succeeded.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0700";
      console.info(TAG + "====>start startAbilityForResult====>");
      await sleep(2000);
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }, (err: BusinessError, data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end err====>" + JSON.stringify(err));
        console.info(TAG + "====>startAbilityForResult end data====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })

    /*
     * @tc.number  : ACTS_ThirdPartyStartAbilityForResult_0800
     * @tc.name    : start new ability for result
     * @tc.desc    : Starting mainability3 with startAbilityForResult failed.(callback)
     */
    it('ACTS_ThirdPartyStartAbilityForResult_0800', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_ThirdPartyStartAbilityForResult_0800";
      console.info(TAG + "====>start startAbilityForResult====>");
      try {
        await globalThis.abilityContext.startAbilityForResult(
          {
            bundleName: 'com.acts.error',
            abilityName: 'com.acts.error.MainAbility3',
          }, (err: BusinessError, data: common.AbilityResult) => {
          console.info(TAG + "====>startAbilityForResult end err====>" + JSON.stringify(err));
          console.info(TAG + "====>startAbilityForResult end data====>" + JSON.stringify(data));
          expect(err.code == 16000001).assertTrue();
          done();
        })
      } catch (err) {
        console.info(TAG + 'ACTS_ThirdPartyStartAbilityForResult_0800 - error' + JSON.stringify(err));
      }
    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0100
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(promise)
     */
    it('ACTS_TerminateSelf_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_TerminateSelf_0100";
      console.info(TAG + "====>start startAbilityForResult====>");
      let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
      let terminateresult = false;
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        console.info(TAG + "====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          terminateresult = true;
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(terminateresult).assertEqual(true);
          done();
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          await globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }).then(() => {
            console.info(TAG + "====>startAbility end====>");
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_TerminateSelf_0300
     * @tc.name    : Use terminateself to terminate ability
     * @tc.desc    : Starting mainability2 with startAbility then terminateself ability succeeded.(callback)
     */
    it('ACTS_TerminateSelf_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_TerminateSelf_0300";
      console.info(TAG + "====>start startAbilityForResult====>");
      let Subscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
      let terminateresult = false;
      let SubscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData): void => {
        console.info("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        expect(data.event == "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent" || data.event == "ACTS_TerminateSelf_CommonEvent")
          .assertTrue();
        if (data.event === "ACTS_InterfaceMultiUsers_0100_Start_CommonEvent") {
          console.info(TAG + " MainAbility2 is onWindowStageCreate");
          terminateresult = true
        } else if (data.event === "ACTS_TerminateSelf_CommonEvent") {
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          Subscriber = undefined;
          console.info(TAG + " MainAbility2 is Destroy");
          expect(terminateresult).assertEqual(true);
          done();
        }
      }

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then(async (data) => {
        console.info(TAG + "====>Create Subscriber====>");
        data.getSubscribeInfo().then(async (SubscribeInfo) => {
          console.info(TAG + "====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.info(TAG + "====>start startAbility====>");
          globalThis.abilityContext.startAbility(
            {
              bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
              abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility2'
            }, () => {
            console.info(TAG + "====>startAbility end====>");
          })
        })
      })

      let UnSubscribeCallback = (): void => {
        console.info(TAG + "====>UnSubscribeCallback====>");
      }
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0100
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(promise)
     */
    it('ACTS_TerminateSelfWithResult_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_TerminateSelfWithResult_0100";
      console.info(TAG + "====>start startAbilityForResult====>");
      await sleep(2000);
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }).then((data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end====>");
        console.info(TAG + "====>data.resultCode is====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })

    /*
     * @tc.number  : ACTS_TerminateSelfWithResult_0300
     * @tc.name    : Use terminateselfwithresult to terminate ability and return result
     * @tc.desc    : Starting mainability3 with startAbilityforresult
     *               then terminateself ability and return result succeeded.(callback)
     */
    it('ACTS_TerminateSelfWithResult_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_TerminateSelfWithResult_0300";
      console.info(TAG + "====>start startAbilityForResult====>");
      await sleep(2000)
      await globalThis.abilityContext.startAbilityForResult(
        {
          bundleName: 'com.acts.actsinterfacemultiusersthirdtest',
          abilityName: 'com.acts.actsinterfacemultiusersthirdtest.MainAbility3',
        }, (err: BusinessError, data: common.AbilityResult) => {
        console.info(TAG + "====>startAbilityForResult end err====>" + JSON.stringify(err));
        console.info(TAG + "====>startAbilityForResult end err====>" + JSON.stringify(data));
        expect(data.resultCode).assertEqual(1);
        expect(data.want!.action).assertEqual('ACTION');
        done();
      })
    })
  })
}