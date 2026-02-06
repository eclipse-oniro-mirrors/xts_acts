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

import { drawing } from '@kit.ArkGraphics2D';
import { LengthMetrics } from '@kit.ArkUI';

/**
 * 实现LeadingMarginSpan
 */
class MyLeadingMarginSpan1 extends LeadingMarginSpan {
  private text: string = ''

  constructor(text: string) {
    super()
    this.text = text
  }

  getText() {
    return this.text;
  }

  // 返回缩进距离
  getLeadingMargin(): LengthMetrics {
    console.info('getLeadingMargin')
    return LengthMetrics.vp(20)
  }

  // 回调给开发者行信息，用于canvas绘制
  onDraw(context: DrawContext, options: LeadingMarginSpanDrawInfo) {
    if(!AppStorage.get('StyledStringOptionsFirst')){
      console.log('First line information    -----------')
      AppStorage.setOrCreate('StyledStringOptionsX',options.x)
      AppStorage.setOrCreate('StyledStringOptionsTop',options.top)
      AppStorage.setOrCreate('StyledStringOptionsBottom',options.bottom)
      AppStorage.setOrCreate('StyledStringOptionsBaseline',options.baseline)
      AppStorage.setOrCreate('StyledStringOptionsDirection',options.direction)
      AppStorage.setOrCreate('StyledStringOptionsStart',options.start)
      AppStorage.setOrCreate('StyledStringOptionsEnd',options.end)
      AppStorage.setOrCreate('StyledStringOptionsFirst',options.first)
    }
    console.info('x = ' + options.x + ', top = ' + options.top +
    ', bottom = ' + options.bottom + ', baseline = ' + options.baseline + 
    ', direction = ' +options.direction+ ', start = ' + options.start + 
    ', end = ' + options.end + ', first = ' + options.first)
    let canvas = context.canvas;
    if (!options.first) {
      return
    }

    // 绘制文本符号
    const font = new drawing.Font();
    font.setSize(20);
    const textBlob = drawing.TextBlob.makeFromString(this.text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, options.x - 30, options.top + (options.bottom - options.top) / 2);
  }
}

class MyLeadingMarginSpan2 extends LeadingMarginSpan {
  private text: string = ''

  constructor(text: string) {
    super()
    this.text = text
  }

  getText() {
    return this.text;
  }

  // 返回缩进距离
  getLeadingMargin(): LengthMetrics {
    console.info('getLeadingMargin')
    return LengthMetrics.vp(20)
  }

  // 回调给开发者行信息，用于canvas绘制
  onDraw(context: DrawContext, options: LeadingMarginSpanDrawInfo) {
    AppStorage.setOrCreate('StyledStringOptionsX',options.x)
    AppStorage.setOrCreate('StyledStringOptionsTop',options.top)
    AppStorage.setOrCreate('StyledStringOptionsBottom',options.bottom)
    AppStorage.setOrCreate('StyledStringOptionsBaseline',options.baseline)
    AppStorage.setOrCreate('StyledStringOptionsDirection',options.direction)
    AppStorage.setOrCreate('StyledStringOptionsStart',options.start)
    AppStorage.setOrCreate('StyledStringOptionsEnd',options.end)
    AppStorage.setOrCreate('StyledStringOptionsFirst',options.first)
    console.info('x = ' + options.x + ', top = ' + options.top + 
    ', bottom = ' + options.bottom + ', baseline = ' + options.baseline + 
    ', direction = ' +options.direction+ ', start = ' + options.start + 
    ', end = ' + options.end + ', first = ' + options.first)
    let canvas = context.canvas;
    if (!options.first) {
      return
    }

    // 绘制文本符号
    const font = new drawing.Font();
    font.setSize(20);
    const textBlob = drawing.TextBlob.makeFromString(this.text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
    canvas.drawTextBlob(textBlob, options.x, options.top + (options.bottom - options.top) / 2);
  }
}

@Entry
@Component
struct StyledStringLeadingMarginSpanDemo {
  textController: TextController = new TextController();
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  leadingMarginSpan1: LeadingMarginSpan = new MyLeadingMarginSpan1('●');
  leadingMarginSpan2: LeadingMarginSpan = new MyLeadingMarginSpan2('①');
  paragraphStyleAttr1: ParagraphStyle =
    new ParagraphStyle({ leadingMarginSpan: this.leadingMarginSpan1 });
  paragraphStyleAttr2: ParagraphStyle =
    new ParagraphStyle({ leadingMarginSpan: this.leadingMarginSpan2 });
  StyledString1: StyledString = new StyledString('段落内容首行从左至右 23456789012345678906456151351531245245245254254123454564561531556586412315678901234567890123456789',
    [
      {
        start: 0,
        length: 15,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleAttr1
      }
    ]
  );

  StyledString2: StyledString = new StyledString('段落内容首行从右至左 234567890123456789012345456456153155658634534345345345345345345354354412315678901234567890123456789',
    [
      {
        start: 0,
        length: 15,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleAttr2
      }
    ]
  );

  build() {
    Column() {
      Column() {
        Row(){
          // 设置属性字符串
          Button('setStyledString1')
            .onClick(() => {
              this.textController.setStyledString(this.StyledString1);
            }).width('50%').id('setLeadingMarginSpan1')
          Button('setStyledString2')
            .onClick(() => {
              this.controller.setStyledString(this.StyledString2);
            }).width('50%').id('setLeadingMarginSpan2')
        }.height('5%')
        Row(){
          // 查询段落样式
          Button('getStyles1')
            .onClick(() => {
              let styles = this.StyledString1.getStyles(0, this.StyledString1.length);
              if (styles.length == 0) {
                return
              }
              for (let i = 0; i < styles.length; i++) {
                console.info('getStyles style object start:' + styles[i].start);
                console.info('getStyles style object length:' + styles[i].length);
                console.info('getStyles style object key:' + styles[i].styledKey);
                if (styles[i].styledKey === 200) {
                  let paraAttr = styles[i].styledValue as ParagraphStyleInterface;
                  console.info('getStyles leadingMarginSpan:' + paraAttr.leadingMarginSpan);
                  let leadingMarginSpanClass = paraAttr.leadingMarginSpan as MyLeadingMarginSpan1
                  if (leadingMarginSpanClass != null) {
                    AppStorage.setOrCreate('ParagraphStyleLeadingMarginSpan',leadingMarginSpanClass.getText())
                    console.info('getStyles leadingMarginSpan getText: ' + AppStorage.get('ParagraphStyleLeadingMarginSpan'));
                  }
                }
              }
            }).width('50%').id('getLeadingMarginSpan1')
          Button('getStyles2')
            .onClick(() => {
              let styles = this.StyledString2.getStyles(0, this.StyledString1.length);
              if (styles.length == 0) {
                return
              }
              for (let i = 0; i < styles.length; i++) {
                console.info('getStyles style object start:' + styles[i].start);
                console.info('getStyles style object length:' + styles[i].length);
                console.info('getStyles style object key:' + styles[i].styledKey);
                if (styles[i].styledKey === 200) {
                  let paraAttr = styles[i].styledValue as ParagraphStyleInterface;
                  console.info('getStyles leadingMarginSpan:' + paraAttr.leadingMarginSpan);
                  let leadingMarginSpanClass = paraAttr.leadingMarginSpan as MyLeadingMarginSpan1
                  if (leadingMarginSpanClass != null) {
                    AppStorage.setOrCreate('ParagraphStyleLeadingMarginSpan',leadingMarginSpanClass.getText())
                    console.info('getStyles leadingMarginSpan getText: ' + AppStorage.get('ParagraphStyleLeadingMarginSpan'));
                  }
                }
              }
            }).width('50%').id('getLeadingMarginSpan2')
        }.height('5%')
      }
      Text(undefined, { controller: this.textController })
        .width('90%')
        .height('20%')
        .borderWidth(1)
        .clip(true)
      RichEditor(this.options)
        .width('90%')
        .height('20%')
        .margin({ top: 2})
        .borderWidth(1)
        .direction(Direction.Rtl)
        .clip(true)
    }
    .width('100%')
  }
}