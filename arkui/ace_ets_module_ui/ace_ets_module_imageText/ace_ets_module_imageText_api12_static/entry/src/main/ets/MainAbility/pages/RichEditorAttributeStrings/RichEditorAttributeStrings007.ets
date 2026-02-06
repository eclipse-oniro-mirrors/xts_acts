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
  Entry,RowOptions,
  Component,RichEditorRange,
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
  Alignment,Image,
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
struct RichEditorAttributeStrings007 {

  @State spans: string = '';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller } as RichEditorOptions;
  private myOffset: int | undefined = undefined
  private myBuilder: CustomBuilder = ()=>{}
  @Builder
  placeholderBuilder() {
    Row({ space: 2 } as RowOptions as RowOptions) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 } as Margin)
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
  }



build() {
    Column() {

      Button('toStyledString 0,500').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: 0,
          end: 500});
        this.spans = str!.getString();
      }).id('toStyledString')

      Button('toStyledString 2,2').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: 2,
          end: 2});
        this.spans = str!.getString();
      }).id('toStyledString1')

      Button('toStyledString 2,1').onClick((e: ClickEvent) => {
        let str = this.controller!.toStyledString({start: 2,
          end: 1});
        this.spans = str!.getString();
      }).id('toStyledString2')

      Button('toStyledString undefined').onClick((e: ClickEvent) => {
        // let str = this.controller!.toStyledString(undefined);
        // this.spans = str!.getString();
      }).id('toStyledStringUndefined')

      Button('builder').onClick((e: ClickEvent) => {
        this.myBuilder = () => {
          this.placeholderBuilder()
        }
      }).id('builder')

      Button('add symbol builder').onClick((e: ClickEvent) => {
        this.controller!.addSymbolSpan($r('sys.symbol.ohos_trash'),
          {
            style:
            {
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
        this.controller!.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
        this.controller!.addBuilderSpan(this.myBuilder, { offset: this.myOffset })
      }).id('addSpans')

      Button('add image').onClick((e: ClickEvent) => {
        this.controller!.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
        this.controller.addImageSpan($r('app.media.icon'),
          {
            imageStyle:
            {
              size: ['57px', '57px']
            }
          })
      }).id('addImage')


      Text('spans:' + this.spans).id('spans')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller.addTextSpan('0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
          this.controller.addTextSpan('abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyz',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
          this.controller.addTextSpan('abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyz',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 20,
                textShadow: { radius: 10, color: Color.Blue, offsetX: 10, offsetY: 0 }
              }
            })
        })
        .height(100)
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)
        .id('RichEditorAttributeStrings007')
    }
  }
}