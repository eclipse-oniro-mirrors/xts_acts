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
import Ability from '@ohos.app.ability.UIAbility'

class MySequenceable {
  num: number = 0;
  str: String = "";
  result: String = "";

  constructor(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  setMySequence(num, string, result) {
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel) {
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeString(this.result);
    return true;
  }

  unmarshalling(messageParcel) {
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readString();
    return true;
  }
}

export default class MainAbility extends Ability {
  test2100(data) {
    console.log("SystemCallTest MainAbility test2100 begin");
    let recvData = new MySequenceable(0, '', '');
    data.readParcelable(recvData);
    return new MySequenceable(recvData.num + 1, recvData.str + "Main", recvData.result);
  }

  onCreate(want, launchParam) {
    // Ability is creating, initialize resources for this ability
    console.log("SystemCallTest MainAbility onCreate")
    globalThis.abilityWant = want;
    globalThis.callee = this.callee;
    this.callee.on('test2100', this.test2100);
  }

  onDestroy() {
    // Ability is destroying, release resources for this ability
    console.log("SystemCallTest MainAbility onDestroy")
  }

  onWindowStageCreate(windowStage) {
    // Main window is created, set main page for this ability
    console.log("SystemCallTest MainAbility onWindowStageCreate")
    globalThis.abilityContext = this.context
    windowStage.setUIContent(this.context, "MainAbility/pages/index/index", null)
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    console.log("SystemCallTest MainAbility onWindowStageDestroy")
  }

  onForeground() {
    // Ability has brought to foreground
    console.log("SystemCallTest MainAbility onForeground")
  }

  onBackground() {
    // Ability has back to background
    console.log("SystemCallTest MainAbility onBackground")
  }
};
