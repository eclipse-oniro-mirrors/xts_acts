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
import { TestSample, Info } from './Monitor1'

let testSample = new TestSample()
const t2Str: string = 't2'

enum ENUM {
  T3 = 't3'
}

@ObservedV2
class ChildInfo extends Info {
  @Monitor(t2Str)
  onT2Change(monitor: IMonitor) {
    testSample.res1 = "测试1：Success"
  }

  @Monitor(ENUM.T3)
  onT3Change(monitor: IMonitor) {
    testSample.res2 = "测试2：Success"
  }
}

@Entry
@Component
struct Monitor5 {
  @State message: string = "Hello World"
  info: ChildInfo = new ChildInfo()

  build() {
    Row() {
      Column({ space: 10 }) {
        Button(testSample.res1)
          .id('Monitor5_1')
          .onClick(() => {
            this.info.t2++
          })
        Button(testSample.res2)
          .id('Monitor5_2')
          .onClick(() => {
            this.info.t3 += 'a'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}