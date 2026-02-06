'use static';
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

import { Entry, Column, Component, ForEach, Scroll, Scroller, Flex, FlexDirection, TextAlign,BarState,EdgeEffect,Margin,
  ItemAlign, FlexAlign, Text, Button, ClickEvent, ScrollAttribute, ScrollSnapAlign, NestedScrollMode, ScrollDirection} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { ScrollModifier } from "@ohos.arkui.modifier";
class CustomModifier extends ScrollModifier {
  applyNormalAttribute(instance: ScrollAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange1() {
    this.scrollBarColor('#FF222222')
  }
}

@Entry
@Component
struct ScrollOnScrollBegin {
  scroller: Scroller = new Scroller()
  private arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  @State customModifier: ScrollModifier = new CustomModifier()
    .scrollSnap({ snapAlign: ScrollSnapAlign.NONE, enableSnapToStart: true, enableSnapToEnd: true })
    .friction(1)
    .enableScrollInteraction(true)
    .nestedScroll({ scrollForward: NestedScrollMode.SELF_FIRST, scrollBackward: NestedScrollMode.PARENT_FIRST })
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .scrollBarWidth(5)
    .edgeEffect(EdgeEffect.None)
    .scrollBarColor('#FF123456')

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("change value").onClick((e:ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Scroll(this.scroller) {
        Column() {
          ForEach(this.arr, (item: Number) => {
            Text(item.toString())
              .width('90%')
              .height(150)
              .backgroundColor(0xFFFFFF)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({ top: 10 } as Margin)
          })
        }.width('100%')
      }
        .key("ScrollKey1")
        .attributeModifier(this.customModifier as CustomModifier)
        .width("100%")
        .height("100%")

    }.width("100%").height("100%")
  }
}

