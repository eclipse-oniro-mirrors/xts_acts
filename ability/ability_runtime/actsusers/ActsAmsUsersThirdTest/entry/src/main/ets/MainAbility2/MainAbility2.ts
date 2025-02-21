/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent'
function PublishCallBackOne() {
  console.debug("====>Publish CallBack ACTS_StartAbility_0100_CommonEvent====>");
  globalThis.abilityContext2.terminateSelf();
  console.debug("====>terminateSelf succese====>")
  commonEvent.publish("ACTS_TerminateSelf_CommonEvent", ()=>{
    console.debug("====>publish ACTS_TerminateSelf_CommonEvent====>")
  });
}
export default class MainAbility extends Ability {

  onCreate(want, launchParam) {
    console.log("MainAbility2 onCreate")
  }

  onDestroy() {
    console.log("MainAbility2 onDestroy")
  }

  onWindowStageCreate(windowStage) {
    console.log("MainAbility2 onWindowStageCreate")
    globalThis.abilityContext2 = this.context
    commonEvent.publish("ACTS_InterfaceMultiUsers_0100_Start_CommonEvent", PublishCallBackOne);
  }

  onWindowStageDestroy() {
    console.log("MainAbility onWindowStageDestroy")
  }

  onForeground() {
    console.log("MainAbility onForeground")
  }

  onBackground() {
    console.log("MainAbility onBackground")
  }
};
