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
struct RichEditorApi7 {
  @State rangeBefore: string = "";
  controller:RichEditorController = new RichEditorController()


build() {
    Column() {
      Text(this.rangeBefore).width("100%")

      RichEditor({ controller: this.controller } as RichEditorOptions)
        .onReady((): void => {
          this.controller!.addTextSpan('testWord',{
            style:{
              fontColor:Color.Orange,
              fontSize:30
            }
          })
          this.controller!.deleteSpans({
            start:0,
            end:1
          })
        })
        .height("20%")
        .width("100%")
        .borderWidth(1)
        .borderColor(Color.Black)
        .onWillChange((value:RichEditorChangeValue): boolean => {
          this.rangeBefore =  value.rangeBefore.start + ',' + value.rangeBefore.end ;
          return true
        })
      Text(this.rangeBefore).id('RichEditorApi7_text1')
    }
  }
}