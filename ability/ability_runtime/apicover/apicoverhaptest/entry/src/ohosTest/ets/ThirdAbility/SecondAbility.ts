/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import wantConstant from '@ohos.app.ability.wantConstant';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import window from '@ohos.window';

export default class SecondAbility extends Ability {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("[Demo] SecondAbility onCreate");
    AppStorage.setOrCreate<common.ApplicationContext>("applicationContext", this.context.getApplicationContext());
  }

  onDestroy() {
    console.log("[Demo] SecondAbility onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("[Demo] SecondAbility onWindowStageCreate");
    AppStorage.setOrCreate<common.UIAbilityContext>("abilityContext", this.context);
    windowStage.loadContent("ThirdAbility/pages/MainAbility_pages", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("[Demo] SecondAbility onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("[Demo] SecondAbility onForeground");
    let CommonEventPublishData = {
      parameters: {
        "Life": "onForeground"
      }
    }
    commonEvent.publish("Form_StartAbility", CommonEventPublishData, (err) => {
      console.info("Form_StartAbility onCreate");
    });
  }

  onBackground() {
    // Ability has back to background
    console.log("[Demo] SecondAbility onBackground");
  }

  onDump(Param) {
    return null;
  }

  onShare(wantParam) {
    wantParam[wantConstant.Params.CONTENT_TITLE_KEY] = {
      title: "baidu"
    },
    wantParam[wantConstant.Params.SHARE_ABSTRACT_KEY] = {
      Abstract: "share data"
    },
    wantParam[wantConstant.Params.SHARE_URL_KEY] = {
      uri: "www.baidu.com"
    }
  }

  onPrepareToTerminate() {
    return true;
  }
}