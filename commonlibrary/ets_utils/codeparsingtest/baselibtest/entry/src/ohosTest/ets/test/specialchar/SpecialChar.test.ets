/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, buffer, JSON, util, xml } from '@kit.ArkTS';

const specChars = ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';

interface GeneratedObjectLiteralInterface_1 {
  ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~': string;
}

function escapeRegExp(string: string): string {
  return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

export default function SpecialCharTest() {
  describe('SpecialCharTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0100
     * @tc.name       : testBufferAllocSpecial0001
     * @tc.desc       : Testing the Buffer interface Alloc with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAllocSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocSpecial0001";
      try {
        let buf1 = buffer.alloc(97, specChars, 'utf8');
        console.log(`${TAG} success: ${buf1.toString('utf-8')}`);
        console.log(`${TAG} success: ${specChars}`, specChars.length);
        expect(buf1.toString('utf-8')).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0200
     * @tc.name       : testBufferByteLengthSpecial0002
     * @tc.desc       : Testing the Buffer interface ByteLength with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferByteLengthSpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferByteLengthSpecial0002";
      try {
        let str = specChars;
        console.log(`${str}: ${str.length} characters, ${buffer.byteLength(str, 'utf-8')} bytes`);
        expect(buffer.byteLength(str, 'utf-8')).assertEqual(97);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0300
     * @tc.name       : testBufferIsBufferSpecial0003
     * @tc.desc       : Testing the Buffer interface IsBuffer with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsBufferSpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsBufferSpecial0003";
      try {
        let result = buffer.isBuffer(specChars);
        console.log(`This is equal result ${result}`);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0400
     * @tc.name       : testBufferIsEncodingSpecial0004
     * @tc.desc       : Testing the Buffer interface IsEncoding with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingSpecial0004";
      try {
        let result = buffer.isEncoding(specChars).toString();
        console.log(`This is equal result ${result}`);
        expect(result).assertEqual("false");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0500
     * @tc.name       : testBufferFillSpecial0005
     * @tc.desc       : Testing the Buffer interface Fill with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFillSpecial0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFillSpecial0005";
      try {
        let b = buffer.allocUninitializedFromPool(2).fill(specChars);
        console.log(`This is b ${b.toString()}`);
        expect(b.toString()).assertEqual(" ï");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0600
     * @tc.name       : testBufferIncludesSpecial0006
     * @tc.desc       : Testing the Buffer interface Includes with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIncludesSpecial0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIncludesSpecial0006";
      try {
        let buf = buffer.from(specChars);
        console.log(buf.includes(specChars).toString());
        console.log(buf.includes('be').toString());
        expect(buf.includes(specChars).toString()).assertEqual("true");
        expect(buf.includes('be').toString()).assertEqual("false");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0700
     * @tc.name       : testBufferIndexOfSpecial0007
     * @tc.desc       : Testing the Buffer interface IndexOf with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIndexOfSpecial0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfSpecial0007";
      try {
        let buf = buffer.from(specChars);
        console.log(buf.indexOf(specChars).toString());
        console.log(buf.indexOf('no exist').toString());
        expect(buf.indexOf(specChars).toString()).assertEqual("0");
        expect(buf.indexOf('no exist').toString()).assertEqual("-1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0800
     * @tc.name       : testBufferlastIndexOfSpecial0008
     * @tc.desc       : Testing the Buffer interface lastIndexOf with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferlastIndexOfSpecial0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferlastIndexOfSpecial0008";
      try {
        let buf = buffer.from(specChars);
        console.log(buf.lastIndexOf(specChars).toString());
        console.log(buf.lastIndexOf('no exist').toString());
        expect(buf.lastIndexOf(specChars).toString()).assertEqual("0");
        expect(buf.lastIndexOf('no exist').toString()).assertEqual("-1");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_0900
     * @tc.name       : testBufferToJSONSpecial0009
     * @tc.desc       : Testing the Buffer interface ToJSON with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToJSONSpecial0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferToJSONSpecial0009";
      try {
        let buf1 = buffer.from(specChars);
        let obj = buf1.toJSON();
        console.log(JSON.stringify(obj));
        expect(JSON.stringify(obj))
          .assertEqual('{"type":"Buffer","data":[32,239,188,129,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126]}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_1000
     * @tc.name       : testBufferToStringSpecial0010
     * @tc.desc       : Testing the Buffer interface ToString with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferToStringSpecial0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferToStringSpecial0010";
      try {
        let buf = buffer.from(specChars);
        console.log(buf.toString('utf-8'));
        expect(buf.toString('utf-8'))
          .assertEqual(' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_1100
     * @tc.name       : testBufferWriteSpecial0011
     * @tc.desc       : Testing the Buffer interface Write with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferWriteSpecial0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferWriteSpecial0011";
      try {
        let buf = buffer.alloc(97);
        let len = buf.write(specChars);
        console.log(`${len} bytes: ${buf.toString('utf-8', 0, len)}`);
        expect(buf.write(specChars)).assertEqual(97);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_SPECIAL_1200
     * @tc.name       : testBufferTextSpecial0012
     * @tc.desc       : Testing the Buffer interface text with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferTextSpecial0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBufferTextSpecial0012";
      try {
        let blob1: buffer.Blob = new buffer.Blob([specChars]);
        let pro1 = blob1.text();
        let val1 = await pro1;
        console.log(val1);
        expect(val1.toString()).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0100
     * @tc.name       : testBuilintsStringConstructorSpecial0001
     * @tc.desc       : Testing the Buffer interface String with String
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringConstructorSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringConstructorSpecial0001";
      try {
        const strFunctionResult = String(specChars);
        const strConstructorResult = new String(specChars);
        expect(strFunctionResult).assertEqual(specChars);
        expect(strConstructorResult.valueOf()).assertEqual(specChars);
        expect(strFunctionResult).assertEqual(strConstructorResult.valueOf());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0200
     * @tc.name       : testBuilintsStringRawSpecial0002
     * @tc.desc       : Testing the Buffer interface String with Raw
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringRawSpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringRawSpecial0002";
      try {
        const rawString =
          String.raw` ！"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_abcdefghijklmnopqrstuvwxyz{|}~`;
        const specialInterpolatedString = String.raw`${specChars}`;
        expect(rawString)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_abcdefghijklmnopqrstuvwxyz{|}~");
        expect(specialInterpolatedString).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0300
     * @tc.name       : testBuilintsStringPrototypeCharAtSpecial0003
     * @tc.desc       : Testing the Buffer interface String with PrototypeCharAt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeCharAtSpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeCharAtSpecial0003";
      try {
        const index = 5;
        const result = specChars.charAt(index).toString();
        expect(result).assertEqual("%");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0400
     * @tc.name       : testBuilintsStringPrototypeCharCodeAtSpecial0004
     * @tc.desc       : Testing the Buffer interface String with PrototypeCharAt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeCharCodeAtSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeCharCodeAtSpecial0004";
      try {
        const index = 5;
        const result = specChars.charCodeAt(index);
        expect(result).assertEqual(37);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0500
     * @tc.name       : testBuilintsStringPrototypeCharCodeAtSpecial0005
     * @tc.desc       : Testing the Buffer interface String with PrototypeCharAt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeCharCodeAtSpecial0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeCharCodeAtSpecial0005";
      try {
        const index = 5;
        const result = specChars.codePointAt(index);
        expect(result).assertEqual(37);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0600
     * @tc.name       : testBuilintsStringPrototypeConcatSpecial0006
     * @tc.desc       : Testing the Buffer interface String with PrototypeConcat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeConcatSpecial0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeConcatSpecial0006";
      try {
        const result = specChars.concat("Hello World");
        expect(result)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~Hello World");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0700
     * @tc.name       : testBuilintsStringPrototypeEndsWithSpecial0007
     * @tc.desc       : Testing the Buffer interface String with PrototypeEndsWith
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeEndsWithSpecial0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeEndsWithSpecial0007";
      try {
        const result = specChars.endsWith("~");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0800
     * @tc.name       : testBuilintsStringPrototypeIncludesSpecial0008
     * @tc.desc       : Testing the Buffer interface String with PrototypeIncludes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeIncludesSpecial0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeIncludesSpecial0008";
      try {
        const result = specChars.includes("~");
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_0900
     * @tc.name       : testBuilintsStringPrototypeIndexOfSpecial0009
     * @tc.desc       : Testing the Buffer interface String with PrototypeIndexOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeIndexOfSpecial0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeIndexOfSpecial0009";
      try {
        const result = specChars.indexOf("~");
        expect(result).assertEqual(94);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1100
     * @tc.name       : testBuilintsStringLastIndexOfSpecial0011
     * @tc.desc       : Testing the Buffer interface String with LastIndexOf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringLastIndexOfSpecial0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringLastIndexOfSpecial0011";
      try {
        const result = specChars.lastIndexOf("~");
        expect(result).assertEqual(94);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1200
     * @tc.name       : testBuilintsStringMatchSpecial0012
     * @tc.desc       : Testing the Buffer interface String with Match
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringMatchSpecial0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringMatchSpecial0012";
      try {
        const regex = /[A-Z]/g;
        const result = specChars.match(regex)?.toString();
        expect(result).assertEqual("A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1300
     * @tc.name       : testBuilintsStringPrototypeNormalizeSpecial0013
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeNormalizeSpecial0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeNormalizeSpecial0013";
      try {
        const result = specChars.normalize();
        expect(result).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1400
     * @tc.name       : testBuilintsStringPrototypePadEndSpecial0014
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypePadEndSpecial0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypePadEndSpecial0014";
      try {
        const result = specChars.padEnd(100, "*");
        expect(result)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~*****");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1500
     * @tc.name       : testBuilintsStringPrototypePadStartSpecial0015
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypePadStartSpecial0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypePadStartSpecial0015";
      try {
        const result = specChars.padStart(100, "*");
        expect(result)
          .assertEqual("***** ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1600
     * @tc.name       : testBuilintsStringPrototypeRepeatSpecial0016
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeRepeatSpecial0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeRepeatSpecial0016";
      try {
        const result = specChars.repeat(1);
        expect(result).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1700
     * @tc.name       : testBuilintsStringPrototypeReplaceSpecial0017
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeReplaceSpecial0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeReplaceSpecial0017";
      try {
        const result = specChars.replace("！", "?").toString();
        expect(result)
          .assertEqual(" ?\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1800
     * @tc.name       : testBuilintsStringPrototypeSearchSpecial0018
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeSearchSpecial0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeSearchSpecial0018";
      try {
        const regex = /[^\w\s']/g;
        const result = specChars.search(regex);
        expect(result).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_1900
     * @tc.name       : testBuilintsStringPrototypeSliceSpecial0019
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeSliceSpecial0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeSliceSpecial0019";
      try {
        const result = specChars.slice(0, 96);
        expect(result).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2000
     * @tc.name       : testBuilintsStringPrototypeStartsWithSpecial0020
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeStartsWithSpecial0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeStartsWithSpecial0020";
      try {
        const result = specChars.startsWith('Sat');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2100
     * @tc.name       : testBuilintsStringPrototypeSubstringSpecial0021
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeSubstringSpecial0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeSubstringSpecial0021";
      try {
        const result = specChars.substring(1, 3);
        expect(result).assertEqual("！\"");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2200
     * @tc.name       : testBuilintsStringPrototypeToLocaleLowerCaseSpecial0022
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeToLocaleLowerCaseSpecial0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testBuilintsStringPrototypeToLocaleLowerCaseSpecial0022";
        try {
          const result = specChars.toLocaleLowerCase('en-US');
          expect(result)
            .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2300
     * @tc.name       : testBuilintsStringPrototypeToLocaleUpperCaseSpecial0023
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeToLocaleUpperCaseSpecial0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
        const TAG = "testBuilintsStringPrototypeToLocaleUpperCaseSpecial0023";
        try {
          const result = specChars.toLocaleUpperCase('en-US');
          expect(result)
            .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~");
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.message}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2400
     * @tc.name       : testBuilintsStringPrototypeToLowerCaseSpecial0024
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeToLowerCaseSpecial0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeToLowerCaseSpecial0024";
      try {
        const result = specChars.toLowerCase();
        expect(result)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2500
     * @tc.name       : testBuilintsStringPrototypeToStringSpecial0025
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeToStringSpecial0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeToStringSpecial0025";
      try {
        const result = specChars.toString();
        expect(result).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2600
     * @tc.name       : testBuilintsStringPrototypeToUpperCaseSpecial0026
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeToUpperCaseSpecial0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeToUpperCaseSpecial0026";
      try {
        const result = specChars.toUpperCase();
        expect(result)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2700
     * @tc.name       : testBuilintsStringPrototypeTrimSpecial0027
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeTrimSpecial0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeTrimSpecial0027";
      try {
        const result = specChars.trim();
        expect(result)
          .assertEqual("！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2800
     * @tc.name       : testBuilintsStringPrototypeTrimEndSpecial0028
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeTrimEndSpecial0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeTrimEndSpecial0028";
      try {
        const result = specChars.trimEnd();
        expect(result)
          .assertEqual(" ！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_2900
     * @tc.name       : testBuilintsStringPrototypeTrimStartSpecial0029
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeTrimStartSpecial0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeTrimStartSpecial0029";
      try {
        const result = specChars.trimStart();
        console.log(`+++(${result})`)
        expect(result)
          .assertEqual("！\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUILINTS_SPECIAL_3000
     * @tc.name       : testBuilintsStringPrototypeValueOfSpecial0030
     * @tc.desc       : Testing the Buffer interface String with Normalize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuilintsStringPrototypeValueOfSpecial0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuilintsStringPrototypeValueOfSpecial0030";
      try {
        const result = specChars.valueOf();
        expect(result).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILJSON_SPECIAL_0100
     * @tc.name       : testUtilJsonParseSpecial0001
     * @tc.desc       : Testing the Buffer interface parse with input special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilJsonParseSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonParseSpecial0001";
      try {
        let specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let util1 = JSON.stringify(specChars);
        let util = JSON.parse(util1);
        expect(util).assertEqual(specChars);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILJSON_SPECIAL_0200
     * @tc.name       : testUtilJsonStringifySpecial0002
     * @tc.desc       : Testing the Buffer interface Stringify with input special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilJsonStringifySpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonStringifySpecial0002";
      try {
        let specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let util = JSON.stringify(specChars);
        expect(util)
          .assertEqual('" ！\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILJSON_SPECIAL_0300
     * @tc.name       : testUtilJsonStringifySpecial0003
     * @tc.desc       : Testing the Buffer interface Stringify with input special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilJsonStringifySpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonStringifySpecial0003";
      try {
        let specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let util = JSON.stringify(specChars);
        expect(util)
          .assertEqual('" ！\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILJSON_SPECIAL_0400
     * @tc.name       : testUtilJsonHasSpecial0004
     * @tc.desc       : Testing the Buffer interface Has with input special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilJsonHasSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonHasSpecial0004";
      try {
        let specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let util1: GeneratedObjectLiteralInterface_1 = {
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~': "123"
        };
        let util = JSON.has(util1, specChars);
        expect(util).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UTILJSON_SPECIAL_0500
     * @tc.name       : testUtilJsonRemoveSpecial0005
     * @tc.desc       : Testing the Buffer interface Remove with input special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilJsonRemoveSpecial0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilJsonRemoveSpecial0005";
      try {
        let util1: GeneratedObjectLiteralInterface_1 = {
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~': "123"
        };
        let specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        JSON.remove(util1, specChars);
        expect(JSON.stringify(util1)).assertEqual('{}');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_SPECIAL_0100
     * @tc.name       : testUtilsRequestSpecial0001
     * @tc.desc       : Testing the Utils interface Request with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilsRequestSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUtilsRequestSpecial0001";
      try {
        const lock1 = ArkTSUtils.locks.AsyncLock.request(specChars);
        const lock2 = ArkTSUtils.locks.AsyncLock.request(specChars);
        expect(lock1.name).assertEqual(lock2.name);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_Utils_SPECIAL_0200
     * @tc.name       : testUtilsQuerySpecial0002
     * @tc.desc       : Testing the Utils interface Query with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUtilsQuerySpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testUtilsQuerySpecial0002";
      let lock = ArkTSUtils.locks.AsyncLock.request(specChars);
      try {
        let state = ArkTSUtils.locks.AsyncLock.query(specChars);
        if (!state) {
          throw new Error('test failed：but get ' + state);
        }
        expect(state.held.length >= 0).assertTrue();
        expect(state.pending.length >= 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0100
     * @tc.name       : testXmlXmlSerializerConstructorSpecial0001
     * @tc.desc       : Test the function of the interface constructor() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlXmlSerializerConstructorSpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlSerializerConstructorSpecial0001";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(2048);
        let thatSer = new xml.XmlSerializer(arrayBuffer, specChars);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0200
     * @tc.name       : testXmlSetAttributesSpecial0002
     * @tc.desc       : Test the function of the interface setAttributes() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetAttributesSpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetAttributesSpecial0002";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(225);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes(specChars, specChars);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('<note  ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~=" ！&quot;#$%&amp;&apos;()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0300
     * @tc.name       : testXmlAddEmptyElementSpecial0003
     * @tc.desc       : Test the function of the interface addEmptyElement() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlAddEmptyElementSpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlAddEmptyElementSpecial0003";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(100);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.addEmptyElement(specChars);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('< ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~/>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0400
     * @tc.name       : testXmlStartElementSpecial0004
     * @tc.desc       : Test the function of the interface startElement() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlStartElementSpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlStartElementSpecial0004";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(204);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement(specChars);
        thatSer.setText("Happy");
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('< ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>Happy</ ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0600
     * @tc.name       : testXmlSetCommentSpecial0006
     * @tc.desc       : Test the function of the interface setComment() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCommentSpecial0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCommentSpecial0006";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(104);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setComment(specChars);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('<!-- ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~-->');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0700
     * @tc.name       : testXmlSetCDATASpecial0007
     * @tc.desc       : Test the function of the interface setCDATA() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetCDATASpecial0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetCDATASpecial0007";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(109);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setCDATA(specChars);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('<![CDATA[ ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~]]>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0800
     * @tc.name       : testXmlSetTextSpecial0008
     * @tc.desc       : Test the function of the interface setText() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetTextSpecial0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetTextSpecial0008";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(148);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.startElement("note");
        thatSer.setAttributes("importance", "high");
        thatSer.setText(specChars);
        thatSer.endElement();
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('<note importance="high"> ！&quot;#$%&amp;&apos;()*+,-./0123456789:;&lt;=&gt;?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~</note>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_0900
     * @tc.name       : testXmlSetDocTypeSpecial0009
     * @tc.desc       : Test the function of the interface setDocType() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlSetDocTypeSpecial0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlSetDocTypeSpecial0009";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let arrayBuffer = new ArrayBuffer(108);
        let thatSer = new xml.XmlSerializer(arrayBuffer);
        thatSer.setDocType(specChars);
        let uint8 = new Uint8Array(arrayBuffer);
        let result = util.TextDecoder.create().decodeToString(uint8);
        expect(result)
          .assertEqual('<!DOCTYPE  ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~>');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_XML_SPECIAL_1000
     * @tc.name       : testXmlXmlPullParserConstructorSpecial0010
     * @tc.desc       : Test the function of the interface constructor() with Special
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testXmlXmlPullParserConstructorSpecial0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testXmlXmlPullParserConstructorSpecial0010";
      try {
        const specChars =
          ' ！"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
        let strXml = '<title>Happy</title>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, specChars);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('Parameter error.Just support utf-8');
      }
    })
  })
}