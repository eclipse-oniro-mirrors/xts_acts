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

import {  MultiNavPathStack } from '@ohos.arkui.advanced.MultiNavigation';
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,
  NavDestination, FontWeight, ButtonType,
} from '@ohos.arkui.component'
@Component
export struct PageDetail1 {
  @State message: string = 'PageDetail1';
  @Consume('pageStack') pageStack: MultiNavPathStack;

  build() {
      NavDestination() {
        Column() {
          Column() {
            Text(this.message).id('detailTextId')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height('8%')

          Scroll() {
            Column() {
              Button('pop', { stateEffect: true, type: ButtonType.Capsule })
                .height(40)
                .margin(10)
                .backgroundColor('#ffac056d')
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.pop();
                  }
                })
                .id('detailPopId')

              //clear
              Button('clear', { stateEffect: true, type: ButtonType.Capsule })
                .height(40)
                .margin(10)
                .backgroundColor('#ffac056d')
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.clear()
                  }
                })

              //setKeepBottomPage
              Button('setKeepBottomPage true', { stateEffect: true, type: ButtonType.Capsule })
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.keepBottomPage(true);
                  }
                })
                .id('setKeepBottomPageId')

              Button('setKeepBottomPage false', { stateEffect: true, type: ButtonType.Capsule })
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.keepBottomPage(false);
                  }
                })
            }
            .width('100%')
          }
          .width('100%')
          .height('92%')
        }
      }
      .backgroundColor('#9966FF')
      .hideTitleBar(true)
    }
  }
