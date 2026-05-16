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
import { ListItemModifier } from '@ohos.arkui.modifier';

class MyListItemModifier extends ListItemModifier {
  applyNormalAttribute(instance: ListItemAttribute | null | undefined): void {
    AppStorage.setOrCreate('ListItemAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct ListItemModifierNullUndefined {
  @State modifier: MyListItemModifier = new MyListItemModifier()

  build() {
    Row() {
      Column() {
        // ========== ListItemModifier null and undefined tests ==========
        Text('ListItemModifier')

        // Test applyNormalAttribute with null
        Button('ListItemModifier null')
          .id('btn_listItemModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('ListItemModifier setNull: ' + AppStorage.get('ListItemAttributeNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('ListItemModifier undefined')
          .id('btn_listItemModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('ListItemModifier setUndefined: ' + AppStorage.get('ListItemAttributeNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}