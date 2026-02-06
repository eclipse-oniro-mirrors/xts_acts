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

import { AbilityConstant, common, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit';
import commonEvent from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';

let ON_CREATE = 'on_Create';
let CALL_BACK = 'call_back';
let tag = 'SystemAppB_SecondAbility11'
let ON_SECOND_RELEASE_BACK = 'ON_Second_Release_BacK';
let CALLER_ENTER = 'call_enter';

export default class SecondAbility14 extends UIAbility {
  testCall(data: rpc.MessageSequence){
    let recvSequence = new MySequenceable(0, '', '');
    console.log('======>SystemAppCalleeA SecondAbility14 on testCall <======')
    data.readParcelable(recvSequence);
    let result = recvSequence.getStr();
    console.log('SystemAppCalleeA export default class SecondAbility14  data===' + JSON.stringify(result));
    let commonEventData: commonEvent.CommonEventPublishData = {
      parameters: {
        data: result,
      }
    };
    commonEvent.publish(CALL_BACK, commonEventData, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `ON_ERROR_BACK publish err:  ${JSON.stringify(err)}`);
    });
    return recvSequence;
  }

  releaseSecondCallback(data: string){
    console.info('====>' + 'SecondAbility14= releaseCallBack:==' + data);
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    commonEvent.publish(ON_CREATE, (err) => {
      hilog.info(0x0000, tag, '%{public}s', `on_Create publish err:  ${JSON.stringify(err)}`);
    });
    let result = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_2300';
    let wantInfo: Want = {
      bundleName: 'com.acts.systemappa',
      abilityName: 'MainAbility14B',
    };
    let param = new MyParcelable(100, result, false);
    try {
      this.context.startAbilityByCall(wantInfo).then((caller) => {
        if (caller) {
          commonEvent.publish(CALLER_ENTER, (err) => {
            hilog.info(0x0000, tag, '%{public}s',
              `ON_ERROR_BACK SecondAbility14 publish CALLER_ENTER err:  ${JSON.stringify(err)}`);
          });
        }
        console.log('SystemAppCalleeA export default class SecondAbility14  startAbilityByCall' +
        JSON.stringify(caller));
        caller.call('testb', param).then((data1) => {
          console.log('SystemAppCalleeA export default class SecondAbility14  release==' + JSON.stringify(data1));
          caller.onRelease(this.releaseSecondCallback);
          try {
            caller.release();
            let commonEventData: commonEvent.CommonEventPublishData = {
              parameters: {
                data: result,
              }
            };
            commonEvent.publish(ON_SECOND_RELEASE_BACK, commonEventData, (err) => {
              hilog.info(0x0000, tag, '%{public}s',
                `ON_ERROR_BACK SecondAbility14 publish err:  ${JSON.stringify(err)}`);
            });
          } catch (e) {
          }
        });
        console.log('SystemAppCalleeA export default class SecondAbility14  release==');
      });
    } catch (err) {
      let code = (err as BusinessError).code;
      let message = (err as BusinessError).message;
      console.log('SystemAppCalleeA MainAbility14 startAbilityByCall err==' + JSON.stringify(err));
      console.log('SystemAppCalleeA MainAbility14 startAbilityByCall code==' + JSON.stringify(code));
      console.log('SystemAppCalleeA MainAbility14 startAbilityByCall message==' + JSON.stringify(message));
    }
    this.callee.on('testa', this.testCall);
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
    return this.result;
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
    return this.result;
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
