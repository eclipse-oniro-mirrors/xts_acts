'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
,SelectionOptions,MenuPolicy,RichEditorImageSpanResult,Image,RowOptions,TextDecorationType,TextDecorationStyle} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorShortCutKeys005 {
  controller: RichEditorController = new RichEditorController();
  private myOffset: int | undefined = undefined;
  private myBuilder: CustomBuilder =  ()=>{};
  @State positionNum: int = -1;
  @State selection: string = '';
  @Builder
  placeholderBuilder() {
    Row({ space: 2 } as RowOptions) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 } as Margin)
      Text('Custom').fontSize(10)
    }.width(100).height(50).padding(5)
  }

build() {

    Column() {
      Text('positionNum:' + this.positionNum).id('positionNum')
      Text('selection:' + this.selection).id('selection')
      Button('get position')
        .id('get_position')
        .margin(15)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.positionNum = this.controller!.getCaretOffset() as int;
        })
      Button('set position')
        .id('set_position')
        .margin(15)
        .backgroundColor(Color.Blue)
        .onClick((e: ClickEvent) => {
          this.controller!.setCaretOffset(3);
        })
      RichEditor({ controller: this.controller } as RichEditorOptions)
        .padding('10px')
        .height(300)
        .width(200)
        .borderWidth(1)
        .borderColor(Color.Green)
        .onReady((): void => {
          this.controller!.addTextSpan('abc123');
            this.myBuilder = () => {
              this.placeholderBuilder();
            }
            this.controller!.addBuilderSpan(this.myBuilder, { offset: this.myOffset });
          this.controller!.addTextSpan('abc123');
            this.controller!.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['25px', '25px']
                }
              });
          this.controller!.addTextSpan('abc123');
            this.controller!.addSymbolSpan($r('sys.symbol.ohos_trash'),
              {
                style:
                {
                  fontSize: 30
                }
              });
        })
        .onSelectionChange((value: RichEditorRange): void => {
          console.log('RichEditorController onSelectionChange:' + JSON.stringify(value));
          this.selection = JSON.stringify(value);
        })
        .id('RichEditorShortCutKeys005')
    }
  }
}