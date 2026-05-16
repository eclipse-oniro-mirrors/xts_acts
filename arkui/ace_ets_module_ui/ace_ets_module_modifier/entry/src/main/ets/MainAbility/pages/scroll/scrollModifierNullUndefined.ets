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
import { ScrollModifier } from '@ohos.arkui.modifier';

class MyScrollModifier extends ScrollModifier {
  applyNormalAttribute(instance: ScrollAttribute | null | undefined): void {
    AppStorage.setOrCreate('ScrollAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct ScrollModifierNullUndefined {
  @State modifier: MyScrollModifier = new MyScrollModifier()

  build() {
    Row() {
      Column() {
        // ========== ScrollModifier null and undefined tests ==========
        Text('ScrollModifier')

        // Test applyNormalAttribute with null
        Button('ScrollModifier null')
          .id('btn_scrollModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('ScrollModifier setNull: ' + AppStorage.get('ScrollAttributeNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('ScrollModifier undefined')
          .id('btn_scrollModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('ScrollModifier setUndefined: ' + AppStorage.get('ScrollAttributeNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}