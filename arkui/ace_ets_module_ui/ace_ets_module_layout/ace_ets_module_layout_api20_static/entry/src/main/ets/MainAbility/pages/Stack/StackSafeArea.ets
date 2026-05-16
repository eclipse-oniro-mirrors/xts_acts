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

import { LengthMetrics } from '@kit.ArkUI'
import {
  LayoutSafeAreaType,
  Entry,
  Component,
  Column,
  LayoutSafeAreaEdge,
  ColumnOptions,
  Stack,
  Row,
  LayoutPolicy,
  Color,
  Alignment,
  Button,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';

@Entry
@Component
struct StackSafeArea {
  @State layoutSafeAreaType: LayoutSafeAreaType[] | null | undefined = [] as LayoutSafeAreaType[] | null | undefined
  @State layoutSafeAreaEdge: LayoutSafeAreaEdge[] | null | undefined = [] as LayoutSafeAreaEdge[] | null | undefined
  @State str: string = ''

  build() {
    Column({ space: 2 } as ColumnOptions) {
      Stack() {
        Stack() {
        }
        .id('StackSafeArea1')
        .width(LayoutPolicy.matchParent)
        .height(LayoutPolicy.matchParent)
        .backgroundColor(Color.Orange)

        
      }
      .id('StackSafeArea2')
      .width(100)
      .height(80)
      .backgroundColor(Color.Pink)
      .align(Alignment.TopStart)

      

      Row() {
        Button('SYSTEM')
          .id('SystemButton1')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaType = [LayoutSafeAreaType.SYSTEM]
            this.str = String(this.layoutSafeAreaType).toString()
          }).width(55).height(25)

        Button('NULL1')
          .id('NullButton1')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaType = null
            this.str = this.layoutSafeAreaType + ''
          }).width(55).height(25)
      }

      Row() {
        Button('UNDEFINED1')
          .id('UndefinedButton1')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaType = undefined
            this.str = this.layoutSafeAreaType + ''
          }).width(55).height(25)
        Button('TOP')
          .id('TopButton1')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.TOP]
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
        Button('BOTTOM')
          .id('BottomButton1')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.BOTTOM]
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
        Button('START')
          .id('StartButton1')
          .onClick((e: ClickEvent) => {
            
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
      }

      Row() {
        Button('END')
          .id('EndButton1')
          .onClick((e: ClickEvent) => {
            
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
        Button('VERTICAL')
          .id('VerticalButton1')
          .onClick((e: ClickEvent) => {
            
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
        Button('HORIZONTAL')
          .id('HorizontalButton1')
          .onClick((e: ClickEvent) => {
            
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
        Button('ALL2')
          .id('AllButton2')
          .onClick((e: ClickEvent) => {
            
            this.str = String(this.layoutSafeAreaEdge).toString()
          }).width(55).height(25)
      }

      Row() {
        Button('NULL2')
          .id('NullButton2')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaEdge = null
            this.str = this.layoutSafeAreaEdge + ''
          }).width(55).height(25)
        Button('UNDEFINED2')
          .id('UndefinedButton2')
          .onClick((e: ClickEvent) => {
            this.layoutSafeAreaEdge = undefined
            this.str = this.layoutSafeAreaEdge + ''
          }).width(55).height(25)
        Text(this.str)
          .id('GetSafeAreaNumber1')
          .width(75)
          .height(25)
        
      }

    }
    .width('100%')
    .height('100%')
    .padding(5)
  }
}