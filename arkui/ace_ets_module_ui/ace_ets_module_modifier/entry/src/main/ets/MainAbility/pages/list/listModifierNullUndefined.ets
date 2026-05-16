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
import { ListModifier } from '@ohos.arkui.modifier';

class MyListModifier extends ListModifier {
  applyNormalAttribute(instance: ListAttribute | null | undefined): void {
    AppStorage.setOrCreate('ListAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct ListModifierNullUndefined {
  @State modifier: MyListModifier = new MyListModifier()

  build() {
    Row() {
      Column() {
        // ========== ListModifier null and undefined tests ==========
        Text('ListModifier')

        // Test applyNormalAttribute with null
        Button('ListModifier null')
          .id('btn_listModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('ListModifier setNull: ' + AppStorage.get('ListAttributeNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('ListModifier undefined')
          .id('btn_listModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('ListModifier setUndefined: ' + AppStorage.get('ListAttributeNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}