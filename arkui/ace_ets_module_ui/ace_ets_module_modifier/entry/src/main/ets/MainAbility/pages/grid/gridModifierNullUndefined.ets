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
import { GridModifier } from '@ohos.arkui.modifier';

class MyGridModifier extends GridModifier {
  applyNormalAttribute(instance: GridAttribute | null | undefined): void {
    AppStorage.setOrCreate('GridAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct GridModifierNullUndefined {
  @State modifier: MyGridModifier = new MyGridModifier()

  build() {
    Row() {
      Column() {
        // ========== GridModifier null and undefined tests ==========
        Text('GridModifier')

        // Test applyNormalAttribute with null
        Button('GridModifier null')
          .id('btn_gridModifier_null')
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
            console.log('GridModifier setNull: ' + AppStorage.get('GridAttributeNullUndefined'))
          })

        // Test applyNormalAttribute with undefined
        Button('GridModifier undefined')
          .id('btn_gridModifier_undefined')
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
            console.log('GridModifier setUndefined: ' + AppStorage.get('GridAttributeNullUndefined'))
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}