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
  BarMode,
  BarPosition,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CopyOptions,
  DataChangeListener,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  IDataSource,
  Image,
  InputType,
  ItemAlign,
  LazyForEach,
  Margin,
  Path,
  Search,
  SearchController,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  TabsController,
  Text,
  TextAlign,
  TextArea,
  TextInput,
  TextOverflow
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Log from '../common/Log';
import uiAppearance from '@ohos.uiAppearance'
import { XComponentController } from 'arkui.component.xcomponent.d.ets'

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct uiAppearanceSetDarkMode {
  xcomponentController: XComponentController = new XComponentController()

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear uiAppearanceSetDarkMode start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear uiAppearanceSetDarkMode end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("uiAppearance-setDarkMode1")
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
        .key("uiAppearance-setDarkMode1Text")
        .onClick((e: ClickEvent) => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (err) => {
            console.info(`uiAppearance.setDarkMode: ${err}`);
          })
        })

      Text("uiAppearance-getDarkMode")
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
        .key("uiAppearance-getDarkModeText")
        .onClick((e: ClickEvent) => {
          console.log('uiAppearance.getDarkMode: ' + JSON.stringify(uiAppearance.getDarkMode()))
        })

      Text("uiAppearance-setDarkMode2")
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
        .key("uiAppearance-setDarkMode2Text")
        .onClick((e: ClickEvent) => {
          uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK)
        })

    }.width("100%").height("100%")
  }
}
