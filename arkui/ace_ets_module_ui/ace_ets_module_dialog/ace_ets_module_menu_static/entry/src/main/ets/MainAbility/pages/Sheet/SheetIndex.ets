/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Entry,
  Component,
  TripleLengthDetents,
  Builder,
  Column,
  Button,
  Text,
  ColumnOptions,
  SheetSize,
  ClickEvent,
  FlexAlign,
  SheetType,
  SheetKeyboardAvoidMode,
  ModalTransition,
  ContentTransitionEffect,
  MenuKeyboardAvoidMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SheetIndex {
  @State isShow: boolean = false
  @State detentSelection: SheetSize | number = SheetSize.MEDIUM;
  @State value: number = 0

  aboutToAppear() {
    try {
      let router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  @Builder
  myBuilder() {
    Column({ space: 5 } as ColumnOptions) {
      Text('' + this.value)
        .id('text')
      Button('Change detent -10')
        .id('changeBtn')
        .onClick((e: ClickEvent) => {
          this.detentSelection = -10;
        })
      Button('Change detent to Large')
        .id('changedetent')
        .onClick((e: ClickEvent) => {
          this.detentSelection = SheetSize.LARGE;
        })
      Button('关闭模态框')
        .id('close')
        .onClick((e: ClickEvent) => {
          this.isShow = false
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('Sheet')
        .id('bindSheet')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '88%' })
        .fontSize(10)
        .onClick((e: ClickEvent) => {
          this.isShow = true
        })
        .bindSheet(this.isShow, this.myBuilder, {
          detents: [SheetSize.MEDIUM, SheetSize.FIT_CONTENT, SheetSize.LARGE] as TripleLengthDetents,
          preferType: SheetType.BOTTOM,
          detentSelection: this.detentSelection,
          enableFloatingDragBar: false,
          modalTransition: ModalTransition.DEFAULT,
          keyboardAvoidMode: SheetKeyboardAvoidMode.POPUP_SHEET,
          onDetentsDidChange: (value: Int) => {
            this.value = value.toDouble()
            console.log('BindSheet onDetentsDidChange.' + value)
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '2%', bottom: '2%' })
  }
}
