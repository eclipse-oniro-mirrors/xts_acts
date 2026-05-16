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
  Entry,SelectionOptions,
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
  TouchEvent,MenuPolicy,
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
struct RichEditorOnSelectionChange018 {
  controller: RichEditorController = new RichEditorController();
  @State onSelectCallBack: boolean = false;
  @State message: string = '';

build() {

    Column() {

      Text('onSelectCallBack:' + this.onSelectCallBack).id('onSelectCallBack')
      Text('message:' + this.message).id('message')
      Button('setCaretOffset').onClick((e: ClickEvent) => {
        this.controller!.setCaretOffset(1);
      }).id('setCaretOffset')

      Button('select')
        .id('select')
        .margin(15)
        .backgroundColor(Color.Transparent)
        .onClick((e: ClickEvent) => {
          let options: SelectionOptions = {
            menuPolicy: MenuPolicy.SHOW
          };
          this.controller!.setSelection(2, 4, options);
        })

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('01234',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
          this.controller!.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
                fontSize: 30
              }
            })
        })
        .onSelectionChange((value: RichEditorRange): void => {
          this.onSelectCallBack = true;
          console.log('RichEditorController value:' + JSON.stringify(value));
          this.message = JSON.stringify(value);
        })
        .id('rich_struct')

    }
  }
}