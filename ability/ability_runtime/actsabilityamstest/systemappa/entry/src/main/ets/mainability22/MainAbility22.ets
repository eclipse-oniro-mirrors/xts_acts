/*
 * Copyright (C) 2024 HiHope Device Co., Ltd.
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

import { AbilityConstant, Caller, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit';
import { commonEventManager } from '@kit.BasicServicesKit';

export default class MainAbility22 extends UIAbility{
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    let wantData: string = want?.parameters?.data as string
    console.log('testTag:' + 'want__' + wantData);

    await sleep(1000);
    try{
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappb',
        abilityName: 'SecondAbility22',
        parameters: {
          //'ohos.aafwk.param.callAbilityToForeground': true, // 前台启动 SecondAbility
          data: wantData
        }
      };
      //await this.context.startAbility(want)
      await this.context.startAbilityByCall(want)
        .then(async (caller: Caller) =>{
          if (caller == undefined || caller == null){
            hilog.info(0x0000, 'testTag', '%{public}s', `get caller error`);
          } else{
            hilog.info(0x0000, 'testTag', '%{public}s', `get caller success`);
            try{
              await sleep(500); // 打开页面2S后发送信息

              let method1 = 'call_Function1';
              let msg1 = new MyMessageAble('msg1', wantData + '_1');

              let method2 = 'call_Function2';
              let msg2 = new MyMessageAble('msg2', wantData + '_2');

              let method3 = 'call_Function3';
              let msg3 = new MyMessageAble('msg3', wantData + '_3');

              caller.call(method1, msg1);

              await sleep(1000);
              caller.call(method2, msg2);

              await sleep(1000);
              caller.callWithResult(method3, msg3)
                .then(async (data: rpc.MessageSequence) =>{
                  console.log('Caller callWithResult() called' + JSON.stringify(data));
                  let retmsg = new MyMessageAble('msg', '');
                  data.readParcelable(retmsg); // 从MessageSequence实例中读取成员变量到指定的对象（retmsg）

                  caller.onRelease((str) =>{
                    console.log(`Caller OnRelease CallBack is called ${str}`);

                    let commonEventPublishData: commonEventManager.CommonEventPublishData ={
                      parameters: {
                        data: retmsg.getStr()
                      }
                    };
                    commonEventManager.publish('MainAbility_releaseCallBack', commonEventPublishData, async (error) => {
                      hilog.info(0x0000, 'testTag1', '%{public}s', `calleeOn publish: ${JSON.stringify(error)}`);
                    })
                  });
                  await sleep(1000);
                  caller.release();
                })
            } catch (error){
              console.error(`Caller.on catch error, error.code: ${error.code}, error.message: ${error.message}`);
            }
          }
        })
    } catch (error){
      hilog.info(0x0000, 'testTag', '%{public}s',
        `start SecondAbility fail : ${error}__code: ${error.code}`);
    }

  }

  onDestroy(): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void{
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err) =>{
      if (err.code){
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void{
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  async onForeground(): Promise<void>{
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');

  }

  onBackground(): void{
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export class MyMessageAble implements rpc.Parcelable{
  private  name: string
  private str: string
  private num: number = 1

  constructor(name: string, str: string){
    this.name = name;
    this.str = str;
  }
  getName(){
    return this.name;
  }

  getStr(){
    return this.str;
  }

  marshalling(messageSequence: rpc.MessageSequence){
    messageSequence.writeInt(this.num); // 将整数值写入MessageSequence实例
    messageSequence.writeString(this.str);
    console.log(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence){
    this.num = messageSequence.readInt(); // 从MessageSequence实例读取整数值。
    this.str = messageSequence.readString();
    console.log(`MyMessageAble unmarshalling num[${this.num}] str[${this.str}]`);
    return true;
  }
}