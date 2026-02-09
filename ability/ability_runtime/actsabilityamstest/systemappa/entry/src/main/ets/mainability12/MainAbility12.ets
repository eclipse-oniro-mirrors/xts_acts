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

let FIRST_RELEASE_BACK = 'first_release_back';
let tag = 'SystemAppA_MainAbility12'

export default class MainAbility12 extends UIAbility {
  sleep(time: number){
    return new Promise<void>((resolve) => setTimeout(resolve, time))
  }

  releaseCallback(data: string){
    console.info('====>' + 'MainAbility11= releaseCallBack:==' + data);
  }

  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let data = want.parameters!['data'] as string;
    console.log('SystemAppCalleeA export default class MainAbility12  data===' + JSON.stringify(data));
    let wantInfo: Want = {
      bundleName: 'com.acts.systemappb',
      abilityName: 'SecondAbility12',
    };
    let wantInfob: Want = {
      bundleName: 'com.acts.systemappb',
      abilityName: 'SecondAbility12b',
      parameters: {
        data: data,
      }
    };
    let param = new MyParcelable(100, data, false);
    try {
      this.context.startAbilityByCall(wantInfo).then(async (caller) => {
        console.log('SystemAppCalleeA export default class MainAbility12  startAbilityByCall' + JSON.stringify(caller));
        let data = await caller.callWithResult('test', param);
        let retMsg = new MySequenceable(0, '', '');
        data.readParcelable(retMsg)
        let result = retMsg.getStr();
        await this.sleep(100);
        await this.context.startAbility(wantInfob);
        await this.sleep(100);
        let data2 = await caller.callWithResult('test2', param);
        let retMsgB = new MySequenceable(0, '', '');
        data2.readParcelable(retMsgB)
        let resultB = retMsgB.getStr();
        caller.onRelease(this.releaseCallback);
        try {
          caller.release();
          let commonEventData: commonEvent.CommonEventPublishData = {
            parameters: {
              data: result,
              data2: resultB,
            }
          };
          commonEvent.publish(FIRST_RELEASE_BACK, commonEventData, (err) => {
            hilog.info(0x0000, tag, '%{public}s', `ON_ERROR_BACK publish err:  ${JSON.stringify(err)}`);
          });
        } catch (e) {
        }
      });
    } catch (e) {
      console.log('SystemAppCalleeA MainAbility11 startAbilityByCall err==' + JSON.stringify(e));
    }
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

class MyParcelable {
  private num: number = 0;
  private str: string = '';
  private result: boolean = false;

  getNum(){
    return this.num;
  }

  getStr(){
    return this.str;
  }

  getResult(){
    return this.result
  }

  constructor(num: number, string: string, result: boolean){
    this.num = num;
    this.str = string;
    this.result = result;
  }

  MyParcelable(num: number, string: string, result: boolean){
    this.num = num;
    this.str = string;
    this.result = result;
  }

  marshalling(messageParcel: rpc.MessageSequence){
    messageParcel.writeInt(this.num);
    messageParcel.writeString(this.str);
    messageParcel.writeBoolean(this.result);
    return true;
  }

  unmarshalling(messageParcel: rpc.MessageSequence){
    this.num = messageParcel.readInt();
    this.str = messageParcel.readString();
    this.result = messageParcel.readBoolean();
    return true;
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





