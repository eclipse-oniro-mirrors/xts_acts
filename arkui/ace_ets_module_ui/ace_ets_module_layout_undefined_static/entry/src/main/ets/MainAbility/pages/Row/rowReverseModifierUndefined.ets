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

import {
  Entry, Text, Column, Component, Button, ClickEvent, Color, Slider, Grid, GridItem, SliderBlockType,
  TextAlign, List, ListItem, ListScroller, Builder, ForEach, Row, TransitionType, FlexAlign, ColumnOptions,
  SizeOptions,  SliderBlockStyle, Ellipse, SliderStyle, SlideRange, SliderInteraction, SliderChangeMode,
  RowAttribute, AttributeModifier, Divider, VerticalAlign, $r } from '@ohos.arkui.component'
import { State ,Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class RowModifierTest implements AttributeModifier<RowAttribute>{
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: RowAttribute):void{
    instance
      .reverse(this.isUndefined ? undefined : false)
  }
}

@Entry
@Component
struct SelectExampleM {
  @State modifier1:RowModifierTest = new RowModifierTest()
  build() {
    Column() {
      Row() {
        Row().width('30%').height(50).backgroundColor(0xAFEEEE).id('row1')
        Row().width('30%').height(50).backgroundColor(0x00FFFF).id('row2')
      }
      .width('90%')
      .height('15%')
      .border({ width: 1 })
      .attributeModifier(this.modifier1)
      .id('Row_Reverse_Modifier')
      Divider()
      Button(this.modifier1.isUndefined ?'isUndefined = true':'isUndefined = false')
        .onClick(() => {
          this.modifier1.isUndefined = !this.modifier1.isUndefined
        }
        ).id('changeButton')
    }.width('100%')
  }
}