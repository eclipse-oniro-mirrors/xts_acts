/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { PersistenceV2, Type } from '@ohos.arkui.StateManagement';

@ObservedV2
class PerSampleChild {
  @Trace public p1: number = 0;
  public p2: number = 10;
}

@ObservedV2
export class PerSample {
  // 对于复杂对象需要@Type修饰，确保序列化成功
  @Type(PerSampleChild)
  @Trace public f: PerSampleChild = new PerSampleChild();
}

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`notifyOnError key: ${key}, reason: ${reason}, message: ${msg}`);
});

@Entry
@ComponentV2
struct PerGlobalConnect {
  @Local perSample: PerSample = PersistenceV2.globalConnect({
    type: PerSample,
    key: 'key_1',
    defaultCreator: () => new PerSample,
    areaMode: 1
  })!
  @Local perSample1: PerSample = PersistenceV2.globalConnect({
    type: PerSample,
    key: 'key_2',
    defaultCreator: () => new PerSample
  })!
  @Local perSample2: PerSample = PersistenceV2.globalConnect({
    type: PerSample,
    defaultCreator: () => new PerSample
  })!
  @Local keys: string = `keys:${PersistenceV2.keys()}`

  build() {
    Row() {
      Button('ClearKeys')
        .id('btnClear')
        .width('50%')
        .height('30%')
        .onClick(() => {
          PersistenceV2.remove(PerSample)
          PersistenceV2.remove('key_1')
          PersistenceV2.remove('key_2')
        })

      // 获取当前PersistenceV2里面的所有key
      Text(this.keys)
        .id('tvKeys')
        .width('50%')
        .height('30%')
        .onClick(() => {
          this.keys = `keys:${PersistenceV2.keys()}`
        })
    }
  }
}