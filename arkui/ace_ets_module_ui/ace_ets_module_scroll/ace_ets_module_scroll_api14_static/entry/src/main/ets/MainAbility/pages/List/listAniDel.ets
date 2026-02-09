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
import {
  BarState,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexDirection,
  ForEach,
  ItemAlign,
  List,
  ListItem,
  ListScroller,
  NodeContainer,
  Padding,
  Row,
  Scroller,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct animationListDelExample {
  scroller: Scroller = new Scroller()
  @State arr: number[] = [0, 1, 2] as number[]
  @State num: number = 0
  @State onTextDel: string = ''

  aboutToAppear() {
    for (let i = 3; i < 7; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Text('del: ' + this.onTextDel)
        .id('list_del_mess')
        .width('90%')
        .height('10%')

      List() {
        ListItem() {
          Text('' + this.arr)
            .fontSize(15)
        }

        ListItem() {
          Button('删除元素')
            .id('list_del_btn')
            .borderRadius(10)
            .onClick((e: ClickEvent) => {
              this.arr.pop()
              this.scroller.scrollPage({ next: true, animation: true })
            })
        }
      }

      List({ space: 10, scroller: this.scroller }) {
        ForEach(this.arr, (item: number, i: int) => {
          ListItem() {
            Text('item-' + item)
              .width('100%')
              .height('20%')
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(Color.Red)
          }
        }, (item: number) => item.toString())
      }
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .divider({ strokeWidth: 1, color: Color.Blue })
      .onScrollIndex((firstIndex: int, lastIndex: int, centerIndex: int) => {
        console.info('first' + firstIndex)
        console.info('last' + lastIndex)
        console.info('center' + centerIndex)
      })
      .onScrollStart(() => {
        this.onTextDel += 'onScrollStart-'
        console.info('waterFlow scroll start')
      })
      .onScrollStop(() => {
        this.onTextDel += 'onScrollStop'
        console.info('waterFlow scroll stop')
      })
      .onReachStart(() => {
        this.onTextDel += 'onReachStart-'
        console.info('waterFlow reach start')
      })
      .onReachEnd(() => {
        this.onTextDel += 'onReachEnd-'
        console.info('waterFlow reach end')
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
    .padding({ top: 5 } as Padding)
  }
}