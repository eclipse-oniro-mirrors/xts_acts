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
import { LengthMetrics } from '@ohos.arkui.node'
import {
  $r,
  Alignment,
  AnimationStatus,
  BarState,
  Button,
  ClickEvent,
  Color,
  ColorFilter,
  Column,
  ColumnOptions,
  Component,
  Edge,
  EdgeEffect,
  Entry,
  FlexAlign,
  ForEach,
  HorizontalAlign,
  Image,
  ImageAnimator,
  ImageAttachment,
  ImageError,
  ImageErrorCallback,
  ImageSpan,
  Margin,
  MutableStyledString,
  Padding,
  RichEditor,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  Row,
  RowOptions,
  Scroll,
  ScrollDirection,
  Scroller,
  ScrollState,
  Stack,
  Text,
  TextAlign,
  Visibility
} from '@ohos.arkui.component';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ImageOnErrorExample {
  @State componentWidthValue: number = 0
  @State componentHeightValue: number = 0

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text('componentWidth: ' + this.componentWidthValue + ' componentHeight: ' + this.componentHeightValue)
      Text('' + this.componentWidthValue).id('componentWidth')
      Text('' + this.componentHeightValue).id('componentHeight')
      Image('xxx')
        .width(100)
        .height(100)
        .onError((error: ImageError) => {
          console.log('componentWidth = ' + error.componentWidth)
          console.log('componentHeight = ' + error.componentHeight)
          this.componentWidthValue = error.componentWidth
          this.componentHeightValue = error.componentHeight
        })
        .id('image')
    }.width('100%')
    .padding(20)
  }
}