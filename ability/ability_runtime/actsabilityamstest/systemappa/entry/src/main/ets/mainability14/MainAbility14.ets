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
import rpc from '@ohos.rpc';
import commonEvent from '@ohos.commonEventManager';

let ON_RELEASE_BACK = 'on_Release_Back';
let tag = 'SystemAppA_MainAbility14';
let CALLER_ENTER = 'call_enter';
let enterCallFlag = false;

export default class MainAbility14 extends UIAbility {
  releaseCallback(data: string){
    console.info('====>' + 'MainAbility14= releaseCallBack:==' + data);
  }

  sleep(time: number){
    return new Promise<void>((resolve) => setTimeout(resolve, time))
  }

  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
      events: [CALLER_ENTER],
    };
    let subscriber = await commonEvent.createSubscriber(subscribeInfo);
    commonEvent.subscribe(subscriber, (err, data) => {
      console.log('SystemAppCalleeA export default class MainAbility14  subscribe err===' + JSON.stringify(err));
      console.log('SystemAppCalleeA export default class MainAbility14  subscribe data===' + JSON.stringify(data));
      if (data.event === CALLER_ENTER){
        enterCallFlag = true;
      }
    });
    let data = want.parameters!['data'] as string;
    console.log('SystemAppCalleeA export default class MainAbility14  data===' + JSON.stringify(data));
    let wantInfo: Want = {
      bundleName: 'com.acts.systemappb',
      abilityName: 'SecondAbility14',
    };
    let param = new MyParcelable(100, data, false);
    try {
      this.context.startAbilityByCall(wantInfo).then(async (caller) => {
        console.log('SystemAppCalleeA export default class MainAbility14  startAbilityByCall' + JSON.stringify(caller));
        console.log('SystemAppCalleeA export default class MainAbility14  enterCallFlag===' + enterCallFlag);
        while (!enterCallFlag) {
          console.log('执行操作，参数为1==：', enterCallFlag);
          await this.sleep(50);
          if (enterCallFlag) {
            console.log('执行操作，参数为3==：', enterCallFlag);
            break;
          }
        }
        console.log('SystemAppCalleeA export default class MainAbility14  enterCallFlag=63==' + enterCallFlag);
        caller.call('testa', param).then((data) => {
          console.log('SystemAppCalleeA export default class MainAbility14  release==' + JSON.stringify(data));
          caller.onRelease(this.releaseCallback);
          try {
            caller.release();
            commonEvent.publish(ON_RELEASE_BACK, (err) => {
              hilog.info(0x0000, tag, '%{public}s',
                `ON_ERROR_BACK publish SecondAbility14 err:  ${JSON.stringify(err)}`);
            })
          } catch (e) {
          }
        });
        console.log('SystemAppCalleeA export default class MainAbility14  release==');
      });
    } catch (e) {
      console.log('SystemAppCalleeA MainAbility14 startAbilityByCall err==' + JSON.stringify(e));
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

    setTimeout(() => {
      this.context.terminateSelf();
    }, 1500)
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

