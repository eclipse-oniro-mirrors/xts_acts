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
import { TestSample } from './Monitor1'

let testSample = new TestSample()

@ObservedV2
class Base {
  @Trace baseNum: number = 100

  @Monitor('baseNum')
  onBaseChange(monitor: IMonitor) {
    testSample.res1 = '测试1：'
  }
}

@ObservedV2
class Derived extends Base {
  @Monitor('baseNum')
  onDerivedChange(monitor: IMonitor) {
    testSample.res1 += "Success"
  }
}

@Entry
@Component
struct Monitor4 {
  @State message: string = "Hello World"
  derived: Derived = new Derived()

  build() {
    Row() {
      Column() {
        Button(testSample.res1)
          .id('Monitor4_1')
          .onClick(() => {
            this.derived.baseNum++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}