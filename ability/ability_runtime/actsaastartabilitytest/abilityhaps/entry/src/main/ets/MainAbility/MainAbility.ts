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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import commonEvent from '@ohos.commonEvent';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

const flag = '10000';
let subscriber;
let lifeCircle: Array<string> = new Array();
const onForegroundEvent_main = '10000-onForegroundEvent_entry';

function publishEvent(event: string) {
  let commonEventPublishData = {
    parameters: {
      'flag': 'main',
      'lifeCircle': lifeCircle
    }
  }
  commonEvent.publish(event, commonEventPublishData, (err, data) => {
    hilog.info(0x0000, 'testTag', '%{public}s', 'publish ' + event);
  })
}

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', flag + '-Ability onCreate');
    lifeCircle[0] = 'onCreate->';
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', flag + '-Ability onDestroy');
    commonEvent.unsubscribe(subscriber);
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    lifeCircle[1] = 'onWindowStageCreate->';
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    })
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', flag + '-Ability onForeground');
    lifeCircle[2] = 'onForeground';
    publishEvent(onForegroundEvent_main);
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', flag + '-Ability onBackground');
  }
}
