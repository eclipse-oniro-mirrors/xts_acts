/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import buffer from '@ohos.buffer';
import util from '@ohos.util';


export default function stringDecoderTest() {
  describe('StringDecoderTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await Utils.msSleep(200)
    })

    afterAll(() => {})

    afterEach(() => {})

    let newArr = ['utf-8', 'ibm866', 'iso-8859-2', 'iso-8859-3', 'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
      'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
      'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
      'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'gb18030', 'big5',
      'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']

    /**
     * @tc.name   test_Decode_Test_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0100
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Decode_Test_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      newArr.forEach(item => {
        console.log('nztest', item)
        let decoder = new util.StringDecoder(item);
        let input1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
        let input2 = 'HelloWorld123?HelloWorld123?';
        const decoded1 = decoder.write(input1)
        const decoded2 = decoder.write(input2)
        if (item === 'utf-16be') {
          let input2 = 'HelloWorld123?HelloWorld123?';
        }
        expect(decoded1 === 'HelloWorld123?').assertTrue()
        expect(decoded2 === 'HelloWorld123?HelloWorld123?').assertTrue()

        let input3 = input1.slice(0, 5);
        let input33 = input1.slice(5);
        const decoded3 = decoder.write(input3)
        const decodedend3 = decoder.write(input33)
        expect(decoded3 === 'Hello').assertTrue()
        expect(decodedend3 === 'World123?').assertTrue()

        let input4 = input1.slice(0, 1);
        let input44 = input1.slice(1);
        const decoded4 = decoder.write(input4)
        const decodedend4 = decoder.write(input44)
        expect(decoded4 === 'H').assertTrue()
        expect(decodedend4 === 'elloWorld123?').assertTrue()
      })
    })

    /**
     * @tc.name   test_Decode_Test_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0200
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_Decode_Test_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let that = new util.TextEncoder('utf-16be')
      let result = that.encodeInto('HelLoWorLd123?')
      let decoder = new util.StringDecoder('utf-16be')
      const decoded1 = decoder.write(result)
      expect(decoded1).assertEqual('HelLoWorLd123?')
    })

    /**
     * @tc.name   test_Decode_Test_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0300
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_Decode_Test_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let that = new util.TextEncoder('utf-16le')
      let result = that.encodeInto('HelLoWorLd123?')
      let decoder = new util.StringDecoder('utf-16le')
      const decoded1 = decoder.write(result)
      expect(decoded1).assertEqual('HelLoWorLd123?')
    })

    /**
     * @tc.name   testArrayScenarios0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0400
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayScenarios0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testArrayScenarios0100 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let textDecoder = util.TextDecoder.create(item, {
          ignoreBOM: false
        })
        let decoded1 = textDecoder.decodeToString(uint8Array)
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00HelloWorld123?')
      })

      let textDecoderBe = util.TextDecoder.create('utf-16be', {
        ignoreBOM: false
      })
      let decodedBe = textDecoderBe.decodeToString(uint8Array)
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00H%E6%95%AC%E6%B1%AF%E5%9D%AF%E7%89%AC%E6%90%B1%E3%88%B3%EF%BF%BD')

      let textDecoderLe = util.TextDecoder.create('utf-16le', {
        ignoreBOM: false
      })
      let decodedLe = textDecoderLe.decodeToString(uint8Array)
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%E4%A0%80%E6%B1%A5%E6%BD%AC%E6%BD%97%E6%B1%B2%E3%85%A4%E3%8C%B2%EF%BF%BD')
    })

    /**
     * @tc.name   testArrayScenarios0400
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0700
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayScenarios0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = 'testArrayScenarios0400 == ';
      let buf = buffer.from([
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28,
        -7, 42, -17, 93, 24, -5, 58, -31, 82, -65,
        49, -14, 76, -39, 52, 88, -21, 63, -19, 97,
        -44, 29, -55, 81, 34, -73, 6, 47, -12, 91,
        -26, 59, -36, 85, 11, -79, 4, 51, -84, 23,
        68, -38, 54, -89, 16, 72, -3, 46, 95, -28
      ])
      console.info(TAG + `buf: ${buf.length}`)
      expect(buf.length).assertEqual(360)
      done()
    })

    /**
     * @tc.name   testArrayScenarios0600
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_0900
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayScenarios0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = 'testArrayScenarios0600 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([0, 0, 0, 0, 0, 72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let decoder = new util.StringDecoder(item)
        let decoded1 = decoder.write(uint8Array)
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00HelloWorld123?')
      })

      let decoder1 = new util.StringDecoder('utf-16be')
      let decodedBe = decoder1.write(uint8Array)
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00H%E6%95%AC%E6%B1%AF%E5%9D%AF%E7%89%AC%E6%90%B1%E3%88%B3')

      let decoder2 = new util.StringDecoder('utf-16le')
      let decodedLe = decoder2.write(uint8Array)
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%E4%A0%80%E6%B1%A5%E6%BD%AC%E6%BD%97%E6%B1%B2%E3%85%A4%E3%8C%B2')
      done()
    })

    /**
     * @tc.name   testArrayScenarios0700
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRINGDECODER_1000
     * @tc.desc   Test ENCODER and DOCODER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayScenarios0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TAG = 'testArrayScenarios0700 == ';
      let encodingArr =
        ['utf-8', 'UTF-8', 'GBK', 'GB2312', 'GB18030', 'gb18030', 'ibm866', 'iso-8859-1', 'iso-8859-2', 'iso-8859-3',
          'iso-8859-4', 'iso-8859-5', 'iso-8859-6', 'iso-8859-7',
          'iso-8859-8', 'iso-8859-8-i', 'iso-8859-10', 'iso-8859-13', 'iso-8859-14', 'iso-8859-15', 'koi8-r', 'koi8-u',
          'macintosh', 'windows-874', 'windows-1250', 'windows-1251', 'windows-1252', 'windows-1253', 'windows-1254',
          'windows-1255', 'windows-1256', 'windows-1257', 'windows-1258', 'x-mac-cyrillic', 'gbk', 'big5',
          'euc-jp', 'iso-2022-jp', 'shift_jis', 'euc-kr']
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63, 0, 0, 0, 0, 0])

      encodingArr.forEach(item => {
        console.log(TAG + "encoding", item)
        let decoder = new util.StringDecoder(item)
        let decoded1 = decoder.end(uint8Array.slice(14))
        let urlcode = encodeURI(decoded1)
        console.info(TAG + `urlcode: ${urlcode}`)
        expect(urlcode).assertEqual('%00%00%00%00%00')
      })

      let decoder1 = new util.StringDecoder('utf-16be')
      let decodedBe = decoder1.end(uint8Array.slice(14))
      let urlcodeBe = encodeURI(decodedBe)
      console.info(TAG + `urlcodeBe: ${urlcodeBe}`)
      expect(urlcodeBe).assertEqual('%00%00%EF%BF%BD')

      let decoder2 = new util.StringDecoder('utf-16le')
      let decodedLe = decoder2.end(uint8Array.slice(14))
      let urlcodeLe = encodeURI(decodedLe)
      console.info(TAG + `urlcodeLe: ${urlcodeLe}`)
      expect(urlcodeLe).assertEqual('%00%00%EF%BF%BD')
      done()
    })
  })
}
