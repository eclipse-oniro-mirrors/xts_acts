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
import { StepperItemModifier } from "@ohos.arkui.modifier";

class CustomModifier extends StepperItemModifier {
  applyNormalAttribute(instance: StepperItemAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChange() {
    this.nextLabel('textLabel2')
  }
}

@Styles
function itemStyle() {
  .width(336)
    .height(621)
    .margin({ top: 48, left: 12 })
    .borderRadius(24)
    .backgroundColor('#FFFFFF')
}

@Extend(Text)
function itemTextStyle() {
  .fontColor('#182431')
    .fontSize(36)
    .fontWeight(500)
    .opacity(0.4)
    .margin({ top: 82, bottom: 40 })
}

@Entry
@Component
struct StepperExample {
  @State customModifier: StepperItemAttribute = new CustomModifier()
    .nextLabel('textLabel')
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal

  build() {
    Column(){
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")
      Stepper({ index: this.currentIndex }) {
        // 第一个步骤页
        StepperItem() {
          Column() {
            Text('Page One')
              .itemTextStyle()
            Button('change status:' + this.firstState)
              .backgroundColor('#007dFF')
              .onClick(() => {
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
              })
          }.itemStyle()
        }
      .key("nextLabel1")
          .attributeModifier(this.customModifier as CustomModifier)
          .status(this.firstState)
      }
    .backgroundColor('#F1F3F5')
        .onFinish(() => {
          console.info('onFinish')
        })
        .onSkip(() => {
          console.info('onSkip')
        })
        .onChange((prevIndex?: number, index?: number) => {
          if (index) {
            this.currentIndex = index
          }
        })
    }
  }
}