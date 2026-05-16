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
import { MyCustomSpan } from '../../common/MyCustomSpan'

import {
  Entry,
  Component,SpanStyle,
  Column,
  Row,
  Text,
  ColumnOptions,
  TouchType,
  CustomBuilder,
  DragItemInfo,
  Color,
  Button,
  TouchEvent,
  Margin,
  Scroller,
  GestureRecognizer,
  PanRecognizer,
  GestureEvent,
  ScrollableTargetInfo,
  Stack,
  Alignment,
  Scroll,
  TextAlign,
  ForEach,
  ScrollDirection,
  BarState,
  EdgeEffect,
  GestureControl,
  PanGesture,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorCustomSpan004 {
  @State customSpanInfo: string = '';
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;
  isPageShow: boolean = true;

   onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;
    this.controller!.setStyledString(this.style1)
  }


build() {
    Column() {
      Text('customSpanInfo:' + this.customSpanInfo).id('customSpanInfo')
      Button('get CustomSpanInfo')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller!.getStyledString()!;
          let styles:SpanStyle[] = richEditorStyledString!.getStyles(0, richEditorStyledString.length) as SpanStyle[];
          this.customSpanInfo = JSON.stringify(styles);
        })
        .id('getCustomSpanInfo')
      RichEditor(this.options)
        .onReady((): void => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorCustomSpan004')
    }
  }
}