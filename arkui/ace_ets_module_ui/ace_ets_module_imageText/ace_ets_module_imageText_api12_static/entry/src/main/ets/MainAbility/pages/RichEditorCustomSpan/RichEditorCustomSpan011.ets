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
import image from "@ohos.multimedia.image";
import { MyCustomSpan } from '../../common/MyCustomSpan'

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
struct RichEditorCustomSpan011 {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  @State length: string = '';
  @State stylesInfo: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;



build() {
    Column() {

      Button('get content').onClick((e: ClickEvent) => {
        let richEditorStyledString = this.controller!.getStyledString()!;
        this.length = richEditorStyledString!.getString().length + '';
      }).id('getContent')
      Button('getStyles')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller!.getStyledString()!;
          let styles = richEditorStyledString!.getStyles(0, richEditorStyledString.length);
          this.stylesInfo += JSON.stringify(styles);
        })
        .id('getStyles')
      Button('removeStyle').onClick((e: ClickEvent) => {
        let richEditorStyledString = this.controller!.getStyledString()!;
        richEditorStyledString.removeStyle(0, 1, StyledStringKey.CUSTOM_SPAN);
        this.controller!.setStyledString(richEditorStyledString);
      }).id('removeStyle')

      Text('length:' + this.length).id('length')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')

      RichEditor(this.options)
        .onReady((): void => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorCustomSpan011')

      Column() {
        Row() {
          Button('add custom').onClick((e: ClickEvent) => {
            this.richEditorStyledString = this.controller!.getStyledString()!;
            this.richEditorStyledString.appendStyledString(this.style1);
            this.controller!.setStyledString(this.richEditorStyledString);
            this.controller!.setCaretOffset(this.richEditorStyledString.length);
          }).id('addCustom')
        }
      }
      .width('100%')
    }
  }
}