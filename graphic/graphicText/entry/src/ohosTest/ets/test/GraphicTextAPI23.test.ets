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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import router from '@ohos.router';
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, 
WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../MainAbility/utils/Common';
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import { text, drawing, common2D } from "@kit.ArkGraphics2D"
import { image } from '@kit.ImageKit'
import { BusinessError } from '@ohos.base';

export default function GraphicTextAPI23() {
  describe('GraphicTextAPI23', () => {
    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.name   testLoadFontSyncWithCheck_0100
     * @tc.number testLoadFontSyncWithCheck_0100
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 0);
        console.info('www data success to do loadFontSyncWithCheck');
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0200
     * @tc.number testLoadFontSyncWithCheck_0200
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900001).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0300
     * @tc.number testLoadFontSyncWithCheck_0300
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900008).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0400
     * @tc.number testLoadFontSyncWithCheck_0400
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1);
        console.info('www data success to do loadFontSyncWithCheck');
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0500
     * @tc.number testLoadFontSyncWithCheck_0500
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0);
        console.info('www data success to do loadFontSyncWithCheck');
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0600
     * @tc.number testLoadFontSyncWithCheck_0600
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900002).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0700
     * @tc.number testLoadFontSyncWithCheck_0700
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 0)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
        }).catch((error: Error) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect().assertFail();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0800
     * @tc.number testLoadFontSyncWithCheck_0800
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect(Number(error.code) == 25900001).assertTrue();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_0900
     * @tc.number testLoadFontSyncWithCheck_0900
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect(Number(error.code) == 25900008).assertTrue();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1000
     * @tc.number testLoadFontSyncWithCheck_1000
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect().assertFail();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1100
     * @tc.number testLoadFontSyncWithCheck_1100
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect().assertFail();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1200
     * @tc.number testLoadFontSyncWithCheck_1200
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect(Number(error.code) == 25900002).assertTrue();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1300
     * @tc.number testLoadFontSyncWithCheck_1300
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2);
        console.info('www data success to do loadFontSyncWithCheck');
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1400
     * @tc.number testLoadFontSyncWithCheck_1400
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900008).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1500
     * @tc.number testLoadFontSyncWithCheck_1500
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect().assertFail();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1600
     * @tc.number testLoadFontSyncWithCheck_1600
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
        expect(Number(error.code) == 25900008).assertTrue();
        });
      done();
    })

    /**
     * @tc.name   testParagraphStyle_0100
     * @tc.number testParagraphStyle_0100
     * @tc.desc   test ParagraphStyle property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParagraphStyle_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let msg  = "====testParagraphStyle_0100===="
      let fontCollection: text.FontCollection = new text.FontCollection();
      try {
        let fontFamilies: Array<string> = ["Clock_01"]
        let myTextStyle: text.TextStyle = {
          fontFamilies: fontFamilies
        };
        let myParagraphStyle: text.ParagraphStyle = {
          textStyle: myTextStyle,
          compressHeadPunctuation: false,
          includeFontPadding: true,
          fallbackLineSpacing: false
        }
        let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
        let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
        paragraphBuilder.addText(textData);
        let paragraph: text.Paragraph = paragraphBuilder.build();
        paragraph.layoutSync(600);
        let arrLineMetrc: Array<text.LineMetrics> =  paragraph.getLineMetrics();
        let arrRunMetrics: Map<number,text.RunMetrics> = arrLineMetrc[0].runMetrics;
        let arr: number[] = [];
        for (let key of arrRunMetrics.keys()) {
          arr.push(key);
        }
        let textStyle: text.TextStyle | undefined = arrRunMetrics.get(arr[arr.length -1])?.textStyle;
        expect(3).assertEqual(textStyle?.fontWeight);
        let fontMetrics: drawing.FontMetrics | undefined = arrRunMetrics.get(arr[arr.length -1])?.fontMetrics;
        let maxNum = fontMetrics?.maxCharWidth;
        let minIntrinsicWidth = paragraph.getMinIntrinsicWidth();
        let maxIntrinsicWidth = paragraph.getMaxIntrinsicWidth();
        let lineCount = paragraph.getLineCount();
        let lineHeight = paragraph.getLineHeight(0);
        let lineWidth = paragraph.getLineWidth(0);
        console.info('www data testParagraphStyle_0100 minIntrinsicWidth', minIntrinsicWidth);
        console.info('www data testParagraphStyle_0100 maxIntrinsicWidth', maxIntrinsicWidth);
        console.info('www data testParagraphStyle_0100 lineCount', lineCount);
        console.info('www data testParagraphStyle_0100 lineHeight', lineHeight);
        console.info('www data testParagraphStyle_0100 lineWidth', lineWidth);
        expect(minIntrinsicWidth).assertLargerOrEqual(0);
        expect(maxIntrinsicWidth).assertLargerOrEqual(133);
        expect(lineCount).assertLargerOrEqual(1);
        expect(lineHeight).assertLargerOrEqual(16);
        expect(lineWidth).assertLargerOrEqual(300);
        done();
      } catch(err){
        console.info(msg + 'test error' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testIsFontSupported_0100
     * @tc.number testIsFontSupported_0100
     * @tc.desc   text isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let filePath = "file:///system/fonts/HarmonyOS_Sans.ttf";
      let isSupported = text.isFontSupported(filePath);
      console.info("www data is font supported: " + isSupported);
      expect(isSupported).assertTrue();
      done();
    })

    /**
     * @tc.name   testIsFontSupported_0200
     * @tc.number testIsFontSupported_0200
     * @tc.desc   text isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupported_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let filePath = "file:///system/fonts/HarmonyOS_Sans111.ttf";
      let isSupported = text.isFontSupported(filePath);
      console.info("www data is font supported: " + isSupported);
      expect(isSupported).assertFalse();
      done();
    })

    /**
     * @tc.name   testIsFontSupported_0300
     * @tc.number testIsFontSupported_0300
     * @tc.desc   text isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupported_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let isSupported = text.isFontSupported($rawfile('HarmonyOS_Sans.ttf'));
      console.info("www data is font supported: " + isSupported);
      expect(isSupported).assertTrue();
      done();
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0100
     * @tc.number GetFontUnicodeSet_API23_0100
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 0).then((unicodeSet) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertLarger(0);
        done();
      })
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0200
     * @tc.number GetFontUnicodeSet_API23_0200
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 1).then((unicodeSet) => {
        expect(unicodeSet.length).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0300
     * @tc.number GetFontUnicodeSet_API23_0300
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans123.ttf", 0).then((unicodeSet) => {
        expect(unicodeSet.length).assertEqual(0);
        done();
      })
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0400
     * @tc.number GetFontUnicodeSet_API23_0400
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet("file:///system/fonts/NotoSansCJK-Regular.ttc", 1).then((unicodeSet) => {
        expect(unicodeSet.length).assertLarger(0);
        done();
      })
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0500
     * @tc.number GetFontUnicodeSet_API23_0500
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet("file:///system/fonts/NotoSansCJK-Regular.ttc", 0).then((unicodeSet) => {
        expect(unicodeSet.length).assertLarger(0);
        done();
      })
    })

    /**
     * @tc.name   GetFontUnicodeSet_API23_0600
     * @tc.number GetFontUnicodeSet_API23_0600
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_API23_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontUnicodeSet($rawfile('HarmonyOS_Sans.ttf'), 0).then((unicodeSet) => {
        expect(unicodeSet.length).assertLarger(0);
        done();
      })
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1700
     * @tc.number testLoadFontSyncWithCheck_1700
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, $rawfile('empty.ttf'), 0);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900007).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1800
     * @tc.number testLoadFontSyncWithCheck_1800
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///dev/tun', 0);
        console.info('www data success to do loadFontSyncWithCheck');
        expect().assertFail();
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect(Number(e.code) == 25900003).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1900
     * @tc.number testLoadFontSyncWithCheck_1900
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      try {
        fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc');
        console.info('www data success to do loadFontSyncWithCheck');
      } catch (e) {
        console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2000
     * @tc.number testLoadFontSyncWithCheck_2000
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc')
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
        }).catch((error: BusinessError) => {
          console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect().assertFail();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2100
     * @tc.number testLoadFontSyncWithCheck_2100
     * @tc.desc   text loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
      await fontCollection.loadFontWithCheck(fontFamily, 'file:///dev/tun', 0)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error(`www data Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
          expect(Number(error.code) == 25900003).assertTrue();
        });
      done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2200
     * @tc.number testLoadFontSyncWithCheck_2200
     * @tc.desc   text loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
      let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, $rawfile('empty.ttf'), 0)
        .then((data) => {
          console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((error: BusinessError) => {
          console.error('www data Failed to do loadFontWithCheck', JSON.stringify(error));
          expect(Number(error.code) == 25900007).assertTrue();
        });
      done();
    })
    
  })
}