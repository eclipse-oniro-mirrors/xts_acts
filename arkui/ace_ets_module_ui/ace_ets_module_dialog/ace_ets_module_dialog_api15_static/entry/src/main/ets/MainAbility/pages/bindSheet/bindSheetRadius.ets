'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,$$,SheetType,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin,BorderRadiuses
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router,KeyboardAvoidMode,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics } from '@ohos.arkui.node';
import { Callback } from '@ohos.base';
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct bindSheetRadius {
  @State isShow: boolean = false
  @State radius: undefined|LengthMetrics|BorderRadiuses|LocalizedBorderRadiuses = LengthMetrics.px(20)

  @Builder
  myBuilder() {
    Column() {
      Button('radius:20px')
        .height('8%')
        .id('radiusPX')
        .onClick((event: ClickEvent) => {
          console.log('xyb 111');
          this.radius = LengthMetrics.px(20);
          console.log('xyb 222');
        })
      Button('radius:20vp')
        .height('8%')
        .id('radiusVP')
        .onClick((event: ClickEvent) => {
          this.radius = LengthMetrics.vp(20);
        })
      Button('radius:20fp')
        .height('8%')
        .id('radiusFP')
        .onClick((event: ClickEvent) => {
          this.radius = LengthMetrics.fp(20);
        })
      Button('radius:BorderRadiuses')
        .height('8%')
        .id('borderRadiuses')
        .onClick((event: ClickEvent) => {
          this.radius = {
            topLeft: '10px',
            topRight: '20vp',
            bottomLeft: '10fp',
            bottomRight: '10%'
          }
        })
      Button('radius:LocalizedBorderRadiuses')
        .height('8%')
        .id('localizedBorderRadiuses')
        .onClick((event: ClickEvent) => {
          this.radius = {
            topStart: LengthMetrics.px(100),
            topEnd: LengthMetrics.vp(0),
            bottomStart: LengthMetrics.fp(100),
            bottomEnd: LengthMetrics.px(100),
          }
        })
      Button('radius:undefined')
        .height('8%')
        .id('undefined')
        .onClick((event: ClickEvent) => {
          this.radius = undefined
        })
      Button('radius:null')
        .height('8%')
        .id('null')
        .onClick((event: ClickEvent) => {
          this.radius = undefined;  //null
        })


      Button('close modal 1')
        .height('8%')
        .id('close')
        .margin(10)
        .onClick((event: ClickEvent) => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('transition modal 1')
        .id('bindSheet')
        .onClick((event: ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$(this.isShow), this.myBuilder, {
          radius: this.radius,
          height: '80%',
          backgroundColor: Color.Green,
          preferType: SheetType.BOTTOM,
          onWillAppear: () => {
            console.log('BindSheet onWillAppear.')
          },
          onAppear: () => {
            console.log('BindSheet onAppear.')
          },
          onWillDisappear: () => {
            console.log('BindSheet onWillDisappear.')
          },
          onDisappear: () => {
            console.log('BindSheet onDisappear.')
          }
        } as SheetOptions)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
