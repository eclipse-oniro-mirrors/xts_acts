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
struct AddMonitorWildcardUnerfined {
  @Local cls: AddMonitorClass = new AddMonitorClass(100, 100);
  @Local public num1: int = 0;
  monitorHandle?: IMonitorDecoratedVariable;
  onClsChanged(m: IMonitor) {
    this.num1++
  }

  aboutToAppear(): void {
    // 监听cls中的属性变化，设置路径为'cls.*'
    this.monitorHandle = UIUtils.addMonitor({ valueCallback: () => this.cls, observeProps: undefined, path: 'cls.*'}, this.onClsChanged);
  }

  build() {
    Column() {
      Button(`Change propA:${this.cls.propA} num1:${this.num1}`)
        .id('ButtonPropA')
        .height('5%')
        .onClick(() => {
          this.cls.propA += 1; // onClsChanged回调触发
        })
    }
  }
}