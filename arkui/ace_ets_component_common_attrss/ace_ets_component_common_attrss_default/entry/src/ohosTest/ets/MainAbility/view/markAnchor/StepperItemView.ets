/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Styles function itemStyle() {
  .width(336)
  .height(621)
  .margin({ top: 48, left: 12 })
  .borderRadius(24)
  .backgroundColor('#FFFFFF')
}

@Extend(Text) function itemTextStyle() {
  .fontColor('#182431')
  .fontSize(36)
  .fontWeight(500)
  .opacity(0.4)
  .margin({ top: 82, bottom: 40 })
}


@Component
export struct StepperItemView {
  @State prevIndex: number = 0
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @Link _markAnchor: Position;
  private componentKey: string;
  private parentWidth: number;
  private parentHeight: number;
  private subassemblyWidth: number;
  private subassemblyHeight: number;
  private parentComponentKey: string;
  private referenceComponentKey: string;

  build() {
    Stepper({
      index: this.currentIndex
    }) {
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
      .width(this.subassemblyWidth)
      .height(this.subassemblyHeight)
      .nextLabel('Next')
      .status(this.firstState)
      .markAnchor(this._markAnchor)
      .key(this.componentKey)

      StepperItem() {
        Column() {
          Text('Page Two')
            .itemTextStyle()
          Button('change status:' + this.secondState)
            .backgroundColor('#007dFF')
            .onClick(() => {
              this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
            })
        }.itemStyle()
      }
      .width(this.subassemblyWidth)
      .height(this.subassemblyHeight)
      .nextLabel('Next')
      .prevLabel('Previous')
      .status(this.secondState)
      .key(this.referenceComponentKey)
    }
    .backgroundColor('#F1F3F5')
    .onFinish(() => {
      console.info('onFinish')
    })
    .onSkip(() => {
      console.info('onSkip')
    })
    .onChange((prevIndex: number, index: number) => {
      this.currentIndex = index
      this.prevIndex = prevIndex
    })
    .width(this.parentWidth)
    .height(this.parentHeight)
    .key(this.parentComponentKey)
  }
}