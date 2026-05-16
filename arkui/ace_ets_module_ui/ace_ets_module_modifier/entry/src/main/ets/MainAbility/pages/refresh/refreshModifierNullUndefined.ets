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
import { RefreshModifier } from '@ohos.arkui.modifier';

class MyRefreshModifier extends RefreshModifier {
  applyNormalAttribute(instance: RefreshAttribute | null | undefined): void {
    AppStorage.setOrCreate('RefreshAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct RefreshModifierNullUndefined {
  @State modifier: MyRefreshModifier = new MyRefreshModifier()

  build() {
    Row() {
      Column() {
        // ========== RefreshModifier null and undefined tests ==========
        Text('RefreshModifier')

        // Test applyNormalAttribute with null
        Button('RefreshModifier null')
          .id('btn_refreshModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('RefreshModifier setNull: ' + AppStorage.get('RefreshAttributeNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('RefreshModifier undefined')
          .id('btn_refreshModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('RefreshModifier setUndefined: ' + AppStorage.get('RefreshAttributeNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}