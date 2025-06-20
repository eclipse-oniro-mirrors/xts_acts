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

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { url } from '@kit.ArkTS';
import { rpc } from '@kit.IPCKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';

export default class applicationContext01 extends UIAbility {
  onCreate(want) {
    console.info('applicationContext01 onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    globalThis.applicationContext01 = this.context
    console.info('applicationContext01 JSON.stringify(want) is', JSON.stringify(want));
    console.info('applicationContext01 JSON.stringify(want) is', JSON.stringify(want.parameters));
    let applicationContext = globalThis.applicationContext01.getApplicationContext()
    console.log('killAllProcesses begin');
    try {
      applicationContext.killAllProcesses(undefined)
      console.log('killAllProcesses success');
      globalThis.applicationContext01.terminateSelfWithResult(
        {
          resultCode: 100,
          want: {
            parameters: {
              keyString: 'NextCase',
            }
          }
        }, () => {
        console.log("====>terminateSelfWithResult success====>")
        commonEventManager.publish('ACTS_TEST_DESTROY', function () {
          console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000 publish ACTS_TEST_DESTROY');
        });
      });
    } catch (err) {
      console.log('killAllProcesses fail', JSON.stringify(err.code));
    }
    console.log('killAllProcesses end');
  };


  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info('applicationContext01 onWindowStageCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('testability/pages/UiAbility/UiAbility12', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
    globalThis.applicationContext01.terminateSelfWithResult(
      {
        resultCode: 100,
        want: {
          parameters: {
            keyString: 'NextCase',
          }
        }
      }, () => {
      console.log("====>terminateSelfWithResult success====>")
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000 publish ACTS_TEST_DESTROY');
      });
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    console.info('applicationContext01 onForeground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
    globalThis.applicationContext01.terminateSelfWithResult(
      {
        resultCode: 100,
        want: {
          parameters: {
            keyString: 'NextCase',
          }
        }
      }, () => {
      console.log("====>terminateSelfWithResult success====>")
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        console.info('====>SUB_Ability_AbilityRuntime_ABILITY_StartAbility_OpenLink_3000 publish ACTS_TEST_DESTROY');
      });
    });
  }

  onBackground() {
    console.info('applicationContext01 onBackground');
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
