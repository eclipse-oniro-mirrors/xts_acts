/*
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
import { FrameNode } from '@kit.ArkUI'

@Entry
@Component
struct CanvasAttrsTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  private node: FrameNode | null = null
  private swipeStartIndex: number = -1
  @State message: string = ''

  attachCallback(): void {
    console.info('CanvasRenderingContext2D attached to the canvas frame node.')
    this.node = this.context.canvas
  }

  detachCallback(): void {
    console.info('CanvasRenderingContext2D detach from the canvas frame node.')
    this.node = null
  }

  aboutToAppear(): void {
    this.context.on('onAttach', this.attachCallback.bind(this))
    this.context.on('onDetach', this.detachCallback.bind(this))
  }

  aboutToDisappear(): void {
    this.context.off('onAttach', this.attachCallback)
    this.context.off('onDetach', this.detachCallback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Row() {
        Button('Swipe to Top').id('swipe_top')
          .onClick(() => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
            this.scroller.scrollToIndex(0) // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y) // Slide a specified distance
          })
        Button('Swipe to Bottom').id('swipe_bottom')
          .onClick(() => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex) // Get child components size and position
            this.scroller.scrollToIndex(this.arr.length - 1) // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y) // Slide a specified distance
          })
      }

      Text(this.message).id('show_content')

      List({ space: 3, scroller: this.scroller }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            if (item == 2) {
              Canvas(this.context)
                .width('100%')
                .height('20%')
                .backgroundColor('#ffff00')
                .onReady(() => {
                  this.context.font = '30vp sans-serif'
                  this.node?.commonEvent.setOnVisibleAreaApproximateChange(
                    { ratios: [0, 1], expectedUpdateInterval: 10 },
                    (isVisible: boolean, currentRatio: number) => {
                      if (!isVisible && currentRatio <= 0.0) {
                        this.message = 'Canvas is completely invisible.'
                        console.info('Canvas is completely invisible.')
                      }
                      if (isVisible && currentRatio >= 1.0) {
                        this.message = 'Canvas is fully visible.'
                        console.info('Canvas is fully visible.')
                      }
                    }
                  )
                })
            } else {
              Text(item.toString())
                .width('100%')
                .height('20%')
                .backgroundColor(Color.Blue)
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .margin({ top: 5 })
            }
          }
        }, (item: number) => item.toString())
      }
      .onScrollIndex((start: number, end: number) => {
        this.swipeStartIndex = start
      })
    }
    .width('100%')
    .height('100%')
  }
}