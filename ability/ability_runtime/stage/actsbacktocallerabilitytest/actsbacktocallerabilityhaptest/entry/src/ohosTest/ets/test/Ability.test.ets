/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { contextConstant, Want } from '@kit.AbilityKit';
import commonEventManager from '@ohos.commonEventManager';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from '@kit.TestKit';

let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let textsToMatch: Array<string> = ['打开', '允许', '本次允许', "始终允许打开"];

function log(TAG: string, info: string) {
  console.info(`${TAG}::` + info);
}

function log_error(TAG: string, info: string) {
  console.error(`${TAG}::` + info);
}

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

async function clickDialog(TAG: string) {
  await sleep(2000);
  let driver = Driver.create();
  let allowed = await driver.findComponent(ON.text('想要打开', MatchPattern.CONTAINS));
  log(TAG, `no need to click button=allowed== ${allowed}`);
  if (allowed) {
    for (const text of textsToMatch) {
      let buttons = await driver.findComponents(ON.text(text));
      if (buttons && buttons.length > 0) {
        buttons[buttons.length - 1].click();
        log(TAG, `click last button success`);
        return
      }
    }
  }
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    beforeAll(() => {
    })
    beforeEach(async () => {
      log('beforeEach::', 'execute force-stop backdemo')
      await delegator.executeShellCommand('aa start -b com.example.startdemo -a TestAbility');
      await delegator.executeShellCommand('aa force-stop com.example.backdemo');
      await delegator.executeShellCommand('aa force-stop com.example.backdemo1');
      await sleep(1000)
      log('beforeEach::', '---------------testcase start---------------')
    })
    afterEach(async () => {
      log('afterEach::', 'execute force-stop backdemo')
      await delegator.executeShellCommand('aa force-stop com.example.backdemo');
      await delegator.executeShellCommand('aa force-stop com.example.backdemo1');
      await sleep(1000)
      log('afterEach::', '---------------testcase end---------------')
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BackToCallerAbilityWithResultTest_0100
     * @tc.number BackToCallerAbilityWithResultTest_0100
     * @tc.desc   A start B, B back to A with invalid request code.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackToCallerAbilityWithResultTest_0100', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'BackToCallerAbilityWithResultTest_0100';
      log(TAG, '---------------testcase start---------------')
      let abilityContext: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      if (!abilityContext) {
        log(TAG, 'abilityContext is undefined');
        expect().assertFail();
        done();
      }

      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['BackToCallerAbilityWithResultTest_0100_Success',
          'BackToCallerAbilityWithResultTest_0100_Failed']
      }
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        log(TAG, 'subscribeCallBack, data: ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'BackToCallerAbilityWithResultTest_0100_Success') {
          commonEventManager.unsubscribe(subscriber, UnSubscribeInfoCallBack)
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      let UnSubscribeInfoCallBack = () => {
        log(TAG, 'UnSubscribeInfoCallBack')
      }
      await commonEventManager.createSubscriber(subscribeInfo)
        .then((data) => {
          log(TAG, 'createSubscriber success');
          subscriber = data;
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          log(TAG, 'subscribe success');
        })

      let want: Want = {
        bundleName: 'com.example.backdemo',
        abilityName: 'EntryAbility',
        parameters: {
          'testcase': 'BackToCallerAbilityWithResultTest_0100'
        }
      }

      await abilityContext?.startAbility(want)
        .then(() => {
          log(TAG, 'Succeeded in starting EntryAbility.');
        })
        .catch((err: BusinessError) => {
          log_error(TAG, `Failed to start EntryAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      await clickDialog(TAG);
    });

    /**
     * @tc.name   BackToCallerAbilityWithResultTest_0200
     * @tc.number BackToCallerAbilityWithResultTest_0200
     * @tc.desc   A start B, B back to A.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackToCallerAbilityWithResultTest_0200', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'BackToCallerAbilityWithResultTest_0200';
      log(TAG, '---------------testcase is start---------------')
      let abilityContext: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      if (!abilityContext) {
        log(TAG, 'abilityContext is undefined');
        expect().assertFail();
        done();
      }

      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['BackToCallerAbilityWithResultTest_0200_Success',
          'BackToCallerAbilityWithResultTest_0200_Failed']
      }
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        log(TAG, 'subscribeCallBack, data: ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'BackToCallerAbilityWithResultTest_0200_Success') {
          commonEventManager.unsubscribe(subscriber, UnSubscribeInfoCallBack)
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      let UnSubscribeInfoCallBack = () => {
        log(TAG, 'UnSubscribeInfoCallBack')
      }
      await commonEventManager.createSubscriber(subscribeInfo)
        .then((data) => {
          log(TAG, 'createSubscriber success');
          subscriber = data;
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          log(TAG, 'subscribe success');
        })

      let want: Want = {
        bundleName: 'com.example.backdemo',
        abilityName: 'EntryAbility',
        parameters: {
          'testcase': 'BackToCallerAbilityWithResultTest_0200'
        }
      }

      abilityContext?.startAbilityForResult(want)
        .then(() => {
          log(TAG, 'Succeeded in starting EntryAbility.');
        })
        .catch((err: BusinessError) => {
          log_error(TAG, `Failed to start EntryAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      await clickDialog(TAG);

    });

    /**
     * @tc.name   BackToCallerAbilityWithResultTest_0300
     * @tc.number BackToCallerAbilityWithResultTest_0300
     * @tc.desc   A start B, B start C, C back to B.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BackToCallerAbilityWithResultTest_0300', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'BackToCallerAbilityWithResultTest_0300';
      log(TAG, '---------------testcase is start---------------')
      let abilityContext: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      if (!abilityContext) {
        log_error(TAG, 'abilityContext is undefined');
        expect().assertFail();
        done();
      }

      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['BackToCallerAbilityWithResultTest_0300_Success',
          'BackToCallerAbilityWithResultTest_0300_Failed',
        "BackToCallerAbilityWithResultTest_CLICK_DIALOG"]
      }
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        log(TAG, 'subscribeCallBack, data: ' + JSON.stringify(data));
        let event = data.event;
        if (event === "BackToCallerAbilityWithResultTest_CLICK_DIALOG") {
          clickDialog(TAG);
        } else if (event === 'BackToCallerAbilityWithResultTest_0300_Success') {
          commonEventManager.unsubscribe(subscriber, UnSubscribeInfoCallBack)
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      let UnSubscribeInfoCallBack = () => {
        log(TAG, 'UnSubscribeInfoCallBack')
      }
      await commonEventManager.createSubscriber(subscribeInfo)
        .then((data) => {
          log(TAG, 'createSubscriber success');
          subscriber = data;
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          log(TAG, 'subscribe success');
        })

      let want: Want = {
        bundleName: 'com.example.backdemo',
        abilityName: 'EntryAbility',
        parameters: {
          'testcase': 'BackToCallerAbilityWithResultTest_0300'
        }
      }

      abilityContext?.startAbility(want)
        .then(() => {
          log(TAG, 'Succeeded in starting EntryAbility.');
        })
        .catch((err: BusinessError) => {
          log_error(TAG, `Failed to start EntryAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      await clickDialog(TAG);
    });

    /**
     * @tc.name   SetOnNewWantSkipScenarios_0100
     * @tc.number SetOnNewWantSkipScenarios_0100
     * @tc.desc   SetOnNewWantSkipScenarios_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetOnNewWantSkipScenarios_0100', Level.LEVEL0, async (done: Function) => {
      let TAG: string = 'SetOnNewWantSkipScenarios_0100';
      log(TAG, '---------------testcase is start---------------')
      let abilityContext: common.UIAbilityContext = getContext() as common.UIAbilityContext;
      if (!abilityContext) {
        log_error(TAG, 'abilityContext is undefined');
        expect().assertFail();
        done();
      }
      let scenarios : number = contextConstant.Scenarios.SCENARIO_MOVE_MISSION_TO_FRONT |
      contextConstant.Scenarios.SCENARIO_SHOW_ABILITY |
      contextConstant.Scenarios.SCENARIO_BACK_TO_CALLER_ABILITY_WITH_RESULT;
      abilityContext?.setOnNewWantSkipScenarios(scenarios).then((data) => {
        log(TAG, 'SetOnNewWantSkipScenarios_0100 succeed');
        expect(data).assertEqual(undefined);
        done();
      }).catch((err: BusinessError) => {
        log_error(TAG, `SetOnNewWantSkipScenarios_0100 failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      });
      log(TAG, '---------------testcase is end---------------')
    });
  })
}