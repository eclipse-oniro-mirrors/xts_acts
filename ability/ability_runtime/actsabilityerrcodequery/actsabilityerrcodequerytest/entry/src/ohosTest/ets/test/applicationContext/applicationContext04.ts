/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { commonEventManager } from '@kit.BasicServicesKit';
import { UIExtensionContentSession, UIExtensionAbility } from '@kit.AbilityKit';

export default class applicationContext04 extends UIExtensionAbility  {
  public session:UIExtensionContentSession;

  onSessionCreate(want: Want, session: UIExtensionContentSession): void {
    this.session = session
    console.info('applicationContext04 onSessionCreate');
    globalThis.applicationContext04 = this.context
    console.info('applicationContext04 JSON.stringify(want) is', JSON.stringify(want));
    console.info('applicationContext04 JSON.stringify(want) is', JSON.stringify(want.parameters));
    try {
      this.session.loadContent(undefined);
    } catch (error) {
      console.error(`session.loadContent fail, error: ${JSON.stringify(error)}`);
      if(error.code==401){
        globalThis.applicationContext04.terminateSelfWithResult(
          {
            resultCode: 100,
            want: {
              parameters: {
                keyString: 'NextCase',
              }
            }
          }, () => {
          console.log("====>terminateSelfWithResult success====>")
        });
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info('====>SUB_ChildProcessManager_sendableContextManager_1100 publish ACTS_TEST_DESTROY');
        });
      }
    }
  };

  onSessionDestroy(session: UIExtensionContentSession) {
    console.log(`applicationContext04 onSessionDestroy`);
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('applicationContext04 onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('testability/pages/UiAbility/UiAbility12', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.info('applicationContext04 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    console.info('applicationContext04 onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
