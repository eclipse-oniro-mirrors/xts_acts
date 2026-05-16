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
    // 安全调用 enableBackForwardCache（如果支持）
    if (webview.WebviewController.enableBackForwardCache) {
      try {
        let features = new webview.BackForwardCacheSupportedFeatures();
        features.nativeEmbed = true;
        features.mediaTakeOver = true;
        webview.WebviewController.enableBackForwardCache(features);
        GlobalContext.getContext().setObject('enableBackForwardCache', true);
        GlobalContext.getContext().setObject('nativeEmbed', true);
        GlobalContext.getContext().setObject('mediaTakeOver', true);
        hilog.info(0x0000, 'testTag', 'enableBackForwardCache set successfully');
      } catch (e) {
        hilog.error(0x0000, 'testTag', 'enableBackForwardCache failed: %{public}s', e.message);
      }
    } else {
      hilog.warn(0x0000, 'testTag', 'enableBackForwardCache not supported, skip');
    }

    // 安全调用 initializeWebEngine（如果支持）
    if (webview.WebviewController.initializeWebEngine) {
      try {
        webview.WebviewController.initializeWebEngine();
        hilog.info(0x0000, 'testTag', 'initializeWebEngine succeeded');
      } catch (e) {
        hilog.error(0x0000, 'testTag', 'initializeWebEngine failed: %{public}s', e.message);
      }
    } else {
      hilog.warn(0x0000, 'testTag', 'initializeWebEngine not supported, skip');
    }

    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/webviewSetBlanklessLoadingCacheCapacity', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err?.code) {
          hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag EntryAbility', 'loadContent ok');
      });
    } catch (e) {
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