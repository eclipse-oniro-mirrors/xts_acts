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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium";
import text from "@ohos.graphics.text";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
import common2D from '@ohos.graphics.common2D';

export default function GraphicTextAPI26() {

  describe('GraphicTextAPI26', () => {

    beforeAll(() => {
    })

    /**
     * @tc.name   testOrphanCharOptimizationTrue
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationTrue_0100
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationTrue===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationFalse
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationFalse_0200
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property set to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationFalse===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationUndefined
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationUndefined_0300
     * @tc.desc   Test ParagraphStyle orphanCharOptimization property with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationUndefined===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHans
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHans_0400
     * @tc.desc   Test orphanCharOptimization with zh-Hans locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHans', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHans===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithZhHant
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithZhHant_0500
     * @tc.desc   Test orphanCharOptimization with zh-Hant locale and BREAK_WORD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithZhHant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithZhHant===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithBreakAll
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithBreakAll_0600
     * @tc.desc   Test orphanCharOptimization with BREAK_ALL wordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithBreakAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithBreakAll===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithEnLocale
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithEnLocale_0700
     * @tc.desc   Test orphanCharOptimization with en locale.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithEnLocale', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithEnLocale===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationLayoutEffect
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationLayoutEffect_0800
     * @tc.desc   Test orphanCharOptimization layout effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationLayoutEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationLayoutEffect===="
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
          await paragraph.layout(200).then(() => {
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
          }).catch((error: Error) => {
            console.error(msgStr + ' layout error: ' + error.message);
            expect().assertFail();
          });
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationWithLongText
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationWithLongText_0900
     * @tc.desc   Test orphanCharOptimization with long text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationWithLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationWithLongText===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationEmptyText
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationEmptyText_1000
     * @tc.desc   Test orphanCharOptimization with empty text.
     * @tc.type     FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationEmptyText===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testOrphanCharOptimizationSingleChar
     * @tc.number SUB_GRAPHIC_Text_testOrphanCharOptimizationSingleChar_1100
     * @tc.desc   Test orphanCharOptimization with single character text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOrphanCharOptimizationSingleChar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testOrphanCharOptimizationSingleChar===="
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
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testSetParagraphCachesEnabledTrue
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledTrue_0100
     * @tc.desc   Test FontCollection setParagraphCachesEnabled property set to true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledTrue===="
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
     * @tc.name   testSetParagraphCachesEnabledFalse
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledFalse_0200
     * @tc.desc   Test FontCollection setParagraphCachesEnabled property set to false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledFalse===="
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
     * @tc.name   testSetParagraphCachesEnabledToggle
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledToggle_0300
     * @tc.desc   Test FontCollection setParagraphCachesEnabled toggle state multiple times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledToggle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledToggle===="
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
     * @tc.name   testSetParagraphCachesEnabledWithLayout
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledLayout_0400
     * @tc.desc   Test setParagraphCachesEnabled enabled with paragraph layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledWithLayout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledWithLayout===="
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
     * @tc.name   testSetParagraphCachesEnabledDisabledWithLayout
     * @tc.number SUB_GRAPHIC_FontCollection_setParagraphCachesEnabledDisabledLayout_0500
     * @tc.desc   Test setParagraphCachesEnabled disabled with paragraph layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetParagraphCachesEnabledDisabledWithLayout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testSetParagraphCachesEnabledDisabledWithLayout===="
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
     * @tc.name   testGetProcessStateInit
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateInit_0100
     * @tc.desc   Test Paragraph getProcessState returns INIT after build.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateInit===="
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
     * @tc.name   testGetProcessStateFormatted
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateFormatted_0200
     * @tc.desc   Test Paragraph getProcessState returns FORMATTED after layout.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateFormatted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateFormatted===="
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
     * @tc.name   testGetProcessStatePaint
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStatePaint_0300
     * @tc.desc   Test Paragraph getProcessState returns PAINT after paint.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStatePaint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStatePaint===="
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
     * @tc.name   testGetProcessStateUpdateAttribute
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateUpdateAttribute_0400
     * @tc.desc   Test Paragraph getProcessState returns UPDATE_ATTRIBUTE after updateAttribute.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateUpdateAttribute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateUpdateAttribute===="
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
     * @tc.name   testGetProcessStateTransition
     * @tc.number SUB_GRAPHIC_Paragraph_getProcessStateStateTransition_0500
     * @tc.desc   Test Paragraph getProcessState state transition from INIT to FORMATTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetProcessStateTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetProcessStateTransition===="
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
     * @tc.name   testGetTextDisplayStateUnknown
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateUnknown_0100
     * @tc.desc   Test Paragraph getTextDisplayState returns UNKNOWN after build.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateUnknown===="
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
     * @tc.name   testGetTextDisplayStateAll
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateAll_0200
     * @tc.desc   Test Paragraph getTextDisplayState returns ALL when text fits.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateAll===="
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
     * @tc.name   testGetTextDisplayStateClip
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateClip_0300
     * @tc.desc   Test Paragraph getTextDisplayState returns CLIP when text overflows.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateClip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateClip===="
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
     * @tc.name   testGetTextDisplayStateOmitted
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateOmitted_0400
     * @tc.desc   Test Paragraph getTextDisplayState returns OMITTED with ellipsis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateOmitted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateOmitted===="
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
     * @tc.name   testGetTextDisplayStateTransition
     * @tc.number SUB_GRAPHIC_Paragraph_getTextDisplayStateStateTransition_0500
     * @tc.desc   Test Paragraph getTextDisplayState state transition from UNKNOWN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTextDisplayStateTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetTextDisplayStateTransition===="
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
     * @tc.name   testGetParagraphStyleTextStyle
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyle_0100
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyle===="
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
     * @tc.name   testGetParagraphStyleTextDirection
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextDirection_0200
     * @tc.desc   Test Paragraph getParagraphStyle returns textDirection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextDirection===="
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
     * @tc.name   testGetParagraphStyleAlign
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlign_0300
     * @tc.desc   Test Paragraph getParagraphStyle returns align.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlign', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlign===="
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
     * @tc.name   testGetParagraphStyleWordBreak
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreak_0400
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreak===="
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
     * @tc.name   testGetParagraphStyleMaxLines
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleMaxLines_0500
     * @tc.desc   Test Paragraph getParagraphStyle returns maxLines.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleMaxLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleMaxLines===="
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
     * @tc.name   testGetParagraphStyleBreakStrategy
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleBreakStrategy_0600
     * @tc.desc   Test Paragraph getParagraphStyle returns breakStrategy.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleBreakStrategy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleBreakStrategy===="
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
     * @tc.name   testGetParagraphStyleLineSpacing
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleLineSpacing_0700
     * @tc.desc   Test Paragraph getParagraphStyle returns lineSpacing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleLineSpacing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleLineSpacing===="
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
     * @tc.name   testGetParagraphStyleAPI26Properties
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleProperties_0800
     * @tc.desc   Test Paragraph getParagraphStyle returns API 26 properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAPI26Properties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAPI26Properties===="
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
     * @tc.name   testGetParagraphStyleMultipleProperties
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleMultipleProperties_0900
     * @tc.desc   Test Paragraph getParagraphStyle returns multiple properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleMultipleProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleMultipleProperties===="
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
     * @tc.name   testGetParagraphStyleDefaultValues
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleDefaultValues_1000
     * @tc.desc   Test Paragraph getParagraphStyle returns default values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleDefaultValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleDefaultValues===="
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
     * @tc.name   testGetParagraphStyleEmptyTailIndents
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleEmptyTailIndents_1100
     * @tc.desc   Test Paragraph getParagraphStyle returns empty tailIndents array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleEmptyTailIndents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleEmptyTailIndents===="
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
     * @tc.name   testGetParagraphStyleEmptyHeadIndents
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleEmptyHeadIndents_1200
     * @tc.desc   Test Paragraph getParagraphStyle returns empty headIndents array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleEmptyHeadIndents', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleEmptyHeadIndents===="
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
     * @tc.name   testGetVisibleTextRangesNoTruncation
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesNoTruncation_0100
     * @tc.desc   Test Paragraph getVisibleTextRanges returns full range when text is not truncated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesNoTruncation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesNoTruncation===="
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
     * @tc.name   testGetVisibleTextRangesMaxLines
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMaxLines_0200
     * @tc.desc   Test Paragraph getVisibleTextRanges with maxLines truncation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMaxLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMaxLines===="
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
     * @tc.name   testGetVisibleTextRangesEndEllipsis
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesEndEllipsis_0300
     * @tc.desc   Test Paragraph getVisibleTextRanges with END ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesEndEllipsis', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesEndEllipsis===="
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
     * @tc.name   testGetVisibleTextRangesStartEllipsis
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesStartEllipsis_0400
     * @tc.desc   Test Paragraph getVisibleTextRanges with START ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesStartEllipsis', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesStartEllipsis===="
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
     * @tc.name   testGetVisibleTextRangesMiddleEllipsis
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMiddleEllipsis_0500
     * @tc.desc   Test Paragraph getVisibleTextRanges with MIDDLE ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMiddleEllipsis', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMiddleEllipsis===="
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
     * @tc.name   testGetVisibleTextRangesMultilineStart
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMultilineStart_0600
     * @tc.desc   Test Paragraph getVisibleTextRanges with MULTILINE_START ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMultilineStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMultilineStart===="
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
     * @tc.name   testGetVisibleTextRangesMultilineMiddle
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesMultilineMiddle_0700
     * @tc.desc   Test Paragraph getVisibleTextRanges with MULTILINE_MIDDLE ellipsis mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesMultilineMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesMultilineMiddle===="
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
     * @tc.name   testGetVisibleTextRangesEmptyText
     * @tc.number SUB_GRAPHIC_Paragraph_getVisibleTextRangesEmptyText_0800
     * @tc.desc   Test Paragraph getVisibleTextRanges with empty text.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVisibleTextRangesEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetVisibleTextRangesEmptyText===="
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
     * @tc.name   testGetParagraphStyleTextStyleDecoration
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleDecoration_1300
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle decoration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleDecoration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleDecoration===="
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
     * @tc.name   testGetParagraphStyleTextStyleColor
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleColor_1400
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle color.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleColor===="
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
          let colorNumber = returnedStyle.textStyle?.color;
          console.info('www data int ', colorNumber, typeof(colorNumber));
          if(colorNumber !== undefined){
            let num: number = Number.parseInt(colorNumber?.toString())
            let r = (num >>> 16) & 0xFF;
            let g = (num >>> 8) & 0xFF;
            let b = num & 0xFF;
            let a = (num >>> 24) & 0xFF;
            let color: common2D.Color = { red : r, green: g, blue: b, alpha: a }
            console.info('www data color ', JSON.stringify(color));
            expect(color.alpha).assertEqual(200);
            expect(color.red).assertEqual(100);
            expect(color.green).assertEqual(150);
            expect(color.blue).assertEqual(200);
            console.info(msgStr + ' success end');
            done();
          } else {
            console.info(msgStr + ' failed end');
            expect().assertFail();
            done();
          }
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testGetParagraphStyleTextStyleFontWeight
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontWeight_1500
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontWeight.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontWeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontWeight===="
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
     * @tc.name   testGetParagraphStyleTextStyleFontStyle
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontStyle_1600
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontStyle===="
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
     * @tc.name   testGetParagraphStyleTextStyleBaseline
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleBaseline_1700
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle baseline.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleBaseline===="
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
     * @tc.name   testGetParagraphStyleTextStyleFontFamilies
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleTextStyleFontFamilies_1800
     * @tc.desc   Test Paragraph getParagraphStyle returns textStyle fontFamilies.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleTextStyleFontFamilies', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleTextStyleFontFamilies===="
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
     * @tc.name   testGetParagraphStyleComplexTextStyle
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleComplexTextStyle_1900
     * @tc.desc   Test Paragraph getParagraphStyle returns complex textStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleComplexTextStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleComplexTextStyle===="
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
     * @tc.name   testGetParagraphStyleAlignLeft
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignLeft_2000
     * @tc.desc   Test Paragraph getParagraphStyle returns align LEFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignLeft===="
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
     * @tc.name   testGetParagraphStyleAlignRight
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignRight_2100
     * @tc.desc   Test Paragraph getParagraphStyle returns align RIGHT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignRight===="
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
     * @tc.name   testGetParagraphStyleAlignJustify
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleAlignJustify_2200
     * @tc.desc   Test Paragraph getParagraphStyle returns align JUSTIFY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleAlignJustify', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleAlignJustify===="
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
     * @tc.name   testGetParagraphStyleWordBreakNormal
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreakNormal_2300
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak NORMAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreakNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreakNormal===="
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
     * @tc.name   testGetParagraphStyleWordBreakHyphen
     * @tc.number SUB_GRAPHIC_Paragraph_getParagraphStyleWordBreakHyphen_2400
     * @tc.desc   Test Paragraph getParagraphStyle returns wordBreak BREAK_HYPHEN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetParagraphStyleWordBreakHyphen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testGetParagraphStyleWordBreakHyphen===="
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
