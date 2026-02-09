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
  Component,
  Column,
  ClickEvent,
  Button,
  Text,
  Builder,
  wrapBuilder,
  Color,
  ContentModifier,
  ButtonConfiguration,
  WrappedBuilder,
  Circle,
  GestureEvent,
  FlexAlign,
  TapGesture,
  CircleOptions,CustomBuilderT
} from '@ohos.arkui.component';

import { State } from '@ohos.arkui.stateManagement';

class MyButtonStyle implements ContentModifier<ButtonConfiguration> {
  x: number = 0
  y: number = 0
  selectedColor:Color = Color.Black

  constructor(x : number, y: number,ColorType:Color) {
    this.x = x
    this.y = y
    this.selectedColor = ColorType
  }

  applyContent():  WrappedBuilder<CustomBuilderT<ButtonConfiguration>>{
    return wrapBuilder<CustomBuilderT<ButtonConfiguration>>(buildButton1)
  }
}

@Builder function buildButton1(config: ButtonConfiguration) {
  Column() {
    Text(config.label).id('ButtonApi2_text1')
    Circle({ width: 150, height: 150 } as CircleOptions)
      .fill(config.pressed ? (config.contentModifier as MyButtonStyle).selectedColor : Color.Black)
      .gesture(
        TapGesture({count:1}).onAction((event: GestureEvent)=>{
          config.triggerClick(event.fingerList[0].localX,event.fingerList[0].localY)
        })).opacity(config.enabled ? 1 : 0.1)
  }
}

@Entry
@Component
struct ButtonApi2 {
  @State buttonEnabled: boolean = true;
  @State positionX: number = 0
  @State positionY: number = 0
  @State label:string = 'before click'

  build() {
    Column() {
      Button(this.label)
        .contentModifier(new MyButtonStyle(this.positionX,this.positionY,Color.Red))
        .onClick((event: ClickEvent) => {
          this.label = 'after click'
          console.log("===============================  this.label");
        }).enabled(this.buttonEnabled)
        .id('ButtonApi2_btn1')
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}