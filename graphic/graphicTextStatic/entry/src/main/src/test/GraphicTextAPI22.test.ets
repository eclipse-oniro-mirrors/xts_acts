/**
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
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text";

export default function GraphicTextAPI22() {
  describe('GraphicTextAPI22', () => {

    /**
     * @tc.name   graphicTextAPI22TestStatic_0100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_FONTCOLLECTION_0100
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0100===="
      let fontCollection = text.FontCollection.getLocalInstance();
      fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
      let fontFamilies: Array<string> = ["Clock_01"]
      let myTextStyle: text.TextStyle = {
        fontFamilies: fontFamilies
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
      }
      let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);

      let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
      paragraphBuilder.addText(textData);
      let paragraph: text.Paragraph = paragraphBuilder.build();
      paragraph.layoutSync(600);
      expect(fontCollection != undefined).assertTrue();
      await text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf")
        .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
          for (let index = 0; index < fontFullDescriptors.length; index++) {
            console.info('www data path ', fontFullDescriptors[index].path);
            console.info('www data postScriptName ', fontFullDescriptors[index].postScriptName);
            console.info('www data fullName ', fontFullDescriptors[index].fullName);
            console.info('www data fontFamily ', fontFullDescriptors[index].fontFamily);
            console.info('www data fontSubfamily ', fontFullDescriptors[index].fontSubfamily);
            console.info('www data weight ', fontFullDescriptors[index].weight);
            console.info('www data width ', fontFullDescriptors[index].width);
            console.info('www data italic ', fontFullDescriptors[index].italic);
            console.info('www data monoSpace ', fontFullDescriptors[index].monoSpace);
            console.info('www data index ', fontFullDescriptors[index].symbolic);
            expect(fontFullDescriptors[index].path).assertEqual('/system/fonts/HarmonyOS_Sans.ttf');
            expect(fontFullDescriptors[index].postScriptName).assertEqual('HarmonyOS_Sans');
            expect(fontFullDescriptors[index].fullName).assertEqual('HarmonyOS Sans');
            expect(fontFullDescriptors[index].fontFamily).assertEqual('HarmonyOS Sans');
            expect(fontFullDescriptors[index].fontSubfamily).assertEqual('Regular');
            expect(fontFullDescriptors[index].weight).assertEqual(3);
            expect(fontFullDescriptors[index].width).assertEqual(5);
            expect(fontFullDescriptors[index].italic).assertEqual(0);
            expect(fontFullDescriptors[index].monoSpace).assertEqual(false);
            expect(fontFullDescriptors[index].symbolic).assertEqual(false);
          }
        })
      fontCollection.unloadFontSync('Clock_01');
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0200
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_FONTCOLLECTION_0200
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0200===="
      await text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf")
        .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
          console.info(msg + 'www data fontFullDescriptors ', fontFullDescriptors.length);
          expect(fontFullDescriptors.length > 0).assertTrue();
        })
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0300
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_FONTCOLLECTION_0300
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0300===="
      await text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans123.ttf")
        .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
          console.info(msg + 'www data fontFullDescriptors ', fontFullDescriptors.length);
          expect(fontFullDescriptors.length == 0).assertTrue();
        })
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0400
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getLocalInstance_0100
     * @tc.desc   Test TextStyle Property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0400===="
      let fontCollection = text.FontCollection.getLocalInstance();
      fontCollection.loadFontSync('Clock_01', 'file:///system/fonts/HarmonyClock_01.ttf')
      let fontFamilies: Array<string> = ["Clock_01"]
      let myTextStyle: text.TextStyle = {
        fontFamilies: fontFamilies
      };
      let myParagraphStyle: text.ParagraphStyle = {
        textStyle: myTextStyle,
      }
      let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(myParagraphStyle, fontCollection);
      let textData = "测试 loadFontSync 加载字体HarmonyClock_01.ttf";
      paragraphBuilder.addText(textData);
      let paragraph: text.Paragraph = paragraphBuilder.build();
      paragraph.layoutSync(600);
      expect(fontCollection != undefined).assertTrue();
      await text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf")
        .then((fontFullDescriptors: Array<text.FontDescriptor>) => {
          for (let index = 0; index < fontFullDescriptors.length; index++) {
            console.info('www data localPostscriptName ', fontFullDescriptors[index].localPostscriptName);
            console.info('www data localFullName ', fontFullDescriptors[index].localFullName);
            console.info('www data localFamilyName ', fontFullDescriptors[index].localFamilyName);
            console.info('www data localSubFamilyName ', fontFullDescriptors[index].localSubFamilyName);
            console.info('www data version ', fontFullDescriptors[index].version);
            console.info('www data manufacture ', fontFullDescriptors[index].manufacture);
            console.info('www data copyright ', fontFullDescriptors[index].copyright);
            console.info('www data trademark ', fontFullDescriptors[index].trademark);
            console.info('www data license ', fontFullDescriptors[index].license);
            console.info('www data index ', fontFullDescriptors[index].index);
          }
          expect(fontFullDescriptors[0].localPostscriptName).assertEqual('HarmonyOS_Sans');
          expect(fontFullDescriptors[0].localFullName).assertEqual('HarmonyOS Sans');
          expect(fontFullDescriptors[0].localFamilyName).assertEqual('HarmonyOS Sans');
          expect(fontFullDescriptors[0].localFamilyName).assertEqual('HarmonyOS Sans');
          expect(fontFullDescriptors[0].localSubFamilyName).assertEqual('Regular');
          expect(fontFullDescriptors[0].index).assertEqual(0);
        })
      fontCollection.unloadFontSync('Clock_01');
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0500
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFontUnicodeSet_0100
     * @tc.desc   Test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0500===="
      await text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 0).then((unicodeSet:Array<int>) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(msg + 'www data ', unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertLarger(0);
      })
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0600
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFontUnicodeSet_0200
     * @tc.desc   Test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0600===="
      await text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 1).then((unicodeSet:Array<int>) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(msg + 'www data ', unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertEqual(0);
      })
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0700
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFontUnicodeSet_0300
     * @tc.desc   Test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0700===="
      await text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf123", 0).then((unicodeSet:Array<int>) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(msg + 'www data ', unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertEqual(0);
      })
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0800
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFontCount_0100
     * @tc.desc   Test getFontCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0800===="
      let fontCount = text.getFontCount("file:///system/fonts/HarmonyOS_Sans.ttf");
      console.info(msg + 'www data fontCount', fontCount);
      expect(fontCount).assertLarger(0);
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_0900
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFontCount_0200
     * @tc.desc   Test getFontCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_0900===="
      let fontCount = text.getFontCount("file:///system/fonts/HarmonyOS_Sans123.ttf");
      console.info(msg + 'www data fontCount', fontCount);
      expect(fontCount).assertEqual(0);
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_1000
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFomtPathsByType_0100
     * @tc.desc   Test getFontPathsByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_1000===="
      let fontList = text.getFontPathsByType(text.SystemFontType.ALL);
      for (let index = 0; index < fontList.length; index++) {
        console.info(msg + "www data file path: " + fontList[index])
      }
      console.info(msg + 'www data fontList', fontList);
      expect(fontList.length).assertLarger(0);
      done();
    })

    /**
     * @tc.name   graphicTextAPI22TestStatic_1100
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_API_getFomtPathsByType_0200
     * @tc.desc   Test getFontPathsByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicTextAPI22TestStatic_1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let msg  = "====graphicTextAPI22TestStatic_1100===="
      let fontList = text.getFontPathsByType(text.SystemFontType.CUSTOMIZED);
      for (let index = 0; index < fontList.length; index++) {
        console.info(msg + "www data file path: " + fontList[index])
      }
      console.info(msg + 'www data fontList', fontList);
      expect(fontList.length).assertEqual(0);
      done();
    })

  })
}

