'use static'
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem, ListScroller, FlexAlign, TextAlign,
  SwipeActionOptions, SwipeEdgeEffect, AttributeModifier, ListItemAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Builder } from 'arkui.component.builder'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ListItemAttribute> {
  public isSelected: boolean = false;
  public isSelectable: boolean = false;
  public isSwipeAction: boolean = false;
  public isOnSelect: boolean = false;
  public onSelectValue: string = 'U';
  applyNormalAttribute(instance: ListItemAttribute): void {
    instance
      .selected(this.isSelected ? true : undefined)
      .selectable(this.isSelectable ? false : undefined)
      .swipeAction(this.isSwipeAction ? {
        end: {
          builder: () => {},
          onAction: () => {},
          actionAreaDistance: 60,
        },
        edgeEffect: SwipeEdgeEffect.Spring
      } as SwipeActionOptions : undefined)
      .onSelect(this.isOnSelect ? (isSelected: boolean) => {
        this.onSelectValue += 'U';
      } : undefined)
  }
}

@Entry
@Component
struct ListItemModifier1 {
  @State modifier: MyModifier = new MyModifier()

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
        .attributeModifier(this.modifier)
        .id('listItem_action')
      }
      .multiSelectable(true)

      Row() {
        Button('0' + this.modifier.isSelected).onClick((event: ClickEvent) => {
          this.modifier.isSelected = !this.modifier.isSelected;
        }).margin(5).id('selected_action')
        Button('1' + this.modifier.isSelectable).onClick((event: ClickEvent) => {
          this.modifier.isSelectable = !this.modifier.isSelectable;
        }).margin(5).id('selectable_action')
        Button('2' + this.modifier.isSwipeAction).onClick((event: ClickEvent) => {
          this.modifier.isSwipeAction = !this.modifier.isSwipeAction;
        }).margin(5).id('swipeAction_action')
      }
      Row() {
        Button('3' + this.modifier.isOnSelect).onClick((event: ClickEvent) => {
          this.modifier.isOnSelect = !this.modifier.isOnSelect;
        }).margin(5).id('onSelect_action')
        Text(this.modifier.onSelectValue).id('onSelectValue')
      }
    }
    .width('100%')
    .height('100%')
  }
}