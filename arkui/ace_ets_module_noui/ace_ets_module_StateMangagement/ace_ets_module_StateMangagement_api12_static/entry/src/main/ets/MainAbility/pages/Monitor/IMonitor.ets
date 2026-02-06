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
  Link,Monitor,
  StorageLink,IMonitor,IMonitorValue,Local
} from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct IMonitor1 {
  private IMonitorValue: IMonitorValue<string> | undefined = undefined
  @Local before: string | undefined = "before";
  @Local now: string | undefined = "now";
  @Local message: string = "Hello World";
  @Local name: string = "Tom";
  @Local age: number = 24;
  @Monitor(["message", "name"])
  onStrChange(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      this.IMonitorValue = monitor.value(path) as IMonitorValue<String>
      this.before = this.IMonitorValue?.before;
      this.now = this.IMonitorValue?.now;
      console.log(`${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`)
    })
  }
  build() {
    Column() {
      Text(this.before).id("IMonitorValue_before")
      Text(this.now).id("IMonitorValue_now")
      Button(this.name).id('IMonitor_button')
        .onClick(():void => {
          console.log('onclick==================')
          this.message += "!";
          this.name = "IMonitor succ";
        })
    }
  }
}