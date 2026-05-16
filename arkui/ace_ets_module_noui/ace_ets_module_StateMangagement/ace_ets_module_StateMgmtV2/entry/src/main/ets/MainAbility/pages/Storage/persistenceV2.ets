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
import { PersistenceV2, Type } from '@ohos.arkui.StateManagement';
import router from '@ohos.router';

@ObservedV2
class PerSampleChild {
  @Trace p1: number = 0;
  p2: number = 10;
}

@ObservedV2
export class PerSample {
  // 对于复杂对象需要@Type修饰，确保序列化成功
  @Type(PerSampleChild)
  @Trace f: PerSampleChild = new PerSampleChild();
}

// 接受序列化失败的回调
PersistenceV2.notifyOnError((key: string, reason: string, msg: string) => {
  console.error(`notifyOnError key: ${key}, reason: ${reason}, message: ${msg}`);
});

@Entry
@ComponentV2
struct PersistenceV2Page1 {
  @Local a: number = 0
  // 在PersistenceV2中创建一个key为PerSample的键值对（如果存在，则返回PersistenceV2中的数据），并且和prop关联
  @Local prop: PerSample = PersistenceV2.connect(PerSample, () => new PerSample())!;

  build() {
    Column() {
      Button('Go to page1')
        .id('router_appStorageV2')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          router.pushUrl({
            url: 'MainAbility/pages/Storage/appStorageV2'
          })
        })
      Button('connect the key PerSample')
        .id('persistenceV2_connect')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 在PersistenceV2中创建一个key为PerSample的键值对（如果存在，则返回PersistenceV2中的数据），并且和prop关联
          // 不建议对prop属性换connect的对象
          try {
            this.prop = PersistenceV2.connect(PerSample, 'PerSample', () => new PerSample())!;
          } catch (err) {
            console.error('PersistenceV2Page1 PersistenceV2.connect error')
          }
        })

      Button('remove the key PerSample')
        .id('persistenceV2_remove')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 从PersistenceV2中删除后，prop将不会再与key为PerSample的值关联
          try {
            PersistenceV2.remove(PerSample);
          } catch (err) {
            console.error('PersistenceV2Page1 PersistenceV2.remove error')
          }
        })

      Button('Clear Create keys')
        .id('btnPersistenceV2ClearKeys')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          try {
            if (PersistenceV2.keys().includes('PerSample')) {
              PersistenceV2.remove('PerSample')
            }
          } catch (err) {
            console.error('PersistenceV2Page1 PersistenceV2 error')
          }
        })

      Button('save the key PerSample')
        .id('persistenceV2_save')
        .width('10%')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          // 如果处于connect状态，持久化key为PerSample的键值对
          try {
            PersistenceV2.save(PerSample);
          } catch (err) {
            console.error('PersistenceV2Page1 PersistenceV2.save error')
          }
        })

      Text(`prop.p1: ${this.prop.f.p1}`)
        .id('persistenceV2_p1')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.prop.f.p1 += 2;
        })

      Text(`prop.p2: ${this.prop.f.p2}a: ${this.a}`)
        .id('persistenceV2_p2')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          //p2不是观察对象，它的变化需要save保存
          this.prop.f.p2++;
          try {
            PersistenceV2.save(PerSample);
          } catch (err) {
            console.error('PersistenceV2Page1 PersistenceV2.save error')
          }
          this.a += 2
        })

      // 获取当前PersistenceV2里面的所有key
      Text(`keys in PersistenceV2: ${PersistenceV2.keys()}`)
        .id('persistenceV2_keys')
        .height('3%')
        .fontSize(9)
    }
  }
}