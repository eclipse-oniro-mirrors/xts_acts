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
import { AppStorageV2 } from '@ohos.arkui.StateManagement';
import router from '@ohos.router';
@ObservedV2
export class SampleApp {
  @Trace p1: number = 0;
}

@Entry
@ComponentV2
struct AppStorageV2Page1 {
  // 在AppStorageV2中创建一个key为SampleApp的键值对（如果存在，则返回AppStorageV2中的数据），并且和prop关联
  @Local prop: SampleApp = AppStorageV2.connect(SampleApp, () => new SampleApp())!;

  build() {
    Column() {
      Button('Go to page2')
        .id('router_persistenceV2')
        .height('5%')
        .onClick(() => {
          router.pushUrl({
            url: 'MainAbility/pages/Storage/persistenceV2'
          })
        })
      Button('connect the key SampleApp')
        .id('appStorageV2_connect')
        .height('5%')
        .onClick(() => {
          // 在AppStorageV2中创建一个key为SampleApp的键值对（如果存在，则返回AppStorageV2中的数据），并且和prop关联
          this.prop = AppStorageV2.connect(SampleApp, 'SampleApp', () => new SampleApp())!;
        })

      Button('remove the key SampleApp')
        .id('appStorageV2_remove')
        .height('5%')
        .onClick(() => {
          // 从AppStorageV2中删除后，prop将不会再与key为SampleApp的值关联
          AppStorageV2.remove(SampleApp);
        })

      Button('Clear Create keys')
        .id('btnAppStorageV2ClearKeys')
        .height('5%')
        .onClick(()=>{
          AppStorage.setOrCreate<Array<string>>('AppStorageV2Keys', AppStorageV2.keys());
          if (AppStorageV2.keys().includes('SampleApp')) {
            AppStorageV2.remove('SampleApp')
          }
          AppStorage.setOrCreate<Array<string>>('AppStorageV2KeysEmpty', AppStorageV2.keys());
          AppStorage.setOrCreate<undefined | SampleApp>('AppStorageV2Connect001', AppStorageV2.connect(SampleApp, ''));

        })

      Text(`prop.p1: ${this.prop.p1}`)
        .id('appStorageV2_num')
        .height('5%')
        .onClick(() => {
          this.prop.p1 += 2;
        })

      // 获取当前AppStorageV2里面的所有key
      Text(`keys in AppStorage: ${AppStorageV2.keys()}`)
        .id('appStorageV2_keys')
        .height('5%')
        .fontSize(9)
    }
  }
}