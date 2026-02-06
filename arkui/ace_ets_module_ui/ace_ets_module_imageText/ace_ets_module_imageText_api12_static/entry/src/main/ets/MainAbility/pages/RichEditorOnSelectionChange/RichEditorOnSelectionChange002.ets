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
struct RichEditorOnSelectionChange002 {
  controller: RichEditorController = new RichEditorController();
  @State onSelectCallBack: boolean = false;
  @State setCaretOffset: string = '';
  private offsets: int = -1;

build() {

    Column() {

      Text('onSelectCallBack:' + this.onSelectCallBack).id('onSelectCallBack')
      Text('setCaretOffset:' + this.setCaretOffset).id('setCaretOffset')

      Button('setCaretOffset -1').onClick((e: ClickEvent) => {
        this.controller!.setCaretOffset(this.offsets);
      }).id('set1')

      Button('setCaretOffset 0').onClick((e: ClickEvent) => {
        this.offsets = 0;
        this.controller!.setCaretOffset(this.offsets);
      }).id('set2')

      Button('setCaretOffset 1').onClick((e: ClickEvent) => {
        this.offsets = 1;
        this.controller!.setCaretOffset(this.offsets);
      }).id('set3')

      Button('setCaretOffset 5').onClick((e: ClickEvent) => {
        this.offsets = 5;
        this.controller!.setCaretOffset(this.offsets);
      }).id('set4')

      Button('setCaretOffset 10000').onClick((e: ClickEvent) => {
        this.offsets = 10000;
        this.controller.setCaretOffset(this.offsets);
      }).id('set5')


      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller.addTextSpan('0123abcd',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onSelectionChange((value: RichEditorRange): void => {
          this.onSelectCallBack = true;
          console.log('RichEditorController value:' + JSON.stringify(value));
          const valueObj = JSON.parseJsonElement(JSON.stringify(value))
          if('{"start":8,"end":8}' !== `{"start":${valueObj.getDouble('start')},"end":${valueObj.getDouble('end')}}`){
            this.setCaretOffset += this.offsets + ',';
          }
        })
        .id('rich_struct')

    }
  }
}