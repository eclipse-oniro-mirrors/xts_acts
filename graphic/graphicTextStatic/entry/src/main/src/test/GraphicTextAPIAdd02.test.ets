/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import { $rawfile, Resource } from '@ohos.arkui.component';
import image from '@ohos.multimedia.image';

export default function GraphicTextAPIAdd02() {

  describe('GraphicTextAPIAdd02', () => {
    beforeAll(() => {
    })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0100
     * @tc.number GraphicTextAPIAdd02Static_0100
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0100====";
        let fontDescriptor = await text.matchFontDescriptors({
          fullName: '',
          manufacture: '',
          weight: text.FontWeight.W100
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
    })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0200
     * @tc.number GraphicTextAPIAdd02Static_0200
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0200====";
        let fontDescriptor = await text.matchFontDescriptors({
          fontFamily: '',
          copyright: '',
          weight: text.FontWeight.W200
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0300
     * @tc.number GraphicTextAPIAdd02Static_0300
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0300====";
        let fontDescriptor = await text.matchFontDescriptors({
          fontSubfamily: '',
          trademark: '',
          weight: text.FontWeight.W300
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0400
     * @tc.number GraphicTextAPIAdd02Static_0400
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0400====";
        let fontDescriptor = await text.matchFontDescriptors({
          localPostscriptName: '',
          license: '',
          weight: text.FontWeight.W500
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0500
     * @tc.number GraphicTextAPIAdd02Static_0500
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0500====";
        let fontDescriptor = await text.matchFontDescriptors({
          localFullName: '',
          monoSpace: true,
          weight: text.FontWeight.W600
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0600
     * @tc.number GraphicTextAPIAdd02Static_0600
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0600====";
        let fontDescriptor = await text.matchFontDescriptors({
          localFamilyName: '',
          monoSpace: false,
          weight: text.FontWeight.W700
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0700
     * @tc.number GraphicTextAPIAdd02Static_0700
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0700====";
        let fontDescriptor = await text.matchFontDescriptors({
          localSubFamilyName: '',
          symbolic: false,
          weight: text.FontWeight.W800
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0800
     * @tc.number GraphicTextAPIAdd02Static_0800
     * @tc.desc   test matchFontDescriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0800====";
        let fontDescriptor = await text.matchFontDescriptors({
          version: '',
          symbolic: true,
          weight: text.FontWeight.W900
        })
        console.info(msg + JSON.stringify(fontDescriptor));
        expect(fontDescriptor.length).assertLargerOrEqual(0);
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_0900
     * @tc.number GraphicTextAPIAdd02Static_0900
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_0900===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_0900 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_0900 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1000
     * @tc.number GraphicTextAPIAdd02Static_1000
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1000===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BELOW_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1000 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1000 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1100
     * @tc.number GraphicTextAPIAdd02Static_1100
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1100===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.TOP_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1100 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1100 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1200
     * @tc.number GraphicTextAPIAdd02Static_1200
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1200===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BOTTOM_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1200 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1200 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1300
     * @tc.number GraphicTextAPIAdd02Static_1300
     * @tc.desc   test addPlaceholder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1300===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = {
            fontFamilies: fontFamilies,
            fontSize: 50,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
            maxLines: 1,
          }
          let myPlaceholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.CENTER_OF_ROW_BOX,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            baselineOffset: 100
          };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.addPlaceholder(myPlaceholderSpan);
            console.info('www data GraphicTextAPIAdd02Static_1300 success in addPlaceholder');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1300 failed to addPlaceholder');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1400
     * @tc.number GraphicTextAPIAdd02Static_1400
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1400===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W100,
            decoration: {
              textDecoration: text.TextDecorationType.NONE,
              decorationStyle: text.TextDecorationStyle.SOLID
            },
            fontFamilies: [''],
            fontFeatures: [{ name: '', value: 1 }],
            fontWidth: text.FontWidth.ULTRA_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1400 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1400 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1500
     * @tc.number GraphicTextAPIAdd02Static_1500
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1500===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W200,
            decoration: {
              textDecoration: text.TextDecorationType.OVERLINE,
              decorationStyle: text.TextDecorationStyle.DOUBLE
            },
            lineHeightStyle: text.LineHeightStyle.FONT_SIZE,
            textShadows: [],
            fontWidth: text.FontWidth.EXTRA_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1500 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1500 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1600
     * @tc.number GraphicTextAPIAdd02Static_1600
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1600===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W300,
            decoration: {
              textDecoration: text.TextDecorationType.LINE_THROUGH,
              decorationStyle: text.TextDecorationStyle.DASHED
            },
            lineHeightStyle: text.LineHeightStyle.FONT_HEIGHT,
            fontVariations: [],
            fontWidth: text.FontWidth.CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1600 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1600 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1700
     * @tc.number GraphicTextAPIAdd02Static_1700
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1700===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W400,
            decoration: {
              textDecoration: text.TextDecorationType.NONE,
              decorationStyle: text.TextDecorationStyle.WAVY
            },
            halfLeading: true,
            fontVariations: [{ axis: '', value: 26 }],
            fontWidth: text.FontWidth.SEMI_CONDENSED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1700 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1700 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1800
     * @tc.number GraphicTextAPIAdd02Static_1800
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1800===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W500,
            fontStyle: text.FontStyle.NORMAL,
            heightOnly: false,
            badgeType: text.TextBadgeType.TEXT_BADGE_NONE,
            fontWidth: text.FontWidth.NORMAL,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1800 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1800 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_1900
     * @tc.number GraphicTextAPIAdd02Static_1900
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_1900===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W600,
            fontStyle: text.FontStyle.ITALIC,
            ellipsisMode: text.EllipsisMode.START,
            badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT,
            fontWidth: text.FontWidth.SEMI_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_1900 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_1900 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2000
     * @tc.number GraphicTextAPIAdd02Static_2000
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2000===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W800,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            ellipsisMode: text.EllipsisMode.MIDDLE,
            badgeType: text.TextBadgeType.TEXT_SUBSCRIPT,
            fontWidth: text.FontWidth.EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2000 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2000 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2100
     * @tc.number GraphicTextAPIAdd02Static_2100
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2100===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W900,
            fontFamilies: [],
            fontFeatures: [],
            fontWidth: text.FontWidth.EXTRA_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2100 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2100 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2200
     * @tc.number GraphicTextAPIAdd02Static_2200
     * @tc.desc   test pushStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2200===="
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          let myTextStyle: text.TextStyle = {
            fontSize: 50,
            fontWeight: text.FontWeight.W900,
            fontFamilies: [],
            fontFeatures: [],
            fontWidth: text.FontWidth.ULTRA_EXPANDED,
          };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle,
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          try {
            paragraphBuilder.pushStyle(myTextStyle);
            console.info('www data GraphicTextAPIAdd02Static_2200 success in pushStyle');
          } catch(err) {
            console.info('www data GraphicTextAPIAdd02Static_2200 failed to pushStyle');
            expect(false).assertTrue();
          }
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(600);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2300
     * @tc.number GraphicTextAPIAdd02Static_2300
     * @tc.desc   To test interface loadFontAsync of FontCollection.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd02Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg = "GraphicTextAPIAdd02Static_2300";
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('', $rawfile('test.ttf'));
          console.info(msg + 'www data success loadFontSync 111');
        } catch (err) {
          console.info(msg + 'www data failed to loadFontSync 111', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await fontCollection.loadFont('', $rawfile('test.ttf'));
          console.info(msg + 'www data success loadFontSync 111');
        } catch (err) {
          console.info(msg + 'www data failed to loadFontSync 111', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          fontCollection.unloadFontSync('');
          console.info(msg + 'www data success unloadFontSync 222');
        } catch (err) {
          console.info(msg + 'www data failed to unloadFontSync 222', JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await fontCollection.unloadFont('');
          console.info(msg + 'www data success unloadFontSync 333');
        } catch (err) {
          console.info(msg + 'www data failed to unloadFontSync 333', JSON.stringify(err));
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2400
     * @tc.number GraphicTextAPIAdd02Static_2400
     * @tc.desc   FontCollection loadFontSyncWithCheck path parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GraphicTextAPIAdd02Static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const msgStr = 'www data GraphicTextAPIAdd02Static_2400 ';
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        try {
          fontCollection.loadFontSyncWithCheck('', $rawfile('test.ttf'));
          console.info(`${msgStr} success `, 111);
          fontCollection.unloadFontSync('');
          done();
        } catch (err) {
          console.info(`${msgStr} error 111 `, err.code);
          expect().assertFail();
          done();
        }
        try {
          await fontCollection.loadFontWithCheck('', $rawfile('test.ttf'));
          console.info(`${msgStr} success `, 222);
          fontCollection.unloadFontSync('');
          done();
        } catch (err) {
          console.info(`${msgStr} error 222 `, err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2500
     * @tc.number GraphicTextAPIAdd02Static_2500
     * @tc.desc   ParagraphBuilder pushStyle fontStyle NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const msgStr = 'www data GraphicTextAPIAdd02Static_2500 ';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontFamilies: undefined,
            fontStyle: text.FontStyle.NORMAL,
            ellipsisMode: text.EllipsisMode.MULTILINE_START
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          console.info(`${msgStr} success`);
          done();
        } catch (err) {
          console.info(`${msgStr} error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2600
     * @tc.number GraphicTextAPIAdd02Static_2600
     * @tc.desc   ParagraphBuilder pushStyle fontStyle NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const msgStr = 'www data GraphicTextAPIAdd02Static_2600 ';
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontFamilies: undefined,
            fontStyle: text.FontStyle.NORMAL,
            ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          console.info(`${msgStr} success`);
          done();
        } catch (err) {
          console.info(`${msgStr} error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2700
     * @tc.number GraphicTextAPIAdd02Static_2700
     * @tc.desc   test createTruncatedLine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = new text.FontCollection();
        try {
          fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
          let fontFamilies: Array<string> = ["Clock_01"]
          let myTextStyle: text.TextStyle = { fontFamilies: fontFamilies };
          let myParagraphStyle: text.ParagraphStyle = {
            textStyle: myTextStyle, compressHeadPunctuation: false,
            includeFontPadding: true, fallbackLineSpacing: false
          }
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
          let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
          paragraphBuilder.addText(textData);
          let lineTypeset: text.LineTypeset = paragraphBuilder.buildLineTypeset();
          console.info('www data GraphicTextAPIAdd02Static_2700 getLineBreak ', lineTypeset.getLineBreak(20,100));
          let textLine: text.TextLine = lineTypeset.createLine(1,20);
          let truncatedTextLine1 = textLine.createTruncatedLine(10, text.EllipsisMode.MULTILINE_START, '');
          console.info('www data GraphicTextAPIAdd02Static_2700 range.start ', truncatedTextLine1);
          console.info('www data GraphicTextAPIAdd02Static_2700 range.start ', truncatedTextLine1?.getGlyphCount());
          expect(truncatedTextLine1 !== undefined).assertTrue();
          let truncatedTextLine2 = textLine.createTruncatedLine(10, text.EllipsisMode.MULTILINE_MIDDLE, '');
          console.info('www data GraphicTextAPIAdd02Static_2700 range.start ', truncatedTextLine2);
          console.info('www data GraphicTextAPIAdd02Static_2700 range.start ', truncatedTextLine2?.getGlyphCount());
          expect(truncatedTextLine2).assertUndefined();
          fontCollection.unloadFontSync('Clock_01');
          done();
        } catch (e) {
          console.error(`www data Failed to do GraphicTextAPIAdd02Static_2700, error: ${e}, ${e.code} `);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2800
     * @tc.number GraphicTextAPIAdd02Static_2800
     * @tc.desc   test getFontDescriptorByFullName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPIAdd02Static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====www data GraphicTextAPIAdd02Static_2800====";
        let fontCollection = text.FontCollection.getGlobalInstance();
        fontCollection.unloadFontSync('myFamilyName');
        fontCollection.unloadFontSync('myFamilyName0');
        fontCollection.unloadFontSync('test');
        fontCollection.unloadFontSync('Clock_01');
        try {
          await text.getFontDescriptorByFullName('', text.SystemFontType.CUSTOMIZED)
            .then((fontDescriptor: text.FontDescriptor)=>{
              console.info(msg + JSON.stringify(fontDescriptor));
              expect(false).assertTrue();
              done();
            }).catch((err: Error) => {
              console.info(msg + 'error ' + JSON.stringify(err));
              done();
            });
        } catch(err){
          console.info(msg + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   GraphicTextAPIAdd02Static_2900
     * @tc.number GraphicTextAPIAdd02Static_2900
     * @tc.desc   Paragraph getGlyphPositionAtCoordinate normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('GraphicTextAPIAdd02Static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr = "====www data GraphicTextAPIAdd02Static_2900====";
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          const positionWithAffinity: text.PositionWithAffinity = paragraph.getGlyphPositionAtCoordinate(10, 10);
          console.info(`${msgStr} success position=`
            + `${positionWithAffinity.position} affinity=${positionWithAffinity.affinity}`);
          expect(positionWithAffinity !== undefined).assertTrue();
          expect(positionWithAffinity.position).assertLargerOrEqual(0);
          expect(positionWithAffinity.affinity).assertEqual(text.Affinity.UPSTREAM);
          done();
        } catch (err) {
          console.info(`${msgStr}  error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });


  })
}
