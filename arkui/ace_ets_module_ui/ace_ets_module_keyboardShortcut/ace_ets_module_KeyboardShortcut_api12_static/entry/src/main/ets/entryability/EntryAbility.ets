'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from "@ohos.app.ability.common";
import { UIContext } from '@ohos.arkui.UIContext';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    AppStorage.setOrCreate<Want>('abilityWant', want);
  }

  onDestroy(): Promise<void> {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    AppStorage.setOrCreate<window.WindowStage>('windowStage', windowStage);
    AppStorage.setOrCreate<common.UIAbilityContext>('abilityContext', this.context);
    windowStage.loadContent('MainAbility/pages/index/index', (err: BusinessError | null, data) => {
      if (err?.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      let windowClass: window.Window | undefined = undefined;
      windowStage.getMainWindow((err: BusinessError | null, data) => {
        let errCode: number = err!.code as number;
        if (errCode) {
          console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          return;
        }
        windowClass = data;
        hilog.info(0x0000, 'testTag', 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        try {
          let properties: window.WindowProperties | undefined =
            windowClass?.getWindowProperties() as window.WindowProperties;
          let wRect: window.Rect | undefined = properties?.windowRect;
          AppStorage.setOrCreate<number>('winLeft', wRect?.left ?? 0);
          AppStorage.setOrCreate<number>('winTop', wRect?.top ?? 0);
          hilog.info(0x0000, 'testTag', 'Succeeded get winLeft:' + wRect?.left + ',winTop:' + wRect?.top);
        } catch (exception) {
          hilog.error(0x0000, 'testTag', 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        }
        // Obtain a UIContext instance.
        if (windowClass !== null) {
          AppStorage.setOrCreate<UIContext>('uiContent', windowClass!.getUIContext());
        }
      })
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