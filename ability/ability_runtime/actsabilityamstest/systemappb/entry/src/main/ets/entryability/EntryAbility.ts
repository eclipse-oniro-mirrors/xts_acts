/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import commonEvent from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';
import Ability from '@ohos.app.ability.UIAbility'

let CREATE_EVENT = 'create_event';
let tag = 'SystemAppB_EntryAbility'

export default class EntryAbility extends Ability {
  onCreate(want, launchParam){
    // Ability is creating, initialize resources for this ability
    console.log("SystemAppCalleeA SecondAbility onCreate")
    try {
      this.callee.off(undefined);
    } catch (e) {
      console.log('SystemAppCalleeA SecondAbility onCreate===' + JSON.stringify(e))
      let code = (e as BusinessError).code;
      let commonEventData: commonEvent.CommonEventPublishData = {
        parameters: {
          num: code,
        }
      };
      commonEvent.publish(CREATE_EVENT, commonEventData, (err) => {
        hilog.info(0x0000, tag, '%{public}s', `Acts_EntryOnDestroy publish err:  ${JSON.stringify(err)}`);
      });
    }
  }


  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
