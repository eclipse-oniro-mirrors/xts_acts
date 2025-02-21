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

let sendMessageTime = 2000;
function PublishCallBackOne() {
  console.info('====>Publish CallBack ACTS_StartAbility_0100_CommonEvent====>');
  setTimeout(()=>{
    globalThis.abilityContext2.terminateSelf();
  }, sendMessageTime)
  console.info('====>terminateSelf succese====>');
}
export default class MainAbility extends Ability {

  onCreate(want, launchParam) {
    console.log('MainAbility2 onCreate');
  }

  onDestroy() {
    console.log('MainAbility2 onDestroy');
    setTimeout(()=>{
      commonEvent.publish('ACTS_TerminateSelf_CommonEvent', ()=>{
        console.info('====>publish ACTS_TerminateSelf_CommonEvent====>');
      });
    }, sendMessageTime)
  }

  onWindowStageCreate(windowStage) {
    console.log('MainAbility2 onWindowStageCreate');
    windowStage.setUIContent(this.context, 'MainAbility/pages/second/second', null);
    globalThis.abilityContext2 = this.context;
    commonEvent.publish('ACTS_InterfaceMultiUsers_0100_Start_CommonEvent', PublishCallBackOne);
  }

  onWindowStageDestroy() {
    console.log('MainAbility onWindowStageDestroy');
  }

  onForeground() {
    console.log('MainAbility onForeground');
  }

  onBackground() {
    console.log('MainAbility onBackground');
  }
};
