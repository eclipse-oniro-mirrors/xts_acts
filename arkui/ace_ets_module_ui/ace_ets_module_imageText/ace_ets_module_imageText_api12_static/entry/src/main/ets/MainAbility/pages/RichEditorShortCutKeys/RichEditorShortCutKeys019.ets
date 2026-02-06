'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
  Entry,DecorationStyle,
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
struct RichEditorShortCutKeys019 {
  @State content: string = '';
  @State stylesInfo: string = '';

  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: CommonFunc.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Italic
  })

  mutableStyledString: MutableStyledString = new MutableStyledString('abc',
    [{ start: 0, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.textStyle },
      { start: 0, length: 4, styledKey: StyledStringKey.DECORATION,
        styledValue: new DecorationStyle({ type: TextDecorationType.Underline, color: Color.Blue })}]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions ;


  build() {
    Column() {

      Button('get content').onClick((e: ClickEvent) => {
        this.richEditorStyledString = this.controller!.getStyledString()!;
        this.content = this.richEditorStyledString.subStyledString(0, 6)!.getString();
        console.log('RichEditorController this.content:' + this.content);

      }).id('getContent')
      Button('getStyles')
        .onClick((e: ClickEvent) => {
          let richEditorStyledString = this.controller!.getStyledString()!;
          let styles = richEditorStyledString!.getStyles(0, richEditorStyledString.length)!
          if (styles!.length !== 0) {
            for (let i = 0; i < styles!.length; i++) {
              console.info('mutableStyledString1 style object start:' + styles[i as int].start)
              console.info('mutableStyledString1 style object length:' + styles[i as int].length)
              console.info('mutableStyledString1 style object key:' + styles[i as int].styledKey)
              this.stylesInfo += 'start:' + styles[i as int].start + ',';
              this.stylesInfo += 'length:' + styles[i as int].length + ',';
              this.stylesInfo += 'styledKey:' + styles[i as int].styledKey + ',';
              if (styles[i as int].styledKey === 0) {
                let fontAttr = styles[i as int].styledValue as TextStyle;
                this.stylesInfo += 'fontWeight:' + fontAttr.fontWeight + ',';
                this.stylesInfo += 'fontStyle:' + fontAttr.fontStyle + ',';
              }
              if (styles[i as int].styledKey === 1) {
                let decoAttr = styles[i as int].styledValue as DecorationStyle;
                this.stylesInfo += 'decoration type:' + decoAttr.type + ',';
                this.stylesInfo += 'decoration color:' + decoAttr.color;
              }
            }
          }
        })
        .id('getStyles')

      Text('content:' + this.content).id('content')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')


      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorShortCutKeys019')

    }
  }
}