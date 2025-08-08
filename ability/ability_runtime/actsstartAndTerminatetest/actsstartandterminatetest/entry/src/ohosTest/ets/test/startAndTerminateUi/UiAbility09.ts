/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class UiAbility09 extends UIAbility {

  static isFirstStart:boolean = true;

  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onCreate');
    globalThis.uiAbilityContext9 = this.context;
    hilog.info(0x0000, 'testTag', '%{public}s', `UiAbility09 want is, ${JSON.stringify(want)}`);
    UiAbility09.isFirstStart = want.parameters.isFirstStart
    if (UiAbility09.isFirstStart) {
      commonEventManager.publish('UiAbility09_onCreate_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onCreate_01');
      });
    } else {
      commonEventManager.publish('UiAbility09_onCreate_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onCreate_02');
      });
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onDestroy');
    if (UiAbility09.isFirstStart) {
      commonEventManager.publish('UiAbility09_onDestroy_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onDestroy_01');
      });
    } else {
      commonEventManager.publish('UiAbility09_onDestroy_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onDestroy_02');
      });
    }
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onWindowStageCreate');
    if (UiAbility09.isFirstStart) {
      commonEventManager.publish('UiAbility09_onWindowStageCreate_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onWindowStageCreate_01');
      });
    } else {
      commonEventManager.publish('UiAbility09_onWindowStageCreate_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onWindowStageCreate_02');
      });
    }
    windowStage.loadContent('testability/pages/UiAbility/UiAbility01', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onForeground');
    if (UiAbility09.isFirstStart) {
      commonEventManager.publish('UiAbility09_onForeground_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onForeground_01');
      });
    } else {
      commonEventManager.publish('UiAbility09_onForeground_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onForeground_02');
      });
      commonEventManager.publish('ACTS_TEST_DESTROY', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish ACTS_TEST_DESTROY');
      });
    }
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 onBackground');

    if (UiAbility09.isFirstStart) {
      commonEventManager.publish('UiAbility09_onBackground_01', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onBackground_01');
      });
    } else {
      commonEventManager.publish('UiAbility09_onBackground_02', function () {
        hilog.info(0x0000, 'testTag', '%{public}s', 'UiAbility09 publish UiAbility09_onBackground_02');
      });
    }
  }
}
