'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
//继承场景被@Trace修饰
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,IMonitor,Monitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@ObservedV2
class MonitorObject {
  @Trace name: string;
  constructor(name: string) {
    this.name = name;
  }
}
@ObservedV2
class LogClassTrace {
  @Trace logStr: string[] = []
}
let log:LogClassTrace = new LogClassTrace()
@ObservedV2
class MonitorInfo extends MonitorObject {
  constructor(name: string) {
    super(name); // 关键：调用父类的构造函数，传入必要的参数
  }
  @Monitor(['name'])
  onNameChange(monitor: IMonitor) {
    log.logStr.push(`1-Info name change to ${monitor.value<Any>()?.now}`);
  }
}
@Entry
@ComponentV2
struct extendsMonitor {
  @Local info: MonitorInfo = new MonitorInfo('Tom');
  @Monitor(['info'])
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      log.logStr.push(`2-struct: ${path} change to ${monitor.value<string>(path)?.now}`);
    })
  }
  build() {
    Row(){
      Column(){
        ForEach(log.logStr,(item:string, index:int)=>{
          Text(`${item}`).id('extends_mes_' + index)
        })
        Button('change name').id('extends_btn')
          .onClick(():void => {
            this.info.name = 'Jack'
          })
      }.width('100%')
    }
    .height('100%')
  }
}