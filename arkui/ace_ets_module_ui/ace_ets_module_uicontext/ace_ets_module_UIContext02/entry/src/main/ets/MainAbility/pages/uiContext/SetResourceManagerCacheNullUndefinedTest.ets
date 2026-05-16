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
import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct SetResourceManagerCacheMaxCountForHSPNullUndefinedTest {
  @State message: string = 'start'

  build() {
    Column() {
      Button('setResourceManagerCacheMaxCountForHSP').id('setResourceManagerCache_null_id')
        .onClick(() => {
          // 测试 setResourceManagerCacheMaxCountForHSP 方法参数为 null 的情况
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(null);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_null', 'error');
          }

          // 测试 setResourceManagerCacheMaxCountForHSP 方法参数为 undefined 的情况
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(undefined);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_undefined', 'error');
          }
        })

    }
    .height('100%')
  }
}
