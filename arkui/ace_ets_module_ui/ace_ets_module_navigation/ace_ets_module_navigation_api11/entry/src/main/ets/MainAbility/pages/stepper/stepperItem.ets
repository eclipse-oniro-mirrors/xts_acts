/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Log from '../../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct StepperItemDisabled {
  @State currentIndex: number = 0;
  @State firstState: ItemState = ItemState.Normal;
  @State secondState: ItemState = ItemState.Normal;

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear StepperItemDisabled start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear StepperItemDisabled end`);
  }

  build() {
    Row() {
      Column({ space: 10 }) {
        Text('message')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Stepper({
          index: this.currentIndex
        }) {
          StepperItem() {
            Text('Page One')
              .fontSize(35)
              .fontColor(Color.Blue)
              .width(200)
              .lineHeight(50)
              .margin({ top: 250 })
          }
          .nextLabel('')
          .position({ x: '35%', y: 0 })

          StepperItem() {
            Text('Page Two')
              .fontSize(35)
              .fontColor(Color.Blue)
              .width(200)
              .lineHeight(50)
              .margin({ top: 250 })
              .onClick(() => {
                this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
              })
          }
          .key("StepperItem")
          .nextLabel('Finish')
          .prevLabel('Previous')
          .status(this.firstState)
          .position({ x: '35%', y: 0 })
          .status(ItemState.Disabled)
        }
        .onFinish(() => {
          Log.showInfo(TAG, 'onFinish')
        })
        .onSkip(() => {
          Log.showInfo(TAG, 'onSkip')
        })
        .onChange((prevIndex: number, index: number) => {
          this.currentIndex = index
        })
        .align(Alignment.Center)
        .height('50%')
      }
      .width('100%')
    }
    .height('100%')
  }
}

