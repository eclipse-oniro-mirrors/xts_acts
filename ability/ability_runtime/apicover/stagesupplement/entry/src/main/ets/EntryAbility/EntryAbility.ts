/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEvent';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

let printLog9 = "Stage:EntryAbility:";
let listPush9 = "Stage_EntryAbility_";
let lifeList9 = [];
function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
export default class EntryAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.info(printLog9 + "onCreate");
  }

  async onDestroy(): Promise<void>{
    console.info(printLog9 + "onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.info(printLog9 + "onWindowStageCreate");
    windowStage.loadContent("pages/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.info(printLog9 + "onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.info(printLog9 + "onForeground");
  }

  onBackground() {
    // Ability has back to background
    console.info(printLog9 + "onBackground");
  }

  onWindowStageRestore(windowStage) {
    console.info(printLog9 + "onWindowStageRestore");
  }

  onNewWant() {
    console.info(printLog9 + "onNewWant");
  }

  onContinue(wantParam: { [key: string]: any }) {
    console.info(printLog9 + "onContinue");
    return AbilityConstant.OnContinueResult.AGREE;
  }
}
