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

import { MultiNavPathStack, SplitPolicy } from '@ohos.arkui.advanced.MultiNavigation';
import hilog from '@ohos.hilog';
import { State, Provide, Consume, AppStorage,  } from '@ohos.arkui.stateManagement'
import { Entry, Component, Column, Button, ColumnOptions, ClickEvent, Text, Color, Builder, Scroll, Margin, Row, $r,
  NavDestination, FontWeight, ButtonType, NavDestinationMode, LaunchMode, NavPathInfo,
} from '@ohos.arkui.component'

class Param {
  private info: string = 'defaultParam';
  constructor(info: string) { this.info = info }
}

@Component
export struct PageHome1 {
  @State message: string = 'PageHome1';
  @Consume('pageStack') pageStack: MultiNavPathStack;

  @State disableAnimationValue: boolean = false

  build() {
      NavDestination() {
        Column() {
          Column() {
            Text(this.message).id('homePageId')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height('8%')
          Scroll(){
            Column() {
              Button('setPlaceholderPage', { stateEffect: true, type: ButtonType.Capsule})
                .width('50%')
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    console.log('test setPlaceholderPage');
                    this.pageStack.setPlaceholderPage(new NavPathInfo('PagePlaceholder',undefined));
                  }
                })
                .id('setPlaceholderPageId')

              Button('pushPath PageDetail1', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.pushPath(new NavPathInfo('PageDetail1',new Param('ok') ), true, SplitPolicy.DETAIL_PAGE);
                  }
                })
                .id('pageDetail1Id')


              Button('pop', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .backgroundColor('#ffac056d')
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.pop();
                  }
                })

              //clear
              Button('clear', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .backgroundColor('#ffac056d')
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.clear()
                  }
                })

              //switchFullScreen
              Button('switchFullScreen true', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    console.log('test switchFullScreenState');
                    let result = this.pageStack.switchFullScreenState(true);
                    hilog.info(0x0000, 'demotest', 'switchFullScreen return : ' + result);
                  }
                }).id('switchFullScreenId')


              Button('switchFullScreen false', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    let result = this.pageStack.switchFullScreenState(false);
                    hilog.info(0x0000, 'demotest', 'switchFullScreen return : ' + result);
                  }
                })
              Button('switchFullScreen undefined', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    let result  = this.pageStack.switchFullScreenState(undefined);
                    hilog.info(0x0000, 'demotest', 'switchFullScreen return : ' + result);
                  }
                })

              //setKeepBottomPage
              Button('setKeepBottomPage true', { stateEffect: true, type: ButtonType.Capsule})
                .height(40)
                .margin(10)
                .onClick((e: ClickEvent) => {
                  if (this.pageStack !== undefined && this.pageStack !== null) {
                    this.pageStack.keepBottomPage(true);
                  }
                })

              Button('setKeepBottomPage false', { stateEffect: true, type: ButtonType.Capsule})
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
      .backgroundColor('#FF6699')
      .hideTitleBar(true)
    }
}