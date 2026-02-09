'use static';
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

import {
  $$,
  $r,
  AdaptiveColor,
  Alignment,
  BindOptions,
  BlurStyle,
  Builder,
  Button,
  ButtonType,
  Circle,
  CircleOptions,
  ClickEvent,
  Color,
  ColoringStrategy,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  OverlayOffset,
  OverlayOptions,
  Padding,
  Rect,
  RectOptions,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  ThemeColorMode,ContentCoverOptions,ModalTransition
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, LocalStorage, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct ModalTransition111 {
  @State isShow: boolean = false
  @State isShow2: boolean = false

  @Builder
  myBuilder2() {
    Column() {
      Button("close modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow2 = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  myBuilder() {
    Column() {
      Button("transition modal 2")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow2 = true;
        })
      .bindContentCover(this.isShow2, ()=>{ this.myBuilder2() } , {
        modalTransition: ModalTransition.NONE,
        backgroundColor: Color.Gray,
        onAppear: () => {
          console.log("BindContentCover onAppear.")
        },
        onDisappear: () => {
          console.log("BindContentCover onDisappear.")
        }
      } as ContentCoverOptions)

      Button("close modal 1")
        .margin(10)
        .fontSize(20)
        .onClick((e: ClickEvent) => {
          this.isShow = false;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
      .bindContentCover($$(this.isShow), ()=>{this.myBuilder()}, {modalTransition: ModalTransition.ALPHA, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}} as ContentCoverOptions)

      Button("transition modal 3")
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
      .bindContentCover($$(this.isShow),()=>{ this.myBuilder() }, {modalTransition: ModalTransition.DEFAULT, backgroundColor: Color.Pink, onAppear: () => {console.log("BindContentCover onAppear.")}, onDisappear: () => {console.log("BindContentCover onDisappear.")}} as ContentCoverOptions)
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .width('100%')
    .height('100%')
  }
}