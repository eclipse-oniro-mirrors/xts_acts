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
@Entry
@Component
struct StepperTest1 {
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Skip
  @State thirdState: ItemState = ItemState.Normal
  @State fourthState: ItemState = ItemState.Normal

  build() {
    Stepper({
      index: this.currentIndex
    }) {
      StepperItem() {
        Column() {
          Text('PageOne')
        }
      }
      .status(this.firstState)

      StepperItem() {
        Column() {
          Text('PageTwo')
        }
      }
      .status(this.secondState)

      StepperItem() {
        Column() {
          Text('PageThree')
        }
      }
      .status(this.thirdState)


      StepperItem() {
        Column() {
          Text('PageFour').id('StepperTest1_text')
        }
      }
      .status(this.fourthState)
    }
    .backgroundColor('#F1F3F5')
    .onSkip(() => {
      this.currentIndex = 3
      console.info('onSkip')
    })
    .onChange((prevIndex?: number, index?: number) => {
      if(index){
        this.currentIndex = index
      }
    })
    .height('90%')
  }
}