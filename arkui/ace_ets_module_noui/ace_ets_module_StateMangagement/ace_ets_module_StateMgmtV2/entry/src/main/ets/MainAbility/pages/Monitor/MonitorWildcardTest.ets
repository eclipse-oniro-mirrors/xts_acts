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

const TAG = '[MonitorWildcardTest]';
const DOMAIN = 0xF811;

@ObservedV2
class Person {
  @Trace public firstName: string = 'first';
  @Trace public lastName: string = 'last';
  constructor(first: string = 'no first', last: string = 'no last') {
    this.firstName = first;
    this.lastName = last;
  }
}

@ObservedV2
class MonitorTestClass {
  @Trace public propA: number = 100;
  @Trace public propB: number = 200;
  @Trace public arr: number[] = [1, 2, 3];
  @Trace public map: Map<string, string> = new Map<string, string>();
  @Trace public set: Set<string> = new Set<string>();
  @Trace public date: Date = new Date();
  @Trace public person: Person = new Person();

  @Trace public monitorCallbackCount: number = 0;
  @Trace public monitorDirtyPaths: string[] = [];

  @Monitor({ enableWildcard: true }, 'propA')
  onPropAChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    hilog.info(DOMAIN, TAG, `onPropAChange called, count: ${this.monitorCallbackCount}`);
  }

  @Monitor({ enableWildcard: true }, 'propB')
  onPropBChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    hilog.info(DOMAIN, TAG, `onPropBChange called, count: ${this.monitorCallbackCount}`);
  }

  @Monitor({ enableWildcard: true }, 'arr.*')
  onArrWildcardChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    this.monitorDirtyPaths = monitor.dirty;
    hilog.info(DOMAIN, TAG, `onArrWildcardChange called, dirty: ${monitor.dirty.toString()}`);
  }

  @Monitor({ enableWildcard: true }, 'map.*')
  onMapWildcardChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    this.monitorDirtyPaths = monitor.dirty;
    hilog.info(DOMAIN, TAG, `onMapWildcardChange called, dirty: ${monitor.dirty.toString()}`);
  }

  @Monitor({}, 'set.*')
  onSetWildcardChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    this.monitorDirtyPaths = monitor.dirty;
    hilog.info(DOMAIN, TAG, `onSetWildcardChange called, dirty: ${monitor.dirty.toString()}`);
  }

  @Monitor({}, 'date.*')
  onDateWildcardChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    this.monitorDirtyPaths = monitor.dirty;
    hilog.info(DOMAIN, TAG, `onDateWildcardChange called, dirty: ${monitor.dirty.toString()}`);
  }

  @Monitor({ enableWildcard: true }, 'person.*')
  onPersonWildcardChange(monitor: IMonitor) {
    this.monitorCallbackCount++;
    this.monitorDirtyPaths = monitor.dirty;
    hilog.info(DOMAIN, TAG, `onPersonWildcardChange called, dirty: ${monitor.dirty.toString()}`);
  }
}

@Entry
@ComponentV2
struct MonitorWildcardTest {
  @Local monitorTest: MonitorTestClass = new MonitorTestClass();

  build() {
    Column({ space: 10 }) {
      Text('Monitor Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Bold)

      Text(`Callback Count: ${this.monitorTest.monitorCallbackCount}`)
        .id('callback_count_text')
        .height('3%')
      
      Divider().margin({ top: 10, bottom: 10 })

      Text('Array Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Medium)

      Row({ space: 10 }) {
        Button('Push to array')
          .width('40%')
          .height('3%')
          .id('button_array_push')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.arr.push(4);
          })

        Button('Pop from array')
          .width('40%')
          .height('3%')
          .id('button_array_pop')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.arr.pop();
          })
      }

      Divider().margin({ top: 10, bottom: 10 })

      Text('Map Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Medium)

      Row({ space: 10 }) {
        Button('Set to map')
          .width('40%')
          .height('3%')
          .id('button_map_set')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.map.set('key1', 'value1');
          })

        Button('Delete from map')
          .width('40%')
          .height('3%')
          .id('button_map_delete')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.map.delete('key1');
          })
      }

      Divider().margin({ top: 10, bottom: 10 })

      Text('Set Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Medium)

      Row({ space: 10 }) {
        Button('Add to set')
          .width('40%')
          .height('3%')
          .id('button_set_add')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.set.add('item1');
          })

        Button('Delete from set')
          .width('40%')
          .height('3%')
          .id('button_set_delete')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.set.delete('item1');
          })
      }

      Divider().margin({ top: 10, bottom: 10 })

      Text('Date Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Medium)

      Row({ space: 10 }) {
        Button('Set date time')
          .width('40%')
          .height('3%')
          .id('button_date_set')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.date.setTime(1000000);
          })

        Button('Set date milliseconds')
          .width('40%')
          .height('3%')
          .id('button_date_milliseconds')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.date.setMilliseconds(1000);
          })
      }

      Divider().margin({ top: 10, bottom: 10 })

      Text('Person Wildcard Test')
        .height('3%')
        .fontWeight(FontWeight.Medium)

      Row({ space: 10 }) {
        Button('Change firstName')
          .width('40%')
          .height('3%')
          .id('button_person_firstname')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.person.firstName += '+';
          })

        Button('Change lastName')
          .width('40%')
          .height('3%')
          .id('button_person_lastname')
          .onClick(() => {
            this.monitorTest.monitorCallbackCount = 0;
            this.monitorTest.person.lastName += '+';
          })
      }
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
