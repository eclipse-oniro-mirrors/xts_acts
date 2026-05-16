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
  Entry,EnterKeyType,SubmitEvent,
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
struct RichEditorKeyBoard007 {
  controller: RichEditorController = new RichEditorController();
  @State onSubmitCallBack: boolean = false;
  @State isEditingFlag: boolean = false;
  private enterType: EnterKeyType = EnterKeyType.Go;
build() {

    Column() {
      Text('onSubmitCallBack:' + this.onSubmitCallBack).id('onSubmitCallBack')
      Text('isEditingFlag:' + this.isEditingFlag).id('isEditingFlag')
      Button('set enterType')
        .onClick((e: ClickEvent) => {
          this.enterType = EnterKeyType.Search;
        }).id('set_enterType')

      Button('up customKeyboard').onClick((e: ClickEvent) => {
        this.controller!.stopEditing()
        console.log('RichEditorController up customKeyboard');
      }).id('up_customKeyboard')

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .onReady((): void => {
          this.controller!.addTextSpan('01',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 30
              }
            })
        })
        .onEditingChange((isEditing: boolean): void => {
          this.isEditingFlag = isEditing;
          console.log('RichEditorController Editing Status:' + isEditing);
        })
        .enterKeyType(this.enterType)
        .onSubmit((enterKey: EnterKeyType, event: SubmitEvent): void => {
          this.onSubmitCallBack = true;
          console.log('RichEditorController trigger richeditor onsubmit' + enterKey);
          this.controller!.addTextSpan(' type['+ enterKey +'] triggerred');
          event.keepEditableState();
        })
        .id('RichEditorKeyBoard007')

    }
  }
}