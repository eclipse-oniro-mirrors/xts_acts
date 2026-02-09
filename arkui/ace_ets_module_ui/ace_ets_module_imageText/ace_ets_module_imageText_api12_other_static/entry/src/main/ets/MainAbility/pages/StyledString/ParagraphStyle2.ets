'use static';
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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  RenderingContextSettings,
  OffscreenCanvas,
  OffscreenCanvasRenderingContext2D,
  PixelMap,
  ParagraphStyle,
  LineHeightStyle,
  StyledString,
  TextController,
  ColumnOptions,
  TextAlign,
  WordBreak,
  TextOverflow,
  StyledStringKey,
  CopyOptions,
  Margin,
  TextAlign,
  WordBreak,
  TextAlign,
  WordBreak,
  LeadingMarginPlaceholder,
  TextOverflow
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
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
struct Index {
  private leadingMarkCreatorInstance :LeadingMarginCreator= LeadingMarginCreator.instance
  leadingMarginPlaceholder1: LeadingMarginPlaceholder = {
    pixelMap: this.leadingMarkCreatorInstance.genSquareMark(24),
    size:[15, 15]
  } as LeadingMarginPlaceholder
  paragraphStyleAttr4: ParagraphStyle = new ParagraphStyle({
    textIndent: LengthMetrics.vp(-15),
    textAlign: TextAlign.Start,
    maxLines: 1,
    wordBreak: WordBreak.NORMAL,
    overflow: TextOverflow.None
  });
  paragraphStyleAttr5: ParagraphStyle = new ParagraphStyle({
    textIndent: undefined,
    textAlign: TextAlign.Start,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_WORD,
    overflow: TextOverflow.Clip
  });
  paragraphStyleAttr6: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.Start,
    maxLines: 1,
    wordBreak: WordBreak.HYPHENATION,
    overflow: TextOverflow.MARQUEE
  });
  //行高样式对象
  lineHeightStyle1: LineHeightStyle = new LineHeightStyle(new LengthMetrics(24));
  //创建含段落样式的对象paragraphStyledString1
  paragraphStyledString2: StyledString = new StyledString('正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。', [
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr4
    }
  ])
  paragraphStyledString3: StyledString = new StyledString('正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。', [
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr5
    }
  ])
  paragraphStyledString4: StyledString = new StyledString('正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。', [
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr6
    }
  ])
  controller2: TextController = new TextController();
  controller3: TextController = new TextController();
  controller4: TextController = new TextController();

  onPageShow() {
    this.controller2.setStyledString(this.paragraphStyledString2)
    this.controller3.setStyledString(this.paragraphStyledString3)
    this.controller4.setStyledString(this.paragraphStyledString4)
  }

  build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {

        Text(undefined, { controller: this.controller2 })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        Text(undefined, { controller: this.controller3 })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)

        Text(undefined, { controller: this.controller4 })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)


        //查询段落样式
        Text('点击')
          .id('text')
          .onClick((e: ClickEvent) => {

            let styles2 = this.paragraphStyledString2.getStyles(0, this.paragraphStyledString2.length)!
            if (styles2.length !== 0) {
              for (let i = 0; i < styles2.length; i++) {
                console.info('paragraphStyledString2 style object start:' + styles2[i].start)
                console.info('paragraphStyledString2 style object length:' + styles2[i].length)
                console.info('paragraphStyledString2 style object key:' + styles2[i].styledKey)
                if (styles2[i].styledKey === 200) {
                  let paraAttr = styles2[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString2 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate<undefined | TextAlign>('StyledString2_textAlign', paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString2 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate<undefined | Double>('StyledString2_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString2 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate<undefined | int>('StyledString2_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString2 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate<undefined | WordBreak>('StyledString2_wordBreak', paraAttr.wordBreak);
                  console.info(i + '  paragraphStyledString2 leadingMargin:' + paraAttr.leadingMargin)
                  AppStorage.setOrCreate<undefined | Double | LeadingMarginPlaceholder>('StyledString2_leadingMargin',
                    paraAttr.leadingMargin);
                  console.info(i + '  paragraphStyledString2 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate<undefined | TextOverflow>('StyledString2_overflow', paraAttr.overflow);
                }
              }
            }

            let styles3 = this.paragraphStyledString3.getStyles(0, this.paragraphStyledString3.length)!
            if (styles3.length !== 0) {
              for (let i = 0; i < styles3.length; i++) {
                console.info('paragraphStyledString3 style object start:' + styles3[i].start)
                console.info('paragraphStyledString3 style object length:' + styles3[i].length)
                console.info('paragraphStyledString3 style object key:' + styles3[i].styledKey)
                if (styles3[i].styledKey === 200) {
                  let paraAttr = styles3[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString3 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate<undefined | TextAlign>('StyledString3_textAlign', paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString3 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate<undefined | Double>('StyledString3_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString3 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate<undefined | int>('StyledString3_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString3 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate<undefined | WordBreak>('StyledString3_wordBreak', paraAttr.wordBreak);
                  console.info(i + '  paragraphStyledString3 leadingMargin:' + paraAttr.leadingMargin)
                  AppStorage.setOrCreate<undefined | Double | LeadingMarginPlaceholder>('StyledString3_leadingMargin',
                    paraAttr.leadingMargin);
                  console.info(i + '  paragraphStyledString3 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate<undefined | TextOverflow>('StyledString3_overflow', paraAttr.overflow);
                }
              }
            }

            let styles4 = this.paragraphStyledString4.getStyles(0, this.paragraphStyledString4.length)!
            if (styles4.length !== 0) {
              for (let i = 0; i < styles4.length; i++) {
                console.info('paragraphStyledString4 style object start:' + styles4[i].start)
                console.info('paragraphStyledString4 style object length:' + styles4[i].length)
                console.info('paragraphStyledString4 style object key:' + styles4[i].styledKey)
                if (styles4[i].styledKey === 200) {
                  let paraAttr = styles4[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString4 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate<undefined | TextAlign>('StyledString4_textAlign', paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString4 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate<undefined | Double>('StyledString4_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString4 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate<undefined | int>('StyledString4_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString4 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate<undefined | WordBreak>('StyledString4_wordBreak', paraAttr.wordBreak);
                  console.info(i + '  paragraphStyledString4 leadingMargin:' + paraAttr.leadingMargin)
                  AppStorage.setOrCreate<undefined | Double | LeadingMarginPlaceholder>('StyledString4_leadingMargin',
                    paraAttr.leadingMargin);
                  console.info(i + '  paragraphStyledString4 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate<undefined | TextOverflow>('StyledString4_overflow', paraAttr.overflow);
                }
              }
            }

          })
          .margin({ top: 10 } as Margin)
      }
      .width('100%')
    }
    .height('100%')
  }
}