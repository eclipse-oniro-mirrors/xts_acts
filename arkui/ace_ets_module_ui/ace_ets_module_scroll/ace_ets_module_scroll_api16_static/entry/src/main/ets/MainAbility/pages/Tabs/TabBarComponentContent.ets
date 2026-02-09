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
  $r,
  Column,
  ColumnOptions,
  Builder,
  FontWeight,
  wrapBuilder,
  Row,
  ClickEvent,
  Text,
  Swiper,
  TabsController,
  Button,
  BarMode,
  BarPosition,
  Color,
  SwiperController,
  TextAlign,
  Direction,
  Tabs,
  Margin,
  TabContent,
  CustomBuilderT,
  ComponentContent
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';

class Params {
  public text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .id('TabContent1')
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }
}

@Entry
@Component
struct TabBarComponentContent {
  @State message1: string = 'tabBar1';
  @State setUndefinedIndex: number = 0;
  context: UIContext = this.getUIContext();
  private controller: TabsController = new TabsController();
  tabBar1: ComponentContent<Params> = new ComponentContent<Params>(this.context, wrapBuilder(buildText),
    new Params(this.message1));
  @State setUndefined: (ComponentContent<Params> | undefined)[] = [
    this.tabBar1, undefined
  ]

  build() {
    Row() {
      Column() {
        Button('set ComponentContent').margin(1)
          .onClick((e: ClickEvent) => {
            this.setUndefinedIndex = 0
          })
          .id('button1')
        Button('set undefined').margin(1)
          .onClick((e: ClickEvent) => {
            this.setUndefinedIndex = 1
          })
          .id('button2')
        Button('set null').margin(1)
          .onClick((e: ClickEvent) => {
            // this.setUndefinedIndex = 2
          })
          .id('button3')
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor(Color.Blue).borderRadius('12vp')
          }
          .tabBar(() => {this.setUndefined[this.setUndefinedIndex.toInt()]})
        }
        .vertical(false)
        .barMode(BarMode.Fixed)
        .barWidth('auto')
        .barHeight('auto')
        .width(300)
        .height(300)
        .backgroundColor('#F1F3F5')
        .margin({ top: 20 } as Margin)
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}