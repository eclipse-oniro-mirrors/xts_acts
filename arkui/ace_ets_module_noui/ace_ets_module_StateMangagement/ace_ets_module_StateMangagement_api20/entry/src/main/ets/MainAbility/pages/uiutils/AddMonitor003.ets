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

import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class ObservedClass003 {
  @Trace public name: string = 'Tom';
  @Trace public title: string = 'Tom';
  @Trace public age: number = 0;
  onChange(mon: IMonitor) {
    mon.dirty.forEach((path: string) => {
      this.age++;
    });
  }

  constructor() {
    UIUtils.addMonitor(this, ['name', 'title'], this.onChange, { isSynchronous: false});
  }
}

@Entry
@ComponentV2
struct AddMonitor003 {
  @Local observedClass: ObservedClass003 = new ObservedClass003();

  build() {
    Column() {
      Text(`${this.observedClass.age}`)
        .height('5%')
        .id('age01')
      Button(`name: ${this.observedClass.name}`)
        .height('5%')
        .id('changeName01')
        .onClick(() => {
          this.observedClass.name = 'Jack';
          this.observedClass.name = 'Jane';
        })
      Button(`clearMonitor01`)
        .height('5%')
        .id('clearMonitor01')
        .onClick(() => {
          UIUtils.clearMonitor(this.observedClass, ['name','title']);
        })
    }
  }
}