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
  Column,
  Component,
  EdgeEffect,
  Edges,
  Entry,
  ForEach,
  List,
  ListItem,
  NestedScrollMode,
  Scroll,
  ScrollBar,
  Scroller,
  Text,
  TextAlign,
  ListItemAttribute,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

function listCard(this: ListItemAttribute): ListItemAttribute{
  this.backgroundColor(Color.White)
  this.height(50)
  this.width('100%')
  this.borderRadius(12)
  return this
}

@Entry
@Component
struct StickyNestedScroll {
  listScroller: Scroller = new Scroller();
  @State array: number[] = [] as number[]

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('Scroll Area')
            .width('100%')
            .height('15%')
            .backgroundColor('#0080DC')
            .textAlign(TextAlign.Center)
          List({ space: 10, scroller: this.listScroller }) {
            ForEach(this.array, (item: number) => {
              ListItem() {
                Text('item' + item)
                  .fontSize(16)
              }
              .listCard()
            }, (item: number, index: int) => String(item))
          }
          .scrollBar(BarState.Off)
          .nestedScroll({
            scrollForward: NestedScrollMode.PARENT_FIRST,
            scrollBackward: NestedScrollMode.SELF_FIRST
          })
          .height('100%')
        }
        .width('100%')
      }
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor('#DCDCDC')
      .scrollBar(BarState.Off)
      .width('100%')
      .height('50%')

      ScrollBar({ scroller: this.listScroller })
        .id('sBar_enable')
        .position({ right: 0 } as Edges)
        .enableNestedScroll(true)
    }
  }

  aboutToAppear() {
    for (let i = 0; i < 15; i++) {
      this.array.push(i)
    }
  }
}