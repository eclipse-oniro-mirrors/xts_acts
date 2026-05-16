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

import { CommonModifier } from '@kit.ArkUI'

class MyButtonUpdater extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute|null|undefined): void {
    AppStorage.setOrCreate('CommonAttributeNullUndefined', instance);
  }
}

@Entry
@Component
struct ApplyNormalAttributeNullIndex {
  @State modifier: MyButtonUpdater = new MyButtonUpdater()

  build() {
    Row() {
      Column() {
        // Test applyNormalAttribute with null
        Button('attributeModifier null')
          .id('btn_commonModifier_null')
          // .attributeModifier(this.modifier)
          .onClick(() => {
            this.modifier.applyNormalAttribute(null);
          })
        // Test applyNormalAttribute with undefined
        Button('attributeModifier undefined')
          .id('btn_commonModifier_undefined')
          // .attributeModifier(this.modifier)
          .onClick(() => {
            this.modifier.applyNormalAttribute(undefined);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}