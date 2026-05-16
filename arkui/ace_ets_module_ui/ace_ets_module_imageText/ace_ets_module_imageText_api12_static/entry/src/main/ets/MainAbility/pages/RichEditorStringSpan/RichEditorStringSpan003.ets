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

import { LengthMetrics } from '@ohos.arkui.node'
import CommonFunc from '../../common/Common'

import {
  Entry,
  ImageSpanAlignment,ImageFit,ImageAttachmentInterface,
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
  GestureControl,DecorationStyle,TextDecorationType,
  PanGesture,
GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorStringSpan003 {
  stringLength: number = 0;
  @State selection: string = '';
  @State content: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: CommonFunc.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = { fontColor: Color.Blue } as TextStyle;
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Italic
  })
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('init属性',
    [{ start: 0, length: 6, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);
  styledString: StyledString = new StyledString('属性字符串',
    [
      { start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: this.fontStyle2
    },
      {
      start: 0,
      length: 5,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue })
    }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;

  onPageShow() {
    console.info('aboutToAppear initial imagePixelMap');
  }

build() {
    Column() {
      Button('remove').onClick((e: ClickEvent) => {
        // 获取组件展示的属性字符串
        this.richEditorStyledString = this.controller!.getStyledString()!;
        this.richEditorStyledString.clearStyles();
        // 使删除内容后的属性字符串展示在组件上
        this.controller!.setStyledString(this.richEditorStyledString);
      }).id('remove')

      Button('get content').onClick((e: ClickEvent) => {
        // 获取组件展示的属性字符串
        this.content = JSON.stringify(this.richEditorStyledString.getStyles(6 , 5));
        console.log('RichEditorController this.content:' + this.content);

      }).id('get_content')

      Text('content:' + this.content).id('content')

      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorStringSpan003')

      Column() {
        Row() {
          Button('add text').onClick((e: ClickEvent) => {
            this.richEditorStyledString = this.controller!.getStyledString()!;
            this.richEditorStyledString.appendStyledString(this.styledString);
            this.controller!.setStyledString(this.richEditorStyledString);
            this.controller!.setCaretOffset(this.richEditorStyledString.length);
          }).id('add_text')
        }

      }
      .width('100%')
    }
  }
}