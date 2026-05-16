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


import { PersistenceV2, Type } from '@kit.ArkUI';


PersistenceV2.notifyOnError((key: string, reason: string, msg: string, oldValue?: string) => {
  console.info(`[PersistenceV2_notifyOnError] callback called: key=${key}, reason=${reason}, msg=${msg}, oldValue=${oldValue}`);
  AppStorage.setOrCreate<string>('PersistenceV2_notifyOnError_oldValue', oldValue === undefined ? 'isUndefined': oldValue)
});

@ObservedV2
class SampleChildOldValue {
  @Trace public id: number | null = null;
  @Trace public count: number = 10;
}

@ObservedV2
class SampleOldValue {
  @Type(SampleChildOldValue)
  @Trace public sampleChild: SampleChildOldValue = new SampleChildOldValue();
}

@Entry
@ComponentV2
struct PersistenceV2NotifyOnErrorTest {
  @Local refresh: number = 0;
  @Local p: SampleOldValue = PersistenceV2.connect(SampleOldValue, 'SampleOld', () => new SampleOldValue())!;

  build() {
    Column({ space: 5 }) {
      Text('Key connectSample: ' + this.p.sampleChild.count.toString())
        .id('PersistenceV2NotifyOnErrorTest_01')

    }
    .width('100%')
  }
}