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
import { ListItemGroupModifier } from '@ohos.arkui.modifier';

class MyListItemGroupModifier extends ListItemGroupModifier {
  applyNormalAttribute(instance: ListItemGroupAttribute | null | undefined): void {
    AppStorage.setOrCreate('ListItemGroupNullUndefined', instance);
  }
}

@Entry
@Component
struct ListItemGroupModifierNullUndefined {
  @State modifier: MyListItemGroupModifier = new MyListItemGroupModifier()

  build() {
    Row() {
      Column() {
        // ========== ListItemGroupModifier null and undefined tests ==========
        Text('ListItemGroupModifier')

        // Test applyNormalAttribute with null
        Button('ListItemGroupModifier null')
          .id('btn_listItemGroupModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('ListItemGroupModifier setNull: ' + AppStorage.get('ListItemGroupNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('ListItemGroupModifier undefined')
          .id('btn_listItemGroupModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('ListItemGroupModifier setUndefined: ' + AppStorage.get('ListItemGroupNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}