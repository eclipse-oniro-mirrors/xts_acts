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
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window';
import { AppStorage } from 'arkui.stateManagement.storage.appStorage'
import common from '@ohos.app.ability.common';
import { GlobalContext } from '../../src/test/GlobalContext';
import webview from '@ohos.web.webview';


class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Ability is creating, initialize resources for this ability
    let features = new webview.BackForwardCacheSupportedFeatures();
    features.nativeEmbed = true;
    features.mediaTakeOver = true;
    // 如果一个页面同时使用了同层渲染和视频托管的能力，需要 nativeEmbed 和
    // mediaTakeOver 同时设置为 true，该页面才可以进入前进后退缓存中。
    webview.WebviewController.enableBackForwardCache(features);
    webview.WebviewController.initializeWebEngine();
    GlobalContext.getContext().setObject('enableBackForwardCache', true)
    GlobalContext.getContext().setObject('nativeEmbed', true)
    GlobalContext.getContext().setObject('mediaTakeOver', true)
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/webviewEnableBackForwardCache', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent catch error：-----------' + e.message);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onDestroy');
	return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}