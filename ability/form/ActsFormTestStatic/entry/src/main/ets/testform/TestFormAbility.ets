/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { UIContext } from '@ohos.arkui.UIContext';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag TestFormAbility';

class TestFormAbility extends UIAbility {
  private xtsWindowStage: window.WindowStage | undefined;
  private wantUri: string = '';
  private uiContext: UIContext | undefined;

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(DOMAIN, TAG, `onCreate, wantUri: ${this.wantUri}`);
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.wantUri = want.uri ?? '';
    hilog.info(DOMAIN, TAG, `onNewWant, wantUri: ${this.wantUri}`);
    if (this.wantUri) {
      try {
        let aRouter = this.uiContext?.getRouter();
        aRouter?.pushUrl({url: this.wantUri})
      } catch (e) {
        hilog.error(DOMAIN, TAG, `pushUrl error, message: ${e?.message}`);
      }
    }
    this.wantUri = '';
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(DOMAIN, TAG, 'onWindowStageCreate');
    this.xtsWindowStage = windowStage;
    try {
      this.xtsWindowStage?.loadContent(this.wantUri || 'testform/pages/XtsFormLink',
        (err: BusinessError<void> | null): void => {
        if (err?.code) {
          hilog.info(DOMAIN, TAG, 'loadContent error');
          return;
        }
        hilog.info(DOMAIN, TAG, 'loadContent ok');
      });
    } catch (e) {
      e = e as BusinessError;
      hilog.error(DOMAIN, TAG, `loadContent catch error: ${e?.message}`);
    }

    hilog.info(DOMAIN, TAG, 'get main window start');
    windowStage.getMainWindow().then((win) => {
      hilog.info(DOMAIN, TAG, 'get main window success');
      this.uiContext = win.getUIContext();
      hilog.info(DOMAIN, TAG, 'getUIContext end');
    }).catch((err) => {
      hilog.info(DOMAIN, TAG, `Failed to get main window: ${JSON.stringify(err)}`);
    });
    hilog.info(DOMAIN, TAG, 'onWindowStageCreate end');
  }
}