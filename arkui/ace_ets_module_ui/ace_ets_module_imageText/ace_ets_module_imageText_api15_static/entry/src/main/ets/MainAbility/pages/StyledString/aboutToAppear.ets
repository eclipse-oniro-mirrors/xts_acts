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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  Entry,
  MutableStyledString,
  ColorFilter,
  ClickEvent,
  Component,
  RichEditor,
  Column,
  Text,
  ImageSpan,
  Visibility,
  $r,
  FlexAlign,
  HorizontalAlign,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  ColumnOptions,
  ImageAttachment,
  Button,
  Row,
  Margin,
  TextController,
  Image,
  Component
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct styled_string_demo8 {
  controller1 : TextController = new TextController
  mutableStyledString1: MutableStyledString = new MutableStyledString('运动45分钟');

   aboutToAppear():void {
    console.info('aboutToAppear initial succ')
    this.controller1.setStyledString(this.mutableStyledString1)
  }


  build() {
    Column() {
      Text(undefined, { controller: this.controller1 }).height('10%').id('text')
    }.width('100%')
  }
}