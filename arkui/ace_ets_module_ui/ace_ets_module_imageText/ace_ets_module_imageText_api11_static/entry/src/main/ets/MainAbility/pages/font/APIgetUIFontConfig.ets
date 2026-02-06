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
import font from '@ohos.font';
import {
  Entry,
  Component,
  Column,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  TextDecorationType,
  Margin,
  ClickEvent,
  Button,
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct APIgetUIFontConfig {
  @State text: string = ''

  build() {
    Column() {
      Text(this.text).margin(70).key('APIgetUIFontConfigText')
      Button("fontDir").key('APIgetUIFontConfigButton')
        .width('60%')
        .height('6%')
        .margin(10)
        .onClick((e:ClickEvent)=>{
          let fontConfig = font.getUIFontConfig();
          this.text = fontConfig?.fontDir?.length + ''
        })
    }
  }
}