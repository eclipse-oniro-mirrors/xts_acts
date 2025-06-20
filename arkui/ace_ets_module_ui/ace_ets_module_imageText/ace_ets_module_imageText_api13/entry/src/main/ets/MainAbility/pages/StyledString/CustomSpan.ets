/**
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


import { drawing } from '@kit.ArkGraphics2D'
import { LengthMetrics } from '@kit.ArkUI'

let gUIContext: UIContext;

class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    console.log('CustomSpanMeasureInfo fontSize ' + measureInfo.fontSize);
    AppStorage.setOrCreate('CustomSpanFontSize', measureInfo.fontSize);

    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo) {
    let canvas = context.canvas;

    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 0,
      green: 74,
      blue: 175
    });
    const font = new drawing.Font();
    font.setSize(25);
    const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.attachBrush(brush);
    canvas.drawRect({
      left: options.x + 10,
      right: options.x + gUIContext.vp2px(this.width) - 10,
      top: options.lineTop + 10,
      bottom: options.lineBottom - 10
    });

    brush.setColor({
      alpha: 255,
      red: 23,
      green: 169,
      blue: 141
    });
    canvas.attachBrush(brush);
    canvas.drawTextBlob(textBlob, options.x + 20, options.lineBottom - 15);
    canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }

  getWord() {
    return this.word;
  }

  width: number = 160;
  word: string = 'drawing';
  height: number = 10;
}

@Entry
@Component
struct styled_string_CustomSpan {
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80, 10);
  customSpan2: MyCustomSpan = new MyCustomSpan('World', 80, 40);
  style: MutableStyledString = new MutableStyledString(this.customSpan1);
  textStyle: MutableStyledString = new MutableStyledString('123');
  textController: TextController = new TextController();
  isPageShow: boolean = true;

  aboutToAppear() {
    gUIContext = this.getUIContext();
  }

  async onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;

    this.style.appendStyledString(new MutableStyledString('文本绘制 示例代码 CustomSpan', [
      {
        start: 0,
        length: 5,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Pink })
      }, {
      start: 5,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontStyle: FontStyle.Italic })
    }, {
      start: 10,
      length: 500,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Green, fontWeight: FontWeight.Bold })
    }
    ]))
    this.style.appendStyledString(new StyledString(this.customSpan2))
    this.style.appendStyledString(new StyledString('自定义绘制', [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.px(50) })
    }]))
    this.textController.setStyledString(this.style)
  }

  build() {
    Row() {
      Column() {
        Text(undefined, { controller: this.textController })
          .copyOption(CopyOptions.InApp)
          .fontSize(30)

        Button('invalidate').onClick(() => {
          console.log('CustomSpan getWord ' + this.customSpan1.getWord())
          this.customSpan1.setWord('你好')
          this.customSpan1.invalidate()
          console.log('CustomSpan getWord ' + this.customSpan1.getWord())
          AppStorage.setOrCreate('CustomSpanWord', this.customSpan1.getWord());
        }).id('invalidate')
      }
      .width('100%')
    }
    .height('100%')
  }
}