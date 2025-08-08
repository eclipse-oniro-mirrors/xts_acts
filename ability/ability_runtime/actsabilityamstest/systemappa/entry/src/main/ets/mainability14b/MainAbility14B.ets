/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit';
import commonEvent from '@ohos.commonEventManager';

let ON_SECOND_ACCEPT_VALUE = 'on_second_accept_value';
let tag = 'SystemAppB_MainAbility14B'

export default class MainAbility14B extends UIAbility {
  testCall(data: rpc.MessageSequence){
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA MainAbility14B on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.getStr();
    console.log('======>SystemAppCalleeA MainAbility14B Call_Finish<======' + result);
    let commonEventData: commonEvent.CommonEventPublishData = {
      parameters: {
        data: result,
      }
    };
    commonEvent.publish(ON_SECOND_ACCEPT_VALUE, commonEventData, (err) => {
      hilog.info(0x0000, tag, '%{public}s',
        `SystemAppCalleeA ON_ERROR_BACK MainAbility14B publish err:  ${JSON.stringify(err)}`);
    });
    return recvSequence;
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    this.callee.on('testb', this.testCall)
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

class MySequenceable {
  private num: number = 0;
  private str: string = '';
  private result: string = '';

  getNum(){
    return this.num;
  }

  getStr(){
    return this.str;
  }

  getResult(){
    return this.result
  }

  constructor(num: number, string: string, result: string){
    this.num = num;
    this.str = string;
    this.result = result;
  }

  setMySequence(num: number, string: string, result: string){
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel: rpc.MessageSequence){
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeString(this.result);
    return true;
  }

  unmarshalling(messageParcel: rpc.MessageSequence){
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readString();
    return true;
  }
}

