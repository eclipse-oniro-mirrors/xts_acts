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

import { LengthMetrics } from '@kit.ArkUI'
const canvasWidth = 1000
const canvasHeight = 100
class LeadingMarginCreator {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private offscreenCanvas: OffscreenCanvas = new OffscreenCanvas(canvasWidth, canvasHeight)
  private offContext: OffscreenCanvasRenderingContext2D = this.offscreenCanvas.getContext('2d', this.settings)
  public static instance: LeadingMarginCreator = new LeadingMarginCreator()

  public genSquareMark(fontSize: number): PixelMap {
    this.offContext = this.offscreenCanvas.getContext('2d', this.settings)
    this.clearCanvas()
    const coordinate = fontSize * (1 - 1 / 1.5) / 2
    const sideLength = fontSize / 1.5
    this.offContext.fillRect(coordinate, coordinate, sideLength, sideLength)
    return this.offContext.getPixelMap(0, 0, fontSize, fontSize)
  }

  private clearCanvas() {
    this.offContext.clearRect(0, 0, canvasWidth, canvasHeight)
  }
}
@Entry
@Component
struct ParagraphStyle3Test {
  private leadingMarkCreatorInstance = LeadingMarginCreator.instance
  leadingMarginPlaceholder1: LeadingMarginPlaceholder = {
    pixelMap: this.leadingMarkCreatorInstance.genSquareMark(24),
    size:[15, 15]
  }
  paragraphStyleAttr7: ParagraphStyle = new ParagraphStyle({ textAlign: undefined, maxLines: -5, wordBreak: undefined, overflow: undefined});
  paragraphStyleAttr8: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Start, leadingMargin:  LengthMetrics.vp(30) });
  //行高样式对象
  lineHeightStyle1: LineHeightStyle= new LineHeightStyle(new LengthMetrics(24));
  //创建含段落样式的对象paragraphStyledString1
  
  paragraphStyledString5: StyledString = new StyledString('正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。', [
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr7
    }
  ])
  paragraphStyledString6: StyledString = new StyledString('正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。', [
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr8
    }
  ])


  controller5: TextController = new TextController();
  controller6: TextController = new TextController();
  async onPageShow() {
    this.controller5.setStyledString(this.paragraphStyledString5)
    this.controller6.setStyledString(this.paragraphStyledString6)
  }

  build() {
    Row() {
      Column( { space : 5 }) {
        Text(undefined, { controller: this.controller5 })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        Text(undefined, { controller: this.controller6 })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        //查询段落样式
        Text('点击')
          .id('textParagraphStyle3Test')
          .onClick(() => {
            let styles5 = this.paragraphStyledString5.getStyles(0, this.paragraphStyledString5.length)
            if (styles5.length !== 0) {
              for (let i = 0; i < styles5.length; i++) {
                console.info('paragraphStyledString5 style object start:' + styles5[i].start)
                console.info('paragraphStyledString5 style object length:' + styles5[i].length)
                console.info('paragraphStyledString5 style object key:' + styles5[i].styledKey)
                if (styles5[i].styledKey === 200) {
                  let paraAttr = styles5[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString5 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate('StyledString5_textAlign', paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString5 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate('StyledString5_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString5 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate('StyledString5_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString5 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate('StyledString5_wordBreak', paraAttr.wordBreak);
                  console.info(i + '  paragraphStyledString5 leadingMargin:' + paraAttr.leadingMargin)
                  AppStorage.setOrCreate('StyledString5_leadingMargin', paraAttr.leadingMargin);
                  console.info(i + '  paragraphStyledString5 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate('StyledString5_overflow', paraAttr.overflow);
                }
              }
            }

            let styles6 = this.paragraphStyledString6.getStyles(0, this.paragraphStyledString6.length)
            if (styles6.length !== 0) {
              for (let i = 0; i < styles6.length; i++) {
                console.info('paragraphStyledString6 style object start:' + styles6[i].start)
                console.info('paragraphStyledString6 style object length:' + styles6[i].length)
                console.info('paragraphStyledString6 style object key:' + styles6[i].styledKey)
                if (styles6[i].styledKey === 200) {
                  let paraAttr = styles6[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString6 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate('StyledString6_textAlign', paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString6 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate('StyledString6_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString6 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate('StyledString6_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString6 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate('StyledString6_wordBreak', paraAttr.wordBreak);
                  console.info(i + '  paragraphStyledString6 leadingMargin:' + paraAttr.leadingMargin)
                  AppStorage.setOrCreate('StyledString6_leadingMargin', paraAttr.leadingMargin);
                  console.info(i + '  paragraphStyledString6 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate('StyledString6_overflow', paraAttr.overflow);
                }
              }
            }
          })
          .margin({ top: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}