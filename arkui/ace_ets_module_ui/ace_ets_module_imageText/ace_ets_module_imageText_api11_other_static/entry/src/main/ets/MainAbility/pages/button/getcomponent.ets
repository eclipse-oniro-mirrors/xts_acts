'use static';
/*
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
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  PlayMode
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

@Entry
@Component
struct getcomponent {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('next page')
        .size({ width: 90, height: 90 })
        .fontWeight(FontWeight.Bold)
        .id('ArkUX_Get_component_0010')
        .margin({
          top: 20
        } as Margin)
        .backgroundColor('#0D9FFB')

      Button("返回值").margin(30)
        .onClick((e: ClickEvent) => {
          let strJson = inspector.getInspectorByKey("ArkUX_Get_component_0010")
          let Rectangle = JSON.parseJsonElement(strJson);
          this.message = "sizeWidth: " + JSON.stringify(Rectangle.getElement('$attrs').getString('width'))
            + "\n sizeHeight: " + JSON.stringify(Rectangle.getElement('$attrs').getString('height'))
            + "\n offset: " + JSON.stringify(Rectangle.getElement('$attrs').getElement('offset').getString('x'))
            + "\n offset: " + JSON.stringify(Rectangle.getElement('$attrs').getElement('offset').getString('y'))
            + "\n offsetX: " + JSON.stringify(Rectangle.getElement('$attrs').getElement('shadow').getString('offsetX'))
            + "\n offsetY: " + JSON.stringify(Rectangle.getElement('$attrs').getElement('shadow').getString('offsetY'))
        })

      Text(this.message)
        .fontSize(25)
        .padding(15)
        .fontWeight(FontWeight.Bold)
        .margin(10)
    }
    .width("100%")
    .height("100%")
  }
}