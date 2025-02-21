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
export class TestSample {
  @Trace logRecord: string[] = []
  @Trace res1: string = '测试1：fail'
  @Trace res2: string = '测试2：fail'
  @Trace res3: string = '测试3：fail'
  @Trace res4: string = '测试4：fail'
  @Trace res5: string = '测试5：fail'
}

let testSample: TestSample = new TestSample()

@ObservedV2
export class Info {
  @Trace t1: number = 0
  @Trace t2: number = 0
  @Trace t3: string = ''
  n1: number = 0
  n2: number = 0
  n3: string = ''

  @Monitor('t1')
  onSingleChange(monitor: IMonitor) {
    testSample.res1 = '测试1：Success'
  }

  @Monitor('t2','t3')
  onMultiChange(monitor: IMonitor) {
    testSample.res2 = '测试2：Success'
  }

  @Monitor('n1')
  onWrongSingleChange(monitor: IMonitor) {
    testSample.res3 = '测试2：Success'
  }
}

@Entry
@Component
struct Monitor1 {
  @State message: string = 'Hello World'
  info: Info = new Info()

  build() {
    Row() {
      Column({ space: 10 }) {

        Button(testSample.res1)
          .id('Monitor1_1')
          .onClick(() => {
            this.info.t1++
          })
        Button(testSample.res2)
          .id('Monitor1_2')
          .onClick(() => {
            this.info.t2++
            this.info.t3 = '123'
          })
        Button(testSample.res3)
          .id('Monitor1_3')
          .onClick(() => {
            this.info.n1++
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}