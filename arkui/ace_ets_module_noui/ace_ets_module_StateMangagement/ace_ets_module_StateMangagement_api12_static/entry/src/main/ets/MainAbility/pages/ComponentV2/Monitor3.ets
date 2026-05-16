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
//被@Param修饰
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
class LogClassParam {
  @Trace logStr: string[] = []
}
let logger:LogClassParam = new LogClassParam()
@Entry
@ComponentV2
struct paramMonitor {
  @Local message: string = 'Tom';
  build() {
    Row(){
      Column(){
        Button('change name').id('param_btn')
          .onClick(():void => {
            this.message = 'Jack'
          })
        paramMonitorChild({
          message: this.message
        })
      }.width('100%')
    }
    .height('100%')
  }
}

@ComponentV2
struct paramMonitorChild {
  @Param message: string = 'Lucy';
  @Monitor(['message'])
  onChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      logger.logStr.push(`param: ${path} change to ${monitor.value<string>(path)?.now}`);
    })
  }
  build() {
    Column() {
      ForEach(logger.logStr,(item:string)=>{
        Text(`${item}`).id('param_mes')
      })
    }
  }
}