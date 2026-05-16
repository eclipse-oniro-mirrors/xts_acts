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

const LOG_PREFIX = 'www data GraphicTextAdd01Test';

export default function GraphicTextAdd01Test() {
  describe('GraphicTextAdd01Test', () => {

    /**
     * @tc.name   fontCollectionLoadFontPathNull401
     * @tc.number FontCollectionLoadFontTest_005
     * @tc.desc   FontCollection loadFont path parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fontCollectionLoadFontPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontName = 'TestFont';

          await fontCollection.loadFont(fontName, null);
          console.info('www data fontCollectionLoadFontPathNull401 ', 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('TestFont');
          done();
        } catch (err) {
          console.info('www data fontCollectionLoadFontPathNull401 ', JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   fontCollectionLoadFontPathUndefined401
     * @tc.number FontCollectionLoadFontTest_006
     * @tc.desc   FontCollection loadFont path parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fontCollectionLoadFontPathUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontName = 'TestFont';
          await fontCollection.loadFont(fontName, undefined);
          console.info('www data fontCollectionLoadFontPathUndefined401 ', 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('TestFont');
          done();
        } catch (err) {
          console.info('www data fontCollectionLoadFontPathUndefined401 ', JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   fontCollectionLoadFontPathEmptyString401
     * @tc.number FontCollectionLoadFontTest_007
     * @tc.desc   FontCollection loadFont path parameter empty string test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fontCollectionLoadFontPathEmptyString401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontName = 'TestFont';
          await fontCollection.loadFont(fontName, '');
          console.info('www data fontCollectionLoadFontPathEmptyString401 ', 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('TestFont');
          done();
        } catch (err) {
          console.info('www data fontCollectionLoadFontPathEmptyString401 ', JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   fontCollectionLoadFontInvalidPath401
     * @tc.number FontCollectionLoadFontTest_008
     * @tc.desc   FontCollection loadFont invalid path parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('fontCollectionLoadFontInvalidPath401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done:Function)=> {
        try {
          const fontCollection: text.FontCollection = new text.FontCollection();
          const fontName = 'TestFont';
          await fontCollection.loadFont(fontName, 'invalid_path_format');
          console.info('www data fontCollectionLoadFontInvalidPath401 ', 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('TestFont');
          done();
        } catch (err) {
          console.info('www data fontCollectionLoadFontInvalidPath401 ', JSON.stringify(err));
          expect(Number(err.code) === 401).assertTrue();
          done();
        }
      });
    /**
     * @tc.name   loadFontSyncWithCheckNameEmptyString25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_001
     * @tc.desc   FontCollection loadFontSyncWithCheck name parameter empty string test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckNameEmptyString25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontPath = 'file:///data/test/font.ttf';

          fontCollection.loadFontSyncWithCheck('', fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameEmptyString25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('');
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameEmptyString25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckNameNull401
     * @tc.number fontCollectionLoadFontWithCheckTest_002
     * @tc.desc   FontCollection loadFontSyncWithCheck name parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckNameNull401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontPath = 'file:///data/test/font.ttf';

          fontCollection.loadFontSyncWithCheck(null, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameNull401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(null);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameNull401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckNameUndefined401
     * @tc.number fontCollectionLoadFontWithCheckTest_003
     * @tc.desc   FontCollection loadFontSyncWithCheck name parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckNameUndefined401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontPath = 'file:///data/test/font.ttf';

          fontCollection.loadFontSyncWithCheck(undefined, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameUndefined401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(undefined);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckNameUndefined401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckPathNull401
     * @tc.number fontCollectionLoadFontWithCheckTest_004
     * @tc.desc   FontCollection loadFontSyncWithCheck path parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckPathNull401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';

          fontCollection.loadFontSyncWithCheck(fontName, null);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathNull401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathNull401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckPathUndefined401
     * @tc.number fontCollectionLoadFontWithCheckTest_005
     * @tc.desc   FontCollection loadFontSyncWithCheck path parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckPathUndefined401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';

          fontCollection.loadFontSyncWithCheck(fontName, undefined);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathUndefined401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathUndefined401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckPathEmptyString25900001
     * @tc.number fontCollectionLoadFontWithCheckTest_006
     * @tc.desc   FontCollection loadFontSyncWithCheck path parameter empty string test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckPathEmptyString25900001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';

          fontCollection.loadFontSyncWithCheck(fontName, '');
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathEmptyString25900001 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckPathEmptyString25900001 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900001);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckIndexNull
     * @tc.number fontCollectionLoadFontWithCheckTest_007
     * @tc.desc   FontCollection loadFontSyncWithCheck index parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckIndexNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontName = 'TestFont';
        const fontPath = 'file:///data/test/font.ttf';

        fontCollection.loadFontSyncWithCheck(fontName, fontPath, null);
        console.info('www data loadFontSyncWithCheckIndexNull ', 1111);
        fontCollection.unloadFontSync(fontName);
      } catch (err) {
        console.info('www data loadFontSyncWithCheckIndexNull ', JSON.stringify(err));
        expect(err.code).assertEqual(25900002);
      }
    });

    /**
     * @tc.name   loadFontSyncWithCheckIndexUndefined
     * @tc.number fontCollectionLoadFontWithCheckTest_008
     * @tc.desc   FontCollection loadFontSyncWithCheck index parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckIndexUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontName = 'TestFont';
        const fontPath = 'file:///data/test/font.ttf';

        fontCollection.loadFontSyncWithCheck(fontName, fontPath, undefined);
        console.info('www data loadFontSyncWithCheckIndexUndefined ', 1111);
        fontCollection.unloadFontSync(fontName);
      } catch (err) {
        console.info('www data loadFontSyncWithCheckIndexUndefined ', JSON.stringify(err));
        expect(err.code).assertEqual(25900002);
      }
    });

    /**
     * @tc.name   loadFontSyncWithCheckFileNotFound25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_009
     * @tc.desc   FontCollection loadFontSyncWithCheck file not found test 25900002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckFileNotFound25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/nonexistent.ttf';

          fontCollection.loadFontSyncWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckFileNotFound25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckFileNotFound25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckFailedToOpen25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_010
     * @tc.desc   FontCollection loadFontSyncWithCheck failed to open file test 25900003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckFailedToOpen25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/corrupt.ttf';

          fontCollection.loadFontSyncWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckFailedToOpen25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckFailedToOpen25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckEmptyFile25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_011
     * @tc.desc   FontCollection loadFontSyncWithCheck empty file test 25900007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckEmptyFile25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/empty.ttf';

          fontCollection.loadFontSyncWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckEmptyFile25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckEmptyFile25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontSyncWithCheckCorruptFile25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_012
     * @tc.desc   FontCollection loadFontSyncWithCheck corrupt file test 25900008.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontSyncWithCheckCorruptFile25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/corrupt.ttf';

          fontCollection.loadFontSyncWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckCorruptFile25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontSyncWithCheckCorruptFile25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    // Test cases for loadFontWithCheck method

    /**
     * @tc.name   loadFontWithCheckNameEmptyString25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_013
     * @tc.desc   FontCollection loadFontWithCheck name parameter empty string test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckNameEmptyString25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontPath = 'file:///data/test/font.ttf';

          await fontCollection.loadFontWithCheck('', fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckNameEmptyString25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync('');
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckNameEmptyString25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckNameNull401
     * @tc.number fontCollectionLoadFontWithCheckTest_014
     * @tc.desc   FontCollection loadFontWithCheck name parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckNameNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontPath = 'file:///data/test/font.ttf';

        await fontCollection.loadFontWithCheck(null, fontPath);
        console.info(`${LOG_PREFIX} loadFontWithCheckNameNull401 `, 1111);
        expect(true).assertFail();
        fontCollection.unloadFontSync(null);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} loadFontWithCheckNameNull401 `, JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   loadFontWithCheckNameUndefined401
     * @tc.number fontCollectionLoadFontWithCheckTest_015
     * @tc.desc   FontCollection loadFontWithCheck name parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckNameUndefined401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontPath = 'file:///data/test/font.ttf';

          await fontCollection.loadFontWithCheck(undefined, fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckNameUndefined401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(undefined);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckNameUndefined401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckPathNull401
     * @tc.number fontCollectionLoadFontWithCheckTest_016
     * @tc.desc   FontCollection loadFontWithCheck path parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckPathNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontName = 'TestFont';

        await fontCollection.loadFontWithCheck(fontName, null);
        console.info(`${LOG_PREFIX} loadFontWithCheckPathNull401 `, 1111);
        expect(true).assertFail();
        fontCollection.unloadFontSync(fontName);
        done();
      } catch (err) {
        console.info(`${LOG_PREFIX} loadFontWithCheckPathNull401 `, JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   loadFontWithCheckPathUndefined401
     * @tc.number fontCollectionLoadFontWithCheckTest_017
     * @tc.desc   FontCollection loadFontWithCheck path parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckPathUndefined401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';

          await fontCollection.loadFontWithCheck(fontName, undefined);
          console.info(`${LOG_PREFIX} loadFontWithCheckPathUndefined401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckPathUndefined401 `, JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckPathEmptyString401
     * @tc.number fontCollectionLoadFontWithCheckTest_018
     * @tc.desc   FontCollection loadFontWithCheck path parameter empty string test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckPathEmptyString401',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';

          await fontCollection.loadFontWithCheck(fontName, '');
          console.info(`${LOG_PREFIX} loadFontWithCheckPathEmptyString401 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckPathEmptyString401 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900001);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckIndexNull
     * @tc.number fontCollectionLoadFontWithCheckTest_019
     * @tc.desc   FontCollection loadFontWithCheck index parameter null test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckIndexNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontName = 'TestFont';
        const fontPath = 'file:///data/test/font.ttf';

        await fontCollection.loadFontWithCheck(fontName, fontPath, null);
        console.info('www data loadFontWithCheckIndexNull ', 1111);
        fontCollection.unloadFontSync(fontName);
      } catch (err) {
        console.info('www data loadFontWithCheckIndexNull ', JSON.stringify(err));
        expect(err.code).assertEqual(25900002);
      }
    });

    /**
     * @tc.name   loadFontWithCheckIndexUndefined
     * @tc.number fontCollectionLoadFontWithCheckTest_020
     * @tc.desc   FontCollection loadFontWithCheck index parameter undefined test 25900001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckIndexUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
        const fontName = 'TestFont';
        const fontPath = 'file:///data/test/font.ttf';

        await fontCollection.loadFontWithCheck(fontName, fontPath, undefined);
        console.info('www data loadFontWithCheckIndexUndefined ', 1111);
        fontCollection.unloadFontSync(fontName);
      } catch (err) {
        console.info('www data loadFontWithCheckIndexUndefined ', JSON.stringify(err));
        expect(err.code).assertEqual(25900002);
      }
    });

    /**
     * @tc.name   loadFontWithCheckFileNotFound25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_021
     * @tc.desc   FontCollection loadFontWithCheck file not found test 25900002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckFileNotFound25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/nonexistent.ttf';

          await fontCollection.loadFontWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckFileNotFound25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckFileNotFound25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckFailedToOpen25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_022
     * @tc.desc   FontCollection loadFontWithCheck failed to open file test 25900003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckFailedToOpen25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/corrupt.ttf';

          await fontCollection.loadFontWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckFailedToOpen25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckFailedToOpen25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckEmptyFile25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_023
     * @tc.desc   FontCollection loadFontWithCheck empty file test 25900007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckEmptyFile25900002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/empty.ttf';

          await fontCollection.loadFontWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckEmptyFile25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckEmptyFile25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   loadFontWithCheckCorruptFile25900002
     * @tc.number fontCollectionLoadFontWithCheckTest_024
     * @tc.desc   FontCollection loadFontWithCheck corrupt file test 25900008.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('loadFontWithCheckCorruptFile25900002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const fontName = 'TestFont';
          const fontPath = 'file:///data/test/corrupt.ttf';

          await fontCollection.loadFontWithCheck(fontName, fontPath);
          console.info(`${LOG_PREFIX} loadFontWithCheckCorruptFile25900002 `, 1111);
          expect(true).assertFail();
          fontCollection.unloadFontSync(fontName);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} loadFontWithCheckCorruptFile25900002 `, JSON.stringify(err));
          expect(err.code).assertEqual(25900002);
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleNormal001
     * @tc.number fontStyleEllipsisModeTest_001
     * @tc.desc   ParagraphBuilder pushStyle fontStyle NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontStyleNormal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal001 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal001 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleItalic
     * @tc.number fontStyleEllipsisModeTest_002
     * @tc.desc   ParagraphBuilder pushStyle fontStyle ITALIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontStyleItalic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.ITALIC
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleItalic success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleItalic error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleOblique
     * @tc.number fontStyleEllipsisModeTest_003
     * @tc.desc   ParagraphBuilder pushStyle fontStyle OBLIQUE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontStyleOblique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.OBLIQUE
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleOblique success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleOblique error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeStart
     * @tc.number fontStyleEllipsisModeTest_004
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode START test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleEllipsisModeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.START
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleEllipsisModeStart success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMiddle
     * @tc.number fontStyleEllipsisModeTest_005
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleEllipsisModeMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MIDDLE
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMiddle success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMiddle error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeEnd
     * @tc.number fontStyleEllipsisModeTest_006
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode END test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleEllipsisModeEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.END
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleEllipsisModeEnd success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeEnd error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMultilineStart
     * @tc.number fontStyleEllipsisModeTest_007
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MULTILINE_START test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleEllipsisModeMultilineStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MULTILINE_START
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineStart success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineStart error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleEllipsisModeMultilineMiddle
     * @tc.number fontStyleEllipsisModeTest_008
     * @tc.desc   ParagraphBuilder pushStyle ellipsisMode MULTILINE_MIDDLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleEllipsisModeMultilineMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineMiddle success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleEllipsisModeMultilineMiddle error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleAndEllipsisModeCombined
     * @tc.number fontStyleEllipsisModeTest_009
     * @tc.desc   ParagraphBuilder pushStyle fontStyle and ellipsisMode combined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontStyleAndEllipsisModeCombined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 2 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.ITALIC,
            ellipsisMode: text.EllipsisMode.END,
            badgeType: text.TextBadgeType.TEXT_BADGE_NONE,
            color: { alpha: 255, red: 128, green: 0, blue: 128 }
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleAndEllipsisModeCombined success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleAndEllipsisModeCombined error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleAllFontStylesTest
     * @tc.number fontStyleEllipsisModeTest_010
     * @tc.desc   ParagraphBuilder pushStyle all font styles test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleAllFontStylesTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          // Test NORMAL
          let textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL,
            badgeType: text.TextBadgeType.TEXT_SUPERSCRIPT,
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Normal ');
          paragraphBuilder.popStyle();

          // Test ITALIC
          textStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.ITALIC
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Italic ');
          paragraphBuilder.popStyle();

          // Test OBLIQUE
          textStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.OBLIQUE
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Oblique');
          paragraphBuilder.popStyle();

          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(300);

          console.info(`${LOG_PREFIX} pushStyleAllFontStylesTest success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleAllFontStylesTest error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleAllEllipsisModesTest
     * @tc.number fontStyleEllipsisModeTest_011
     * @tc.desc   ParagraphBuilder pushStyle all ellipsis modes test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleAllEllipsisModesTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();

          // Test START (maxLines: 1)
          let paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          let paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          let textStyle: text.TextStyle = {
            fontSize: 16,
            ellipsisMode: text.EllipsisMode.START,
            badgeType: text.TextBadgeType.TEXT_SUBSCRIPT,
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('START: This is a very long text that should be truncated at the beginning');
          let paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          // Test MIDDLE (maxLines: 1)
          paragraphStyle = { align: text.TextAlign.LEFT, maxLines: 1 };
          paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          textStyle = {
            fontSize: 16,
            ellipsisMode: text.EllipsisMode.MIDDLE
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('MIDDLE: This is a very long text that should be truncated in the middle');
          paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          // Test END (maxLines: 2)
          paragraphStyle = { align: text.TextAlign.LEFT, maxLines: 2 };
          paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          textStyle = {
            fontSize: 16,
            ellipsisMode: text.EllipsisMode.END
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('END: This is a very long text that should be truncated at the end');
          paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          // Test MULTILINE_START (maxLines: 3)
          paragraphStyle = { align: text.TextAlign.LEFT, maxLines: 3 };
          paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          textStyle = {
            fontSize: 16,
            ellipsisMode: text.EllipsisMode.MULTILINE_START
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText(
            'MULTILINE_START: This is a very long text that should be truncated at the beginning with multiline support'
          )
          paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          // Test MULTILINE_MIDDLE (maxLines: 3)
          paragraphStyle = { align: text.TextAlign.LEFT, maxLines: 3 };
          paragraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          textStyle = {
            fontSize: 16,
            ellipsisMode: text.EllipsisMode.MULTILINE_MIDDLE
          };
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText(
            'MULTILINE_MIDDLE: This is a very long text that should be truncated in the middle with multiline support'
          )
          paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleAllEllipsisModesTest success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleAllEllipsisModesTest error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   addTextEmptyString
     * @tc.number paragraphBuilderCompleteTest_001
     * @tc.desc   ParagraphBuilder addText empty string test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addTextEmptyString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addText('');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addTextEmptyString success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addTextEmptyString error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addTextNull401
     * @tc.number paragraphBuilderCompleteTest_002
     * @tc.desc   ParagraphBuilder addText null parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addTextNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addText(null);
          console.info(`${LOG_PREFIX} addTextNull401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addTextNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addTextUndefined401
     * @tc.number paragraphBuilderCompleteTest_003
     * @tc.desc   ParagraphBuilder addText undefined parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addTextUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addText(undefined);
          console.info(`${LOG_PREFIX} addTextUndefined401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addTextUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    // ParagraphBuilder.addSymbol tests
    /**
     * @tc.name   addSymbolValid
     * @tc.number paragraphBuilderCompleteTest_004
     * @tc.desc   ParagraphBuilder addSymbol valid parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addSymbolValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addSymbol(0x1F600); // Using a valid emoji symbol
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addSymbolValid success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addSymbolValid error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addSymbolNull401
     * @tc.number paragraphBuilderCompleteTest_005
     * @tc.desc   ParagraphBuilder addSymbol null parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addSymbolNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addSymbol(null);
          console.info(`${LOG_PREFIX} addSymbolNull401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addSymbolNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addSymbolUndefined401
     * @tc.number paragraphBuilderCompleteTest_006
     * @tc.desc   ParagraphBuilder addSymbol undefined parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addSymbolUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addSymbol(undefined);
          console.info(`${LOG_PREFIX} addSymbolUndefined401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addSymbolUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addSymbolZero
     * @tc.number paragraphBuilderCompleteTest_007
     * @tc.desc   ParagraphBuilder addSymbol zero parameter test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addSymbolZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addSymbol(0);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addSymbolZero success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addSymbolZero error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.name   addPlaceholderAlignOffsetAtBaseline
     * @tc.number paragraphBuilderPlaceholderTest_001
     * @tc.desc   ParagraphBuilder addPlaceholder align OFFSET_AT_BASELINE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderAlignOffsetAtBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderAlignOffsetAtBaseline success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderAlignOffsetAtBaseline error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderAlignBelowBaseline
     * @tc.number paragraphBuilderPlaceholderTest_002
     * @tc.desc   ParagraphBuilder addPlaceholder align BELOW_BASELINE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderAlignBelowBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BELOW_BASELINE,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderAlignBelowBaseline success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderAlignBelowBaseline error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderAlignTopOfRowBox
     * @tc.number paragraphBuilderPlaceholderTest_003
     * @tc.desc   ParagraphBuilder addPlaceholder align TOP_OF_ROW_BOX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderAlignTopOfRowBox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.TOP_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderAlignTopOfRowBox success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderAlignTopOfRowBox error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderAlignBottomOfRowBox
     * @tc.number paragraphBuilderPlaceholderTest_004
     * @tc.desc   ParagraphBuilder addPlaceholder align BOTTOM_OF_ROW_BOX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderAlignBottomOfRowBox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.BOTTOM_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderAlignBottomOfRowBox success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderAlignBottomOfRowBox error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderAlignCenterOfRowBox
     * @tc.number paragraphBuilderPlaceholderTest_005
     * @tc.desc   ParagraphBuilder addPlaceholder align CENTER_OF_ROW_BOX test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderAlignCenterOfRowBox', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.CENTER_OF_ROW_BOX,
            baseline: text.TextBaseline.ALPHABETIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderAlignCenterOfRowBox success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderAlignCenterOfRowBox error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderBaselineIdeographic
     * @tc.number paragraphBuilderPlaceholderTest_006
     * @tc.desc   ParagraphBuilder addPlaceholder baseline IDEOGRAPHIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('addPlaceholderBaselineIdeographic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const placeholderSpan: text.PlaceholderSpan = {
            width: 100,
            height: 100,
            align: text.PlaceholderAlignment.OFFSET_AT_BASELINE,
            baseline: text.TextBaseline.IDEOGRAPHIC,
            baselineOffset: 0
          };

          paragraphBuilder.addPlaceholder(placeholderSpan);
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} addPlaceholderBaselineIdeographic success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderBaselineIdeographic error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderNull401
     * @tc.number paragraphBuilderPlaceholderTest_007
     * @tc.desc   ParagraphBuilder addPlaceholder null parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addPlaceholderNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addPlaceholder(null);
          console.info(`${LOG_PREFIX} addPlaceholderNull401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   addPlaceholderUndefined401
     * @tc.number paragraphBuilderPlaceholderTest_008
     * @tc.desc   ParagraphBuilder addPlaceholder undefined parameter test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('addPlaceholderUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          paragraphBuilder.addPlaceholder(undefined);
          console.info(`${LOG_PREFIX} addPlaceholderUndefined401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} addPlaceholderUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontStyleNormal002
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_001
     * @tc.desc   ParagraphBuilder pushStyle fontStyle NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontStyleNormal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal002 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontStyleNormal002 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWeightW100
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_002
     * @tc.desc   ParagraphBuilder pushStyle fontWeight W100 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontWeightW100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWeight: text.FontWeight.W100
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWeightW100 success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWeightW100 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthNormal
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_003
     * @tc.desc   ParagraphBuilder pushStyle fontWidth NORMAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontWidthNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.NORMAL
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWidthNormal success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthNormal error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthCondensed
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_004
     * @tc.desc   ParagraphBuilder pushStyle fontWidth CONDENSED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontWidthCondensed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.CONDENSED
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWidthCondensed success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthCondensed error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleFontWidthSemiExpanded
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_005
     * @tc.desc   ParagraphBuilder pushStyle fontWidth SEMI_EXPANDED test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleFontWidthSemiExpanded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontWidth: text.FontWidth.SEMI_EXPANDED
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleFontWidthSemiExpanded success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleFontWidthSemiExpanded error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   pushStyleComplexProperties
     * @tc.number paragraphBuilderPushStyleAndWidthSimpleTest_006
     * @tc.desc   ParagraphBuilder pushStyle complex properties test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('pushStyleComplexProperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);

          const textStyle: text.TextStyle = {
            fontSize: 20,
            fontStyle: text.FontStyle.NORMAL,
            fontWeight: text.FontWeight.W100,
            fontWidth: text.FontWidth.CONDENSED,
            color: { alpha: 255, red: 0, green: 0, blue: 0 }
          };

          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          console.info(`${LOG_PREFIX} pushStyleComplexProperties success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} pushStyleComplexProperties error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationTextDecorationNone
     * @tc.number paragraphUpdateDecorationTest_001
     * @tc.desc   Paragraph updateDecoration textDecoration NONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateDecorationTextDecorationNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const decoration: text.Decoration = {
            textDecoration: text.TextDecorationType.NONE,
            color: { alpha: 255, red: 255, green: 0, blue: 0 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.0
          };

          paragraph.updateDecoration(decoration);
          console.info(`${LOG_PREFIX} updateDecorationTextDecorationNone success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationTextDecorationNone error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationDecorationStyleSolid
     * @tc.number paragraphUpdateDecorationTest_002
     * @tc.desc   Paragraph updateDecoration decorationStyle SOLID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateDecorationDecorationStyleSolid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const decoration: text.Decoration = {
            textDecoration: text.TextDecorationType.UNDERLINE,
            color: { alpha: 255, red: 0, green: 0, blue: 255 },
            decorationStyle: text.TextDecorationStyle.SOLID,
            decorationThicknessScale: 1.0
          };

          paragraph.updateDecoration(decoration);
          console.info(`${LOG_PREFIX} updateDecorationDecorationStyleSolid success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationDecorationStyleSolid error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationDecorationStyleDouble
     * @tc.number paragraphUpdateDecorationTest_003
     * @tc.desc   Paragraph updateDecoration decorationStyle DOUBLE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateDecorationDecorationStyleDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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

          const decoration: text.Decoration = {
            textDecoration: text.TextDecorationType.UNDERLINE,
            color: { alpha: 255, red: 0, green: 128, blue: 128 },
            decorationStyle: text.TextDecorationStyle.DOUBLE,
            decorationThicknessScale: 1.5
          };

          paragraph.updateDecoration(decoration);
          console.info(`${LOG_PREFIX} updateDecorationDecorationStyleDouble success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationDecorationStyleDouble error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationDecorationNull401
     * @tc.number paragraphUpdateDecorationTest_004
     * @tc.desc   Paragraph updateDecoration decoration parameter null test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateDecorationDecorationNull401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          paragraph.updateDecoration(null);
          console.info(`${LOG_PREFIX} updateDecorationDecorationNull401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationDecorationNull401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationDecorationUndefined401
     * @tc.number paragraphUpdateDecorationTest_005
     * @tc.desc   Paragraph updateDecoration decoration parameter undefined test 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('updateDecorationDecorationUndefined401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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

          paragraph.updateDecoration(undefined);
          console.info(`${LOG_PREFIX} updateDecorationDecorationUndefined401 success`, 1111);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationDecorationUndefined401 error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   updateDecorationComplete
     * @tc.number paragraphUpdateDecorationTest_006
     * @tc.desc   Paragraph updateDecoration with all properties test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateDecorationComplete', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const fontCollection: text.FontCollection = text.FontCollection.getGlobalInstance();
          const paragraphStyle: text.ParagraphStyle = { align: text.TextAlign.LEFT };
          const textStyle: text.TextStyle = { fontSize: 20 };
          const paragraphBuilder: text.ParagraphBuilder = new text.ParagraphBuilder(paragraphStyle, fontCollection);
          paragraphBuilder.pushStyle(textStyle);
          paragraphBuilder.addText('Test Text with Decoration');
          const paragraph: text.Paragraph = paragraphBuilder.build();
          paragraph.layoutSync(200);

          const decoration: text.Decoration = {
            textDecoration: text.TextDecorationType.LINE_THROUGH,
            color: { alpha: 200, red: 128, green: 64, blue: 192 },
            decorationStyle: text.TextDecorationStyle.DOTTED,
            decorationThicknessScale: 2.0
          };

          paragraph.updateDecoration(decoration);
          console.info(`${LOG_PREFIX} updateDecorationComplete success`);
          done();
        } catch (err) {
          console.info(`${LOG_PREFIX} updateDecorationComplete error `, JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

  })
}

