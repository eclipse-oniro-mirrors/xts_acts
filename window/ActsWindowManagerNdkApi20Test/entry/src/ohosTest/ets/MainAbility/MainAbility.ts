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

import Ability from '@ohos.app.ability.UIAbility';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import windowndkapi20 from 'libwindowndkapi20.so';

const TAG: string = '[createWindow]'

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    // Ability is creating, initialize resources for this ability
    console.log(`${TAG} MainAbility onCreate`);
    globalThis.abilityWant = want;
    globalThis.abilityLaunchParam = launchParam;
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log(`${TAG} MainAbility onDestroy`);
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log(`${TAG} MainAbility onWindowStageCreate windowStage=` + windowStage);
    globalThis.windowStage = windowStage;
    AppStorage.setOrCreate('context',this.context);
    AppStorage.setOrCreate('windowStage',windowStage);
    windowStage.setUIContent(this.context, 'MainAbility/pages/XTSIndex', null);
    let windowClass: window.Window | undefined = undefined;
    windowStage.getMainWindow((err: BusinessError, data) => {
      let errCode: number = err.code;
      if (errCode) {
        console.error('Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      windowClass = data;
      globalThis.window = data;
      hilog.info(0x0000, 'testTag', 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      try {
        let properties : window.WindowProperties = windowClass.getWindowProperties();
        let wRect : window.Rect =  properties.windowRect;
        globalThis.winLeft = wRect.left;
        globalThis.winTop = wRect.top;
        windowndkapi20.GetMainWindowId(properties.id);
        // 传递屏幕ID到Native
        windowndkapi20.GetDisplayId(properties.displayId);
        hilog.info(0x0000, 'testTag', 'Succeeded get winLeft:' + globalThis.winLeft + ',winTop:' + globalThis.winTop );
      } catch (exception) {
        hilog.error(0x0000, 'testTag', 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
      }
    })
  }

  onWindowStageDestroy() {
    //Main window is destroyed, release UI related resources
    console.log(`${TAG} MainAbility onWindowStageDestroy`);
  }

  onForeground() {
    // Ability has brought to foreground
    console.log(`${TAG} MainAbility onForeground`);
  }

  onBackground() {
    // Ability has back to background
    console.log(`${TAG} MainAbility onBackground`);
  }
};