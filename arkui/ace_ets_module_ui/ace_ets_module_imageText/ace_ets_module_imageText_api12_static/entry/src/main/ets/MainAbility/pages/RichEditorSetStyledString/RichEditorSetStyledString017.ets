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
  ImageSpanAlignment,ImageFit,ImageAttachmentInterface,
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
struct RichEditorSetStyledString017 {
  stringLength: number = 0;
  @State colorStr: string = '';
  @State sizeStr: string = '';
  @State styleStr: string = '';
  @State weightStr: string = '';
  @State familyStr: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');

  fontStyle1: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: CommonFunc.FONT_FAMILY,
    fontColor: Color.Orange,
    fontStyle: FontStyle.Italic,
    fontSize: LengthMetrics.vp(10)
  })
  styledString1: StyledString = new StyledString('a1',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle1
    }]);

  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bold,
    fontFamily: 'Arial',
    fontColor: 0x0000FF,
    fontStyle: FontStyle.Normal,
    fontSize: LengthMetrics.vp(20)
  })
  styledString2: StyledString = new StyledString('a2',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle2
    }]);

  fontStyle3: TextStyle = new TextStyle({
    fontWeight: FontWeight.Medium,
    fontFamily: 'Arial',
    fontColor: '#ff00ff',
    fontSize: LengthMetrics.vp(30)
  })
  styledString3: StyledString = new StyledString('a3',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle3
    }]);

  fontStyle4: TextStyle = new TextStyle({
    fontWeight: FontWeight.Normal,
    fontFamily: 'Arial',
    fontColor: $r('app.color.color_hello'),
    fontSize: LengthMetrics.vp(40)
  })
  styledString4: StyledString = new StyledString('a4',
    [{ start: 0, length: 2, styledKey: StyledStringKey.FONT,
       styledValue: this.fontStyle4
    }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller} as RichEditorStyledStringOptions;

  build() {
    Column() {
      Text('colorStr:' + this.colorStr).id('colorStr')
      Text('sizeStr:' + this.sizeStr).id('sizeStr')
      Text('styleStr:' + this.styleStr).id('styleStr')
      Text('weightStr:' + this.weightStr).id('weightStr')
      Text('familyStr:' + this.familyStr).id('familyStr')

      Button('get fontColor')
        .onClick((e: ClickEvent) => {
          this.richEditorStyledString = this.controller!.getStyledString()!;
          let styles = this.richEditorStyledString.getStyles(0, this.richEditorStyledString.length)!;
          for (let i = 0; i < styles!.length; i++) {
            console.info('StyledString style object start:' + styles[i].start)
            console.info('StyledString style object length:' + styles[i].length)
            console.info('StyledString style object key:' + styles[i].styledKey)
            if (styles[i].styledKey === 0) {
              let fontAttr = styles[i].styledValue as TextStyle;
              this.colorStr += fontAttr.fontColor + ',';
              this.sizeStr += fontAttr.fontSize + ',';
              this.styleStr += fontAttr.fontStyle + ',';
              this.weightStr += fontAttr.fontWeight + ',';
              this.familyStr += fontAttr.fontFamily + ',';
            }
          }
        })
        .id('get_fontColor')
        .margin({ top: 10 } as Margin)
      RichEditor(this.options)
        .onReady((): void => {
          this.controller!.setStyledString(this.styledString1);
          this.richEditorStyledString = this.controller!.getStyledString()!;
          this.richEditorStyledString.appendStyledString(this.styledString2);
          this.controller!.setStyledString(this.richEditorStyledString as StyledString);
          this.controller!.setCaretOffset(this.richEditorStyledString.length);
          this.richEditorStyledString = this.controller!.getStyledString()!;
          this.richEditorStyledString.appendStyledString(this.styledString3);
          this.controller!.setStyledString(this.richEditorStyledString as StyledString);
          this.controller!.setCaretOffset(this.richEditorStyledString.length);
          this.richEditorStyledString.appendStyledString(this.styledString4);
          this.controller!.setStyledString(this.richEditorStyledString as StyledString);
          this.controller!.setCaretOffset(this.richEditorStyledString.length);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorSetStyledString017')

    }
  }
}