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
class DMS {
  @Trace selectedDate: Date = new Date('2021-08-08');
  @Trace messageMap: Map<number, string> = new Map([[0, "a"], [1, "b"], [3, "c"]]);
  @Trace memberSet: Set<number> = new Set([0, 1, 2, 3, 4]);

  @Monitor('selectedDate')
  onDateChange(monitor: IMonitor) {
    testSample.res1 = "测试1：Success"
  }

  @Monitor('messageMap')
  onMapChange(monitor: IMonitor) {
    testSample.res2 = "测试2：Success"
  }

  @Monitor('memberSet')
  onSetChange(monitor: IMonitor) {
    testSample.res3 = "测试3：Success"
  }
}

@Entry
@Component
struct Monitor6 {
  @State message: string = "Hello World"
  DMS: DMS = new DMS()

  build() {
    Row() {
      Column({ space: 10 }) {
        Button(testSample.res1)
          .id('Monitor6_1')
          .onClick(() => {
            this.DMS.selectedDate.setFullYear(this.DMS.selectedDate.getFullYear() + 1);
          })
        Button(testSample.res2)
          .id('Monitor6_2')
          .onClick(() => {
            this.DMS.messageMap.delete(0);
          })
        Button(testSample.res3)
          .id('Monitor6_3')
          .onClick(() => {
            this.DMS.memberSet.add(5);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}