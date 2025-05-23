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
import { ColumnSplitModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ColumnSplitModifier {
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.resizeable(true)
  }
}

@Entry
@Component
struct ColumnSplitExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7]
  @State customModifier: ColumnSplitModifier = new CustomModifier()
    .divider({ startMargin: '10px', endMargin: '10px' })
    .resizeable(false)

  build() {
    Column({ space: 5 }) {
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('4').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('5').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      .attributeModifier(this.customModifier as CustomModifier)
      .key('columnSplit')
    }
    .margin({ top: 5 })
  }
}