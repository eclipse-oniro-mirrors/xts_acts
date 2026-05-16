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
struct RichEditorLineMetrics012 {
  controller: RichEditorController = new RichEditorController();
  @State lineMetrics: string = '';
  @State lineCount: int = 0;
  @State lineMetrics2: string = '';



build() {

    Column() {
      Button('get lineMetrics').id('getFirst')
        .onClick((e: ClickEvent) => {
          let layoutManager: LayoutManager = this.controller!.getLayoutManager() as LayoutManager;
          this.lineCount = layoutManager.getLineCount() as int
          let lineMetrics1 = layoutManager.getLineMetrics(1);
          console.log('RichEditorController 1 lineMetrics 1:' +  JSON.stringify(lineMetrics1));
          this.lineMetrics2 = JSON.stringify(lineMetrics1);
        })
        .margin({ bottom: 20, top: 10 } as Margin)
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .padding('10px')
        .width(200)
        .onReady((): void => {
          this.controller!.addTextSpan('012345012345abctest012345012345abctest')
        })
        .onSelectionChange((value: RichEditorRange): void => {
          console.log('RichEditorController value:' + JSON.stringify(value));
        })
        .id('RichEditorLineMetrics012')
      Text('lineCount:' + this.lineCount).id('lineCount')
      Text('lineMetrics(1):' + this.lineMetrics2).id('lineMetrics2')
    }
  }
}