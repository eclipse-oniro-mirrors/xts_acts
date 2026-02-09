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
import { TextModifier } from '@ohos.arkui.modifier'

class MyModifier extends TextModifier {
  applyNormalAttribute(instance: TextAttribute): void {
    super.applyNormalAttribute?.(instance);

  }

  public setGroup1(): void {
    this.fontSize(9)
    this.fontColor('#FFFFC0CB')
  }

  public setGroup2(): void {
    this.fontWeight(300)
    this.fontColor('#FF808080')
  }
}

@ComponentV2
struct MyImagel {
  @Param @Require modifier: TextModifier
  index: number = 0;

  build() {
    Column() {
      Text('Test').attributeModifier(this.modifier as MyModifier).id('textTest')
      Button('change')
        .onClick(() => {
          console.log('Modifier', 'onClick')
          this.index++;
          if (this.index % 2 === 1) {
            (this.modifier as MyModifier).setGroup1()
            console.log('Modifier', 'setGroup1')
          } else {
            (this.modifier as MyModifier).setGroup2()
            console.log('Modifier', 'setGroup2')
          }
        }).id('buttonTest2')
    }
  }
}

@Entry
@ComponentV2
struct makeObserved0130 {
  @Local myModifier: TextModifier = UIUtils.makeObserved(new MyModifier().height('3%'))

  build() {
    Column() {
      MyImagel({ modifier: this.myModifier })
      Button('replace whole')
        .onClick(() => {
          this.myModifier = UIUtils.makeObserved(new MyModifier().fontColor('#FFFFA500'))
        }).id('buttonTest')
    }
    .width('100%')
  }
}