'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  Canvas,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Callback,
  Column,
  Row,
  Button,
  ClickEvent,
  Color,
  Text,
  Divider,
  TabsController,
  TabContent,
  BarPosition,
  BarMode,
  Scroller,
  Builder,
  Margin,
  List,
  Flex, FlexDirection, ItemAlign, FlexAlign, TextAlign,
  ForEach,
  ListItem,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import {  FrameNode } from '@ohos.arkui.node';

@Entry
@Component
struct CanvasAttrsTest {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
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
    this.context.onAttach( this.attachCallback)
    this.context.onDetach( this.detachCallback)
  }

  aboutToDisappear(): void {
    this.context.offAttach( this.attachCallback)
    this.context.offDetach( this.detachCallback)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Row() {
        Button('Swipe to Top').id('swipe_top')
          .onClick((e:ClickEvent) => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex as int) // Get child components size and position
            this.scroller.scrollToIndex(0) // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y as int) // Slide a specified distance
          })
        Button('Swipe to Bottom').id('swipe_bottom')
          .onClick((e:ClickEvent) => {
            let rect = this.scroller.getItemRect(this.swipeStartIndex as int) // Get child components size and position
            this.scroller.scrollToIndex(this.arr.length - 1) // Slide to the specified index
            this.scroller.scrollBy(0, -rect.y as int) // Slide a specified distance
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
                .onReady(():void => {
                  console.log('Canvas onReady 1')
                  this.context.font = '30vp sans-serif'
                  console.log('Canvas onReady 2',this.node)
                  this.node?.commonEvent.setOnVisibleAreaApproximateChange(  //回调没执行 11.17sdk
                    { ratios: [0, 1], expectedUpdateInterval: 10 },
                    (isVisible: boolean, currentRatio: number) => {
                      console.log('+++++++++++++++setOnVisibleAreaApproximateChange')
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
                .margin({ top: 5 } as Margin)
            }
          }
        }, (item: number) => item.toString())
      }
      .onScrollIndex((start: int, end: int):void => {
        this.swipeStartIndex = start
      })
    }
    .width('100%')
    .height('100%')
  }
}