/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import type window from '@ohos.window';
import commonEvent from '@ohos.commonEventManager';

let message;
let commonEventData = {
  parameters: {
    message: message,
  }
};
let timeout = 50;

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Abilitytest4 onCreate');
    globalThis.terminate = () => {
      setTimeout(() => {
        this.context.terminateSelf().then(() => {
          console.info('====>EntryAbility terminateSelf end');
        }).catch((err) => {
          console.info('====>EntryAbility terminateSelf err:' + JSON.stringify(err));
        });
      }, timeout);
    };
    console.info('Ability4 onCreate' + JSON.stringify(want));
    let actionStr = want.action;
    if (actionStr === 'ohos.nfc.tag.test.action') {
      hilog.info(0x0000, 'testTag', '%{public}s', 'a4Ability ok');
      commonEventData.parameters.message = 'select';
      commonEvent.publish('ACTS_CROSS_CALL_EVENT', commonEventData, (err) => {
        console.info('====>' + actionStr + ' apublish err:' + JSON.stringify(err));
        globalThis.terminate();
      });
    }
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability4 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability4 onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability4 onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability4 onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability4 onBackground');
  }
}
