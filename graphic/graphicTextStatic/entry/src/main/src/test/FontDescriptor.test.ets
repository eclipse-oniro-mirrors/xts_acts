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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import text from "@ohos.graphics.text";
import { $rawfile, Resource } from '@ohos.arkui.component';

export default function FontDescriptorTest() {

  describe('FontDescriptorTest', () => {

    /**
     * @tc.name   testLanguagesValidArrayStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_languagesValidArrayStatic_0100
     * @tc.desc   Test FontDescriptor languages returns valid string array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesValidArrayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesValidArrayStatic===="
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
     * @tc.name   testFontFeaturesValidArrayStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_fontFeaturesValidArrayStatic_0200
     * @tc.desc   Test FontDescriptor fontFeatures returns valid string array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesValidArrayStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesValidArrayStatic===="
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
     * @tc.name   testLanguagesAndFontFeaturesStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesAndFontFeaturesStatic_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesAndFontFeaturesStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesAndFontFeaturesStatic===="
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
     * @tc.name   testLanguagesStringStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesStringStatic_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesStringStatic===="
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
     * @tc.name   testFontFeaturesStringStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_testFontFeaturesStringStatic_0100
     * @tc.desc   Test FontDescriptor languages is empty array and fontFeatures is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesStringStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesStringStatic===="
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
     * @tc.name   testLanguagesUndefinedStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_testLanguagesUndefinedStatic_0100
     * @tc.desc   Test FontDescriptor languages is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLanguagesUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testLanguagesUndefinedStatic===="
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
     * @tc.name   testFontFeaturesUndefinedStatic
     * @tc.number SUB_GRAPHIC_FontDescriptor_testFontFeaturesUndefinedStatic_0100
     * @tc.desc   Test FontDescriptor fontFeatures is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontFeaturesUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = "====www data testFontFeaturesUndefinedStatic===="
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
