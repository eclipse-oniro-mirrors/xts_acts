/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

@ObservedV2
class Monitor0260Class {
  @Trace key: string = 'Tom'
  @Trace index: number = 0
  @Trace val: string = 'Hello'

  @Monitor('key', 'index')
  onChange(monitor: IMonitor) {
    this.val += 'World'
  }
}

@Entry
@ComponentV2
struct Monitor0260 {
  cls: Monitor0260Class = new Monitor0260Class()

  build() {
    Column() {
      Text(this.cls.val)
        .id('tvMonitor0260')
      Button('Click')
        .id('btnMonitor0260')
        .onClick(() => {
          this.cls.key = 'Jack'
          this.cls.index = 30
        })
    }
  }
}