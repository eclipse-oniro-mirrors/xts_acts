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
import commonEvent from '@ohos.commonEventManager';

const TAG1 = "Fa:SupportFunction:MainAbility:";
const listPush1 = "Fa_SupportFunction_MainAbility_";
let lifeList: string[] = [];
let lifeListActive: string[] = [];


class MainAbility {
  onCreate() {
    console.log(TAG1 + 'onCreate');
    lifeList.push('onCreate');
    lifeListActive.push('onCreate');
  }
  onDestroy() {
    console.log(TAG1 + 'onDestroy');
  }
  onActive() {
    console.log(TAG1 + 'onActive');
    lifeListActive.push('onActive');

    let options:commonEvent.CommonEventPublishData = {
      parameters: {
        lifeList: lifeListActive
      }
    }
    commonEvent.publish(listPush1 + "onActive", options, (err) => {
      console.log(TAG1 + listPush1 + "onActive");
    });
  }
  onInactive() {
    console.log(TAG1 + 'onInactive');
  }
  onShow() {
    console.log(TAG1 + 'onShow');
  }
  onHide() {
    console.log(TAG1 + 'onHide');
  }
  onNewWant(want: Want) {
    console.log(TAG1 + 'onNewWant');
  }
  onStartContinuation() {
    console.log(TAG1 + 'onStartContinuation');
    return true;
  }
  onSaveData() {
    console.log(TAG1 + 'onSaveData');
    return true;
  }
  onCompleteContinuation(number:number) {
    console.log(TAG1 + 'onCompleteContinuation');
  }
  onRestoreData() {
    console.log(TAG1 + 'onRestoreData');
  }
  onRemoteTerminated() {
    console.log(TAG1 + 'onRemoteTerminated');
  }
  onSaveAbilityState() {
    console.log(TAG1 + 'onSaveAbilityState');
  }
  onRestoreAbilityState() {
    console.log(TAG1 + 'onRestoreAbilityState');
  }
  onMemoryLevel(level:number) {
    console.log(TAG1 + 'onMemoryLevel');
  }
}

export default new MainAbility();