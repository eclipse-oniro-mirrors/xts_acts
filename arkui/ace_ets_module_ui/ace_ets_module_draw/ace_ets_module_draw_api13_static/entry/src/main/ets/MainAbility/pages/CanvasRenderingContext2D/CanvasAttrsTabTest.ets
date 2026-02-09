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
  Canvas,
  TabsController,
  TabContent,
  BarPosition,
  BarMode,
  Margin,
  Builder,
  Tabs,
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import {  FrameNode } from '@ohos.arkui.node';
@Entry
@Component
struct CanvasAttrsTabTest {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  @State selectedIndex: number = 0
  private controller: TabsController = new TabsController()
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  @State message1: string = ''
  @State message2: string = ''

  @Builder tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.selectedIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.selectedIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 } as Margin)
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.selectedIndex === index ? 1 : 0)
    }.width('100%')
  }

  build() {
    Column() {
      Text(this.message1).id('visible_content').fontSize(12).width('100%')
      Text(this.message2).id('invisible_content').fontSize(12).width('100%')

      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex as int, controller: this.controller }) {
        TabContent() {
          Column() {
            Canvas(this.context).id('canvas1')
              .width('80%')
              .height('80%')
              .backgroundColor('#FFBF00')
              .onReady(():void => {
                let node: FrameNode = this.context.canvas
                node?.commonEvent.setOnVisibleAreaApproximateChange(
                  { ratios: [0, 1], expectedUpdateInterval: 10},
                  (isVisible: boolean, currentRatio: number) => {
                    if (!isVisible && currentRatio <= 0.0) {
                      this.message2 = 'Canvas 1 is completely invisible.'
                    }
                    if (isVisible && currentRatio >= 1.0) {
                      this.message1 = 'Canvas 1 is fully visible.'
                    }
                    this.context.reset()
                    this.context.font = '30vp sans-serif'
                    this.context.fillText(this.message2, 50, 50)
                  }
                )
              })
          }
        }.tabBar(():void=>this.tabBuilder(0, 'Tab one'))

        TabContent() {
          Column() {
            Canvas(this.context).id('canvas2')
              .width('80%')
              .height('80%')
              .backgroundColor('#007DFF')
              .onReady(():void => {
                let node: FrameNode = this.context.canvas
                node?.commonEvent.setOnVisibleAreaApproximateChange(
                  { ratios: [0, 1], expectedUpdateInterval: 10},
                  (isVisible: boolean, currentRatio: number) => {
                    if (!isVisible && currentRatio <= 0.0) {
                      this.message2 = 'Canvas 2 is completely invisible.'
                    }
                    if (isVisible && currentRatio >= 1.0) {
                      this.message1 = 'Canvas 2 is fully visible.'
                    }
                    this.context.reset()
                    this.context.font = '30vp sans-serif'
                    this.context.fillText(this.message2, 50, 50)
                  }
                )
              })
          }
        }.tabBar(():void=>this.tabBuilder(1, 'Tab two'))

        TabContent() {
          Column() {
            Canvas(this.context).id('canvas3')
              .width('80%')
              .height('80%')
              .backgroundColor('#FFBF00')
              .onReady(():void => {
                let node: FrameNode = this.context.canvas
                node?.commonEvent.setOnVisibleAreaApproximateChange(
                  { ratios: [0, 1], expectedUpdateInterval: 10},
                  (isVisible: boolean, currentRatio: number) => {
                    if (!isVisible && currentRatio <= 0.0) {
                      this.message2 = 'Canvas 3 is completely invisible.'
                    }
                    if (isVisible && currentRatio >= 1.0) {
                      this.message1 = 'Canvas 3 is fully visible.'
                    }
                    this.context.reset()
                    this.context.font = '30vp sans-serif'
                    this.context.fillText(this.message2, 50, 50)
                  }
                )
              })
          }
        }.tabBar(():void=>this.tabBuilder(2, 'Tab three'))
      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .onChange((index: int) => {
        // currentIndex控制TabContent显示页签
        this.currentIndex = index
        this.selectedIndex = index
      })
      .width('90%')
      .height('50%')
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}