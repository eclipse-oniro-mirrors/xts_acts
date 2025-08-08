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
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { rpc } from '@kit.IPCKit';

export default class MainAbility25 extends UIAbility{
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void>{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    let wantData: string = want?.parameters?.data as string
    console.log('want__' + wantData);

    await sleep(1000);
    try{
      let want: Want = {
        deviceId: '',
        bundleName: 'com.acts.systemappb',
        abilityName: 'SecondAbility25',
        parameters: {
          // 'ohos.aafwk.param.callAbilityToForeground': true,// 前台启动 SecondAbility
          data: wantData
        }
      };
      await this.context.startAbilityByCall(want)
        .then(async (caller: Caller) =>{
          if (caller == undefined || caller == null){
            hilog.info(0x0000, 'testTag', '%{public}s', `get caller error`);
          } else{
            hilog.info(0x0000, 'testTag', '%{public}s', `get caller success`);
            try{

              await sleep(1000);
              let method = 'call_Function';
              let msg = new MyMessageAble('msg', wantData);
              caller.callWithResult(method, msg)
                .then(async (data: rpc.MessageSequence) =>{
                  console.log('Caller callWithResult() called' + JSON.stringify(data));
                  let retmsg = new MyMessageAble('msgBackGet', '');
                  data.readParcelable(retmsg); // 从MessageSequence实例中读取成员变量到指定的对象（retmsg）

                  console.log(`testTag__name:${retmsg.getName()}——str:${retmsg.getStr()}`);

                  caller.onRelease((str) =>{
                    console.log(`Caller OnRelease CallBack is called ${str}`);

                    let commonEventPublishData: commonEventManager.CommonEventPublishData = {
                      parameters: {
                        data: retmsg.getStr()
                      }
                    };
                    commonEventManager.publish('MainAbility_releaseCallBack', commonEventPublishData, async (error) =>{
                      hilog.info(0x0000, 'testTag1', '%{public}s', `calleeOn publish: ${JSON.stringify(error)}`);

                      await sleep(500);
                      this.context.terminateSelf((err: BusinessError) =>{
                        if (err.code) {
                          // 处理业务逻辑错误
                          hilog.info(0x0000, 'testTag1', '%{public}s', `terminateSelf failed, code is ${err.code}, message is ${err.message}`);
                          return;
                        }
                        // 执行正常业务
                        hilog.info(0x0000, 'testTag1', '%{public}s', `terminateSelf succeed`);
                      })
                    })
                  })
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
      //done();
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
  private name: string
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

  // 将此可序列对象封送到MessageSequence中。
  marshalling(messageSequence: rpc.MessageSequence){
    messageSequence.writeInt(this.num); // 将整数值写入MessageSequence实例
    messageSequence.writeString(this.str);
    console.log(`MyMessageAble marshalling num[${this.num}] str[${this.str}] name[${this.name}]`);
    return true;
  }

  // 从MessageSequence中解封此可序列对象。
  unmarshalling(messageSequence: rpc.MessageSequence){
    this.num = messageSequence.readInt(); // 从MessageSequence实例读取整数值。
    this.str = messageSequence.readString();
    console.log(`MyMessageAble unmarshalling num[${this.num}] str[${this.str}]`);
    return true;
  }
}