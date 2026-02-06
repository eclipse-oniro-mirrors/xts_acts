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
import { ComponentV2, Entry, Column, Button, Text, Color, TextAlign } from '@ohos.arkui.component';

@ObservedV2
class Test {
  @Trace public value: int = 5;
  @Trace public text: string = '';
  public valueMonitor?: IMonitorDecoratedVariable;
  constructor() {
    this.valueMonitor = UIUtils.addMonitor(() => this.value, this.onChange);
  }

  onChange(m: IMonitor) {
    console.log(`[addMonitorTest] Callback triggered.`)

    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] value ${path} has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`)
      this.text = `[addMonitorTest] value ${path} has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local obj: Test = new Test();


  aboutToAppear(): void {
    console.log(`[addMonitorTest] Test case begin.`)
  }

  build() {
    Column() {
      Text('开发者不指定path，监听path系统赋默认值')
        .width('100%').height('5%')
        .backgroundColor(Color.Pink)
        .textAlign(TextAlign.Center)
      Text(`${this.obj.text}`)
        .id('text').height('5%')
      Text(`Current array is ${this.obj.value} `)
        .height('5%')
      Button('addMonitor')
        .id('NoPathButton')
        .height('5%')
        .onClick(() => {
          this.obj.value++;
        })
    }
    .width('100%')
    .height('100%')
  }
}