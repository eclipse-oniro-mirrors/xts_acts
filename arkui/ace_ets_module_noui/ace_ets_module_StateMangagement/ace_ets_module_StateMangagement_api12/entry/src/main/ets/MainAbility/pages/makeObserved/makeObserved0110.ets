/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
import { collections } from '@kit.ArkTS';
import { UIUtils } from '@kit.ArkUI';
import { LengthMetrics } from '@kit.ArkUI';

class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  public isDark: boolean = false

  applyNormalAttribute(instance: ButtonAttribute): void {
    if (this.isDark) {
      instance.backgroundColor(Color.Black)
    } else {
      instance.backgroundColor(Color.Red)
    }
  }
}

@Entry
@ComponentV2
struct makeObserved0110 {
  modifier: MyButtonModifier = UIUtils.makeObserved(new MyButtonModifier())

  build() {
    Row() {
      Column() {
        Button('Button')
          .attributeModifier(this.modifier)
          .onClick(() => {
            this.modifier.isDark = !this.modifier.isDark
          })
          .id('buttonTest')
      }
    }
  }
}
