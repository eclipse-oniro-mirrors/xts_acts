/*
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";
import common2D from '@ohos.graphics.common2D';
import drawing from '@ohos.graphics.drawing';
import { $rawfile, Resource } from '@ohos.arkui.component';

export default function GraphicTextAPI23() {

  describe('GraphicTextAPI23', () => {
    let myColor: common2D.Color;
    beforeAll(() => {
      myColor = { alpha: 255, red: 255, green: 0, blue: 0 };
    })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0100
     * @tc.number testLoadFontSyncWithCheckStatic_0100
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 0);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (err: BusinessError) {
          console.error(`www data Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(err)}`);
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0200
     * @tc.number testLoadFontSyncWithCheckStatic_0200
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900001).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0300
     * @tc.number testLoadFontSyncWithCheckStatic_0300
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900008).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0400
     * @tc.number testLoadFontSyncWithCheckStatic_0400
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0500
     * @tc.number testLoadFontSyncWithCheckStatic_0500
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0600
     * @tc.number testLoadFontSyncWithCheckStatic_0600
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900002).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0700
     * @tc.number testLoadFontSyncWithCheckStatic_0700
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2);
          console.info('www data success to do loadFontSyncWithCheck');
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontSyncWithCheckStatic_0800
     * @tc.number testLoadFontSyncWithCheckStatic_0800
     * @tc.desc   test loadFontSyncWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000);
          console.info('www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e: BusinessError) {
          console.error(`Failed to do loadFontSyncWithCheck, error: ${JSON.stringify(e)} message: ${e.message}`);
          expect(Number(e.code) == 25900008).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0100
     * @tc.number testLoadFontWithCheckStatic_0100
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
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
     * @tc.name   testLoadFontWithCheckStatic_0200
     * @tc.number testLoadFontWithCheckStatic_0200
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, '/system/fonts/HarmonyOS_Sans.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900001).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0300
     * @tc.number testLoadFontWithCheckStatic_0300
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900008).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0400
     * @tc.number testLoadFontWithCheckStatic_0400
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0500
     * @tc.number testLoadFontWithCheckStatic_0500
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 0)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0600
     * @tc.number testLoadFontWithCheckStatic_0600
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/HarmonyOS_Sans111.ttf', 1)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900002).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0700
     * @tc.number testLoadFontWithCheckStatic_0700
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect().assertFail();
          });
        done();
      })

    /**
     * @tc.name   testLoadFontWithCheckStatic_0800
     * @tc.number testLoadFontWithCheckStatic_0800
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontWithCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc', 2000)
          .then((data) => {
            console.info(`Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((error: Error) => {
            console.error(`Failed to do loadFontWithCheck, error: ${JSON.stringify(error)} message: ${error.message}`);
            expect(Number(error.code) == 25900008).assertTrue();
          });
        done();
      })

    /**
     * @tc.name   testParagraphStyleStatic_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_paragraphStyle_0100
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testParagraphStyleStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testParagraphStyleStatic_0100===="
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
          let arrRunMetrics: Map<int,text.RunMetrics> = arrLineMetrc[0].runMetrics;
          let arr: number[] = [];
          for (let key of arrRunMetrics.keys()) {
            arr.push(key);
          }
          arrRunMetrics.forEach((value, key) => {
            let textStyle = value.textStyle;
            console.info(msg + 'www data fontWeight ', textStyle.fontWeight);
            expect(3).assertEqual(textStyle?.fontWeight);
            let fontMetrics: drawing.FontMetrics | undefined = value?.fontMetrics;
            let maxNum = fontMetrics?.maxCharWidth;
            console.info('www data maxCharWidth', maxNum);
          })
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
          expect(minIntrinsicWidth).assertLargerOrEqual(133);
          expect(maxIntrinsicWidth).assertLargerOrEqual(311);
          expect(lineCount).assertLargerOrEqual(1);
          expect(lineHeight).assertLargerOrEqual(22);
          expect(lineWidth).assertLargerOrEqual(311);
          done();
        } catch(err){
          console.info(msg + 'test error' + err);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testIsFontSupportedStatic_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_isFontSupported_0100
     * @tc.desc   test isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupportedStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testIsFontSupportedStatic_0100===="
        let filePath = "file:///system/fonts/HarmonyOS_Sans.ttf";
        let isSupported = text.isFontSupported(filePath);
        console.info(msg + "www data is font supported: " + isSupported);
        expect(isSupported).assertTrue();
        done();
    })

    /**
     * @tc.name   testIsFontSupportedStatic_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_isFontSupported_0200
     * @tc.desc   test isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupportedStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testIsFontSupportedStatic_0200===="
        let filePath = "file:///system/fonts/HarmonyOS_Sans111.ttf";
        let isSupported = text.isFontSupported(filePath);
        console.info(msg + "www data is font supported: " + isSupported);
        expect(isSupported).assertFalse();
        done();
    })

    /**
     * @tc.name   testIsFontSupportedStatic_0300
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_isFontSupported_0300
     * @tc.desc   test isFontSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsFontSupportedStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testIsFontSupportedStatic_0300===="
        let isSupported = text.isFontSupported($rawfile('HarmonyOS_Sans.ttf'));
        console.info(msg + "www data is font supported: " + isSupported);
        expect(isSupported).assertTrue();
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1700
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0100
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_1700===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, $rawfile('empty.ttf'), 0);
          console.info(msg + 'www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e) {
          console.error(`www data Failed to do loadFontSyncWithCheck, error: ${e.code} message: ${e.message}`);
          expect(Number(e.code) == 25900007).assertTrue();
        }
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1800
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0200
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_1800===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///dev/tun', 0);
          console.info(msg + 'www data success to do loadFontSyncWithCheck');
          expect().assertFail();
        } catch (e) {
          console.error(`www data Failed to do loadFontSyncWithCheck, error: ${e.code} message: ${e.message}`);
          expect(Number(e.code) == 25900003).assertTrue();
        }
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_1900
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0300
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_1900===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        try {
          fontCollection.loadFontSyncWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc');
          console.info(msg + 'www data success to do loadFontSyncWithCheck');
        } catch (e) {
          console.error(`www data Failed to do loadFontSyncWithCheck, error: ${e.code} message: ${e.message}`);
          expect().assertFail();
        }
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2000
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0400
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_2000===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///system/fonts/NotoSansCJK-Regular.ttc')
          .then((data) => {
            console.info(msg + `www data Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          }).catch((e: Error) => {
            let error = e as BusinessError;
            console.error(`www data Failed to do loadFontWithCheck, error: ${error.code} message: ${error.message}`);
            expect().assertFail();
          });
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0500
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_2100===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, 'file:///dev/tun', 0)
          .then((data) => {
            console.info(msg + `www data Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
            expect().assertFail();
          }).catch((e: Error) => {
            let error = e as BusinessError;
            console.error(`www data Failed to do loadFontWithCheck, error: ${error.code} message: ${error.message}`);
            expect(Number(error.code) == 25900003).assertTrue();
          });
        done();
    })

    /**
     * @tc.name   testLoadFontSyncWithCheck_2200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_LoadFontSyncWithCheck_0600
     * @tc.desc   test loadFontWithCheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadFontSyncWithCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msg  = "====testLoadFontSyncWithCheck_2200===="
        let fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        let fontFamily: string = 'family';
        await fontCollection.loadFontWithCheck(fontFamily, $rawfile('empty.ttf'), 0)
        .then((data) => {
          console.info(msg + `www data Succeeded in doing loadFontWithCheck ${JSON.stringify(data)} `);
          expect().assertFail();
        }).catch((e: Error) => {
          let error = e as BusinessError;
          console.error(`www data Failed to do loadFontWithCheck, error: ${error.code} message: ${error.message}`);
          expect(Number(error.code) == 25900007).assertTrue();
        });
        await fontCollection.unloadFont(fontFamily);
        done();
    })


  })
}
