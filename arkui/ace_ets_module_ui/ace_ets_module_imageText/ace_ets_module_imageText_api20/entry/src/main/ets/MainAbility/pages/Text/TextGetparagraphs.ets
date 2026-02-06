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

import { LengthMetrics, LengthUnit } from '@ohos.arkui.node';
import { drawing, text } from '@kit.ArkGraphics2D';

class MyCustomSpan extends CustomSpan {
  constructor(word: string, width: number, height: number, context: UIContext) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
    this.context = context;
  }
  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
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
      right: options.x + this.context.vp2px(this.width) - 10,
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
  width: number = 160;
  word: string = "drawing";
  height: number = 10;
  context: UIContext;
}

@Entry
@Component
struct MeasureUtilsGetParagraphs {
  @State pixelmap?: PixelMap = undefined;
  str : string = "Fouring score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal."
  str2 : string = "afnslfkakfksaf"
  mutableStr2 = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({fontSize: LengthMetrics.px(20)})
    },
    {
      start: 3,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({fontColor: Color.Brown})
    }
  ])
  getlineNum(styledString: StyledString, width: LengthMetrics) {
    let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(styledString, { constraintWidth: width })
    let res = 0
    for (let i = 0; i < paragraphArr.length; ++i) {
      res += paragraphArr[i].getLineCount()
    }
    return res
  }
  getCorretIndex(styledString : MutableStyledString, maxLines: number, width: LengthMetrics)  {
    if(styledString.getString().length == 0){
      return 0;
    }
    let low = 0
    let high = styledString.length - 1;
    while(low <= high) {
      let mid = (low + high) >> 1;
      console.log("demo: get " + low + " " + high + " " + mid)
      let moreStyledString = new MutableStyledString("... 全文", [{
        start: 4,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({fontColor: Color.Blue})
      }])
      if(mid == 0){
        return 0;
      }
      moreStyledString.insertStyledString(0, styledString.subStyledString(0, mid))
      let lineNum = this.getlineNum(moreStyledString, LengthMetrics.px(500))
      if(lineNum <= maxLines) {
        low = mid + 1;
      } else {
        high = mid -1;
      }
    }
    return high
  }
  mutableStrAllContent = new MutableStyledString(this.str, [
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({fontSize: LengthMetrics.px(40), fontColor: Color.Red, fontFamily: 'asdad', fontWeight: FontWeight.Lighter, fontStyle: FontStyle.Italic})
    },
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.DECORATION,
      styledValue: new DecorationStyle({ type: TextDecorationType.LineThrough, color: Color.Blue, style: TextDecorationStyle.DOTTED })
    },
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.BASELINE_OFFSET,
      styledValue: new BaselineOffsetStyle(LengthMetrics.px(20))
    },
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.LETTER_SPACING,
      styledValue: new LetterSpacingStyle(new LengthMetrics(10, LengthUnit.PX))
    },
    {
      start: 0,
      length: 3,
      styledKey: StyledStringKey.TEXT_SHADOW,
      styledValue: new TextShadowStyle({
        radius: 5,
        type: ShadowType.COLOR,
        color: Color.Yellow,
        offsetX: 10,
        offsetY: -10
      })
    },
    {
      start: 3,
      length: 3,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({fontColor: Color.Brown, fontWeight: FontWeight.Normal})
    },
  ])
  customSpan1: MyCustomSpan = new MyCustomSpan("Hello", 120, 10, this.getUIContext());
  mutableStrAllContent2 = new MutableStyledString('');
  controller: TextController = new TextController()
  controller2: TextController = new TextController()
  textController: TextController = new TextController()
  textController2: TextController = new TextController()
  aboutToAppear() {
    this.mutableStrAllContent2.insertStyledString(0, new StyledString(this.customSpan1));
    this.mutableStr2.insertStyledString(0, new StyledString(this.customSpan1));
  }

  build() {
    Scroll() {
      Column() {
        Text('原文').height('5%')
        Text(undefined, { controller: this.controller }).width('500px')
          .height('26%')
          .onAppear(() => {
            this.controller.setStyledString(this.mutableStrAllContent)
            let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(this.mutableStrAllContent, { constraintWidth: LengthMetrics.px(500) })
            console.log('获取：' + vp2px(1))
            console.log('获取length:' + paragraphArr.length)
            console.log('获取文本最大行宽:' + paragraphArr[0].getMaxWidth())
            console.log('获取文本总高度:' + paragraphArr[0].getHeight())
            console.log('获取文本最长行宽:' + paragraphArr[0].getLongestLine())
            console.log('获取文本最长一行的宽度:' + paragraphArr[0].getLongestLineWithIndent())
            console.log('获取段落最小固有宽度:' + paragraphArr[0].getMinIntrinsicWidth())
            console.log('获取段落最大固有宽度:' + paragraphArr[0].getMaxIntrinsicWidth())
            console.log('获取拉丁字母基线位置度:' + paragraphArr[0].getAlphabeticBaseline())
            console.log('获取表意字（如CJK（中文，日文，韩文））下的基线位置:' + paragraphArr[0].getIdeographicBaseline())
            let range: text.Range = { start: 0, end: 16};
            console.log('获取给定的矩形区域宽度以及矩形区域高度的规格下，文本中该区间范围内的字符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT)))
            console.log('获取文本中所有占位符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForPlaceholders()))
            console.log('获取与给定坐标最接近的字形位置信息:' + JSON.stringify(paragraphArr[0].getGlyphPositionAtCoordinate(200, 200)))
            console.log('获取返回给定offset的字形所在单词的索引区间:' + JSON.stringify(paragraphArr[0].getWordBoundary(0)))
            console.log('获取返回文本行数:' + paragraphArr[0].getLineCount())
            console.log('获取返回指定行的行高:' + paragraphArr[0].getLineHeight(1))
            console.log('获取返回指定行的行宽:' + paragraphArr[0].getLineWidth(9))
            console.log('获取返回段落是否超过最大行数:' + paragraphArr[0].didExceedMaxLines())
            console.log('获取返回所有的文本行:' + JSON.stringify(paragraphArr[0].getTextLines()))
            console.log('获取指定行的实际可见文本范围，不包括溢出的省略号:' + JSON.stringify(paragraphArr[0].getActualTextRange(0, true)))
            console.log('获取文本行的行度量数组:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
            let lineMetric : LineMetrics | undefined = paragraphArr[0].getLineMetrics(0)
            if (lineMetric) {
              console.log('获取特定行号的行度量信息:' + JSON.stringify(lineMetric))
              console.log('获取特定行号的行度量信息-runMetrics:' + lineMetric.runMetrics.toString())
              let map : Map<number, text.RunMetrics> = lineMetric.runMetrics;
              map.forEach((value, key) => {
                console.log('获取-----key:' + key + ',value:' + JSON.stringify(value))
              })
            }
          })
        Divider().strokeWidth(8).color(Color.Black).height('1%')
        Text('排版后').height('5%')
        Text(undefined, { controller: this.textController })
          .height('10%')
          .onAppear(() => {
            let now = this.getCorretIndex(this.mutableStrAllContent, 3, LengthMetrics.px(500))
            if (now != this.mutableStrAllContent.length - 1 && now != 0) {
              let moreStyledString = new MutableStyledString("... 全文", [{
                start: 4,
                length: 2,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({ fontColor: Color.Blue })
              }])
              moreStyledString.insertStyledString(0, this.mutableStrAllContent.subStyledString(0, now))
              this.textController.setStyledString(moreStyledString)
              let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(moreStyledString, { constraintWidth: LengthMetrics.px(500) })
              console.log('Test2--获取文本最大行宽:' + paragraphArr[0].getMaxWidth())
              console.log('Test2--获取文本总高度:' + paragraphArr[0].getHeight())
              console.log('Test2--获取文本最长行宽:' + paragraphArr[0].getLongestLine())
              console.log('Test2--获取文本最长一行的宽度:' + paragraphArr[0].getLongestLineWithIndent())
              console.log('Test2--获取段落最小固有宽度:' + paragraphArr[0].getMinIntrinsicWidth())
              console.log('Test2--获取段落最大固有宽度:' + paragraphArr[0].getMaxIntrinsicWidth())
              console.log('Test2--获取拉丁字母基线位置度:' + paragraphArr[0].getAlphabeticBaseline())
              console.log('Test2--获取表意字（如CJK（中文，日文，韩文））下的基线位置:' + paragraphArr[0].getIdeographicBaseline())
              let range: text.Range = { start: 0, end: 16};
              console.log('Test2--获取给定的矩形区域宽度以及矩形区域高度的规格下，文本中该区间范围内的字符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT)))
              console.log('Test2--获取文本中所有占位符所占的矩形区域:' + paragraphArr[0].getRectsForPlaceholders())
              console.log('Test2--获取与给定坐标最接近的字形位置信息:' + JSON.stringify(paragraphArr[0].getGlyphPositionAtCoordinate(522, 233)))
              console.log('Test2--获取返回给定offset的字形所在单词的索引区间:' + JSON.stringify(paragraphArr[0].getWordBoundary(0)))
              console.log('Test2--获取返回文本行数:' + paragraphArr[0].getLineCount())
              console.log('Test2--获取返回指定行的行高:' + paragraphArr[0].getLineHeight(1))
              console.log('Test2--获取返回指定行的行宽:' + paragraphArr[0].getLineWidth(1))
              console.log('Test2--获取返回段落是否超过最大行数:' + paragraphArr[0].didExceedMaxLines())
              console.log('Test2--获取返回所有的文本行:' + JSON.stringify(paragraphArr[0].getTextLines()))
              console.log('Test2--获取指定行的实际可见文本范围，不包括溢出的省略号:' + JSON.stringify(paragraphArr[0].getActualTextRange(0, true)))
              console.log('Test2--获取文本行的行度量数组:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
              console.log('Test2--获取特定行号的行度量信息:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
            } else {
              this.textController.setStyledString(this.mutableStrAllContent)
            }
          }).width('500px')
        Divider().strokeWidth(8).color(Color.Black).height('1%')

        Text('原文').height('5%')
        Text(undefined, { controller: this.controller2 }).width('500px')
          .height('5%')
          .onAppear(() => {
            this.controller2.setStyledString(this.mutableStrAllContent2)
            let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(this.mutableStrAllContent2, { constraintWidth: LengthMetrics.px(500) })
            console.log('Test--获取文本最大行宽:' + paragraphArr[0].getMaxWidth())
            AppStorage.SetOrCreate('getMaxWidth', paragraphArr[0].getMaxWidth())
            console.log('Test--获取文本总高度:' + paragraphArr[0].getHeight())
            console.log('Test--获取文本最长行宽:' + paragraphArr[0].getLongestLine())
            console.log('Test--获取文本最长一行的宽度:' + paragraphArr[0].getLongestLineWithIndent())
            console.log('Test--获取段落最小固有宽度:' + paragraphArr[0].getMinIntrinsicWidth())
            console.log('Test--获取段落最大固有宽度:' + paragraphArr[0].getMaxIntrinsicWidth())
            console.log('Test--获取拉丁字母基线位置度:' + paragraphArr[0].getAlphabeticBaseline())
            console.log('Test--获取表意字（如CJK（中文，日文，韩文））下的基线位置:' + paragraphArr[0].getIdeographicBaseline())
            let range: text.Range = { start: 0, end: 1};
            console.log('Test--获取给定的矩形区域宽度以及矩形区域高度的规格下，文本中该区间范围内的字符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT)))
            console.log('Test--获取文本中所有占位符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForPlaceholders()))
            console.log('Test--获取与给定坐标最接近的字形位置信息:' + JSON.stringify(paragraphArr[0].getGlyphPositionAtCoordinate(522, 233)))
            console.log('Test--获取返回给定offset的字形所在单词的索引区间:' + JSON.stringify(paragraphArr[0].getWordBoundary(0)))
            console.log('Test--获取返回文本行数:' + paragraphArr[0].getLineCount())
            console.log('Test--获取返回指定行的行高:' + paragraphArr[0].getLineHeight(1))
            console.log('Test--获取返回指定行的行宽:' + paragraphArr[0].getLineWidth(0))
            console.log('Test--获取返回段落是否超过最大行数:' + paragraphArr[0].didExceedMaxLines())
            AppStorage.SetOrCreate('didExceedMaxLines', paragraphArr[0].didExceedMaxLines() + '')  // False
            console.log('Test--获取返回所有的文本行:' + JSON.stringify(paragraphArr[0].getTextLines()))
            console.log('Test--获取指定行的实际可见文本范围，不包括溢出的省略号:' + JSON.stringify(paragraphArr[0].getActualTextRange(0, true)))
            console.log('Test--获取文本行的行度量数组:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
            console.log('Test--获取特定行号的行度量信息:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
          })
        Divider().strokeWidth(8).color(Color.Black).height('1%')

        Text('排版后Test').height('5%')
        Text(undefined, { controller: this.textController2 })
          .height('10%')
          .onAppear(() => {
            let now = this.getCorretIndex(this.mutableStrAllContent2, 3, LengthMetrics.px(500))
            if (now != this.mutableStrAllContent.length - 1 && now != 0) {
              let moreStyledString = new MutableStyledString("... 全文", [{
                start: 4,
                length: 2,
                styledKey: StyledStringKey.FONT,
                styledValue: new TextStyle({ fontColor: Color.Blue })
              }])
              moreStyledString.insertStyledString(0, this.mutableStrAllContent2.subStyledString(0, now))
              this.textController2.setStyledString(moreStyledString)
              let paragraphArr = this.getUIContext().getMeasureUtils().getParagraphs(moreStyledString, { constraintWidth: LengthMetrics.px(500) })
              console.log('获取文本最大行宽getMaxWidth:' + paragraphArr[0].getMaxWidth())
              console.log('Test1--获取文本总高度:getMaxWidth' + paragraphArr[0].getHeight())
              console.log('Test1--获取文本最长行宽:' + paragraphArr[0].getLongestLine())
              console.log('Test1--获取文本最长一行的宽度:' + paragraphArr[0].getLongestLineWithIndent())
              console.log('Test1--获取段落最小固有宽度:' + paragraphArr[0].getMinIntrinsicWidth())
              console.log('Test1--获取段落最大固有宽度:' + paragraphArr[0].getMaxIntrinsicWidth())
              console.log('Test1--获取拉丁字母基线位置度:' + paragraphArr[0].getAlphabeticBaseline())
              console.log('Test1--获取表意字（如CJK（中文，日文，韩文））下的基线位置:' + paragraphArr[0].getIdeographicBaseline())
              let range: text.Range = { start: 0, end: 1};
              console.log('Test1--获取给定的矩形区域宽度以及矩形区域高度的规格下，文本中该区间范围内的字符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForRange(range, text.RectWidthStyle.TIGHT, text.RectHeightStyle.TIGHT)))
              console.log('Test1--获取文本中所有占位符所占的矩形区域:' + JSON.stringify(paragraphArr[0].getRectsForPlaceholders()))
              console.log('Test1--获取与给定坐标最接近的字形位置信息:' + JSON.stringify(paragraphArr[0].getGlyphPositionAtCoordinate(522, 233)))
              console.log('Test1--获取返回给定offset的字形所在单词的索引区间:' + JSON.stringify(paragraphArr[0].getWordBoundary(0)))
              console.log('Test1--获取返回文本行数:' + paragraphArr[0].getLineCount())
              console.log('Test1--获取返回指定行的行高:' + paragraphArr[0].getLineHeight(1))
              console.log('Test1--获取返回指定行的行宽:' + paragraphArr[0].getLineWidth(1))
              console.log('Test1--获取返回段落是否超过最大行数:' + paragraphArr[0].didExceedMaxLines())
              console.log('Test1--获取返回所有的文本行:' + JSON.stringify(paragraphArr[0].getTextLines()))
              console.log('Test1--获取指定行的实际可见文本范围，不包括溢出的省略号:' + JSON.stringify(paragraphArr[0].getActualTextRange(0, true)))
              console.log('Test1--获取文本行的行度量数组:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
              console.log('Test1--获取特定行号的行度量信息:' + JSON.stringify(paragraphArr[0].getLineMetrics()))
            }
          })
      }.width('100%')
    }
  }
}