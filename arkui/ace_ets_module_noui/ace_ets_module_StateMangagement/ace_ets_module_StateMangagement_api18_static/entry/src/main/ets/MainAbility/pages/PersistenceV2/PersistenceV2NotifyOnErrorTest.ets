'use static';
/*
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
import {
  Entry,
  Text,
  Column,
  ComponentV2,
  Button,
  ObservedV2,
  Trace,
  Local,
  UIUtils,
  PersistenceV2,
  AppStorage
} from '@kit.ArkUI';


@ObservedV2
export class SampleChildOldValue {
  @Trace public id: number | null = null;
  @Trace public count: number = 10;
}

@ObservedV2
export class SampleOldValue {
  @Trace public sampleChild: SampleChildOldValue = new SampleChildOldValue();
}

@Entry
@ComponentV2
struct PersistenceV2NotifyOnErrorTest {
  static {
    // 接受序列化失败的回调
    PersistenceV2.notifyOnError((key: string, reason: string, msg: string, oldValue?: string) => {
      console.info(`[PersistenceV2_notifyOnError] callback called: key=${key}, reason=${reason}, msg=${msg}, oldValue=${oldValue}`);
      AppStorage.setOrCreate<string>('PersistenceV2_notifyOnError_oldValue',
        oldValue === undefined ? 'isUndefined' : oldValue)
    });
  }
  @Local refresh: number = 0;
  @Local p?: SampleOldValue =
    PersistenceV2.connect<SampleOldValue>(Class.from<SampleOldValue>(), 'SampleOld', () => new SampleOldValue(), {
      toJson: (a: SampleOldValue) => {
        throw new Error()
      }, fromJson: (b: jsonx.JsonElement) => {
        throw new Error()
      }
    });

  build() {
    Column() {
      Text('Key connectSample: ' + this.p?.sampleChild.count.toString())
        .id('PersistenceV2NotifyOnErrorTest_01')
        .height('5%')

    }
    .width('100%')
  }
}