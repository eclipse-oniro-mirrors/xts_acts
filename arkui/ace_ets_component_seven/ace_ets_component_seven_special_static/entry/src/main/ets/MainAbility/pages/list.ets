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
import { Entry, Component, Column, AttributeModifier, ListAttribute, ScrollSnapAlign, NestedScrollMode, ChainEdgeEffect, ListItemAlign,
  Axis, BarState, EdgeEffect, StickyStyle, Button, ListItem, List, ForEach, Text, TextAlign, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

class ListModifier1 implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance
      .scrollSnapAlign(ScrollSnapAlign.NONE)
      .lanes(1)
      .friction(0.6)
      .enableScrollInteraction(true)
      .nestedScroll({ scrollForward: NestedScrollMode.SELF_ONLY, scrollBackward: NestedScrollMode.SELF_FIRST })
      .chainAnimationOptions({
        minSpace: 1,
        maxSpace: 2,
        conductivity: 0.6,
        intensity: 0.2,
        edgeEffect: ChainEdgeEffect.DEFAULT
      })
      .alignListItem(ListItemAlign.Start)
      .listDirection(Axis.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .divider({ strokeWidth: 1, color: '#FF00FFFF', startMargin: 2, endMargin: 3 })
      // .editMode(true)
      .multiSelectable(true)
      .cachedCount(2)
      .chainAnimation(true)
      .sticky(StickyStyle.Header)
  }
}

@Entry
@Component
struct ListExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[];
  @State listModifier: ListModifier1 = new ListModifier1()

  build() {
    Column() {
      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('ListKey1'))
        })
      List({ space: 20, initialIndex: 0 }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
              .padding(10)
          }
        }, (item: number) => String(item))
      }
      .key('ListKey1')
      .attributeModifier(this.listModifier)
      .width('90%')
    }
    .width('100%')
  }
}