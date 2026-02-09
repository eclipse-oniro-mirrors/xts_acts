'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,ContentCoverOptions,
  Row,Color,Builder,FlexAlign,$$
} from '@ohos.arkui.component'
import {
  State,
  Watch,PropRef,ObjectLink,
  Link,LocalStoragePropRef,LocalStorageLink,Consume,Provide,
  StorageLink,Observed,Track,LocalStorage
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';


@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State sheetHeight: number = 300;

  @Builder myBuilder() {
    Column() {
      Button('change height')
        .height('5%')
        .fontSize(9)
        .onClick(():void => {
          this.sheetHeight = 500;
        })

      Button('Set Illegal height')
        .height('5%')
        .fontSize(9)
        .onClick(():void => {
          this.sheetHeight = -1;
        })

      Button('close modal 1')
        .height('5%')
        .fontSize(9)
        .onClick(():void => {
          this.isShow = false;
        })
        .id('bindSheetButton1')
    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button('transition modal 1')
        .onClick(():void => {
          this.isShow = true
        })
        .id('bindSheetButton')
        .fontSize(9)
        .height('5%')
        .bindSheet($$(this.isShow), this.myBuilder, {
          height: this.sheetHeight,
          backgroundColor: Color.Green,
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
        })
      Text(`isShow: ${this.isShow}`).id('bindSheetText').height('5%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}