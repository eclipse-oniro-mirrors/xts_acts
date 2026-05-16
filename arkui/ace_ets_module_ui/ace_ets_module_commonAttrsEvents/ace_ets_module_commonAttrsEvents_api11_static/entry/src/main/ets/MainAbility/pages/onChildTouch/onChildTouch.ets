'use static';
/**
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
import promptAction from '@ohos.promptAction';
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Axis,
  BarState,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  EdgeEffect,
  Entry,
  FlexAlign,
  FontWeight,
  ForEach,
  List,
  ListItem,
  Margin,
  Padding,
  ScrollState,
  Text,
  TextAlign,
  TouchEvent,
  TouchResult,
  TouchTestInfo,
  TouchTestStrategy,
  TouchType
} from '@ohos.arkui.component'

@Entry
@Component
struct onChild {
  @State text: string = 'Button'
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)

  build() {
    Column() {
      List({ space: 2, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('Item ' + item)
              .width('100%')
              .height(56)
              .fontSize(16)
              .textAlign(TextAlign.Start)
          }.borderRadius(24)
          .backgroundColor(Color.White)
          .padding({ left: 12, right: 12 } as Padding)
        }, (item: number) => String(item))
      }
      .key('onChild_list')
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .onScrollIndex((start: Int, end: Int): void => {
        console.info('first' + start)
        console.info('last' + end)
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState): void => {
        console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
      })
      .width('100%')
      .height('65%')

      Button(this.text)
        .width(312)
        .height(40)
        .key('onChild_Button')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 80 } as Margin)
        .onClick((e: ClickEvent) => {
          this.text = 'click the button'
          this.getUIContext().getPromptAction().showToast({ message: 'you click the button.', duration: 3000 })
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF1F3F5)
    .justifyContent(FlexAlign.End)
    .padding({ left: 12, right: 12, bottom: 24 } as Padding)
    .onChildTouchTest((touchinfo: Array<TouchTestInfo>): TouchResult => {
      this.text = 'onChildTouch'
      for (let info of touchinfo) {
        if (info.id == 'MyList') {
          return { id: info.id, strategy: TouchTestStrategy.FORWARD_COMPETITION }
        }
      }
      return { strategy: TouchTestStrategy.DEFAULT }
    })
  }
}