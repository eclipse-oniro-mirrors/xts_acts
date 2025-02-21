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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

export default function moveAbilityToBackgroundTest() {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
  let driver = Driver.create();

  describe('ActsMoveAbilityToBackgroundTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      await globalThis.entryAbilityContext.terminateSelf();
    });
    afterAll(() => {
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100
     * @tc.name   : Call UIAbilityContext moveAbilityToBackground
     * @tc.desc   : expect current ability moved to background and onBackground() called.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100', 0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100`;
      console.log(`${tag}, it begin`);

      try {
        await abilityDelegator.executeShellCommand("aa start -b com.acts.moveabilitytobgtest -a EntryAbility");
        await sleep(1000);
        let button = await driver.waitForComponent(ON.text("Move To background"), 3000);
        await sleep(100);
        expect(button != null).assertTrue();
        let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
        console.log(`====>SUB_Ability_AbilityRuntime_MoveAbilityToBackground_0100 deviceType: ${deviceType}`);
        if (deviceType === '2in1') {
          done();
          return;
        }

        let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
          events: ['Acts_onBackground_MoveAbilityToBackground_Event_1']
        };
        let subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
        let subscribeCB = (err: BusinessError, data: CommonEventManager.CommonEventData) => {
          if (err) {
            console.error(`receive event failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`receive event success, event:${data.event}`);
            if (data.event == 'Acts_onBackground_MoveAbilityToBackground_Event_1') {
              unSubscribe(subscriber, done);
            }
          }
        }
        CommonEventManager.subscribe(subscriber, subscribeCB);

        await button.click();
        await sleep(5000);
        console.error(`${tag}, timeout`);
        expect().assertFail();
      } catch (err) {
        console.error(`${tag} error, errorCode: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    });
  })
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