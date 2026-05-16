/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { commonEventManager } from '@kit.BasicServicesKit';

const DOMAIN = 0x0000;
let color: ArrayBuffer = new ArrayBuffer(512 * 512 * 4);
let bufferArr = new Uint8Array(color);
for (let i = 0; i < bufferArr.length; i += 4) {
  bufferArr[i] = 255;
  bufferArr[i + 1] = 0;
  bufferArr[i + 2] = 122;
  bufferArr[i + 3] = 255;
}
let opts: image.InitializationOptions = {editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {height: 512, width: 512}};
let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onForeground');

    setTimeout(() => {
      hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility hideAbility');
      this.context.terminateSelf();
    }, 300);
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'EntryAbility onBackground');

    this.context.setAbilityInstanceInfo('111111', pixelMap).then(() => {
      commonEventManager.publish('setAbilityInstanceInfo_success', () => {});
    }).catch(() => {
      commonEventManager.publish('setAbilityInstanceInfo_fail', () => {});
    });
  }
}