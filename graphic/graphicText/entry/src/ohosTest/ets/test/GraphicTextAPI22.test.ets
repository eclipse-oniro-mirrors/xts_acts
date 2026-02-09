/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

export default function GraphicTextAPI22() {
  describe('GraphicTextAPI22', () => {
    beforeEach(async (done: Function) => {
      done();
    });

    /**
     * @tc.name   GraphicTextAPI22Test_0100
     * @tc.number GraphicTextAPI22Test_0100
     * @tc.desc   text newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPI22Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
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
      let promise = text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf")
      promise.then((fontFullDescriptors) => {
        for (let index = 0; index < fontFullDescriptors.length; index++) {
          console.info("Path:" + fontFullDescriptors[index].path +
            "\npostScriptName:" + fontFullDescriptors[index].postScriptName +
            "\nfullName:" + fontFullDescriptors[index].fullName +
            "\nfamilyName:" + fontFullDescriptors[index].fontFamily +
            "\nfontSubName:" + fontFullDescriptors[index].fontSubfamily +
            "\nweight:" + fontFullDescriptors[index].weight +
            "\nwidth:" + fontFullDescriptors[index].width +
            "\nitalic:" + fontFullDescriptors[index].italic +
            "\nmonoSpace:" + fontFullDescriptors[index].monoSpace +
            "\nsymbolic:" + fontFullDescriptors[index].symbolic);
          expect(fontFullDescriptors[index].path).assertEqual('/system/fonts/HarmonyOS_Sans.ttf');
        }
      })
      done();
    })

    /**
     * @tc.name   GetFontDescriptorsFromPath_0100
     * @tc.number GetFontDescriptorsFromPath_0100
     * @tc.desc   test getFontDescriptorsFromPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontDescriptorsFromPath_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf").then((fontFullDescriptors) => {
        console.info('www data 111 fontFullDescriptors', fontFullDescriptors);
        console.info('www data 111 fontFullDescriptors length', fontFullDescriptors.length);
        expect(fontFullDescriptors.length > 0).assertTrue();
      })
      done();
    })

    /**
     * @tc.name   GetFontDescriptorsFromPath_0200
     * @tc.number GetFontDescriptorsFromPath_0200
     * @tc.desc   test getFontDescriptorsFromPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontDescriptorsFromPath_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans123.ttf").then((fontFullDescriptors) => {
        console.info('www data 111 fontFullDescriptors', fontFullDescriptors);
        console.info('www data 111 fontFullDescriptors length', fontFullDescriptors.length);
        expect(fontFullDescriptors.length == 0).assertTrue();
      })
      done();
    })

    /**
     * @tc.name   GraphicTextAPI22Test_0200
     * @tc.number GraphicTextAPI22Test_0200
     * @tc.desc   text newAPI22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GraphicTextAPI22Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
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
      let promise = text.getFontDescriptorsFromPath("file:///system/fonts/HarmonyOS_Sans.ttf")
      promise.then((fontDescriptors) => {
        for (let index = 0; index < fontDescriptors.length; index++) {
          console.info("localPostscriptName:" + fontDescriptors[index].localPostscriptName +
            "\localFullName:" + fontDescriptors[index].localFullName +
            "\localFamilyName:" + fontDescriptors[index].localFamilyName +
            "\localSubFamilyName:" + fontDescriptors[index].localSubFamilyName +
            "\version:" + fontDescriptors[index].version +
            "\manufacture:" + fontDescriptors[index].manufacture +
            "\copyright:" + fontDescriptors[index].copyright +
            "\trademark:" + fontDescriptors[index].trademark +
            "\license:" + fontDescriptors[index].license + 
            "\index:" + fontDescriptors[index].index);
        }
        console.info('www data fontDescriptors', JSON.stringify(fontDescriptors));
        expect(fontDescriptors[0].localPostscriptName).assertEqual('HarmonyOS_Sans');
        expect(fontDescriptors[0].localFullName).assertEqual('HarmonyOS Sans');
        expect(fontDescriptors[0].localFamilyName).assertEqual('HarmonyOS Sans');
        expect(fontDescriptors[0].localFamilyName).assertEqual('HarmonyOS Sans');
        expect(fontDescriptors[0].localSubFamilyName).assertEqual('Regular');
        expect(fontDescriptors[0].index).assertEqual(0);
      })
      done();
    })

    /**
     * @tc.name   GetFontUnicodeSet_0100
     * @tc.number GetFontUnicodeSet_0100
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let promise = text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 0)
      promise.then((unicodeSet) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertLarger(0);
      })
      done();
    })

    /**
     * @tc.name   GetFontUnicodeSet_0200
     * @tc.number GetFontUnicodeSet_0200
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let promise = text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans.ttf", 1)
      promise.then((unicodeSet) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertEqual(0);
      })
      done();
    })

    /**
     * @tc.name   GetFontUnicodeSet_0300
     * @tc.number GetFontUnicodeSet_0300
     * @tc.desc   test getFontUnicodeSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontUnicodeSet_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let promise = text.getFontUnicodeSet("file:///system/fonts/HarmonyOS_Sans123.ttf", 0)
      promise.then((unicodeSet) => {
        for (let index = 0; index < unicodeSet.length; index++) {
          console.info(unicodeSet[index].toString())
        }
        expect(unicodeSet.length).assertEqual(0);
      })
      done();
    })

    /**
     * @tc.name   GetFontCount_0100
     * @tc.number GetFontCount_0100
     * @tc.desc   test getFontCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCount = text.getFontCount("file:///system/fonts/HarmonyOS_Sans.ttf");
      console.info('www data fontCount', fontCount);
      expect(fontCount).assertLarger(0);
      done();
    })

    /**
     * @tc.name   GetFontCount_0200
     * @tc.number GetFontCount_0200
     * @tc.desc   test getFontCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontCount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontCount = text.getFontCount("file:///system/fonts/HarmonyOS_Sans123.ttf");
      console.info('www data fontCount', fontCount);
      expect(fontCount).assertEqual(0);
      done();
    })

    /**
     * @tc.name   GetFontPathsByType_0100
     * @tc.number GetFontPathsByType_0100
     * @tc.desc   test getFontPathsByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontPathsByType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontList = text.getFontPathsByType(text.SystemFontType.ALL);
      for (let index = 0; index < fontList.length; index++) {
        console.info("www data file path: " + fontList[index])
      }
      console.info('www data fontList', fontList);
      expect(fontList.length).assertLarger(0);
      done();
    })

    /**
     * @tc.name   GetFontPathsByType_0200
     * @tc.number GetFontPathsByType_0200
     * @tc.desc   test getFontPathsByType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GetFontPathsByType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let fontList = text.getFontPathsByType(text.SystemFontType.CUSTOMIZED);
      for (let index = 0; index < fontList.length; index++) {
        console.info("www data file path: " + fontList[index])
      }
      console.info('www data fontList', fontList);
      expect(fontList.length).assertEqual(0);
      done();
    })

  })
}