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
  ClickEvent,  LineCapStyle,  AttributeModifier,  DividerAttribute } from '@ohos.arkui.component';
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyDividerModifier4 implements AttributeModifier<DividerAttribute> {
  public color: ResourceColor | undefined = undefined;
  public lineCap: LineCapStyle | undefined = undefined;
  public strokeWidth: number | string | undefined = undefined;
  public vertical: boolean | undefined = undefined;

  applyNormalAttribute(instance: DividerAttribute): void {
    instance
      .color(this.color)
      .lineCap(this.lineCap)
      .strokeWidth(this.strokeWidth)
      .vertical(this.vertical)
  }
}

@Entry
@Component
struct DividerExample {
  @State modifier4: MyDividerModifier4 = new MyDividerModifier4();

  build() {
    Column() {
        Button('changeNormal').onClick((e: ClickEvent) => {
        this.modifier4.color = '#FFFF7777';
      }).margin('20px')
        .id('dividerModifier_color2')

      Button('changeNormal').onClick((e: ClickEvent) => {
        this.modifier4.strokeWidth = 10;
      }).margin('20px')
        .id('dividerModifier_strokeWidth2')

      Button('changeNormal').onClick((e: ClickEvent) => {
        this.modifier4.lineCap = LineCapStyle.Round;
      }).margin('20px')
        .id('dividerModifier_lineCap2')

      Button('changeNormal').onClick((e: ClickEvent) => {
        this.modifier4.vertical = true;
      }).margin('20px')
        .id('dividerModifier_vertical2')
      Divider()
        .attributeModifier(this.modifier4)
        .id('dividerModifier')
    }.width('100%').padding({ top: 24 } as Padding)
  }
}