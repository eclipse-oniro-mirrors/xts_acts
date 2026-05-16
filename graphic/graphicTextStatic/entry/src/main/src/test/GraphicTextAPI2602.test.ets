/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import text from "@ohos.graphics.text";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';

export default function GraphicTextAPI2602() {

  describe('GraphicTextAPI2602', () => {

    beforeAll(() => {
    })
    /**
     * @tc.name   testFirstLineHeadIndentDefaultStatic
     * @tc.number SUB_GRAPHIC_Text_firstLineHeadIndentDefault_static_0100
     * @tc.desc   Test ParagraphStyle firstLineHeadIndent default value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFirstLineHeadIndentDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFirstLineHeadIndentDefaultStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试首行缩进默认值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(-1);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFirstLineHeadIndentZeroStatic
     * @tc.number SUB_GRAPHIC_Text_firstLineHeadIndentZero_static_0200
     * @tc.desc   Test ParagraphStyle firstLineHeadIndent set to 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFirstLineHeadIndentZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFirstLineHeadIndentZeroStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 0
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试首行缩进为零');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          console.info(msgStr + ' maxWidth: ' + maxWidth + ', height: ' + height);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFirstLineHeadIndentPositiveStatic
     * @tc.number SUB_GRAPHIC_Text_firstLineHeadIndentPositive_static_0300
     * @tc.desc   Test ParagraphStyle firstLineHeadIndent set to positive value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFirstLineHeadIndentPositiveStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFirstLineHeadIndentPositiveStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 20
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试首行缩进为正数值的效果，首行应该有明显的缩进效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFirstLineHeadIndentLargeStatic
     * @tc.number SUB_GRAPHIC_Text_firstLineHeadIndentLarge_static_0400
     * @tc.desc   Test ParagraphStyle firstLineHeadIndent set to large value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFirstLineHeadIndentLargeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFirstLineHeadIndentLargeStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试首行大缩进效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(100);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFirstLineHeadIndentDecimalStatic
     * @tc.number SUB_GRAPHIC_Text_firstLineHeadIndentDecimal_static_0500
     * @tc.desc   Test ParagraphStyle firstLineHeadIndent set to decimal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFirstLineHeadIndentDecimalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFirstLineHeadIndentDecimalStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 15.5
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试首行缩进小数值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(15.5);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsDefaultStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsDefault_static_0100
     * @tc.desc   Test ParagraphStyle tailIndents default value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsDefaultStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行尾缩进默认值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle?.tailIndents?.length).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsEmptyStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsEmpty_static_0200
     * @tc.desc   Test ParagraphStyle tailIndents set to empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsEmptyStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: []
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试空行尾缩进数组');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents length: ' + returnedStyle.tailIndents?.length);
          expect(returnedStyle.tailIndents?.length).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsSingleStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsSingle_static_0300
     * @tc.desc   Test ParagraphStyle tailIndents with single element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsSingleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsSingleStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: [20]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试单元素行尾缩进数组，所有行应该都使用这个缩进值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.tailIndents?.length).assertEqual(1);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsMultiStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsMulti_static_0400
     * @tc.desc   Test ParagraphStyle tailIndents with multiple elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsMultiStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsMultiStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: [10, 20, 30]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试多元素行尾缩进数组，每行使用不同的缩进值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.tailIndents?.length).assertEqual(3);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(10);
          expect(returnedStyle.tailIndents?.[1]).assertEqual(20);
          expect(returnedStyle.tailIndents?.[2]).assertEqual(30);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsOverflowStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsOverflow_static_0500
     * @tc.desc   Test ParagraphStyle tailIndents overflow behavior when lines exceed array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsOverflowStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsOverflowStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: [10, 20]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个很长的测试文本，用于验证当文本行数超过缩进数组长度时的溢出行为。超过行的缩进应该使用数组最后一个值。这段文本应该会产生多行');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(150);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.tailIndents?.length).assertEqual(2);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(10);
          expect(returnedStyle.tailIndents?.[1]).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsZeroStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsZero_static_0600
     * @tc.desc   Test ParagraphStyle tailIndents with all zero values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsZeroStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: [0, 0, 0]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行尾缩进全为零');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.tailIndents?.length).assertEqual(3);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(0);
          expect(returnedStyle.tailIndents?.[1]).assertEqual(0);
          expect(returnedStyle.tailIndents?.[2]).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testTailIndentsDecimalStatic
     * @tc.number SUB_GRAPHIC_Text_tailIndentsDecimal_static_0700
     * @tc.desc   Test ParagraphStyle tailIndents with decimal values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTailIndentsDecimalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testTailIndentsDecimalStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            tailIndents: [10.5, 20.5]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行尾缩进小数值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.tailIndents?.length).assertEqual(2);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(10.5);
          expect(returnedStyle.tailIndents?.[1]).assertEqual(20.5);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsDefaultStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsDefault_static_0100
     * @tc.desc   Test ParagraphStyle headIndents default value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsDefaultStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行首缩进默认值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle?.headIndents?.length).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsEmptyStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsEmpty_static_0200
     * @tc.desc   Test ParagraphStyle headIndents set to empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsEmptyStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: []
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试空行首缩进数组');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents length: ' + returnedStyle.headIndents?.length);
          expect(returnedStyle.headIndents?.length).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsSingleStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsSingle_static_0300
     * @tc.desc   Test ParagraphStyle headIndents with single element.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsSingleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsSingleStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [20]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试单元素行首缩进数组，所有行应该都使用这个缩进值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.headIndents?.length).assertEqual(1);
          expect(returnedStyle.headIndents?.[0]).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsMultiStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsMulti_static_0400
     * @tc.desc   Test ParagraphStyle headIndents with multiple elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsMultiStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsMultiStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [10, 20, 30]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试多元素行首缩进数组，每行使用不同的缩进值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.headIndents?.length).assertEqual(3);
          expect(returnedStyle.headIndents?.[0]).assertEqual(10);
          expect(returnedStyle.headIndents?.[1]).assertEqual(20);
          expect(returnedStyle.headIndents?.[2]).assertEqual(30);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsOverflowStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsOverflow_static_0500
     * @tc.desc   Test ParagraphStyle headIndents overflow behavior when lines exceed array length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsOverflowStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsOverflowStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [10, 20]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个很长的测试文本，用于验证当文本行数超过缩进数组长度时的溢出行为。超过行的缩进应该使用数组最后一个值。这段文本应该会产生多行');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(150);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          expect(returnedStyle.headIndents?.[0]).assertEqual(10);
          expect(returnedStyle.headIndents?.[1]).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsZeroStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsZero_static_0600
     * @tc.desc   Test ParagraphStyle headIndents with all zero values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsZeroStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsZeroStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [0, 0, 0]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行首缩进全为零');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.headIndents?.length).assertEqual(3);
          expect(returnedStyle.headIndents?.[0]).assertEqual(0);
          expect(returnedStyle.headIndents?.[1]).assertEqual(0);
          expect(returnedStyle.headIndents?.[2]).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testHeadIndentsDecimalStatic
     * @tc.number SUB_GRAPHIC_Text_headIndentsDecimal_static_0700
     * @tc.desc   Test ParagraphStyle headIndents with decimal values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeadIndentsDecimalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testHeadIndentsDecimalStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [10.5, 20.5]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行首缩进小数值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          expect(returnedStyle.headIndents?.[0]).assertEqual(10.5);
          expect(returnedStyle.headIndents?.[1]).assertEqual(20.5);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentCombinationStatic
     * @tc.number SUB_GRAPHIC_Text_indentCombination_static_0100
     * @tc.desc   Test ParagraphStyle with all indent properties combined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentCombinationStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentCombinationStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 40,
            headIndents: [20, 30],
            tailIndents: [10, 15]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试所有缩进属性组合效果，首行缩进40，行首缩进数组[20,30]，行尾缩进数组[10,15]');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          console.info(msgStr + ' tailIndents: ' + JSON.stringify(returnedStyle.tailIndents));
          expect(returnedStyle.firstLineHeadIndent).assertEqual(40);
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          expect(returnedStyle.tailIndents?.length).assertEqual(2);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentWithAlignmentStatic
     * @tc.number SUB_GRAPHIC_Text_indentWithAlignment_static_0200
     * @tc.desc   Test indent properties with textAlign JUSTIFY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentWithAlignmentStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentWithAlignmentStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            align: text.TextAlign.JUSTIFY,
            firstLineHeadIndent: 20,
            headIndents: [10],
            tailIndents: [10]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个用于测试缩进与两端对齐组合效果的长文本，缩进属性应该与对齐方式共存并正常生效');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' align: ' + returnedStyle.align);
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.align).assertEqual(text.TextAlign.JUSTIFY);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(20);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentWithMaxLinesStatic
     * @tc.number SUB_GRAPHIC_Text_indentWithMaxLines_static_0300
     * @tc.desc   Test indent properties with maxLines restriction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentWithMaxLinesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentWithMaxLinesStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 2,
            firstLineHeadIndent: 30,
            headIndents: [15, 25],
            tailIndents: [5, 10]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试缩进属性与最大行数限制组合，文本应该被限制为两行');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' maxLines: ' + returnedStyle.maxLines);
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.maxLines).assertEqual(2);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(30);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentWithLongTextStatic
     * @tc.number SUB_GRAPHIC_Text_indentWithLongText_static_0400
     * @tc.desc   Test indent properties with long multi-line text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentWithLongTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentWithLongTextStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            headIndents: [10, 20, 30],
            tailIndents: [5, 10, 15]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let longText: string = '这是一个很长的测试文本，用于验证缩进属性在长文本多行场景下的效果。各行缩进应该按照数组规则生效，超过行数的使用最后一个值。文本需要足够长以产生多行效果';
          paragraphBuilder.addText(longText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(150);

          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          console.info(msgStr + ' maxWidth: ' + maxWidth + ', height: ' + height);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentWithEmptyTextStatic
     * @tc.number SUB_GRAPHIC_Text_indentWithEmptyText_static_0500
     * @tc.desc   Test indent properties with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentWithEmptyTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentWithEmptyTextStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 20,
            headIndents: [10],
            tailIndents: [5]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          console.info(msgStr + ' maxWidth: ' + maxWidth + ', height: ' + height);
          expect(maxWidth).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIndentWithSingleLineStatic
     * @tc.number SUB_GRAPHIC_Text_indentWithSingleLine_static_0600
     * @tc.desc   Test indent properties with single line text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIndentWithSingleLineStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testIndentWithSingleLineStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 40,
            headIndents: [20, 30],
            tailIndents: [10, 15]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('单行文本');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent: ' + returnedStyle.firstLineHeadIndent);
          console.info(msgStr + ' headIndents: ' + JSON.stringify(returnedStyle.headIndents));
          expect(returnedStyle.firstLineHeadIndent).assertEqual(40);
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAllIndentsStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAllIndents_static_0100
     * @tc.desc   Test Paragraph getParagraphStyle returns all indent properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAllIndentsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAllIndentsStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 25,
            headIndents: [15, 25, 35],
            tailIndents: [5, 15, 25]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试getParagraphStyle返回所有缩进属性');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle: ' + JSON.stringify(returnedStyle));
          expect(returnedStyle.firstLineHeadIndent).assertEqual(25);
          expect(returnedStyle.headIndents?.length).assertEqual(3);
          expect(returnedStyle.headIndents?.[0]).assertEqual(15);
          expect(returnedStyle.headIndents?.[1]).assertEqual(25);
          expect(returnedStyle.headIndents?.[2]).assertEqual(35);
          expect(returnedStyle.tailIndents?.length).assertEqual(3);
          expect(returnedStyle.tailIndents?.[0]).assertEqual(5);
          expect(returnedStyle.tailIndents?.[1]).assertEqual(15);
          expect(returnedStyle.tailIndents?.[2]).assertEqual(25);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleBeforeLayoutStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleBeforeLayout_static_0200
     * @tc.desc   Test Paragraph getParagraphStyle before layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleBeforeLayoutStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleBeforeLayoutStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 30,
            headIndents: [10, 20],
            tailIndents: [5, 10]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试layout前获取样式');
          let paragraph: text.Paragraph = paragraphBuilder.build();

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent before layout: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(30);
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          expect(returnedStyle.tailIndents?.length).assertEqual(2);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAfterLayoutStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAfterLayout_static_0300
     * @tc.desc   Test Paragraph getParagraphStyle after layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAfterLayoutStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAfterLayoutStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            firstLineHeadIndent: 30,
            headIndents: [10, 20],
            tailIndents: [5, 10]
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试layout后获取样式');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' firstLineHeadIndent after layout: ' + returnedStyle.firstLineHeadIndent);
          expect(returnedStyle.firstLineHeadIndent).assertEqual(30);
          expect(returnedStyle.headIndents?.length).assertEqual(2);
          expect(returnedStyle.tailIndents?.length).assertEqual(2);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleReturnTypeStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleReturnType_static_0400
     * @tc.desc   Test Paragraph getParagraphStyle returns ParagraphStyle type object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleReturnTypeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleReturnTypeStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试返回值类型');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle type: ' + typeof returnedStyle);
          expect(returnedStyle.textStyle !== undefined).assertTrue();
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

  })
}
