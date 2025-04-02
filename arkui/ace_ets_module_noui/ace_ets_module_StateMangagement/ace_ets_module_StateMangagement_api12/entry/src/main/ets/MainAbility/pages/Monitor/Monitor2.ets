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
class Inner {
  @Trace innerT1: number = 0
  @Trace innerT2: number = 0
  @Trace innerT3: number = 0

  @Monitor('innerT1')
  onSingleChange(monitor: IMonitor) {
    testSample.res1 = '测试1：'
  }

  @Monitor('innerT2','innerT3')
  onMultiChange(monitor: IMonitor) {
    testSample.res2 = '测试2：'
  }
}

@ObservedV2
class Outer {
  inner: Inner = new Inner()

  @Monitor('inner.innerT1')
  onSingleChange(monitor: IMonitor) {
    testSample.res1 += "Success"
  }

  @Monitor('inner.innerT2','inner.innerT3')
  onMultiChange(monitor: IMonitor) {
    testSample.res2 += 'Success'
  }
}

@Entry
@Component
struct Monitor2 {
  @State message: string = 'Hello World'
  info: Outer = new Outer()

  build() {
    Row() {
      Column({ space: 10 }) {
        Button(testSample.res1)
          .id('Monitor2_1')
          .onClick(() => {
            this.info.inner.innerT1++
          })
        Button(testSample.res2)
          .id('Monitor2_2')
          .onClick(() => {
            this.info.inner.innerT3++
            this.info.inner.innerT2++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}