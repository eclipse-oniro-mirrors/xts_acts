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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  Entry,
  MutableStyledString,
  ColorFilter,
  ClickEvent,
  Component,
  RichEditor,
  Column,
  Text,
  ImageSpan,
  Visibility,
  $r,
  FlexAlign,
  HorizontalAlign,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  ColumnOptions,
  ImageAttachment,
  Button,
  Row,
  Margin,
  Scroller,
  AnimationStatus,
  Stack,
  Alignment,
  Scroll,
  ImageAnimator,
  ForEach,
  ScrollDirection,
  BarState,
  TextAlign,
  Color,
  EdgeEffect,
  RowOptions,
  Button,
  Padding,
  ScrollState,
  Edge,
  FillMode
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ImageAnimatorAutoPauseTest {
  scroller: Scroller = new Scroller()
  @State state: AnimationStatus = AnimationStatus.Running
  @State reverse: boolean = false
  @State iterations: int = 100
  @State preCallBack: string = 'Null'
  @State monitorInvisibleArea: boolean | undefined = true
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Scroll(this.scroller) {
        Column() {
          ImageAnimator()
            .id('ImageAnimatorFlag')
            .images([
              {
                src: $r('app.media.flower')
              },
              {
                src: $r('app.media.icon')
              },
              {
                src: $r('app.media.tree')
              },
              {
                src: $r('app.media.icon')
              }
            ])
            .fixedSize(true)
            .borderRadius(10)
            .monitorInvisibleArea(this.monitorInvisibleArea)
            .clip(true).duration(4000).state(this.state).reverse(this.reverse)
            .fillMode(FillMode.Forwards).iterations(this.iterations).width('90%').height('40%')
            .margin({ top: 20 } as Margin)
            .onStart(() => {
              this.preCallBack = 'Start'
              console.info('ImageAnimator Start')
            })
            .onPause(() => {
              this.preCallBack = 'Pause'
              console.info('ImageAnimator Pause')
            })
            .onRepeat(() => {
              console.info('ImageAnimator Repeat')
            })
            .onCancel(() => {
              console.info('ImageAnimator Cancel')
            })
            .onFinish(() => {
              console.info('ImageAnimator Finish')
            })
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => item!.toString())
        }.width('100%')
      }
      .height('100%')
      .id('scrollFlag')
      .scrollable(ScrollDirection.Vertical) 
      .scrollBar(BarState.On) 
      .scrollBarColor(Color.Gray) 
      .scrollBarWidth(10) 
      .friction(0.6)
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((xOffset: number, yOffset: number, scrollState: ScrollState) => {
        console.info(xOffset + ' ' + yOffset);
      })
      .onScrollEdge((side: Edge) => {
        console.info('To the edge')
      })
      .onScrollStop(() => {
        console.info('Scroll Stop')
      })
      Row({space: 5} as RowOptions){
        Text(this.preCallBack).id('textFlag').fontColor(Color.Green)
        Button('TRUE').id('trueFlag').padding({ left: 0, right: 0, top: 2, bottom: 2 } as Padding).width('20%').fontSize(8).onClick((e: ClickEvent) => {
          this.monitorInvisibleArea = true
        })
        Button('FALSE').id('falseFlag').padding({ left: 0, right: 0, top: 2, bottom: 2 } as Padding).width('20%').fontSize(8).onClick((e: ClickEvent) => {
          this.monitorInvisibleArea = false
        })
        Button('UNDEFINED').id('undefinedFlag').padding({ left: 0, right: 0, top: 2, bottom: 2 } as Padding).width('20%').fontSize(8).onClick((e: ClickEvent) => {
          this.monitorInvisibleArea = undefined
        })
        Button('NULL').id('nullFlag').padding({ left: 0, right: 0, top: 2, bottom: 2 } as Padding).width('20%').fontSize(8).onClick((e: ClickEvent) => {
          // this.monitorInvisibleArea = null
        })
      }.backgroundColor(Color.Pink)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC)
  }
}