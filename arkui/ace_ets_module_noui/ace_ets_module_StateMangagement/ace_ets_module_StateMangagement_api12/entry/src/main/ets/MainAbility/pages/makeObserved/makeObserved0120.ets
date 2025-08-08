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
import { CommonModifier } from '@ohos.arkui.modifier'

class MyModifier extends CommonModifier {
  applyNormalAttribute(instance: CommonAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  public setGroup1(): void {
    this.borderStyle(BorderStyle.Dotted)
    this.borderWidth(8)
  }

  public setGroup2(): void {
    this.borderStyle(BorderStyle.Dashed)
    this.borderWidth(8)
  }
}

@ComponentV2
struct MyImagel {
  @Param @Require modifier: CommonModifier

  build() {
    Text('1111').attributeModifier(this.modifier as MyModifier).id('imageTest')
  }
}

@Entry
@ComponentV2
struct makeObserved0120 {
  @Local myModifier: CommonModifier = UIUtils.makeObserved(new MyModifier().height('3%'))
  index: number = 0;

  build() {
    Column() {
      Button('change')
        .onClick(() => {
          console.log('Modifier', 'onClick')
          this.index++;
          if (this.index % 2 === 1) {
            (this.myModifier as MyModifier).setGroup1()
            console.log('Modifier', 'setGroup1')
          } else {
            (this.myModifier as MyModifier).setGroup2()
            console.log('Modifier', 'setGroup2')
          }
        }).id('buttonTest')
      MyImagel({ modifier: this.myModifier })
    }
    .width('100%')
  }
}