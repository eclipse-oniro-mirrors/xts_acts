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

import {
  Entry,
  Component,
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
struct RichEditorAttributeStrings002 {

  @State styledString: string = '';
  fontStyle1: TextStyle = { fontColor: Color.Blue } as TextStyle
  mutableStyledString: MutableStyledString = new MutableStyledString('abcd',
    [{
      start: 0,
      length: 4,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle1
    }]);
  fontStyle2: TextStyle = { fontColor: Color.Red } as TextStyle;
  mutableStyledString1: MutableStyledString = new MutableStyledString('hello',
    [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;

  controller1: RichEditorStyledStringController = new RichEditorStyledStringController();
  options1: RichEditorStyledStringOptions = { controller: this.controller1 } as RichEditorStyledStringOptions;



build() {
    Column() {

      Button('getStyles')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller!.getStyledString()!;
          this.styledString = richEditorStyledString!.getString();
        })
        .id('getStyles')

      Button('getOtherStyles')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller1.getStyledString();
          this.styledString = richEditorStyledString!.getString();
        })
        .id('getOtherStyles')

      Text('StyledString:' + this.styledString).id('StyledString')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings002')

      RichEditor(this.options1)
        .onReady((): void => {
          this.controller1.setStyledString(this.mutableStyledString1);
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings002_1')
    }
  }
}