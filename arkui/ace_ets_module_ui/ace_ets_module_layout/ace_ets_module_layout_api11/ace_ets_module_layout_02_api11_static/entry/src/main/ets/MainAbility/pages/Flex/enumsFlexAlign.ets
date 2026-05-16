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
import GlobalContext from '../../common/GlobalContext';
import { FaceValue } from '../../common/Value';
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Image,ImageFit, Scroller,
  Scroll,
  ForEach,
  Search,
  SafeAreaType,
  ScrollDirection,
  BarState,
  Color,
  Flex,FlexOptions,Margin,FlexWrap,ItemAlign,FlexDirection,HorizontalAlign,Alignment,FlexAlign,Position,
  ColumnOptions
} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import {
  State,


  AppStorage
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct JustifyContentFlex {
  @State justifyContent: FlexAlign = FlexAlign.Center

  build() {
    Flex({ justifyContent: this.justifyContent } as FlexOptions) {
      Text('1')
        .width('20%')
        .height(50)
        .backgroundColor(0xF5DEB3)
      Text('2')
        .width('20%')
        .height(50)
        .backgroundColor(0xD2B48C)
      Text('3')
        .width('20%')
        .height(50)
        .backgroundColor(0xF5DEB3)
    }.key("justifyContent")
    .width('90%')
    .padding(10)
    .backgroundColor(0xAFEEEE)
  }
}