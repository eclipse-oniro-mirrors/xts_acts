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
import Ability from '@ohos.app.ability.UIAbility';
import { GlobalContext } from '../test/GlobalContext';
import webview from '@ohos.web.webview';

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
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
    console.log('GlobalContext enableBackForwardCache===>'+GlobalContext.getContext().getObject('enableBackForwardCache'))
    globalThis.enableBackForwardCache = true
    globalThis.nativeEmbed = true
    globalThis.mediaTakeOver = true
    console.log("[Demo] MainAbility onCreate");
    globalThis.abilityWant = want;
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("[Demo] MainAbility onDestroy");
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] MainAbility onWindowStageCreate windowStage=" + windowStage);
    globalThis.windowStage = windowStage;
    globalThis.abilityContext = this.context;
    windowStage.setUIContent(this.context, "MainAbility/pages/Index", null);
  }

  onWindowStageDestroy() {
    //Main window is destroyed, release UI related resources
    console.log("[Demo] MainAbility onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] MainAbility onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] MainAbility onBackground");
  }
};
