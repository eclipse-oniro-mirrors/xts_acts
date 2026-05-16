'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {  Entry,  Component,  Text,  Button,  Divider,  Column,  Margin,  Padding,  Color,  ResourceColor,
  ClickEvent,  LineCapStyle } from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct DividerExample {
  @State color: ResourceColor | undefined = undefined;
  @State lineCap: LineCapStyle | undefined = undefined;
  @State strokeWidth: number | string | undefined = undefined;
  @State vertical: boolean | undefined = undefined;

  build() {
    Column() {
      Column() {
        Button('changeUndefined').onClick((e: ClickEvent) => {
          this.color = undefined;
        }).margin('20px')
          .id('divider_color1')
        Button('changeNormal').onClick((e: ClickEvent) => {
          this.color = '#FF7777';
        }).margin('20px')
          .id('divider_color2')
      }

      Column() {
        Button('changeUndefined').onClick((e: ClickEvent) => {
          this.lineCap = undefined;
        }).margin('20px')

        Button('changeNormal').onClick((e: ClickEvent) => {
          this.lineCap = LineCapStyle.Round;
        }).margin('20px')
          .id('divider_lineCap2')
      }

      Column() {
        Button('changeUndefined').onClick((e: ClickEvent) => {
          this.strokeWidth = undefined;
        }).margin('20px')

        Button('changeNormal').onClick((e: ClickEvent) => {
          this.strokeWidth = 10;
        }).margin('20px')
          .id('divider_strokeWidth2')
      }

      Column() {
        Button('changeUndefined').onClick((e: ClickEvent) => {
          this.vertical = undefined;
        }).margin('20px')

        Button('changeNormal').onClick((e: ClickEvent) => {
          this.vertical = true;
        }).margin('20px')
          .id('divider_vertical2')
      }
      Divider()
        .color(this.color)
        .lineCap(this.lineCap)
        .strokeWidth(this.strokeWidth)
        .vertical(this.vertical)
        .id('divider')
    }.width('100%').padding({ top: 24 } as Padding)
  }
}