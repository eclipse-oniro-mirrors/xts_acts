'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {
  $rawfile,
  Alignment,
  ClickEvent,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  Image,
  ItemAlign,
  Path,
  Text,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import Log from '../common/Log';
import router1 from '@system.router'
import router2 from '@system.router'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct RouterEnableAlertBeforeBackPage {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear RouterEnableAlertBeforeBackPage start`)

    router1.enableAlertBeforeBackPage({
      message: 'Message Info'
    })

    router2.enableAlertBeforeBackPage({
      message: 'Message Info',
      success: () => {
        console.log('success')
      },
      cancel: () => {
        console.log('fail')
      },
    })
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear RouterEnableAlertBeforeBackPage end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("ohos-router-EnableAlertBeforeBackPage")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("enableAlertBeforeBackPageText")
        .onClick((e: ClickEvent) => {
          router1.back()
        })

      Text("router-DisableAlertBeforeBackPage")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("disableAlertBeforeBackPageText")
        .onClick((e: ClickEvent) => {
          router1.disableAlertBeforeBackPage()
        })

      Text("router-EnableAlertBeforeBackPage")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("enableAlertBeforeBackPageText1")
        .onClick((e: ClickEvent) => {
          router2.back()
        })

      Text("router-DisableAlertBeforeBackPage")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("disableAlertBeforeBackPageText")
        .onClick((e: ClickEvent) => {
          router2.disableAlertBeforeBackPage()
        })

    }.width("100%").height("100%")
  }
}

