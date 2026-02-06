/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const caseName: string = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100';

export default class SetFontSizeAbility011 extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onCreate');
    globalThis.context11 = this.context;
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onWindowStageCreate');

    windowStage.loadContent('testability/pages/setFontSizeAbility011', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', caseName + 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', caseName + 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 onBackground');
  }
}
