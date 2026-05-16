/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { AttributeUpdater } from '@kit.ArkUI'

class MyButtonUpdater extends AttributeUpdater<ButtonAttribute> {
  isDark: boolean = false
  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
    } else {
      instance.backgroundColor(Color.Red)
    }
  }
}

@Entry
@Component
struct updaterIndex {
  @State modifier: MyButtonUpdater = new MyButtonUpdater()
  @State ret: string  = '0'

  build() {
    Row() {
      Column() {
        Text(this.ret).id('applyNormalAttribute_value_id')
        Button('Button')
          .id('applyNormalAttribute_btn_id')
          .attributeModifier(this.modifier)
          .onClick(() => {
            this.modifier.isDark = !this.modifier.isDark
            this.ret = this.modifier.isDark + '';
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}