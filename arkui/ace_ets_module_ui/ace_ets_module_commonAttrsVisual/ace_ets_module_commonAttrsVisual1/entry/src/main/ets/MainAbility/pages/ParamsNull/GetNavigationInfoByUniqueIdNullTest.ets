/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct getNavigationInfoByUniqueIdIndex {

  build() {
    Column() {
      Button('getNavigationInfoByUniqueId null')
        .id('btn_getNavigationInfoByUniqueId_null')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.getNavigationInfoByUniqueId(null);
          console.info('getNavigationInfoByUniqueId null success:' + ret);
          AppStorage.SetOrCreate('getNavigationInfoByUniqueIdNull', ret);
        })

      Button('getNavigationInfoByUniqueId undefined')
        .id('btn_getNavigationInfoByUniqueId_undefined')
        .height('10%')
        .onClick(() => {
          let ret = this.getUIContext()?.getNavigationInfoByUniqueId(undefined);
          console.info('getNavigationInfoByUniqueId undefined success:' + ret);
          AppStorage.SetOrCreate('getNavigationInfoByUniqueIdUndefined', ret);
        })
    }
    .width('100%')
    .height('100%')
  }
}