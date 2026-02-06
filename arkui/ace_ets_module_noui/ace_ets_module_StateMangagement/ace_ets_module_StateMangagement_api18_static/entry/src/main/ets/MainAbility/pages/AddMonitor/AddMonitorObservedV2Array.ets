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

//array数组类型
@ObservedV2
class ArrayInfo{
  @Trace public arrayValue: int[] = UIUtils.makeObserved([1, 2, 3, 4, 5]);
  public arrayMonitor?: IMonitorDecoratedVariable;
  @Trace public text: string = '';

  constructor() {
    let callbackArray: (() => Any)[] = [];
    for (let index = 0; index < 5; index++) {
      callbackArray.push(() => this.arrayValue[index]);
    }
    this.arrayMonitor = UIUtils.addMonitor(callbackArray, this.onArrayChange, { path: ['Array1','Array2','Array3','Array4','Array5'] });
  }
  onArrayChange(m: IMonitor) {
    m.dirty.forEach((path: string) => {
      console.log(`[addMonitorTest] ${path} value has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`);
      this.text = `[addMonitorTest] ${path} value has changed from ${m.value<int>(path)?.before} to ${m.value<int>(path)?.now}`
    })
  }
}

@Entry
@ComponentV2
struct Page {
  @Local info: ArrayInfo = new ArrayInfo()

  build() {
    Scroll(undefined) {
      Column(undefined) {
        Text('@Observed/@Trace')
          .width('100%')
          .height('5%')
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Pink)
        //监听array数组
        Text(`${this.info.text}`)
          .id('ObservedArray')
          .height('5%')
        Text(`Current number: ${this.info.arrayValue}`)
          .height('5%')
          .width('100%')
          .backgroundColor(0xAFEEEE)
          .textAlign(TextAlign.Center)
        Row(undefined) {
          Button(`Set Array`)
            .id('ObservedArray1')
            .width('30%')
            .height('5%')
            .onClick(() => {
              for (let index = 0; index < 5; index++) {
                this.info.arrayValue[index]++;
              }
            })
          Button(`clear Monitor`)
            .id('ObservedArrayClear')
            .width('30%')
            .height('5%')
            .onClick((e) => {
              UIUtils.clearMonitor(this.info.arrayMonitor!);
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