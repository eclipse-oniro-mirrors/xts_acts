'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Entry, Text, Column, ComponentV2, Button,
  ObservedV2, Trace, Local, Monitor, IMonitor, UIUtils, IMonitorDecoratedVariable } from '@kit.ArkUI';
import hilog from '@ohos.hilog';

@ObservedV2
export class AddMonitorClass {
  @Trace public propA: int = 8;
  @Trace public propB: int = 99;

  constructor(a: int, b: int) {
    this.propA = a;
    this.propB = b;
  }
}

@Entry
@ComponentV2
struct AddMonitorWildcard {
  @Local cls: AddMonitorClass = new AddMonitorClass(100, 100);
  @Local public num: int = 0;
  monitorHandle: IMonitorDecoratedVariable | undefined = undefined;
  onClsChanged(m: IMonitor) {
    this.num++
  }

  aboutToAppear(): void {
    // 监听cls中的属性变化，设置路径为'cls.*'
    this.monitorHandle = UIUtils.addMonitor({ valueCallback: () => this.cls, observeProps: true, path: 'cls.*'}, this.onClsChanged);
  }

  build() {
    Column() {
      Button(`Change propA:${this.cls.propA} num:${this.num}`)
        .id('ButtonChangePropA')
        .height('5%')
        .onClick(() => {
          this.cls.propA += 1; // onClsChanged回调触发
        })
      Button(`Change propB:${this.cls.propB} num:${this.num}`)
        .id('ButtonChangePropB1')
        .height('5%')
        .onClick(() => {
          this.cls.propB += 1; // onClsChanged回调触发
        })
      Button('clear')
        .id('ButtonClear')
        .height('5%')
        .onClick(() => {
          UIUtils.clearMonitor(this.monitorHandle!); // 取消监听
        })
      Button(`Change propB:${this.cls.propB} num:${this.num}`)
        .id('ButtonChangePropB2')
        .height('5%')
        .onClick(() => {
          this.cls.propB += 1; // onClsChanged回调触发
        })
    }
  }
}