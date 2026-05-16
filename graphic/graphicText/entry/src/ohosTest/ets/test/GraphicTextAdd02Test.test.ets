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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from "@ohos/hypium"
import { text, drawing, common2D } from "@kit.ArkGraphics2D"
import image from "@ohos.multimedia.image"

const LOG_PREFIX = 'www data GraphicTextAdd02Test';

export default function GraphicTextAdd02Test() {
  describe('GraphicTextAdd02Test', () => {

    /**
     * @tc.name   getFontDescriptorByFullNameNormal
     * @tc.number fontCollectionMethodsTest_001
     * @tc.desc   FontCollection getFontDescriptorByFullName normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            'HarmonyOS Sans', text.SystemFontType.GENERIC
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameNormal success ${JSON.stringify(descriptor)}`);
          expect(descriptor !== undefined).assertTrue();
          expect(descriptor.fullName).assertEqual('HarmonyOS Sans');
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   getFontDescriptorByFullNameCustomized
     * @tc.number fontCollectionMethodsTest_001_1
     * @tc.desc   FontCollection getFontDescriptorByFullName normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameCustomized', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let fontCollection: text.FontCollection = new text.FontCollection();
          try {
            await fontCollection.loadFont('fontFamily', $rawfile('test.ttf'));
            console.info('www data success loadFont 111');
          } catch (err) {
            console.info('www data failed to loadFont 111', JSON.stringify(err));
          }
          const descriptor = await text.getFontDescriptorByFullName(
            'fontFamily', text.SystemFontType.CUSTOMIZED
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameCustomized success ${JSON.stringify(descriptor)}`);
          expect(descriptor !== undefined).assertTrue();
          expect(descriptor.fontFamily).assertEqual('fontFamily');
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameCustomized error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFullNameEmpty401
     * @tc.number fontCollectionMethodsTest_002
     * @tc.desc   FontCollection getFontDescriptorByFullName fullName empty test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontDescriptorByFullNameFullNameEmpty401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            '', text.SystemFontType.STYLISH
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameEmpty401 success `,JSON.stringify(descriptor))
          expect(descriptor).assertUndefined();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameEmpty401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFullNameNull401
     * @tc.number fontCollectionMethodsTest_003
     * @tc.desc   FontCollection getFontDescriptorByFullName fullName undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontDescriptorByFullNameFullNameNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            null, text.SystemFontType.STYLISH
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameNull401 success ${JSON.stringify(descriptor)}`)
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFullNameUndefined401
     * @tc.number fontCollectionMethodsTest_003_1
     * @tc.desc   FontCollection getFontDescriptorByFullName fullName null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontDescriptorByFullNameFullNameUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            undefined, text.SystemFontType.STYLISH
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameUndefined401 success `,
            JSON.stringify(descriptor));
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFullNameUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFontTypeStylish
     * @tc.number fontCollectionMethodsTest_004
     * @tc.desc   FontCollection getFontDescriptorByFullName fontType STYLISH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameFontTypeStylish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            'Arial', text.SystemFontType.STYLISH
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeStylish success`, JSON.stringify(descriptor));
          expect(descriptor === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeStylish error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFontTypeGeneric
     * @tc.number fontCollectionMethodsTest_005
     * @tc.desc   FontCollection getFontDescriptorByFullName fontType GENERIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameFontTypeGeneric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            'Times New Roman', text.SystemFontType.GENERIC
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeGeneric success fontType=`,
            JSON.stringify(descriptor));
          expect(descriptor === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeGeneric error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameFontTypeInstalled
     * @tc.number fontCollectionMethodsTest_006
     * @tc.desc   FontCollection getFontDescriptorByFullName fontType INSTALLED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameFontTypeInstalled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const descriptor = await text.getFontDescriptorByFullName(
            'CustomFont', text.SystemFontType.INSTALLED
          );

          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeInstalled success`,JSON.stringify(descriptor));
          expect(descriptor === undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameFontTypeInstalled error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorByFullNameAllFontTypes
     * @tc.number fontCollectionMethodsTest_007
     * @tc.desc   FontCollection getFontDescriptorByFullName all font types test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorByFullNameAllFontTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontTypes = [text.SystemFontType.STYLISH, text.SystemFontType.GENERIC, text.SystemFontType.INSTALLED];

          for (const fontType of fontTypes) {
            const descriptor: text.FontDescriptor = await text.getFontDescriptorByFullName('TestFont', fontType);
            console.info(`${LOG_PREFIX} getFontDescriptorByFullNameAllFontTypes success `, JSON.stringify(descriptor));
            expect(descriptor === undefined).assertTrue();
          }
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorByFullNameAllFontTypes error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsNormal
     * @tc.number fontCollectionMethodsTest_008
     * @tc.desc   FontCollection matchFontDescriptors normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = { fullName: 'Arial', weight: text.FontWeight.W500 };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsNormal success count=${descriptors.length}`,
            JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsFullNameEmpty401
     * @tc.number fontCollectionMethodsTest_009
     * @tc.desc   FontCollection matchFontDescriptors fullName empty test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('matchFontDescriptorsFullNameEmpty401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = { fullName: '', weight: text.FontWeight.W500 };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsFullNameEmpty401 success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsFullNameEmpty401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsFontSubfamilyEmpty401
     * @tc.number fontCollectionMethodsTest_010
     * @tc.desc   FontCollection matchFontDescriptors fontSubfamily empty test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('matchFontDescriptorsFontSubfamilyEmpty401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = { fontSubfamily: '', weight: text.FontWeight.W500 };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsFontSubfamilyEmpty401 success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsFontSubfamilyEmpty401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsFontSubfamilyNotNull
     * @tc.number fontCollectionMethodsTest_011
     * @tc.desc   FontCollection matchFontDescriptors fontSubfamily not null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsFontSubfamilyNotNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            fontSubfamily: 'Arial',
            variationAxisRecords: [],
            variationInstanceRecords: []
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsFontSubfamilyNotNull success `, JSON.stringify(descriptors));
          expect(descriptors.length == 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsFontSubfamilyNotNull error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW100
     * @tc.number fontCollectionMethodsTest_012
     * @tc.desc   FontCollection matchFontDescriptors weight W100 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W100,
            variationAxisRecords: [{
              key: '', name: '', localName: '',
              minValue: 10, maxValue: 20, defaultValue: 20,
              flags: 0
            }],
            variationInstanceRecords: [{
              name: '', localName: '',
              coordinates: []
            }]
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW100 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW100 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW200
     * @tc.number fontCollectionMethodsTest_013
     * @tc.desc   FontCollection matchFontDescriptors weight W200 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W200,
            variationAxisRecords: [{
              key: 'aa', name: 'bb', localName: 'cc',
              minValue: 10, maxValue: 20, defaultValue: 20,
              flags: 1
            }],
            variationInstanceRecords: [{
              name: 'dd', localName: 'ee',
              coordinates: [{axis: '',value: 5, isNormalized: true}]
            }]
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW200 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW200 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW300
     * @tc.number fontCollectionMethodsTest_014
     * @tc.desc   FontCollection matchFontDescriptors weight W300 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W300,
            variationAxisRecords: [{
              key: 'aa', name: 'bb', localName: 'cc',
              minValue: 10, maxValue: 20, defaultValue: 20,
              flags: 1
            }],
            variationInstanceRecords: [{
              name: 'dd', localName: 'ee',
              coordinates: [{axis: 'ff',value: 5, isNormalized: false}]
            }]
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW300 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW300 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW400
     * @tc.number fontCollectionMethodsTest_015
     * @tc.desc   FontCollection matchFontDescriptors weight W400 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W400
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW400 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW400 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW500
     * @tc.number fontCollectionMethodsTest_016
     * @tc.desc   FontCollection matchFontDescriptors weight W500 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W500
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW500 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW500 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW600
     * @tc.number fontCollectionMethodsTest_017
     * @tc.desc   FontCollection matchFontDescriptors weight W600 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W600
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW600 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW600 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW700
     * @tc.number fontCollectionMethodsTest_018
     * @tc.desc   FontCollection matchFontDescriptors weight W700 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W700
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW700 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW700 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW800
     * @tc.number fontCollectionMethodsTest_019
     * @tc.desc   FontCollection matchFontDescriptors weight W800 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W800
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW800 success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW800 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsWeightW900
     * @tc.number fontCollectionMethodsTest_020
     * @tc.desc   FontCollection matchFontDescriptors weight W900 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsWeightW900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            weight: text.FontWeight.W900
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW900 success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsWeightW900 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsMonoSpaceTrue
     * @tc.number fontCollectionMethodsTest_021
     * @tc.desc   FontCollection matchFontDescriptors monoSpace true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsMonoSpaceTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Consolas',
            monoSpace: true
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsMonoSpaceTrue success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsMonoSpaceTrue error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsMonoSpaceFalse
     * @tc.number fontCollectionMethodsTest_022
     * @tc.desc   FontCollection matchFontDescriptors monoSpace false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsMonoSpaceFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            monoSpace: false
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsMonoSpaceFalse success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsMonoSpaceFalse error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsSymbolicTrue
     * @tc.number fontCollectionMethodsTest_023
     * @tc.desc   FontCollection matchFontDescriptors symbolic true test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsSymbolicTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Wingdings',
            symbolic: true
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsSymbolicTrue success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsSymbolicTrue error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsSymbolicFalse
     * @tc.number fontCollectionMethodsTest_024
     * @tc.desc   FontCollection matchFontDescriptors symbolic false test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsSymbolicFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            symbolic: false
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsSymbolicFalse success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsSymbolicFalse error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsLocalPostscriptNameEmpty
     * @tc.number fontCollectionMethodsTest_025
     * @tc.desc   FontCollection matchFontDescriptors localPostscriptName empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsLocalPostscriptNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            localPostscriptName: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalPostscriptNameEmpty success `,
            JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalPostscriptNameEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsLocalFullNameEmpty
     * @tc.number fontCollectionMethodsTest_026
     * @tc.desc   FontCollection matchFontDescriptors localFullName empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsLocalFullNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            localFullName: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalFullNameEmpty success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalFullNameEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsLocalFamilyNameEmpty
     * @tc.number fontCollectionMethodsTest_027
     * @tc.desc   FontCollection matchFontDescriptors localFamilyName empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsLocalFamilyNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            localFamilyName: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalFamilyNameEmpty success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalFamilyNameEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsLocalSubFamilyNameEmpty
     * @tc.number fontCollectionMethodsTest_028
     * @tc.desc   FontCollection matchFontDescriptors localSubFamilyName empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsLocalSubFamilyNameEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            localSubFamilyName: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalSubFamilyNameEmpty success `,
            JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsLocalSubFamilyNameEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsVersionEmpty
     * @tc.number fontCollectionMethodsTest_029
     * @tc.desc   FontCollection matchFontDescriptors version empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsVersionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            version: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsVersionEmpty success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsVersionEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsManufactureEmpty
     * @tc.number fontCollectionMethodsTest_030
     * @tc.desc   FontCollection matchFontDescriptors manufacture empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsManufactureEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            manufacture: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsManufactureEmpty success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsManufactureEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsCopyrightEmpty
     * @tc.number fontCollectionMethodsTest_031
     * @tc.desc   FontCollection matchFontDescriptors copyright empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsCopyrightEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            copyright: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsCopyrightEmpty success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsCopyrightEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsTrademarkEmpty
     * @tc.number fontCollectionMethodsTest_032
     * @tc.desc   FontCollection matchFontDescriptors trademark empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsTrademarkEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            trademark: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsTrademarkEmpty success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsTrademarkEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   matchFontDescriptorsLicenseEmpty
     * @tc.number fontCollectionMethodsTest_033
     * @tc.desc   FontCollection matchFontDescriptors license empty test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('matchFontDescriptorsLicenseEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const desc: text.FontDescriptor = {
            fullName: 'Arial',
            license: ''
          };
          const descriptors: text.FontDescriptor[] = await text.matchFontDescriptors(desc);

          console.info(`${LOG_PREFIX} matchFontDescriptorsLicenseEmpty success `, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} matchFontDescriptorsLicenseEmpty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorsFromPathNormal
     * @tc.number fontCollectionMethodsTest_034
     * @tc.desc   FontCollection getFontDescriptorsFromPath normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontDescriptorsFromPathNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const descriptors: text.FontDescriptor[] = await text.getFontDescriptorsFromPath('/data/local/tmp/fonts');

          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathNormal success`, JSON.stringify(descriptors));
          expect(descriptors !== undefined).assertTrue();
          expect(Array.isArray(descriptors)).assertTrue();
          expect(descriptors.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorsFromPathNull401
     * @tc.number fontCollectionMethodsTest_035
     * @tc.desc   FontCollection getFontDescriptorsFromPath path null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontDescriptorsFromPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const descriptors: text.FontDescriptor[] = await text.getFontDescriptorsFromPath(null);

          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathNull401 success`, JSON.stringify(descriptors));
          expect(descriptors.length == 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontDescriptorsFromPathUndefined401
     * @tc.number fontCollectionMethodsTest_036
     * @tc.desc   FontCollection getFontDescriptorsFromPath path undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontDescriptorsFromPathUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const descriptors: text.FontDescriptor[] = await text.getFontDescriptorsFromPath(undefined);

          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathUndefined401 success`, JSON.stringify(descriptors));
          expect(descriptors.length == 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontDescriptorsFromPathUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   isFontSupportedStringNormal
     * @tc.number fontCollectionMethodsTest_037
     * @tc.desc   FontCollection isFontSupported string normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('isFontSupportedStringNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const isSupported: boolean = text.isFontSupported('/data/local/tmp/test.ttf');

          console.info(`${LOG_PREFIX} isFontSupportedStringNormal success ${isSupported}`);
          expect(typeof isSupported === 'boolean').assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} isFontSupportedStringNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   isFontSupportedStringEmpty401
     * @tc.number fontCollectionMethodsTest_038
     * @tc.desc   FontCollection isFontSupported string empty test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('isFontSupportedStringEmpty401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const isSupported: boolean = text.isFontSupported('');

          console.info(`${LOG_PREFIX} isFontSupportedStringEmpty401 success ${isSupported}`);
          expect(isSupported).assertFalse();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} isFontSupportedStringEmpty401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   isFontSupportedStringNull401
     * @tc.number fontCollectionMethodsTest_039
     * @tc.desc   FontCollection isFontSupported string null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('isFontSupportedStringNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const isSupported: boolean = text.isFontSupported(null);

          console.info(`${LOG_PREFIX} isFontSupportedStringNull401 success ${isSupported}`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} isFontSupportedStringNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   isFontSupportedStringUndefined401
     * @tc.number fontCollectionMethodsTest_040
     * @tc.desc   FontCollection isFontSupported string undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('isFontSupportedStringUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const isSupported: boolean = text.isFontSupported(undefined);

          console.info(`${LOG_PREFIX} isFontSupportedStringUndefined401 success ${isSupported}`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} isFontSupportedStringUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontUnicodeSetNormal
     * @tc.number fontCollectionMethodsTest_041
     * @tc.desc   FontCollection getFontUnicodeSet normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontUnicodeSetNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet('/data/local/tmp/test.ttf', 0);

          console.info(`${LOG_PREFIX} getFontUnicodeSetNormal success count=${unicodeSet.length}`);
          expect(unicodeSet !== undefined).assertTrue();
          expect(Array.isArray(unicodeSet)).assertTrue();
          expect(unicodeSet.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontUnicodeSetPathNull401
     * @tc.number fontCollectionMethodsTest_042
     * @tc.desc   FontCollection getFontUnicodeSet path null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontUnicodeSetPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet(null, 0);

          console.info(`${LOG_PREFIX} getFontUnicodeSetPathNull401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetPathNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontUnicodeSetPathUndefined401
     * @tc.number fontCollectionMethodsTest_043
     * @tc.desc   FontCollection getFontUnicodeSet path undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontUnicodeSetPathUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet(undefined, 0);

          console.info(`${LOG_PREFIX} getFontUnicodeSetPathUndefined401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetPathUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontUnicodeSetIndexNull401
     * @tc.number fontCollectionMethodsTest_044
     * @tc.desc   FontCollection getFontUnicodeSet index null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontUnicodeSetIndexNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet('/data/local/tmp/test.ttf', null);

          console.info(`${LOG_PREFIX} getFontUnicodeSetIndexNull401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetIndexNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontUnicodeSetIndexUndefined401
     * @tc.number fontCollectionMethodsTest_045
     * @tc.desc   FontCollection getFontUnicodeSet index undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontUnicodeSetIndexUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const unicodeSet: number[] = await text.getFontUnicodeSet('/data/local/tmp/test.ttf', undefined);

          console.info(`${LOG_PREFIX} getFontUnicodeSetIndexUndefined401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontUnicodeSetIndexUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontCountNormal
     * @tc.number fontCollectionMethodsTest_046
     * @tc.desc   FontCollection getFontCount normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontCountNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const count: number = text.getFontCount('/data/local/tmp/fonts');

          console.info(`${LOG_PREFIX} getFontCountNormal success ${count}`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontCountNormal error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontCountPathNull401
     * @tc.number fontCollectionMethodsTest_047
     * @tc.desc   FontCollection getFontCount path null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontCountPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const count: number = text.getFontCount(null);

          console.info(`${LOG_PREFIX} getFontCountPathNull401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontCountPathNull401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontCountPathUndefined401
     * @tc.number fontCollectionMethodsTest_048
     * @tc.desc   FontCollection getFontCount path undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getFontCountPathUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const count: number = text.getFontCount(undefined);

          console.info(`${LOG_PREFIX} getFontCountPathUndefined401 success`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontCountPathUndefined401 error `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   getFontPathsByTypeStylish
     * @tc.number fontCollectionMethodsTest_049
     * @tc.desc   FontCollection getFontPathsByType STYLISH test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontPathsByTypeStylish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const paths: string[] = text.getFontPathsByType(text.SystemFontType.STYLISH);

          console.info(`${LOG_PREFIX} getFontPathsByTypeStylish success count=${paths.length}`);
          expect(paths !== undefined).assertTrue();
          expect(Array.isArray(paths)).assertTrue();
          expect(paths.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontPathsByTypeStylish error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontPathsByTypeGeneric
     * @tc.number fontCollectionMethodsTest_050
     * @tc.desc   FontCollection getFontPathsByType GENERIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontPathsByTypeGeneric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const paths: string[] = text.getFontPathsByType(text.SystemFontType.GENERIC);

          console.info(`${LOG_PREFIX} getFontPathsByTypeGeneric success count=${paths.length}`);
          expect(paths !== undefined).assertTrue();
          expect(Array.isArray(paths)).assertTrue();
          expect(paths.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontPathsByTypeGeneric error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getFontPathsByTypeInstalled
     * @tc.number fontCollectionMethodsTest_051
     * @tc.desc   FontCollection getFontPathsByType INSTALLED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getFontPathsByTypeInstalled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const paths: string[] = text.getFontPathsByType(text.SystemFontType.INSTALLED);

          console.info(`${LOG_PREFIX} getFontPathsByTypeInstalled success count=${paths.length}`);
          expect(paths !== undefined).assertTrue();
          expect(Array.isArray(paths)).assertTrue();
          expect(paths.length >= 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getFontPathsByTypeInstalled error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeNormal
     * @tc.number textLineGetTextRangeTest_001
     * @tc.desc   TextLine getTextRange normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeNormal success start=${textRange.start} end=${textRange.end}`);
          expect(textRange !== undefined).assertTrue();
          expect(textRange.start !== undefined).assertTrue();
          expect(textRange.end !== undefined).assertTrue();
          expect(typeof textRange.start === 'number').assertTrue();
          expect(typeof textRange.end === 'number').assertTrue();
          expect(textRange.start >= 0).assertTrue();
          expect(textRange.end >= textRange.start).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeStartProperty
     * @tc.number textLineGetTextRangeTest_002
     * @tc.desc   TextLine getTextRange start property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeStartProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeStartProperty success start=${textRange.start}`);
          expect(textRange.start !== undefined).assertTrue();
          expect(typeof textRange.start === 'number').assertTrue();
          expect(textRange.start >= 0).assertTrue();
          expect(Number.isInteger(textRange.start)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeStartProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeEndProperty
     * @tc.number textLineGetTextRangeTest_003
     * @tc.desc   TextLine getTextRange end property test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeEndProperty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Hello World');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeEndProperty success end=${textRange.end}`);
          expect(textRange.end !== undefined).assertTrue();
          expect(typeof textRange.end === 'number').assertTrue();
          expect(textRange.end >= 0).assertTrue();
          expect(Number.isInteger(textRange.end)).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeEndProperty error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeMultipleLines
     * @tc.number textLineGetTextRangeTest_004
     * @tc.desc   TextLine getTextRange multiple lines test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeMultipleLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('First line\nSecond line\nThird line');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          expect(lines.length >= 2).assertTrue();

          const firstLineRange: text.Range = lines[0].getTextRange();
          const secondLineRange: text.Range = lines[1] ? lines[1].getTextRange() : lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeMultipleLines success first=${firstLineRange.start}-`
            + `${firstLineRange.end} second=${secondLineRange.start}-${secondLineRange.end}`);

          expect(firstLineRange !== undefined).assertTrue();
          expect(secondLineRange !== undefined).assertTrue();
          expect(firstLineRange.start >= 0).assertTrue();
          expect(firstLineRange.end > firstLineRange.start).assertTrue();
          expect(secondLineRange.start >= firstLineRange.end).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeMultipleLines error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeEmptyText
     * @tc.number textLineGetTextRangeTest_005
     * @tc.desc   TextLine getTextRange empty text test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeEmptyText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);
          console.info(`${LOG_PREFIX} getTextRangeEmptyText success start=111111`);

          const lines: text.TextLine[] = paragraph.getTextLines();
          console.info(`${LOG_PREFIX} getTextRangeEmptyText success start=22222`);
          const textRange: text.Range = lines[0].getTextRange();
          console.info('${LOG_PREFIX} getTextRangeEmptyText success start, end ', JSON.stringify(textRange));
          console.info(`${LOG_PREFIX} getTextRangeEmptyText success start=${textRange.start} end=${textRange.end}`);
          expect().assertFail();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeEmptyText error `, JSON.stringify(err));
          console.info(`${LOG_PREFIX} getTextRangeEmptyText error `, err.code);
          expect(err.code).assertUndefined();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeLongText
     * @tc.number textLineGetTextRangeTest_006
     * @tc.desc   TextLine getTextRange long text test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          const longText = 'This is a very long text with many words to test the getTextRange method properly ' +
            'and ensure it works correctly with large amounts of text content.';
          paragraphBuilder.addText(longText);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeLongText success start=${textRange.start} end=`
            + `${textRange.end} length=${textRange.end - textRange.start}`);

          expect(textRange !== undefined).assertTrue();
          expect(textRange.start >= 0).assertTrue();
          expect(textRange.end > textRange.start).assertTrue();
          expect(textRange.end <= longText.length).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeLongText error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeWithSpaces
     * @tc.number textLineGetTextRangeTest_007
     * @tc.desc   TextLine getTextRange with spaces test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeWithSpaces', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('  Text with spaces  ');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeWithSpaces success start=${textRange.start} end=${textRange.end}`);

          expect(textRange !== undefined).assertTrue();
          expect(textRange.start !== undefined).assertTrue();
          expect(textRange.end !== undefined).assertTrue();
          expect(textRange.start >= 0).assertTrue();
          expect(textRange.end > textRange.start).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeWithSpaces error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeSingleCharacter
     * @tc.number textLineGetTextRangeTest_008
     * @tc.desc   TextLine getTextRange single character test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeSingleCharacter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('A');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeSingleCharacter success start=${textRange.start} end=`
            + `${textRange.end}`)

          expect(textRange !== undefined).assertTrue();
          expect(textRange.start === 0).assertTrue();
          expect(textRange.end === 1).assertTrue();
          expect(textRange.end - textRange.start === 1).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeSingleCharacter error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeSpecialCharacters
     * @tc.number textLineGetTextRangeTest_009
     * @tc.desc   TextLine getTextRange special characters test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeSpecialCharacters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('测试文本123!@#$%');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeSpecialCharacters success start=`
            + `${textRange.start} end=${textRange.end}`)

          expect(textRange !== undefined).assertTrue();
          expect(textRange.start >= 0).assertTrue();
          expect(textRange.end > textRange.start).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeSpecialCharacters error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   getTextRangeZeroStart
     * @tc.number textLineGetTextRangeTest_010
     * @tc.desc   TextLine getTextRange zero start test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('getTextRangeZeroStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const lines: text.TextLine[] = paragraph.getTextLines();
          const textRange: text.Range = lines[0].getTextRange();

          console.info(`${LOG_PREFIX} getTextRangeZeroStart success start=${textRange.start}`);

          expect(textRange.start === 0).assertTrue();
          expect(textRange.end > 0).assertTrue();
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} getTextRangeZeroStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}

