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
  Entry,TextInputController,TextAreaController,SearchController,Grid,TextInput,TextArea,Search,GridItem,SearchOptions,TextAreaOptions,TextInputOptions,
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
struct TextInputTextAreaSearch{
  controller1: TextInputController = new TextInputController()
  controller2: TextAreaController = new TextAreaController()
  controller3: SearchController = new SearchController()

  // 自定义键盘组件
  @Builder CustomKeyboardBuilder() {
    Column() {
      Button('x').onClick((e: ClickEvent) => {
        // 关闭自定义键盘
        this.controller1.stopEditing()
        this.controller2.stopEditing()
        this.controller3.stopEditing()
      }).id('supportAvoidance_stopEditing')
      Grid() {
        ForEach(new Array<number | string>(1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'), (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110)
              .height('5%')
              .onClick((e: ClickEvent) => {})
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

build() {
    Column() {
      Column(){
        Text('test').width('100%')
      }
      .width('100%')
      .height('70%')
      TextInput({ controller: this.controller1 } as TextInputOptions)
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder, {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('TextInput_supportAvoidance')
      TextArea({ controller: this.controller2 } as TextAreaOptions)
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder, {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('TextArea_supportAvoidance')
      Search({ controller: this.controller3 } as SearchOptions)
        // 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder, {supportAvoidance: true}).border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('100%')
        .height('10%')
        .id('Search_supportAvoidance')
    }
  }
}