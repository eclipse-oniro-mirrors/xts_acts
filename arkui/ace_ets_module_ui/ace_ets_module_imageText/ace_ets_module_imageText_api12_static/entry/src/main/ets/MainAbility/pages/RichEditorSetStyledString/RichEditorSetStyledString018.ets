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

import {
  Entry,BaselineOffsetStyle,
  Component,
  Column,DecorationStyle,
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
  EdgeEffect,TextDecorationType,ShadowType,
  GestureControl,TextShadowStyle,ShadowOptions,
  PanGesture,
  GestureRecognizerState,RichEditorController,RichEditor,RichEditorChangeValue,RichEditorTextSpanResult,RichEditorOptions,RichEditorLayoutStyle,LongPressGesture,Direction,RichEditorRange,ClickEvent,$r,LayoutManager,RichEditorOptions,MutableStyledString,TextStyle,StyledString,RichEditorStyledStringController,Resource,ImageAttachment,FontWeight,FontStyle,StyledStringKey,RichEditorStyledStringOptions,TextEditControllerEx,TextMenuItem,TextRange,TextMenuItemId,CopyOptions,RichEditorInsertValue,Builder
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
@Entry
@Component
struct RichEditorSetStyledString018 {
  stringLength: number = 0;
  @State baseLineStr: string = '';
  @State shadowValues: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  fontStyleAttr1: TextStyle = { fontColor: Color.Blue } as TextStyle;
  // 创建有多种样式组合对象mutableStyledString2
  mutableStyledString1: MutableStyledString = new MutableStyledString('abcde', [{
    start: 0,
    length: 5,
    styledKey: StyledStringKey.FONT,
    styledValue: this.fontStyleAttr1
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.DECORATION,
    styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue })
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.TEXT_SHADOW,
    styledValue: new TextShadowStyle({
      radius: 5,
      type: ShadowType.COLOR,
      color: Color.Yellow,
      offsetX: 10,
      offsetY: -10
    } as ShadowOptions)
  }, {
    start: 0,
    length: 5,
    styledKey: StyledStringKey.BASELINE_OFFSET,
    styledValue: new BaselineOffsetStyle(LengthMetrics.vp(20))
  }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;
  onPageShow() {
    this.controller!.setStyledString(this.mutableStyledString1)
  }

  build() {
    Column() {
      Text('baseLineStr:' + this.baseLineStr).id('baseLineStr')
      Text('shadowValues:' + this.shadowValues).id('shadowValues')

      Button('get text style')
        .onClick((e: ClickEvent) => {
          let styles = this.mutableStyledString1.getStyles(0, this.mutableStyledString1.length)!;
          if (styles!.length !== 0) {
            for (let i = 0; i < styles!.length; i++) {
              if (styles[i as int].styledKey === 2) {
                let baselineAttr = styles[i as int].styledValue as BaselineOffsetStyle;
                this.baseLineStr = baselineAttr.baselineOffset + '';
              }

              if (styles[i as int].styledKey === 4) {
                let textShadowAttr = styles[i as int].styledValue as TextShadowStyle;
                let shadowValues = textShadowAttr.textShadow;
                if (shadowValues.length > 0) {
                  for (let j = 0; j < shadowValues.length; j++) {
                    this.shadowValues = JSON.stringify(shadowValues[j as int]);
                  }
                }
              }
            }
          }
        })
        .id('get_style')
        .margin({ top: 10 } as Margin)
      RichEditor(this.options)
        .onReady((): void => {
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .backgroundColor(Color.Red)
        .borderColor(Color.Black).id('RichEditorSetStyledString018')
    }
  }
}