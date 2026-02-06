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
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image'
import { LengthMetrics } from '@ohos.arkui.node';
import {
  Entry, Component, CustomSpan, CustomSpanMeasureInfo, CustomSpanMetrics, DrawContext, CustomSpanDrawInfo,
  Column, Row, Text, ClickEvent,StyledString, ColumnOptions, $r , MutableStyledString, TextController, CopyOptions, Button,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import {
  State,
  AppStorage,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo) {
    let canvas = context.canvas;

    const brush = new drawing.Brush();
    // brush.setColor({ alpha: 255, red: 0, green: 74, blue: 175 });
    brush.setColor(2)
    const font = new drawing.Font();
    font.setSize(25);
    const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8) as drawing.TextBlob;
    canvas.attachBrush(brush);
    canvas.drawRect({
      left: options.x + 10,
      right: options.x + Number(AppStorage.get<UIContext>('uiContext')?.vp2px(this.width)) - 10,
      top: options.lineTop + 10,
      bottom: options.lineBottom - 10
    });

    // brush.setColor({ alpha: 255, red: 23, green: 169, blue: 141 });
    brush.setColor(2)
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, options.x + 20, options.lineBottom - 15);
    canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }

  width: number = 160;
  word: string = "drawing";
  height: number = 10;
}

@Entry
@Component
struct styledStringApi {
  customSpan2: MyCustomSpan = new MyCustomSpan("change", 130, 10);
  customSpan1: MyCustomSpan = new MyCustomSpan("Hello", 80, 10);
  customSpan3: MyCustomSpan = new MyCustomSpan("World", 80, 40);
  style2: MutableStyledString = new MutableStyledString(this.customSpan2);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  textStyle: MutableStyledString = new MutableStyledString("123");
  textController: TextController = new TextController();
  isPageShow: boolean = true;
  @State text: string = ''
  mutableStyledString1: MutableStyledString = new MutableStyledString("tr");
  controller1: TextController = new TextController();


  onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;

    this.style1.appendStyledString(new StyledString(this.customSpan3))
    this.textController.setStyledString(this.style1)
    this.controller1.setStyledString(this.mutableStyledString1)
  }

  build() {
    Row() {
      Column() {
        Text(undefined, { controller: this.textController })
          .copyOption(CopyOptions.InApp)
          .fontSize(30)

        Text(this.text).key('styledStringText')
        Text(undefined, { controller: this.controller1 })
        Button('appendStyledString').onClick((event: ClickEvent) => {
          this.mutableStyledString1.appendStyledString(
            new MutableStyledString("ing")
          )
          this.controller1.setStyledString(this.mutableStyledString1)
        }).key('styledStringBt1')

        Button('insertStyledString').onClick((event: ClickEvent) => {
          this.mutableStyledString1.insertStyledString(0,
            new MutableStyledString("s")
          )
          this.controller1.setStyledString(this.mutableStyledString1)
        }).key('styledStringBt2')

        Button('getString').onClick((event: ClickEvent) => {
          this.text = this.mutableStyledString1.getString()
        }).key('styledStringBt3')
      }
      .width('100%')
    }
    .height('100%')
  }
}