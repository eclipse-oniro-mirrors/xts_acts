/**
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIUtils } from '@kit.ArkUI';

@ObservedV2
class Person {
  @Trace public firstName: string = 'John';
  @Trace public lastName: string = 'Doe';
}

@Entry
@ComponentV2
struct AddMonitorWildcardTest {
  @Local callbackCount: number = 0;
  @Local arr: string[] = ['a', 'b', 'c'];
  @Local map: Map<string, string> = new Map<string, string>();
  @Local set: Set<string> = new Set<string>();
  @Local date: Date = new Date();
  @Local person: Person = new Person();

  onArrayChange(monitor: IMonitor) {
    this.callbackCount++;
    hilog.info(0xF811, 'AddMonitorWildcardTest', 'Array callback triggered, count: %{public}d', this.callbackCount);
  }

  onMapChange(monitor: IMonitor) {
    this.callbackCount++;
    hilog.info(0xF811, 'AddMonitorWildcardTest', 'Map callback triggered, count: %{public}d', this.callbackCount);
  }

  onSetChange(monitor: IMonitor) {
    this.callbackCount++;
    hilog.info(0xF811, 'AddMonitorWildcardTest', 'Set callback triggered, count: %{public}d', this.callbackCount);
  }

  onDateChange(monitor: IMonitor) {
    this.callbackCount++;
    hilog.info(0xF811, 'AddMonitorWildcardTest', 'Date callback triggered, count: %{public}d', this.callbackCount);
  }

  onPersonChange(monitor: IMonitor) {
    this.callbackCount++;
    hilog.info(0xF811, 'AddMonitorWildcardTest', 'Person callback triggered, count: %{public}d', this.callbackCount);
  }

  aboutToAppear(): void {
    UIUtils.addMonitor(this, 'arr.*', this.onArrayChange, { enableWildcard: true });
    UIUtils.addMonitor(this, 'map.*', this.onMapChange, { enableWildcard: true });
    UIUtils.addMonitor(this, 'set.*', this.onSetChange, { enableWildcard: true });
    UIUtils.addMonitor(this, 'date.*', this.onDateChange, { enableWildcard: true });
    UIUtils.addMonitor(this, 'person.*', this.onPersonChange, { enableWildcard: true });
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
        Text('AddMonitor Wildcard Test')
          .height('3%')
          .fontWeight(FontWeight.Bold)

        Text(`Callback Count: ${this.callbackCount}`)
          .height('3%')
          .id('callback_count_text')

        Button('Reset Count')
          .id('button_reset_count')
          .height('3%')
          .onClick(() => {
            this.callbackCount = 0;
          })

        Button('Array Push')
          .id('button_array_push')
          .height('3%')
          .onClick(() => {
            this.arr.push('d');
          })

        Button('Array Pop')
          .id('button_array_pop')
          .height('3%')
          .onClick(() => {
            this.arr.pop();
          })

        Button('Map Set')
          .id('button_map_set')
          .height('3%')
          .onClick(() => {
            this.map.set('key1', 'value1');
          })

        Button('Map Delete')
          .id('button_map_delete')
          .height('3%')
          .onClick(() => {
            this.map.delete('key1');
          })

        Button('Set Add')
          .id('button_set_add')
          .height('3%')
          .onClick(() => {
            this.set.add('item1');
          })

        Button('Set Delete')
          .id('button_set_delete')
          .height('3%')
          .onClick(() => {
            this.set.delete('item1');
          })

        Button('Date SetTime')
          .id('button_date_set')
          .height('3%')
          .onClick(() => {
            this.date.setTime(1000000);
          })

        Button('Date SetMilliseconds')
          .id('button_date_milliseconds')
          .height('3%')
          .onClick(() => {
            this.date.setMilliseconds(1000);
          })

        Button('Person FirstName')
          .id('button_person_firstname')
          .height('3%')
          .onClick(() => {
            this.person.firstName = 'Jane';
          })

        Button('Person LastName')
          .id('button_person_lastname')
          .height('3%')
          .onClick(() => {
            this.person.lastName = 'Smith';
          })
      }
      .padding(20)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
