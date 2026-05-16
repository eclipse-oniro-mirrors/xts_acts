/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

let callBackSeq = "";

function publishCallBack() {
  console.debug("====>AbilityMultiInstanceAppB Publish CallBack ====>");
}

async function startAbilityProcess(AppBAbilityContext, parameters) {
  let bundleName = "com.acts.abilitymultiinstancea";
  let abilityName = "com.acts.abilitymultiinstancea.MainAbility";

  let idx = parameters.nextStep;
  switch (parameters.step[idx]) {
    case "StartA1":
      parameters.startId = 1;
      break;
    case "StartA2":
      parameters.startId = 2;
      break;
    case "StartB":
      bundleName = "com.acts.abilitymultiinstanceb";
      abilityName = "com.acts.abilitymultiinstanceb.MainAbility";
      break;
    case "StartC":
      bundleName = "com.acts.abilitymultiinstancec";
      abilityName = "com.acts.abilitymultiinstancec.MainAbility";
      break;
    case "StartDMain1":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 1;
      break;
    case "StartDMain2":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 2;
      break;
    case "StartDSec":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.SecondAbility";
      break;
    case "StartDThd":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.ThirdAbility";
      break;
    case "StartE":
      bundleName = "com.acts.abilitymultiinstancee";
      abilityName = "com.acts.abilitymultiinstancee.MainAbility";
      break;
    default:
      break;
  }
  parameters.nextStep = ++idx;
  AppBAbilityContext.startAbility({
    bundleName: bundleName,
    abilityName: abilityName,
    parameters: parameters
  }, (error, data) => {
    console.log('AppB startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data));
  })
}

async function onShowProcess(AppBAbilityContext) {
  let abilityWant: Want = AppStorage.get<Want>("abilityWant")!;
  let callBackData = "AppB:"
  callBackData += callBackSeq;

  let commonEventPublishData = {
    data: callBackData,
    parameters: abilityWant!.parameters
  }
  console.log("AbilityMultiInstanceAppB onShowProcess");
  if (abilityWant.parameters.nextStep >= abilityWant.parameters.stepNum) {
    commonEvent.publish("MultiInstanceStartFinish", commonEventPublishData, publishCallBack);
    callBackSeq = "";
  } else {
    commonEvent.publish("MultiInstanceStartNext", commonEventPublishData, () => {
      callBackSeq = "";
      startAbilityProcess(AppBAbilityContext, abilityWant.parameters);
    })
  }
}

export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    // Ability is creating, initialize resources for this ability
    console.log("AbilityMultiInstanceAppB MainAbility onCreate");
    callBackSeq += "onCreate";
    AppStorage.setOrCreate("abilityWant", want);
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("AbilityMultiInstanceAppB MainAbility onDestroy");
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    console.log("AbilityMultiInstanceAppB MainAbility onWindowStageCreate");
    AppStorage.setOrCreate("AppBAbilityContext", this.context);
    windowStage.loadContent("pages/index/index", null);
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("AbilityMultiInstanceAppB MainAbility onWindowStageDestroy");
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("AbilityMultiInstanceAppB MainAbility onForeground");
    callBackSeq += "onForeground";
    onShowProcess(this.context);
  }

  onBackground() {
    // Ability has back to background
    console.log("AbilityMultiInstanceAppB MainAbility onBackground");
  }
}
