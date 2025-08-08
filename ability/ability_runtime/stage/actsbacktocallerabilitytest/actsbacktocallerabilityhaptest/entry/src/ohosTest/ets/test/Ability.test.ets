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

function log(info:string) {
  console.info('[BackToCallerAbilityWithResultTest]::' + info);
}

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    let abilityContext: common.UIAbilityContext;
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(async (done: Function) => {
      await sleep(2000);
      done()
    })
    afterAll(() => {})

    /*
    * @tc.number  BackToCallerAbilityWithResultTest_0100
    * @tc.name
    * @tc.desc    BackToCallerAbilityWithResultTest_0100
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('BackToCallerAbilityWithResultTest_0100', Level.LEVEL0, async (done: Function) => {
      log('---------------BackToCallerAbilityWithResultTest_0100 is start---------------')
      abilityContext = AppStorage.get<common.UIAbilityContext>('abilityContext')!;
      if (!abilityContext) {
        log('abilityContext is undefined');
        expect().assertFail();
      }

      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['BackToCallerAbilityWithResultTest_0100_Success',
          'BackToCallerAbilityWithResultTest_0100_Failed']
      }
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        log('subscribeCallBack, data: ' + JSON.stringify(data));
        let event = data.event;
        if (event === 'BackToCallerAbilityWithResultTest_0100_Success') {
          commonEventManager.unsubscribe(subscriber, UnSubscribeInfoCallBack)
          done();
        } else {
          expect().assertFail();
        }
      }
      let UnSubscribeInfoCallBack = () => {
        log('UnSubscribeInfoCallBack')
      }
      await commonEventManager.createSubscriber(subscribeInfo)
        .then((data) => {
          log('createSubscriber success');
          subscriber = data;
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          log('subscribe success');
        })

      let want:Want = {
        bundleName: 'com.example.backdemo',
        abilityName: 'EntryAbility',
        parameters: {
          'testcase': 'BackToCallerAbilityWithResultTest_0100'
        }
      }

      await abilityContext?.startAbility(want)
        .then(() => {
          log('Succeeded in starting EntryAbility.');
        })
        .catch((err: BusinessError) => {
          log(`Failed to start EntryAbility. Code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        });

      log('---------------BackToCallerAbilityWithResultTest_0100 is end---------------')
    });

    /*
    * @tc.number  SetOnNewWantSkipScenarios_0100
    * @tc.name
    * @tc.desc    SetOnNewWantSkipScenarios_0100
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('SetOnNewWantSkipScenarios_0100', Level.LEVEL0, async (done: Function) => {
      log('---------------SetOnNewWantSkipScenarios_0100 is start---------------')
      abilityContext = AppStorage.get<common.UIAbilityContext>('abilityContext')!;
      if (!abilityContext) {
        log('abilityContext is undefined');
        expect().assertFail();
        done();
      }

      let scenarios : number = contextConstant.Scenarios.SCENARIO_MOVE_MISSION_TO_FRONT |
        contextConstant.Scenarios.SCENARIO_SHOW_ABILITY |
        contextConstant.Scenarios.SCENARIO_BACK_TO_CALLER_ABILITY_WITH_RESULT;
      abilityContext?.setOnNewWantSkipScenarios(scenarios).then((data) => {
        console.info('SetOnNewWantSkipScenarios_0100 succeed');
        expect(data).assertEqual(undefined);
        done();
      }).catch((err: BusinessError) => {
        console.error(`SetOnNewWantSkipScenarios_0100 failed, code is ${err.code}, message is ${err.message}`);
        expect().assertFail();
        done();
      });
      log('---------------SetOnNewWantSkipScenarios_0100 is end---------------')
    });

  })
}