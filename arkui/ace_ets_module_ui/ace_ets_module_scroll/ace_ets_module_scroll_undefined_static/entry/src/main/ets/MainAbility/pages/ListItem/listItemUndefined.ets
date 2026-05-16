'use static'
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

import { Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem,
  ListScroller, FlexAlign, TextAlign, SwipeActionOptions, SwipeEdgeEffect
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Builder } from 'arkui.component.builder'

@Entry
@Component
struct ListItem1 {
  @State isSelected: boolean = false;
  @State isSelectable: boolean = false;
  @State isSwipeAction: boolean = false;
  @State isOnSelect: boolean = false;
  @State onSelectValue: string = 'U';

  build() {
    Column() {
      List() {
        ListItem() {
          Text('ListItem')
            .width('100%')
            .height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
        }
        .selected(this.isSelected ? true : undefined)
        .selectable(this.isSelectable ? false : undefined)
        .swipeAction(this.isSwipeAction ? {
          end: {
            builder: () => {},
            onAction: () => {
              this.getUIContext()?.animateTo({ duration: 1000 }, () => {
              });
            },
            actionAreaDistance: 60,
          },
          edgeEffect: SwipeEdgeEffect.Spring
        } as SwipeActionOptions : undefined)
        .onSelect(this.isOnSelect ? (isSelected: boolean) => {
          this.onSelectValue += 'U';
        } : undefined)
        .id('listItem_action')
      }
      .multiSelectable(true)

      Row() {
        Button('0' + this.isSelected).onClick((event: ClickEvent) => {
          this.isSelected = !this.isSelected;
        }).margin(5).id('selected_action')
        Button('1' + this.isSelectable).onClick((event: ClickEvent) => {
          this.isSelectable = !this.isSelectable;
        }).margin(5).id('selectable_action')
        Button('2' + this.isSwipeAction).onClick((event: ClickEvent) => {
          this.isSwipeAction = !this.isSwipeAction;
        }).margin(5).id('swipeAction_action')
      }
      Row() {
        Button('3' + this.isOnSelect).onClick((event: ClickEvent) => {
          this.isOnSelect = !this.isOnSelect;
        }).margin(5).id('onSelect_action')
        Text(this.onSelectValue).id('onSelectValue')
      }
    }
    .width('100%')
    .height('100%')
  }
}