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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "@ohos/hypium";
import text from "@ohos.graphics.text";

export default function FontDescriptorTest26() {

  describe('FontDescriptorTest26', () => {

    /**
     * @tc.name   testLanguagesValidArray
     * @tc.number SUB_GRAPHIC_FontDescriptor_languagesValidArray_0100
     * @tc.desc   Test FontDescriptor languages returns valid string array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesValidArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesValidArray===="
        console.info(msgStr + ' begin');
        try {
          let fontPath: Resource = $rawfile('test.ttf');
          let descriptors: Array<text.FontDescriptor> = await text.getFontDescriptorsFromPath(fontPath);
          expect(descriptors.length).assertLarger(0);

          let fontDesc: text.FontDescriptor = descriptors[0];
          console.info(msgStr + ' languages: ' + JSON.stringify(fontDesc.languages));
          console.info(msgStr + ' fontFeatures: ' + fontDesc.languages?.length);
          expect(Array.isArray(fontDesc.languages)).assertTrue();
          expect(fontDesc.languages?.length).assertLarger(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontFeaturesValidArray
     * @tc.number SUB_GRAPHIC_FontDescriptor_fontFeaturesValidArray_0200
     * @tc.desc   Test FontDescriptor fontFeatures returns valid string array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesValidArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesValidArray===="
        console.info(msgStr + ' begin');
        try {
          let fontPath: Resource = $rawfile('test.ttf');
          let descriptors: Array<text.FontDescriptor> = await text.getFontDescriptorsFromPath(fontPath);
          expect(descriptors.length).assertLarger(0);

          let fontDesc: text.FontDescriptor = descriptors[0];
          console.info(msgStr + ' fontFeatures: ' + JSON.stringify(fontDesc.fontFeatures));
          console.info(msgStr + ' fontFeatures: ' + fontDesc.fontFeatures?.length);
          expect(Array.isArray(fontDesc.fontFeatures)).assertTrue();
          expect(fontDesc.fontFeatures?.length).assertLarger(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testLanguagesAndFontFeatures
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesAndFontFeatures_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesAndFontFeatures', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesAndFontFeatures===="
        console.info(msgStr + ' begin');
        try {
          let fontDescriptor = await text.matchFontDescriptors({
            languages: [],
            fontFeatures: [],
          })
          console.info(msgStr + ' matchFontDescriptors success' + JSON.stringify(fontDescriptor));
          console.info(msgStr + ' matchFontDescriptors success' + fontDescriptor.length);
          expect(fontDescriptor.length).assertLargerOrEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testLanguagesString
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesString_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesString===="
        console.info(msgStr + ' begin');
        try {
          let fontDescriptor = await text.matchFontDescriptors({
            languages: ["zh-Hans"],
          })
          console.info(msgStr + ' matchFontDescriptors success' + JSON.stringify(fontDescriptor));
          console.info(msgStr + ' matchFontDescriptors success' + fontDescriptor.length);
          expect(fontDescriptor.length).assertLargerOrEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontFeaturesString
     * @tc.number SUB_GRAPHIC_FontDescriptor_testFontFeaturesString_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesString===="
        console.info(msgStr + ' begin');
        try {
          let fontDescriptor = await text.matchFontDescriptors({
            fontFeatures: ["case"],
          })
          console.info(msgStr + ' matchFontDescriptors success' + JSON.stringify(fontDescriptor));
          console.info(msgStr + ' matchFontDescriptors success' + fontDescriptor.length);
          expect(fontDescriptor.length).assertLargerOrEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testLanguagesUndefined
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesUndefined_0100
     * @tc.desc   Test FontDescriptor languages is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesUndefined===="
        console.info(msgStr + ' begin');
        try {
          let fontDescriptor = await text.matchFontDescriptors({
            languages: undefined,
          })
          console.info(msgStr + ' matchFontDescriptors success' + JSON.stringify(fontDescriptor));
          console.info(msgStr + ' matchFontDescriptors success' + fontDescriptor.length);
          expect(fontDescriptor.length).assertLargerOrEqual(0);
          console.info(msgStr + ' end');
          done();
        } catch (err) {
          console.error(msgStr + ' error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testFontFeaturesUndefined
     * @tc.number SUB_GRAPHIC_FontDescriptor_testFontFeaturesUndefined_0100
     * @tc.desc   Test FontDescriptor fontFeatures is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesUndefined===="
        console.info(msgStr + ' begin');
        try {
          let fontDescriptor = await text.matchFontDescriptors({
            fontFeatures: undefined,
          })
          console.info(msgStr + ' matchFontDescriptors success' + JSON.stringify(fontDescriptor));
          console.info(msgStr + ' matchFontDescriptors success' + fontDescriptor.length);
          expect(fontDescriptor.length).assertLargerOrEqual(0);
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
