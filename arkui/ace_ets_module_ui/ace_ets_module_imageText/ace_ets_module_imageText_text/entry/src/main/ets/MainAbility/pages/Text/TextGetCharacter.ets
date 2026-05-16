/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import font from '@ohos.font';

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct TextExample10 {
  @State start: number = 0;
  @State end: number = 20;
  textController: TextController = new TextController();
  textStr: string = 'Hello World! 您好，世界!';
  @State str1: string = ''
  @State str2: string = ''
  @State str3: string = ''
  @State str4: string = ''
  @State myDecoration: DecorationStyle | undefined = undefined;
  @State myTextAlign: TextAlign | undefined = undefined;
  @State myDirection: TextDirection | undefined = undefined;
  @State myTextIndent: Length | undefined = undefined;
  @State myTextOverflow: TextOverflowOptions | undefined = undefined;
  @State queryX: number = 150;
  @State queryY: number = 50;
  textStyleAttrs: TextStyle =
    new TextStyle({ fontWeight: FontWeight.Bolder, fontSize: LengthMetrics.vp(24), fontStyle: FontStyle.Italic });
  titleParagraphStyleAttr: ParagraphStyle =
    new ParagraphStyle({ paragraphSpacing: LengthMetrics.px(50), textIndent: LengthMetrics.vp(15) });
  mutableStyledString: MutableStyledString =
    new MutableStyledString('属性字符串TextStyle测试\n属性字符串测试\n属性字符串TextStyle测试', [
      {
        start: 0,
        length: 3,
        styledKey: StyledStringKey.FONT,
        styledValue: this.textStyleAttrs
      },
      {
        start: 5,
        length: 9,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(20) })
      },
      {
        start: 23,
        length: 3,
        styledKey: StyledStringKey.FONT,
        styledValue: this.textStyleAttrs
      },
      {
        start: 28,
        length: 2,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Orange, fontSize: LengthMetrics.vp(20) })
      },
      {
        start: 0,
        length: 0,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.titleParagraphStyleAttr
      },
    ]);

  build() {
    Scroll() {
      Column() {
        Text(this.textStr, { controller: this.textController }) {
          // Span("\n")
          ImageSpan($r('app.media.jpg'))
            .width(20)
            .height(20)
          ImageSpan($r('app.media.gif'))
            .width(20)
            .height(20)
          SymbolSpan($r('sys.symbol.ohos_trash'))
            .fontWeight(FontWeight.Lighter)
            //.fontSize(40)
          Span('45678🎄🐀🙂🧭🚗abcd~!@#$%^&*(\n中文\n！￥👩‍👧‍👦🏛️\t')
        }
        .copyOption(CopyOptions.InApp)
        .width('60%')
        .decoration(this.myDecoration)
        .textDirection(this.myDirection)
        .textAlign(this.myTextAlign)
        .textIndent(this.myTextIndent)
        .textOverflow(this.myTextOverflow)
        //.fontSize(25)
        .borderWidth(1)

        Text(this.str1)
          .fontSize(5)
          .id('glyphPositionAtCoordinateText')
        Text(this.str2)
          .fontSize(5)
          .id('characterPositionAtCoordinateText')
        Text(this.str3)
          .fontSize(5)
          .id('getGlyphText')
        Text(this.str4)
          .fontSize(5)
          .id('getCharacterText')

        Row() {
          Button('[0,0]').id('glyphPositionAtCoordinateButton')
            .onClick(() => {
              this.queryX = 0;
              this.queryY = 0
            }).backgroundColor(Color.Orange)
          Button('0,1').id('getCharacterButton')
            .onClick(() => {
              this.start = 0;
              this.end = 1
            })
        }

        Button('获取具体文本字符/字型信息').id('AccessButton')
          .backgroundColor(Color.Pink)
          .onClick(() => {
            let layoutManager: LayoutManager = this.textController.getLayoutManager();
            let position1: PositionWithAffinity = layoutManager.getGlyphPositionAtCoordinate(this.queryX, this.queryY);
            this.str1 = 'glyphPositionAtCoordinate position: ' + position1.position +
              ' affinity: ' +
            position1.affinity;
            console.info('liufeng glyphPositionAtCoordinate position: ' + position1.position +
              ' affinity: ' +
            position1.affinity)

            let position2: PositionWithAffinity =
              layoutManager.getCharacterPositionAtCoordinate(this.queryX, this.queryY) as PositionWithAffinity;
            console.info('liufeng characterPositionAtCoordinate position: ' + position2.position +
              ' affinity: ' +
            position2.affinity)
            this.str2 = 'characterPositionAtCoordinate position: ' + position2.position +
              ' affinity: ' +
            position2.affinity;

            let range1: TextRange = { start: this.start, end: this.end };
            let ranges1: Array<TextRange> = layoutManager.getGlyphRangeForCharacterRange(range1) as Array<TextRange>
            console.info('liufeng getGlyphRangeForCharacterRange 字型数 ' + ranges1[0].start + ' ' + ranges1[0].end)
            console.info('liufeng getGlyphRangeForCharacterRange 实际字符数 ' + ranges1[1].start + ' ' + ranges1[1].end)
            this.str3 = 'getGlyph(入参字符,返回字型) 字型数 ' + ranges1[0].start + ' ' + ranges1[0].end +
              'getGlyph 实际字符数 ' + ranges1[1].start + ' ' + ranges1[1].end

            let range2: TextRange = { start: this.start, end: this.end };
            let ranges2: Array<TextRange> = layoutManager.getCharacterRangeForGlyphRange(range2) as Array<TextRange>
            console.info('liufeng getCharacterRangeForGlyphRange 字符数 ' + ranges2[0].start + ' ' + ranges2[0].end)
            console.info('liufeng getCharacterRangeForGlyphRange 实际字型数 ' + ranges2[1].start + ' ' + ranges2[1].end)
            this.str4 = 'getCharacter(入参字型,返回字符) 字符数 ' + ranges2[0].start + ' ' + ranges2[0].end +
              'getCharacter 实际字型数 ' + ranges2[1].start + ' ' + ranges2[1].end
          })
      }
      .width('80%')
      .height('80%')
    }
  }
}