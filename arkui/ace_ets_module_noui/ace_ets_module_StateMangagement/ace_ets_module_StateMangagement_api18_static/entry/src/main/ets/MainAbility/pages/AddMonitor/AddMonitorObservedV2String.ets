'use static'

/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable } from '@ohos.arkui.stateManagement';
import { ComponentV2, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, DatePicker, TextAlign, Color } from '@ohos.arkui.component';

@ObservedV2
class User{
  @Trace public name: string = 'Mike';
  public nameMonitor?: IMonitorDecoratedVariable;
  @Trace public text: string = '';

  constructor() {
    this.nameMonitor = UIUtils.addMonitor(() => this.name, this.nameChange, { path: ['name'] });
  }
  nameChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
      this.text = `[addMonitorTest] ${path} has changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local user: User = new User()

  build() {
    Scroll(undefined) {
      Column(undefined) {
        Text('@Observed/@Trace')
          .width('100%')
          .height('5%')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
        //监听string
        Text(`${this.user.text}`)
          .id('ObservedString')
          .height('5%')
        Text(`user name: ${this.user.name}`)
          .height('5%')
          .width('100%')
          .textAlign(TextAlign.Center)
          .backgroundColor(0xAFEEEE)
        Row(undefined) {
          Button('name Jack')
            .id('ObservedStringButton1')
            .height('5%')
            .width('30%')
            .onClick((e) => {
            this.user.name = 'Jack'
          })
          Button('name Lucky')
            .id('ObservedStringButton2')
            .height('5%')
            .width('30%')
            .onClick((e) => {
            this.user.name = 'Lucky'
          })
          Button(`clear Monitor`)
            .id('ObservedClear2')
            .height('5%')
            .width('30%')
            .onClick((e) => {
            UIUtils.clearMonitor(this.user.nameMonitor!);
            console.info('[addMonitorTest]:clearMonitor success')
          })
        }
        Divider(undefined)
      }
    }
    .width('100%')
    .height('100%')
  }
}