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

import { Entry, Text, Column, Row, Component, Button, ClickEvent, List, ListItem, ListDividerOptions,
  Color, ListItemGroup, ChildrenMainSize, AttributeModifier, ListItemGroupAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Builder } from 'arkui.component.builder'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ListItemGroupAttribute> {
  public isDivider: boolean = false;
  public dividerValue: ListDividerOptions = { strokeWidth: 10.00 } as ListDividerOptions;
  public isChildrenMainSize: boolean = false;
  public childrenMainSizeValue: ChildrenMainSize = new ChildrenMainSize(10);
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    instance
      .divider(this.isDivider ? this.dividerValue : undefined)
      .childrenMainSize(this.isChildrenMainSize ? this.childrenMainSizeValue : undefined)
  }
}

@Entry
@Component
struct ListItemGroupModifier1 {
  @State childrenMainSizeValue1: ChildrenMainSize = new ChildrenMainSize(150);
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column() {
      List() {
        ListItemGroup() {
          ListItem() {
            Text('ListItem1')
          }
          .selected(true)
          ListItem() {
            Text('ListItem2')
          }
          .selected(true)
          ListItem() {
            Text('ListItem3')
          }
          .selected(true)
        }
        .width('100%')
        .attributeModifier(this.modifier)
        .id('listItemGroup_action')
      }
      .childrenMainSize(this.childrenMainSizeValue1)

      Row() {
        Button('0' + this.modifier.isDivider).onClick((event: ClickEvent) => {
          this.modifier.isDivider = !this.modifier.isDivider;
        }).margin(5).id('divider_action')
        Button('1' + this.modifier.isChildrenMainSize).onClick((event: ClickEvent) => {
          this.modifier.isChildrenMainSize = !this.modifier.isChildrenMainSize;
        }).margin(5).id('childrenMainSize_action')
      }
    }
    .width('100%')
    .height('100%')
  }
}