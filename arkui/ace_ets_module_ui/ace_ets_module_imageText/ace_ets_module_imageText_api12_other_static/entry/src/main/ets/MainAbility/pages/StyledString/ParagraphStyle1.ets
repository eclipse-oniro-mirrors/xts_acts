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
  TextStyle,
  CopyOptions,
  Margin,
  LeadingMarginPlaceholder,
  FontWeight,
  TextAlign,
  WordBreak
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
    let pixelMap = this.offContext.getPixelMap(0, 0, fontSize, fontSize)
    if (pixelMap != undefined) {
      return pixelMap as PixelMap
    } else {
      throw new Error(`GetPixelMap failed`)
    }
  }

  private clearCanvas() {
    this.offContext.clearRect(0, 0, canvasWidth, canvasHeight)
  }
}

@Entry
@Component
struct Index {
  private leadingMarkCreatorInstance:LeadingMarginCreator = LeadingMarginCreator.instance
  leadingMarginPlaceholder1: LeadingMarginPlaceholder = {
    pixelMap: this.leadingMarkCreatorInstance.genSquareMark(24),
    size:[15, 15]
  } as LeadingMarginPlaceholder
  titleParagraphStyleAttr: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Center });
  //第一段落首行缩进15vp
  paragraphStyleAttr1: ParagraphStyle =
    new ParagraphStyle({ textIndent: LengthMetrics.vp(15), maxLines: undefined, leadingMargin: undefined });
  //第二段落缩进15vp且首行有placeholder占位显示
  paragraphStyleAttr2: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Start, leadingMargin:  this.leadingMarginPlaceholder1 });
  //第三段落不设置缩进配置最大行数及超长显示方式
  paragraphStyleAttr3: ParagraphStyle = new ParagraphStyle({
    textAlign: TextAlign.End,
    maxLines: 1,
    wordBreak: WordBreak.BREAK_ALL,
    overflow: TextOverflow.Ellipsis
  });
  //行高样式对象
  lineHeightStyle1: LineHeightStyle = new LineHeightStyle(new LengthMetrics(24));
  //创建含段落样式的对象paragraphStyledString1
  paragraphStyledString1: StyledString =
    new StyledString('段落标题\n正文第一段落开始0123456789正文第一段落结束\n正文第二段落开始hello world正文第二段落结束\n正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。',
      [
        {
          start: 0,
          length: 4,
          styledKey: StyledStringKey.PARAGRAPH_STYLE,
          styledValue: this.titleParagraphStyleAttr
        }
        , {
        start: 0,
        length: 4,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontSize: LengthMetrics.vp(24), fontWeight: FontWeight.Bolder })
      },
        {
          start: 5,
          length: 3,
          styledKey: StyledStringKey.PARAGRAPH_STYLE,
          styledValue: this.paragraphStyleAttr1
        },
        {
          start: 32,
          length: 5,
          styledKey: StyledStringKey.PARAGRAPH_STYLE,
          styledValue: this.paragraphStyleAttr2
        },
        {
          start: 60,
          length: 5,
          styledKey: StyledStringKey.PARAGRAPH_STYLE,
          styledValue: this.paragraphStyleAttr3
        }
      ]);
  controller: TextController = new TextController();

  onPageShow() {
    this.controller.setStyledString(this.paragraphStyledString1)
  }

  build() {
    Row() {
      Column({ space: 5 } as ColumnOptions) {
        Text(undefined, { controller: this.controller })
          .width(240)
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)


        //查询段落样式
        Text('点击')
          .id('text')
          .onClick((e: ClickEvent) => {
            let styles = this.paragraphStyledString1.getStyles(0, this.paragraphStyledString1.length)!
            if (styles.length !== 0) {
              for (let i = 0; i < styles.length; i++) {
                console.info('paragraphStyledString1 style object start:' + styles[i].start)
                console.info('paragraphStyledString1 style object length:' + styles[i].length)
                console.info('paragraphStyledString1 style object key:' + styles[i].styledKey)
                if (styles[i].styledKey === 200) {
                  let paraAttr = styles[i].styledValue as ParagraphStyle;
                  console.info(i + '  paragraphStyledString1 textAlign:' + paraAttr.textAlign)
                  AppStorage.setOrCreate<undefined | TextAlign>('StyledString1_' + i + '_textAlign',
                    paraAttr.textAlign);
                  console.info(i + '  paragraphStyledString1 textIndent:' + paraAttr.textIndent)
                  AppStorage.setOrCreate<undefined | number>('StyledString1_' + i + '_textIndent', paraAttr.textIndent);
                  console.info(i + '  paragraphStyledString1 maxLines:' + paraAttr.maxLines)
                  AppStorage.setOrCreate<undefined | int>('StyledString1_' + i + '_maxLines', paraAttr.maxLines);
                  console.info(i + '  paragraphStyledString1 wordBreak:' + paraAttr.wordBreak)
                  AppStorage.setOrCreate<undefined | WordBreak>('StyledString1_' + i + '_wordBreak',
                    paraAttr.wordBreak);
                  if (paraAttr.leadingMargin !== undefined) {
                    let radius = paraAttr.leadingMargin as LeadingMarginPlaceholder
                    console.info(i + '  paragraphStyledString1 leadingMargin:' + JSON.stringify(radius))
                    console.info(i + '  paragraphStyledString1 leadingMargin pixelMap:' +
                    JSON.stringify(radius.pixelMap))
                    console.info(i + '  paragraphStyledString1 leadingMargin size:' + JSON.stringify(radius.size))
                    AppStorage.setOrCreate<string>('StyledString1_' + i + '_pixelMap', JSON.stringify(radius.pixelMap));
                    AppStorage.setOrCreate<string>('StyledString1_' + i + '_size', JSON.stringify(radius.size));
                  } else {
                    console.info(i + '  paragraphStyledString1 leadingMargin:' + paraAttr.leadingMargin)
                    AppStorage.setOrCreate<undefined | Double | LeadingMarginPlaceholder>('StyledString1_' + i +
                      '_leadingMargin', paraAttr.leadingMargin);
                  }
                  console.info(i + '  paragraphStyledString1 overflow:' + paraAttr.overflow)
                  AppStorage.setOrCreate<undefined | TextOverflow>('StyledString1_' + i + '_overflow',
                    paraAttr.overflow);
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
