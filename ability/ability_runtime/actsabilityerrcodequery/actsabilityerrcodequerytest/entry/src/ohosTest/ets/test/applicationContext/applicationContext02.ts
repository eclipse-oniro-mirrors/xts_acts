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

import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

export default class applicationContext02 extends UIAbility {
  onCreate(want) {
    console.info('applicationContext02 onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.applicationContext02 = this.context
    console.info('applicationContext02 JSON.stringify(want) is', JSON.stringify(want));
    console.info('applicationContext02 JSON.stringify(want) is', JSON.stringify(want.parameters));
    let applicationContext = globalThis.applicationContext02.getApplicationContext();
    globalThis.applicationContext = applicationContext
  };

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('applicationContext02 onWindowStageCreate');
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
    let want1: Want = {
      bundleName: "ohos.acts.applicationContextAssist",
      abilityName: "EntryAbility",
      parameters: {
        appLinkingOnly: false,
        demo_num: 111
      }
    }
    console.info('applicationContext02 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    globalThis.applicationContext02.startAbility(want1, (err: BusinessError) => {
      if (err.code) {
        console.error(`Failed to startAbility. Code: ${err.code}, message: ${err.message}`);
      }
      console.info('context.startAbility applicationContext03 succeed');
    })
  }

  onBackground() {
    console.info('applicationContext02 onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
    let want: Want = {
      bundleName: "com.test.actsabilityerrcodequerytest",
      abilityName: "applicationContext02",
      parameters: {
        appLinkingOnly: false,
        demo_num: 111
      }
    }

    try {
      hilog.info(0x0000, 'testTag', '%{public}s', 'globalThis.applicationContext.restartApp begin');
      globalThis.applicationContext.restartApp(want);
      hilog.info(0x0000, 'testTag', '%{public}s', 'globalThis.applicationContext.restartApp succeed,case failed');
    } catch (error) {
      console.log(`applicationContext.restartApp fail, error: ${JSON.stringify(error)}`);
      if (error.code == 16000053) {
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info('====>SUB_ChildProcessManager_sendableContextManager_0800 publish ACTS_TEST_DESTROY');
          setTimeout(() => {
            globalThis.applicationContext02.terminateSelf()
          }, 500)
        });
      }
    }
  }
}
