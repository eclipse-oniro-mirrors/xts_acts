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
import { Entry, Component, Builder, Row, Column, ClickEvent, AttributeModifier, ListItemAttribute, Button, ListItem,
  List, ForEach, Text, TextAlign, FlexAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'

class ListItemModifier1 implements AttributeModifier<ListItemAttribute> {
  applyNormalAttribute(instance: ListItemAttribute): void {
    instance
      .selected(true)
      .selectable(true)
  }
}

@Entry
@Component
struct List_itemOnSelect {
  @State listItemModifier: ListItemModifier1 = new ListItemModifier1()

  @Builder
  itemEnd() {
    Row() {
      Button("Del").margin("4vp").key("Del")
      Button("Set").margin("4vp").key("Set")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('ListItemKey1'))
        })
      Button("Click2").fontSize(50)
        .onClick((e: ClickEvent) => {
          console.info("Click2" + JSON.stringify(inspector.sendEventByKey("Del", 10, "")));
        }).key("Click2")
      List({ space: 10 }) {
        ListItem() {
          Text("Hello world") {
          }
          .width('100%')
          .height(100)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }
        .key("ListItemKey1")
        .attributeModifier(this.listItemModifier)
      }
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}

