/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

export default function lastExitReasonTest() {
  let jsCrashText = 'Js Crash';

  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let driver = Driver.create();

  let event1 = "Acts_OnCreate_LaunchParam_1_Event";
  let event2 = "Acts_OnCreate_LaunchParam_2_Event";
  let event3 = "Acts_OnCreate_LaunchParam_3_Event";

  describe('ActsLastExitReasonTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await abilityDelegator.executeShellCommand("aa force-stop com.acts.lastexitreasonrely1");
      await sleep(1500);
    });
    afterEach(() => {
    });
    afterAll(async () => {
      await abilityDelegator.executeShellCommand("aa force-stop com.acts.lastexitreasonrely1");
      await sleep(500);
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_FaultManagement_7700
     * @tc.name   : Make js crash and restart app, check ability LaunchParam last exit reason and message
     * @tc.desc   : Expect: lastExitReason=JS_ERROR, lastExitMessage not empty
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_7700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_FaultManagement_7700`;
      console.log(`${tag}, it begin`);

      try {
        await startRely1();
        await sleep(1000);
        let button = await driver.waitForComponent(ON.text(jsCrashText), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        await button.click();
        await sleep(1000);

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [event1]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${data.event}`);
            if (data.event == event1) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.JS_ERROR);
              expect(lastExitMessage.length > 0).assertTrue();
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);
        await sleep(500);
        await startRely1();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number : SUB_Ability_AbilityRuntime_FaultManagement_7800
     * @tc.name   : App call terminateSelf and restart app, check ability LaunchParam last exit reason and message
     * @tc.desc   : Expect: lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_7800', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_FaultManagement_7800`;
      console.log(`${tag}, it begin`);

      try {
        await startRely1();
        await sleep(1000);
        let button = await driver.waitForComponent(ON.text('TerminateSelf'), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        await button.click();
        await sleep(1000);

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [event1]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${data.event}`);
            if (data.event == event1) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
              expect(lastExitMessage.length == 0).assertTrue();
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);
        await sleep(500);
        await startRely1();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_FaultManagement_7900
     * @tc.name   : Kill process by shell and restart app, check ability LaunchParam last exit reason and message
     * @tc.desc   : Expect: lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_7900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_FaultManagement_7900`;
      console.log(`${tag}, it begin`);

      try {
        await startRely1();
        await sleep(1000);
        await abilityDelegator.executeShellCommand("aa force-stop com.acts.lastexitreasonrely1");
        await sleep(1000);

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [event1]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${data.event}`);
            if (data.event == event1) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
              expect(lastExitMessage.length == 0).assertTrue();
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);
        await sleep(500);
        await startRely1();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_FaultManagement_8000
     * @tc.name   : Start two ability, make js crash and restart app, check ability LaunchParam last exit reason
     *              and message
     * @tc.desc   : Expect: ability which started lastExitReason=JS_ERROR, lastExitMessage not empty, others
     *              lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_8000', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_FaultManagement_8000`;
      console.log(`${tag}, it begin`);

      try {
        await startRely1();
        await sleep(1000);
        let button = await driver.waitForComponent(ON.text('Start Second'), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        await button.click();
        await sleep(1000);

        button = await driver.waitForComponent(ON.text('Second Js Crash'), 3000);
        expect(button != null).assertTrue();
        await button.click();
        await sleep(1000);

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [event1, event2, event3]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${data.event}`);
            if (data.event == event1) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.JS_ERROR);
              expect(lastExitMessage.length > 0).assertTrue();
            } else if (data.event == event2) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.JS_ERROR);
              expect(lastExitMessage.length > 0).assertTrue();
            } else if (data.event == event3) {
              let lastExitReason: AbilityConstant.LastExitReason = data.parameters?.lastExitReason;
              let lastExitMessage: string = data.parameters?.lastExitMessage;
              expect(lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
              expect(lastExitMessage.length == 0).assertTrue();
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);
        await sleep(500);

        await startRely1();
        await sleep(1000);
        button = await driver.waitForComponent(ON.text('Start Second'), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        await button.click();
        await sleep(1000);

        button = await driver.waitForComponent(ON.text('Start Third'), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        await button.click();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });


    /*
     * @tc.number : SUB_Ability_AbilityRuntime_FaultManagement_7901
     * @tc.name   : Kill process by shell and restart app, check ability LaunchParam last exit reason and message
     * @tc.desc   : Expect: lastExitReason=NORMAL, lastExitMessage empty
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_FaultManagement_7901', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_FaultManagement_7901`;
      console.log(`${tag}, it begin`);

      try {
        await startRely1();
        await sleep(1000);
        await abilityDelegator.executeShellCommand("aa force-stop com.acts.lastexitreasonrely1");
        await sleep(1000);

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: [event1]
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${JSON.stringify(data)}`);
            if (data.event == event1) {
              let lastExitDetailInfo: AbilityConstant.LastExitDetailInfo = data.parameters?.lastExitDetailInfo;
              let launchReasonMessage: string = data.parameters?.launchReasonMessage;
              try{
                expect(lastExitDetailInfo?.exitMsg).assertEqual("");
                expect(lastExitDetailInfo?.exitSubReason).assertEqual(-1);
                expect(lastExitDetailInfo?.pid).assertEqual(-1);
                expect(lastExitDetailInfo?.processName).assertEqual("");
                expect(lastExitDetailInfo?.pss).assertEqual(0);
                expect(lastExitDetailInfo?.rss).assertEqual(0);
                expect(lastExitDetailInfo?.timestamp).assertEqual(0);
                expect(lastExitDetailInfo?.uid).assertEqual(-1);
                expect(launchReasonMessage).assertEqual("");
              }catch{}
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);
        await sleep(500);
        await startRely1();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });

  })
}

async function startRely1() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  await abilityDelegator.executeShellCommand("aa start -b com.acts.lastexitreasonrely1 -a EntryAbility");
}

function unSubscribe(subscriber: CommonEventManager.CommonEventSubscriber, callback: Function) {
  let unSubscribeCB = (err: BusinessError) => {
    if (err) {
      console.error(`unsubscribe failed, code is ${err.code}, message is ${err.message}`);
    } else {
      console.info("unsubscribe success");
    }
    callback();
  };
  CommonEventManager.unsubscribe(subscriber, unSubscribeCB);
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}