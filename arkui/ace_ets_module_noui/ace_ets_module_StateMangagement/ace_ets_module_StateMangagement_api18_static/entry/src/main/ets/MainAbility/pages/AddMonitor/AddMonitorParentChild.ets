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
import { UIUtils, Local, Trace, ObservedV2, IMonitor, IMonitorDecoratedVariable, Param, Event, Link, Require } from '@ohos.arkui.stateManagement';
import { ComponentV2, Entry, Column, Row, Button, Scroll, ForEach, Text, Divider, DatePicker, TextAlign, Margin, Color } from '@ohos.arkui.component';

@Entry
@ComponentV2
struct ParentComponent {
  @Local public message: string = 'Hello from Parent'
  messageMonitor?: IMonitorDecoratedVariable;
  @Local public value: number = 1
  @Local public parentText: string = '';

  aboutToAppear(): void {
    this.messageMonitor = UIUtils.addMonitor(() => this.message, this.messageChange, { path: ['ParentComponent'] });
  }
  messageChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} message changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
      this.parentText = `[addMonitorTest] ${path} message changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`
    });
  }

  build() {
    Column() {
      Text(this.parentText)
        .id('ParentText')
        .height('5%')
      Text(this.message)
        .fontSize(30)
        .height('5%')
      Button('Parent Button')
        .id('ParentButton')
        .height('5%')
        .margin({ bottom: 10 } as Margin)
        .onClick((e) => {
          this.value ++ // 触发事件
          this.message = `Parent Value: ${this.value}`
        })
      Button('ClearMonitor')
        .id('ClearParentMonitor')
        .height('5%')
        .margin({ bottom: 10 } as Margin)
        .onClick((e) => {
          UIUtils.clearMonitor(this.messageMonitor!);
          console.info('[addMonitorTest]:clearMonitor success')
        })
      Text(`Parent Value: ${this.value}`)
        .height('5%')
      Divider()
      // 子组件实例
      ChildComponent({
        childMsg : this.message,
        childValue : this.value,
        onChildEvent: (msg: string) => {
          this.message = msg // 接收子组件事件
        }
      })
      Divider()
    }
  }
}

// 子组件
@ComponentV2
struct ChildComponent {
  @Require @Param public childValue: number = 0
  @Require @Param public childMsg: string = ''// 父组件传入
  @Event onChildEvent: (msg: string) => void // 定义事件

  childValueMonitor?: IMonitorDecoratedVariable;
  childMsgMonitor?: IMonitorDecoratedVariable;
  @Local public childText: string = '';

  aboutToAppear(): void {
    this.childValueMonitor = UIUtils.addMonitor(() => this.childValue, this.childValueChange, { path: ['ChildComponent'] });
    this.childMsgMonitor = UIUtils.addMonitor(() => this.childMsg, this.childMsgChange, { path: ['ChildComponent'] });
  }
  childValueChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} childValue changed from ${m.value<number>(path)?.before} to ${m.value<number>(path)?.now}`);
    });
  }

  childMsgChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} childMsg changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
      this.childText = (`[addMonitorTest] ${path} childMsg changed from ${m.value<string>(path)?.before} to ${m.value<string>(path)?.now}`);
    });
  }

  build() {
    Column() {
      Text(`${this.childText}`).id('ChildText').height('5%')
      Text(`Child Value: ${this.childValue}`)
        .height('5%')
      Text(this.childMsg)
        .height('5%')
      Button('Child Button').id('ChildButton')
        .margin({ bottom: 10 } as Margin)
        .height('5%')
        .onClick((e) => {
          console.log(this.childValue)
          this.onChildEvent('Message from Child') // 触发事件
        })
      Button('ClearChildMonitor')
        .margin({ bottom: 10 } as Margin)
        .height('5%')
        .onClick((e) => {
          UIUtils.clearMonitor(this.childValueMonitor!);
          console.info('[addMonitorTest]:clearMonitor success')
        })
      Button('ClearChildMsgMonitor').id('ClearChildMonitor')
        .margin({ bottom: 10 } as Margin)
        .height('5%')
        .onClick((e) => {
          UIUtils.clearMonitor(this.childMsgMonitor!);
          console.info('[addMonitorTest]:clearMonitor success')
        })
    }
    .width('100%')
    .height('100%')
  }
}

