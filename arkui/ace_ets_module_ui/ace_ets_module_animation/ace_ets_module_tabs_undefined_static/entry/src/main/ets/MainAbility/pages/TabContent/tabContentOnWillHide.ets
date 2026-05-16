'use static'
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
  Entry,
  Component,
  Button,
  ClickEvent,
  Column,
  TabContent,
  Tabs,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct tabContentOnWillHidePage {
  @State isState: boolean = true;
  @State tabContentOnWillHideContent: string = 'undefined onWillHide';
  @State isChange: boolean = true;

  @Builder tabBuilderOne() {
    Column() {
      Text('test')
        .fontSize(16)
        .id('textOnWillHideTaberOne')
    }.width('100%')
  }
  @Builder tabBuilderTwo() {
    Column() {
      Text('test')
        .fontSize(16)
        .id('textOnWillHideTaberTwo')
    }.width('100%')
  }
  build() {
    Column() {
      Text(this.tabContentOnWillHideContent)
        .id('textOnWillHide')
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar(this.tabBuilderOne)
        .id('tabContentOnWillHide')
        .onWillHide(this.isState ? undefined : () => {
          this.tabContentOnWillHideContent = 'onWillHide successfully';
        })

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFFFFFFF')
        }.tabBar(this.tabBuilderTwo)
      }

      Button('onWillHide: ' + this.isState)
        .id('buttonOnWillHide')
        .backgroundColor('#E67C92')
        .onClick((event: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}