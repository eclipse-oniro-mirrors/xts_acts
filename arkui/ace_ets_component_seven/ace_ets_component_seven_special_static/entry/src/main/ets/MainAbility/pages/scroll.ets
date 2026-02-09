'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Flex, AttributeModifier, ScrollAttribute, Scroller, Text, ForEach, Column, ScrollSnapAlign,
  NestedScrollMode, ScrollDirection, BarState, EdgeEffect, FlexDirection, ItemAlign, FlexAlign, Alignment, TextAlign,
  TextOverflow, Scroll, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class ScrollModifier1 implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance
      .scrollSnap({ snapAlign: ScrollSnapAlign.NONE, enableSnapToStart: true, enableSnapToEnd: true })
      .friction(0.6)
      .enableScrollInteraction(true)
      .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.PARENT_FIRST })
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .scrollBarWidth(5)
      .edgeEffect(EdgeEffect.None)
      .scrollBarColor('#FF123456')
  }
}

@Entry
@Component
struct ScrollOnScrollBegin {
  scroller: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  @State scrollModifier: ScrollModifier1 = new ScrollModifier1()

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("scroll-OnScrollBegin")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("onScrollBeginText")

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          }, (item: number) => String(item))
        }.width('100%')
      }
      .key("ScrollKey1")
      .attributeModifier(this.scrollModifier)
      .width("100%")
      .height("100%")
    }.width("100%").height("100%")
  }
}

