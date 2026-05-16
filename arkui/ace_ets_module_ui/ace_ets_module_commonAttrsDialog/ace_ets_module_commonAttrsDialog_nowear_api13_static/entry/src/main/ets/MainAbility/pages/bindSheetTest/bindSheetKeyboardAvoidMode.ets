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
  BindOptions,
  Builder,
  Button,
  ButtonType,
  ClickEvent,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FlexWrap,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  SheetKeyboardAvoidMode,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TextInput,SheetSize,Color,TripleLengthDetents
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct bindSheetKeyboardAvoidMode {
  @State isShow: boolean = false
  @State isShow1: boolean = false
  @State keyboardAvoidMode: SheetKeyboardAvoidMode = SheetKeyboardAvoidMode.NONE

  @Builder
  myBuilder() {
    Flex({
      direction: FlexDirection.Column,
      wrap: FlexWrap.Wrap,
      justifyContent: FlexAlign.SpaceAround
    } as FlexOptions) {
      Row() {
        Text(String(this.keyboardAvoidMode))
          .id('text')
        Button('close modal 1')
          .id('close')
          .onClick(() => {
            this.isShow = false
          })
          .margin(10)
          .fontSize(20)
      }

      Button('content1')
        .margin(10)
        .fontSize(20)

      Button('content2')
        .margin(10)
        .fontSize(20)

      TextInput({ placeholder: 'input your word' })
        .id('ipt')
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  myBuilder1() {
    Flex({ direction: FlexDirection.Column, wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceAround }) {
      Button('content1')
        .margin(10)
        .fontSize(20)
      Row() {
        Text(String(this.keyboardAvoidMode))
          .id('text1')
        Button('close modal 1')
          .id('close1')
          .onClick(() => {
            this.isShow = false
          })
          .margin(10)
          .fontSize(20)
      }

      Button('content2')
        .margin(10)
        .fontSize(20)

      TextInput({ placeholder: 'input your word' })
        .id('ipt')
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('SheetKeyboardAvoidMode.NONE')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
        })
        .id('noneButton')
        .fontSize(20)
        .margin(10)
      .bindSheet($$(this.isShow), this.myBuilder,{
        detents:[SheetSize.MEDIUM,SheetSize.LARGE,200] as TripleLengthDetents,
        backgroundColor:Color.Pink,
        preferType:SheetType.BOTTOM,
        showClose:true,
        keyboardAvoidMode:this.keyboardAvoidMode
      } as SheetOptions)

      Button('SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_RESIZE
        })
        .id('translateResizeButton')
        .fontSize(20)
        .margin(10)
      Button('SheetKeyboardAvoidMode.RESIZE_ONLY')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.RESIZE_ONLY
        })
        .id('resizeOnlyButton')
        .fontSize(20)
        .margin(10)
      Button('SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL')
        .onClick((e: ClickEvent) => {
          this.isShow1 = !this.isShow1
          this.keyboardAvoidMode = SheetKeyboardAvoidMode.TRANSLATE_AND_SCROLL

        })
        .id('translateScrollButton')
        .fontSize(20)
        .margin(10)
      .bindSheet($$(this.isShow1), this.myBuilder1,{
        detents:[SheetSize.MEDIUM,SheetSize.LARGE,200] as TripleLengthDetents,
        backgroundColor:Color.Pink,
        preferType:SheetType.BOTTOM,
        showClose:true,
        keyboardAvoidMode:this.keyboardAvoidMode
      } as SheetOptions)
    }
    .width('100%')
  }
}