/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct CacheMaxCountForHSPParamIndex {

  build() {
    Column() {
      Button('param = 0')
        .id('btn_param0')
        .height('5%')
        .width('100%')
        .onClick(()=>{
          try {
            let count = 0
            UIContext.setResourceManagerCacheMaxCountForHSP(count);
            AppStorage.SetOrCreate('setResourceManagerCacheMaxCountForHSP0', 0);
            console.log('setResourceManagerCacheMaxCountForHSP0 success')
          } catch (e) {
            console.log('setResourceManagerCacheMaxCountForHSP0 fail')
          }
        })
      Button('param = 100000000')
        .id('btn_param100000000')
        .height('5%')
        .width('100%')
        .onClick(()=>{
          try {
            let count = 100000000
            UIContext.setResourceManagerCacheMaxCountForHSP(count);
            AppStorage.SetOrCreate('setResourceManagerCacheMaxCountForHSP10', 100000000);
            console.log('setResourceManagerCacheMaxCountForHSP10 success')
          } catch (e) {
            console.log('setResourceManagerCacheMaxCountForHSP10 fail')
          }
        })
      Button('param = 100000001')
        .id('btn_param100000001')
        .height('5%')
        .width('100%')
        .onClick(()=>{
          try {
            let count = 100000001
            UIContext.setResourceManagerCacheMaxCountForHSP(count);
            AppStorage.SetOrCreate('setResourceManagerCacheMaxCountForHSP101', 100000001);
            console.log('setResourceManagerCacheMaxCountForHSP101 success')
          } catch (e) {
            console.log('setResourceManagerCacheMaxCountForHSP101 fail')
          }
        })
    }
    .height('100%')
  }
}