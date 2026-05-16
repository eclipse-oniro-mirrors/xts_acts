/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import window from '@ohos.window';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError,RecordData } from '@ohos.base';

const TAG: string = 'testTag';
const TEST_CASE_KEY: string = 'caseTag';

let testCaseName: string = '';

function publishEvent(eventName: string, code: int) {
  let commonEventData: commonEventManager.CommonEventPublishData = {
    parameters: {
      'result': code
    } as Record<string, RecordData>
  } as commonEventManager.CommonEventPublishData;
  commonEventManager.publish(eventName, commonEventData, (result) => {
    hilog.info(0x0000, TAG, `${eventName} publish result:${JSON.stringify(result)}`);
  });
}

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void  {
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onCreate');
    let eventName: string;

    if (want?.parameters?.[TEST_CASE_KEY]) {
      testCaseName = want?.parameters?.[TEST_CASE_KEY] as string;
    }

    if (testCaseName === 'SUB_AA_ABILITY_NewRule_AppServiceExtension_static_1100') {
      eventName = 'connectServiceExtensionAbilityStatic_1100';
      hilog.info(0x0000, 'testTag', `${eventName} Begin`);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.context.aappserviceextensionrely.static',
        abilityName: 'AppServiceExtAbility',
      };
      try {
        this.context.startAppServiceExtensionAbility(wantInfo). then(() => {
          hilog.info(0x0000, TAG, `${eventName} startAppServiceExtensionAbility success`);
        }).catch((error: Error) => {
          hilog.info(0x0000, TAG, `${eventName} startAppServiceExtensionAbility failed: ${JSON.stringify(error)}`);
          publishEvent(eventName, error.code);
        });
      } catch (error) {
        hilog.info(0x0000, TAG, `${eventName} startAppServiceExtensionAbility: ${JSON.stringify(error)}`);
        publishEvent(eventName, error.code);
      }
    }
  }  

  onDestroy(): Promise<void>|undefined {
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onDestroy');
    return undefined
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onWindowStageCreate');

    windowStage.loadContent('TestAbility/pages/Index', (err: BusinessError<void> | null): void => {
      if (err?.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'MyUIAbility onBackground');
  }
}
