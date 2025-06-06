/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEvent';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import commonEventManager from '@ohos.commonEventManager';

const CALLER_PID = 'ohos.aafwk.param.callerPid';
const CALLER_TOKEN = 'ohos.aafwk.param.callerToken';
const CALLER_UID = 'ohos.aafwk.param.callerUid';
const TEST_SUITE_NAME: string = 'StartAbilityGetStartParameterTest';
const EVENT_CASE_600 = 'ABILITY_StartAbility_GetStartParameters_0600';
let paramWant: Want;

export default class SecondAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    paramWant = want;
    hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME} - paramWant: ${JSON.stringify(paramWant)}`);

    let parameters: commonEventManager.CommonEventPublishData = {
      parameters: {
        pid: paramWant.parameters![CALLER_PID],
        tokenId: paramWant.parameters![CALLER_TOKEN],
        uid: paramWant.parameters![CALLER_UID]
      }
    }
    commonEvent.publish(EVENT_CASE_600, parameters, (err, data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `${TEST_SUITE_NAME}-${JSON.stringify(parameters)} event 800 publish success`);
    })
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    windowStage.loadContent('SecondAbility/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
        JSON.stringify(data) ?? '');
    })
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}