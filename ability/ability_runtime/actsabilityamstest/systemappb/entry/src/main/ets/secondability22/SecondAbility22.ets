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

import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { rpc } from '@kit.IPCKit';
import { commonEventManager } from '@kit.BasicServicesKit';

let method1 = 'call_Function1';
let method2 = 'call_Function2';
let method3 = 'call_Function3';

export default class SecondAbility22 extends UIAbility{
  private index: number;

  constructor(){
    super();
    this.index = 1;
  }

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void{
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    this.callee.on(method1, this.funcCallBack.bind(this));

    this.callee.on(method2, this.funcCallBack.bind(this));

    this.callee.on(method3, this.funcCallBack.bind(this));
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

  onForeground(): void{
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void{
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  funcCallBack(pdata: rpc.MessageSequence){
    console.log(`Callee funcCallBack is called ${pdata}`);
    // 获取Caller发送的序列化数据
    let msg = new MyMessageAble('msgBack' + this.index, '');
    pdata.readParcelable(msg); // 从MessageSequence实例中读取成员变量到指定的对象（pdata）
    console.log(`testTag__name:${msg.getName()}——str:${msg.getStr()}——num:${msg.getNum()}`);

    let commonEventPublishData: commonEventManager.CommonEventPublishData ={
      parameters: {
        data: msg.getStr()
      }
    };
    commonEventManager.publish('SecondAbility_calleeOnCallBack_' + this.index, commonEventPublishData,
      async (error) =>{
        hilog.info(0x0000, 'testTag1', '%{public}s', `calleeOn publish: ${JSON.stringify(error)}`);
      })
    if (this.index <= 2){
      this.index++;
      return;
    } else{
      this.index++;
      let backStr: string = msg.getStr() + '_back'
      return new MyMessageAble(msg.getName(), backStr);
    }

  }
}

// 定义约定的序列化数据。 调用端及被调用端发送接收的数据格式需协商一致，如下示例约定数据由name、str和num组成
export class MyMessageAble implements rpc.Parcelable{
  private  name: string
  private  str: string
  private  num: number = 1

  getName(){
    return this.name;
  }

  getStr(){
    return this.str;
  }

  getNum(){
    return this.num;
  }


  constructor(name: string, str: string){
    this.name = name;
    this.str = str;
  }

  marshalling(messageSequence: rpc.MessageSequence){
    messageSequence.writeInt(this.num);
    messageSequence.writeString(this.str);
    console.log(`MyMessageAble marshalling num[${this.num}] str[${this.str}]`);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence){
    this.num = messageSequence.readInt();
    this.str = messageSequence.readString();
    console.log(`MyMessageAble unmarshalling num[${this.num}] str[${this.str}]`);
    return true;
  }
}