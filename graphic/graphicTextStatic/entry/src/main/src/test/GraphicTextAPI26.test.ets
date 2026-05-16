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

export default function GraphicTextAPI26() {

  describe('GraphicTextAPI26', () => {

    beforeAll(() => {
    })

    /**
     * @tc.name   testOrphanCharOptimizationTrueStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationTrueStatic_0100
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationTrueStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          expect(paragraphStyle.orphanCharOptimization).assertTrue();
          console.info(msgStr + ' orphanCharOptimization is true');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationFalseStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationFalseStatic_0200
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationFalseStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: false
          };
          expect(paragraphStyle.orphanCharOptimization).assertFalse();
          console.info(msgStr + ' orphanCharOptimization is false');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationUndefinedStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationUndefinedStatic_0300
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationUndefinedStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          expect(paragraphStyle.orphanCharOptimization).assertEqual(undefined);
          console.info(msgStr + ' orphanCharOptimization is undefined');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHansStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHansStatic_0400
     * @tc.desc   Test orphanCharOptimization with zh-Hans locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHansStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHansStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个测试文本，用于验证孤字优化功能的效果。孤字优化应该能够避免段落末尾出现孤立的字符，使排版更加美观和合理');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with zh-Hans locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHantStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHantStatic_0500
     * @tc.desc   Test orphanCharOptimization with zh-Hant locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHantStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHantStatic===="
        let zhHantTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hant"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHantTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('這是一個測試文本，用於驗證孤字優化功能的效果。孤字優化應該能夠避免段落末尾出現孤立的字符，使排版更加美觀和合理');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with zh-Hant locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithBreakAllStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithBreakAllStatic_0600
     * @tc.desc   Test orphanCharOptimization with BREAK_ALL wordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithBreakAllStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithBreakAllStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_ALL,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个测试文本，用于验证孤字优化功能的效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with BREAK_ALL wordBreak');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithEnLocaleStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithEnLocaleStatic_0700
     * @tc.desc   Test orphanCharOptimization with en locale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithEnLocaleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithEnLocaleStatic===="
        let enTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "en"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: enTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText("This is a test text for verifying orphan character optimization functionality.");
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with en locale');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationLayoutEffectStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationLayoutEffectStatic_0800
     * @tc.desc   Test orphanCharOptimization layout effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationLayoutEffectStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationLayoutEffectStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('孤字优化通过更高效地处理孤立字符来改善文本布局。使能后，它会调整换行点以尽可能避免孤立字符');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(200);
          console.info(msgStr + ' layout success');
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithLongTextStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithLongTextStatic_0900
     * @tc.desc   Test orphanCharOptimization with long text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithLongTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithLongTextStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let longText: string = '这是一个很长的测试文本，用于验证孤字优化功能在长文本场景下的效果。孤字优化应该能够避免段落末尾出现孤立的字符，使排版更加美观和合理。通过调整换行点，孤字优化可以确保文本布局更加符合中文排版规范，提升阅读体验';
          paragraphBuilder.addText(longText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with long text');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationEmptyTextStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationEmptyTextStatic_1000
     * @tc.desc   Test orphanCharOptimization with empty text.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationEmptyTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationEmptyTextStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText("");
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with empty text');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLessOrEqual(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testOrphanCharOptimizationSingleCharStatic
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationSingleCharStatic_1100
     * @tc.desc   Test orphanCharOptimization with single character text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationSingleCharStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationSingleCharStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          locale: "zh-Hans"
        };
        try {
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            orphanCharOptimization: true
          };
          let fontCollection = new text.FontCollection();
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('a');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with single character');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    /**
     * @tc.name   testSetParagraphCachesEnabledTrueStatic
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledTrueStatic_0100
     * @tc.desc   Test FontCollection setParagraphCachesEnabled property set to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledTrueStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.setParagraphCachesEnabled(true);
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试启用段落缓存');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with cache enabled');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSetParagraphCachesEnabledFalseStatic
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledFalseStatic_0200
     * @tc.desc   Test FontCollection setParagraphCachesEnabled property set to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledFalseStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.setParagraphCachesEnabled(false);
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试禁用段落缓存');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with cache disabled');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSetParagraphCachesEnabledToggleStatic
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledToggleStatic_0300
     * @tc.desc   Test FontCollection setParagraphCachesEnabled toggle state multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledToggleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledToggleStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.setParagraphCachesEnabled(true);
          fontCollection.setParagraphCachesEnabled(false);
          fontCollection.setParagraphCachesEnabled(true);
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试缓存状态切换');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success after toggle');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSetParagraphCachesEnabledWithLayoutStatic
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledLayoutStatic_0400
     * @tc.desc   Test setParagraphCachesEnabled enabled with paragraph layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledWithLayoutStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledWithLayoutStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.setParagraphCachesEnabled(true);
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试启用缓存后的多行文本排版效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(200);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with cache enabled');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testSetParagraphCachesEnabledDisabledWithLayoutStatic
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledDisabledLayoutStatic_0500
     * @tc.desc   Test setParagraphCachesEnabled disabled with paragraph layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledDisabledWithLayoutStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledDisabledWithLayoutStatic===="
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          fontCollection.setParagraphCachesEnabled(false);
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试禁用缓存后的多行文本排版效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(200);
          let maxWidth: number = paragraph.getMaxWidth();
          let height: number = paragraph.getHeight();
          let longestLine: number = paragraph.getLongestLine();
          console.info(msgStr + ' layout success with cache disabled');
          console.info(msgStr + ' maxWidth: ' + maxWidth);
          console.info(msgStr + ' height: ' + height);
          console.info(msgStr + ' longestLine: ' + longestLine);
          expect(maxWidth).assertLarger(0);
          expect(height).assertLarger(0);
          expect(longestLine).assertLarger(0);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetProcessStateInitStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateInitStatic_0100
     * @tc.desc   Test Paragraph getProcessState returns INIT after build.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateInitStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateInitStatic===="
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
          paragraphBuilder.addText('测试文本处理状态');
          let paragraph: text.Paragraph = paragraphBuilder.build();

          let processState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' processState after build: ' + processState);
          expect(processState).assertEqual(text.TextProcessState.INIT);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetProcessStateFormattedStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateFormattedStatic_0200
     * @tc.desc   Test Paragraph getProcessState returns FORMATTED after layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateFormattedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateFormattedStatic===="
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
          paragraphBuilder.addText('测试文本处理状态');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let processState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' processState after layout: ' + processState);
          expect(processState).assertEqual(text.TextProcessState.FORMATTED);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetProcessStatePaintStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStatePaintStatic_0300
     * @tc.desc   Test Paragraph getProcessState returns PAINT after paint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStatePaintStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStatePaintStatic===="
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
          paragraphBuilder.addText('测试文本处理状态');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          const color: ArrayBuffer = new ArrayBuffer(160000);
          let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 200, width: 200 } }
          let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          let canvas: drawing.Canvas = new drawing.Canvas(pixelMap);
          paragraph.paint(canvas, 10, 10);

          let processState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' processState after paint: ' + processState);
          expect(processState).assertEqual(text.TextProcessState.PAINT);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetProcessStateUpdateAttributeStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateUpdateAttributeStatic_0400
     * @tc.desc   Test Paragraph getProcessState returns UPDATE_ATTRIBUTE after updateAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateUpdateAttributeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateUpdateAttributeStatic===="
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
          paragraphBuilder.addText('测试文本处理状态');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);
          paragraph.updateColor({ alpha: 155, red: 100, green: 100, blue: 100 });

          let processState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' processState after updateAttribute: ' + processState);
          expect(processState).assertEqual(text.TextProcessState.UPDATE_ATTRIBUTE);
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetProcessStateTransitionStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateStateTransitionStatic_0500
     * @tc.desc   Test Paragraph getProcessState state transition from INIT to FORMATTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateTransitionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateTransitionStatic===="
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
          paragraphBuilder.addText('测试状态流转');
          let paragraph: text.Paragraph = paragraphBuilder.build();

          let initState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' initState: ' + initState);
          expect(initState).assertEqual(text.TextProcessState.INIT);

          await paragraph.layout(300);

          let formattedState: text.TextProcessState = paragraph.getProcessState();
          console.info(msgStr + ' formattedState: ' + formattedState);
          expect(formattedState).assertEqual(text.TextProcessState.FORMATTED);

          console.info(msgStr + ' state transition from INIT to FORMATTED verified');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
      
    /**
     * @tc.name   testGetTextDisplayStateUnknownStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateUnknownStatic_0100
     * @tc.desc   Test Paragraph getTextDisplayState returns UNKNOWN after build.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateUnknownStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateUnknownStatic===="
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
          paragraphBuilder.addText('测试文本显示状态 UNKNOWN');
          let paragraph: text.Paragraph = paragraphBuilder.build();

          let displayState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' displayState after build: ' + displayState);
          expect(displayState).assertEqual(text.TextDisplayState.UNKNOWN);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetTextDisplayStateAllStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateAllStatic_0200
     * @tc.desc   Test Paragraph getTextDisplayState returns ALL when text fits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateAllStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateAllStatic===="
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
          paragraphBuilder.addText('测试文本显示状态 ALL');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let displayState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' displayState after layout: ' + displayState);
          expect(displayState).assertEqual(text.TextDisplayState.ALL);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetTextDisplayStateClipStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateClipStatic_0300
     * @tc.desc   Test Paragraph getTextDisplayState returns CLIP when text overflows.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateClipStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateClipStatic===="
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
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个很长的测试文本，用于验证文本裁剪显示状态的效果 CLIP');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let displayState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' displayState after layout: ' + displayState);
          expect(displayState).assertEqual(text.TextDisplayState.CLIP);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetTextDisplayStateOmittedStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateOmittedStatic_0400
     * @tc.desc   Test Paragraph getTextDisplayState returns OMITTED with ellipsis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateOmittedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateOmittedStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "..."
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个很长的测试文本，用于验证文本省略显示状态的效果 OMITTED');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let displayState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' displayState after layout: ' + displayState);
          expect(displayState).assertEqual(text.TextDisplayState.OMITTED);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetTextDisplayStateTransitionStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateStateTransitionStatic_0500
     * @tc.desc   Test Paragraph getTextDisplayState state transition from UNKNOWN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateTransitionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateTransitionStatic===="
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
          paragraphBuilder.addText('测试状态流转');
          let paragraph: text.Paragraph = paragraphBuilder.build();

          let unknownState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' unknownState: ' + unknownState);
          expect(unknownState).assertEqual(text.TextDisplayState.UNKNOWN);

          await paragraph.layout(100);

          let clipState: text.TextDisplayState = paragraph.getTextDisplayState();
          console.info(msgStr + ' clipState: ' + clipState);
          expect(clipState).assertEqual(text.TextDisplayState.ALL);

          console.info(msgStr + ' state transition from UNKNOWN to ALL verified');
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
      
    /**
     * @tc.name   testGetParagraphStyleTextStyleStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleStatic_0100
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 33.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试文本样式');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle fontSize: ' + returnedStyle.textStyle?.fontSize);
          expect(returnedStyle.textStyle?.fontSize).assertEqual(33.0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextDirectionStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextDirectionStatic_0200
     * @tc.desc   Test Paragraph getParagraphStyle returns textDirection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextDirectionStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextDirectionStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            textDirection: text.TextDirection.RTL
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试文本方向');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textDirection: ' + returnedStyle.textDirection);
          expect(returnedStyle.textDirection).assertEqual(text.TextDirection.RTL);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAlignStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignStatic_0300
     * @tc.desc   Test Paragraph getParagraphStyle returns align.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            align: text.TextAlign.CENTER
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试文本对齐');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          expect(returnedStyle.align).assertEqual(text.TextAlign.CENTER);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleWordBreakStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreakStatic_0400
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreakStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreakStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_ALL
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试断词类型');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle wordBreak: ' + returnedStyle.wordBreak);
          expect(returnedStyle.wordBreak).assertEqual(text.WordBreak.BREAK_ALL);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleMaxLinesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleMaxLinesStatic_0500
     * @tc.desc   Test Paragraph getParagraphStyle returns maxLines.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleMaxLinesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleMaxLinesStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            maxLines: 5
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试最大行数');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle maxLines: ' + returnedStyle.maxLines);
          expect(returnedStyle.maxLines).assertEqual(5);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleBreakStrategyStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleBreakStrategyStatic_0600
     * @tc.desc   Test Paragraph getParagraphStyle returns breakStrategy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleBreakStrategyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleBreakStrategyStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            breakStrategy: text.BreakStrategy.BALANCED
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试断行策略');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle breakStrategy: ' + returnedStyle.breakStrategy);
          expect(returnedStyle.breakStrategy).assertEqual(text.BreakStrategy.BALANCED);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleLineSpacingStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleLineSpacingStatic_0700
     * @tc.desc   Test Paragraph getParagraphStyle returns lineSpacing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleLineSpacingStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleLineSpacingStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            lineSpacing: 10.0
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试行间距');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle lineSpacing: ' + returnedStyle.lineSpacing);
          expect(returnedStyle.lineSpacing).assertEqual(10.0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAPI26PropertiesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStylePropertiesStatic_0800
     * @tc.desc   Test Paragraph getParagraphStyle returns API 26 properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAPI26PropertiesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAPI26PropertiesStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            firstLineHeadIndent: 20.0,
            tailIndents: [10.0, 20.0],
            headIndents: [5.0, 10.0],
            orphanCharOptimization: true
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试API26新增属性');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle firstLineHeadIndent: ' + JSON.stringify(returnedStyle));
          expect(returnedStyle.orphanCharOptimization).assertTrue();
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleMultiplePropertiesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleMultiplePropertiesStatic_0900
     * @tc.desc   Test Paragraph getParagraphStyle returns multiple properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleMultiplePropertiesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleMultiplePropertiesStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 20.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            align: text.TextAlign.END,
            maxLines: 3,
            lineSpacing: 5.0
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试多属性组合');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          console.info(msgStr + ' returnedStyle maxLines: ' + returnedStyle.maxLines);
          console.info(msgStr + ' returnedStyle lineSpacing: ' + returnedStyle.lineSpacing);
          expect(returnedStyle.align).assertEqual(text.TextAlign.END);
          expect(returnedStyle.maxLines).assertEqual(3);
          expect(returnedStyle.lineSpacing).assertEqual(5.0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleDefaultValuesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleDefaultValuesStatic_1000
     * @tc.desc   Test Paragraph getParagraphStyle returns default values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleDefaultValuesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleDefaultValuesStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试默认值');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textDirection: ' + returnedStyle.textDirection);
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          console.info(msgStr + ' returnedStyle wordBreak: ' + returnedStyle.wordBreak);
          console.info(msgStr + ' returnedStyle maxLines: ' + returnedStyle.maxLines);
          expect(returnedStyle.textDirection).assertEqual(text.TextDirection.LTR);
          expect(returnedStyle.align).assertEqual(text.TextAlign.START);
          expect(returnedStyle.wordBreak).assertEqual(text.WordBreak.BREAK_WORD);
          expect(returnedStyle.maxLines).assertEqual(1000000000);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })


    /**
     * @tc.name   testGetParagraphStyleEmptyTailIndentsStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleEmptyTailIndentsStatic_1100
     * @tc.desc   Test Paragraph getParagraphStyle returns empty tailIndents array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleEmptyTailIndentsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleEmptyTailIndentsStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            tailIndents: []
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试空tailIndents数组');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle tailIndents length: ' + returnedStyle.tailIndents?.length);
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
     * @tc.name   testGetParagraphStyleEmptyHeadIndentsStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleEmptyHeadIndentsStatic_1200
     * @tc.desc   Test Paragraph getParagraphStyle returns empty headIndents array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleEmptyHeadIndentsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleEmptyHeadIndentsStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            headIndents: []
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试空headIndents数组');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle headIndents length: ' + returnedStyle.headIndents?.length);
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
     * @tc.name   testGetVisibleTextRangesNoTruncationStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesNoTruncationStatic_0100
     * @tc.desc   Test Paragraph getVisibleTextRanges returns full range when text is not truncated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesNoTruncationStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesNoTruncationStatic===="
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
          let testText: string = 'Hello';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(1);
          expect(visibleRanges[0].start).assertEqual(0);
          expect(visibleRanges[0].end).assertEqual(testText.length);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesMaxLinesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMaxLinesStatic_0200
     * @tc.desc   Test Paragraph getVisibleTextRanges with maxLines truncation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMaxLinesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMaxLinesStatic===="
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
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证maxLines截断的效果';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(1);
          expect(visibleRanges[0].end).assertLess(testText.length);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesEndEllipsisStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesEndEllipsisStatic_0300
     * @tc.desc   Test Paragraph getVisibleTextRanges with END ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesEndEllipsisStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesEndEllipsisStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.END
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证尾部省略的效果';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(1);
          expect(visibleRanges[0].start).assertEqual(0);
          expect(visibleRanges[0].end).assertLess(testText.length);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesStartEllipsisStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesStartEllipsisStatic_0400
     * @tc.desc   Test Paragraph getVisibleTextRanges with START ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesStartEllipsisStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesStartEllipsisStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.START
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证头部省略的效果';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(1);
          expect(visibleRanges[0].start).assertLargerOrEqual(0);
          expect(visibleRanges[0].end).assertEqual(testText.length);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesMiddleEllipsisStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMiddleEllipsisStatic_0500
     * @tc.desc   Test Paragraph getVisibleTextRanges with MIDDLE ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMiddleEllipsisStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMiddleEllipsisStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.MIDDLE
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 1
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证中部省略的效果';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(100);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(2);
          expect(visibleRanges[0].start).assertEqual(0);
          expect(visibleRanges[1].end).assertEqual(testText.length);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesMultilineStartStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMultilineStartStatic_0600
     * @tc.desc   Test Paragraph getVisibleTextRanges with MULTILINE_START ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMultilineStartStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMultilineStartStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.MULTILINE_START
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 3
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证多行头部省略的效果。文本需要足够长以触发多行省略逻辑，确保测试用例能够正确验证API的行为';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(150);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(2);
          expect(visibleRanges[0].start).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesMultilineMiddleStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMultilineMiddleStatic_0700
     * @tc.desc   Test Paragraph getVisibleTextRanges with MULTILINE_MIDDLE ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMultilineMiddleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMultilineMiddleStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          ellipsis: "...",
          ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_WORD,
            maxLines: 3
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let testText: string = '这是一个很长的测试文本，用于验证多行中部省略的效果。文本需要足够长以触发多行省略逻辑，确保测试用例能够正确验证API的行为';
          paragraphBuilder.addText(testText);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(150);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(2);
          expect(visibleRanges[0].start).assertEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetVisibleTextRangesEmptyTextStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesEmptyTextStatic_0800
     * @tc.desc   Test Paragraph getVisibleTextRanges with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesEmptyTextStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesEmptyTextStatic===="
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
          paragraphBuilder.addText('');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let visibleRanges: Array<text.Range> = paragraph.getVisibleTextRanges();
          console.info(msgStr + ' visibleRanges length: ' + visibleRanges.length);
          expect(visibleRanges.length).assertEqual(1); // 加载字体为空字符串
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleDecorationStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleDecorationStatic_1300
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle decoration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleDecorationStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleDecorationStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          decoration: {
            textDecoration: text.TextDecorationType.UNDERLINE,
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.5
          }
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试装饰线');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle decoration: ' + JSON.stringify(returnedStyle.textStyle?.decoration));
          expect(returnedStyle.textStyle?.decoration?.textDecoration).assertEqual(text.TextDecorationType.UNDERLINE);
          expect(returnedStyle.textStyle?.decoration?.decorationStyle).assertEqual(text.TextDecorationStyle.SOLID);
          expect(returnedStyle.textStyle?.decoration?.decorationThicknessScale).assertEqual(1.5);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleColorStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleColorStatic_1400
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleColorStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleColorStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 200, red: 100, green: 150, blue: 200 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试文字颜色');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle color: ' + JSON.stringify(returnedStyle.textStyle?.color));
          expect(returnedStyle.textStyle?.color?.alpha).assertEqual(200);
          expect(returnedStyle.textStyle?.color?.red).assertEqual(100);
          expect(returnedStyle.textStyle?.color?.green).assertEqual(150);
          expect(returnedStyle.textStyle?.color?.blue).assertEqual(200);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleFontWeightStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontWeightStatic_1500
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontWeight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontWeightStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontWeightStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          fontWeight: text.FontWeight.W700
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字重');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle fontWeight: ' + returnedStyle.textStyle?.fontWeight);
          expect(returnedStyle.textStyle?.fontWeight).assertEqual(text.FontWeight.W700);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleFontStyleStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontStyleStatic_1600
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontStyleStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          fontStyle: text.FontStyle.ITALIC
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字体样式');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle fontStyle: ' + returnedStyle.textStyle?.fontStyle);
          expect(returnedStyle.textStyle?.fontStyle).assertEqual(text.FontStyle.ITALIC);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleBaselineStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleBaselineStatic_1700
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleBaselineStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleBaselineStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          baseline: text.TextBaseline.IDEOGRAPHIC
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试基线类型');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle baseline: ' + returnedStyle.textStyle?.baseline);
          expect(returnedStyle.textStyle?.baseline).assertEqual(text.TextBaseline.IDEOGRAPHIC);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleFontFamiliesStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontFamiliesStatic_1800
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontFamilies.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontFamiliesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontFamiliesStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0,
          fontFamilies: ["HarmonyOS Sans", "sans-serif"]
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试字体家族');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle fontFamilies: ' + JSON.stringify(returnedStyle.textStyle?.fontFamilies));
          expect(returnedStyle.textStyle?.fontFamilies?.length).assertLargerOrEqual(2);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleComplexTextStyleStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleComplexTextStyleStatic_1900
     * @tc.desc   Test Paragraph getParagraphStyle returns complex textStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleComplexTextStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleComplexTextStyleStatic===="
        console.info(msgStr + ' begin');
        let textStyle: text.TextStyle = {
          color: { alpha: 255, red: 50, green: 100, blue: 150 },
          fontSize: 24.0,
          fontWeight: text.FontWeight.W600,
          fontStyle: text.FontStyle.ITALIC,
          baseline: text.TextBaseline.ALPHABETIC,
          fontFamilies: ["HarmonyOS Sans"],
          letterSpacing: 2.0,
          wordSpacing: 5.0,
          decoration: {
            textDecoration: text.TextDecorationType.LINE_THROUGH,
            decorationStyle: text.TextDecorationStyle.DASHED
          }
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: textStyle,
            align: text.TextAlign.JUSTIFY,
            maxLines: 3,
            lineSpacing: 8.0
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试复杂文本样式组合');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle textStyle: ' + JSON.stringify(returnedStyle.textStyle));
          expect(returnedStyle.textStyle?.fontSize).assertEqual(24.0);
          expect(returnedStyle.textStyle?.fontWeight).assertEqual(text.FontWeight.W600);
          expect(returnedStyle.textStyle?.fontStyle).assertEqual(text.FontStyle.ITALIC);
          expect(returnedStyle.textStyle?.baseline).assertEqual(text.TextBaseline.ALPHABETIC);
          expect(returnedStyle.textStyle?.letterSpacing).assertEqual(2.0);
          expect(returnedStyle.textStyle?.wordSpacing).assertEqual(5.0);
          expect(returnedStyle.align).assertEqual(text.TextAlign.JUSTIFY);
          expect(returnedStyle.maxLines).assertEqual(3);
          expect(returnedStyle.lineSpacing).assertEqual(8.0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAlignLeftStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignLeftStatic_2000
     * @tc.desc   Test Paragraph getParagraphStyle returns align LEFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignLeftStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignLeftStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            align: text.TextAlign.LEFT
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试左对齐');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          expect(returnedStyle.align).assertEqual(text.TextAlign.LEFT);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAlignRightStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignRightStatic_2100
     * @tc.desc   Test Paragraph getParagraphStyle returns align RIGHT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignRightStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignRightStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            align: text.TextAlign.RIGHT
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试右对齐');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          expect(returnedStyle.align).assertEqual(text.TextAlign.RIGHT);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleAlignJustifyStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignJustifyStatic_2200
     * @tc.desc   Test Paragraph getParagraphStyle returns align JUSTIFY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignJustifyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignJustifyStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            align: text.TextAlign.JUSTIFY
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('这是一个用于测试两端对齐效果的长文本，两端对齐会使文本的左右边缘都对齐到容器的边界，通常需要足够长的文本才能看到明显的效果');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle align: ' + returnedStyle.align);
          expect(returnedStyle.align).assertEqual(text.TextAlign.JUSTIFY);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleWordBreakNormalStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreakNormalStatic_2300
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak NORMAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreakNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreakNormalStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.NORMAL
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试默认换行规则');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle wordBreak: ' + returnedStyle.wordBreak);
          expect(returnedStyle.wordBreak).assertEqual(text.WordBreak.NORMAL);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleWordBreakHyphenStatic
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreakHyphenStatic_2400
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak BREAK_HYPHEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreakHyphenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreakHyphenStatic===="
        console.info(msgStr + ' begin');
        let zhHansTextStyle: text.TextStyle = {
          color: { alpha: 255, red: 0, green: 0, blue: 0 },
          fontSize: 16.0
        };
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          let paragraphStyle: text.ParagraphStyle = {
            textStyle: zhHansTextStyle,
            wordBreak: text.WordBreak.BREAK_HYPHEN
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.addText('测试连字符断行规则 test-hyphen-break');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          await paragraph.layout(300);

          let returnedStyle: text.ParagraphStyle = paragraph.getParagraphStyle();
          console.info(msgStr + ' returnedStyle wordBreak: ' + returnedStyle.wordBreak);
          expect(returnedStyle.wordBreak).assertEqual(text.WordBreak.BREAK_HYPHEN);
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
