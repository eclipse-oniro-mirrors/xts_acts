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
import { buffer } from '@kit.ArkTS';

export default function EmojiBufferTest() {
  describe('EmojiBufferTest', () => {
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
     * @tc.name   testBufferAllocEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0100
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('😊');
        expect(buf2.toString('utf-8')).assertEqual('😊😊');
        expect(buf3.toString('utf-8')).assertEqual('😊😊😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBufferAllocEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0200
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('👤');
        expect(buf2.toString('utf-8')).assertEqual('👤👤');
        expect(buf3.toString('utf-8')).assertEqual('👤👤👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0300
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('👫');
        expect(buf2.toString('utf-8')).assertEqual('👫👫');
        expect(buf3.toString('utf-8')).assertEqual('👫👫👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0400
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0004";
      try {
        const emoji = '\u260e';
        let buf1 = buffer.alloc(3, emoji, 'utf8');
        let buf2 = buffer.alloc(6, emoji, 'utf8');
        let buf3 = buffer.alloc(9, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('☎');
        expect(buf2.toString('utf-8')).assertEqual('☎☎');
        expect(buf3.toString('utf-8')).assertEqual('☎☎☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0500
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('👹');
        expect(buf2.toString('utf-8')).assertEqual('👹👹');
        expect(buf3.toString('utf-8')).assertEqual('👹👹👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0600
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('🕛');
        expect(buf2.toString('utf-8')).assertEqual('🕛🕛');
        expect(buf3.toString('utf-8')).assertEqual('🕛🕛🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0700
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('🍏');
        expect(buf2.toString('utf-8')).assertEqual('🍏🍏');
        expect(buf3.toString('utf-8')).assertEqual('🍏🍏🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0800
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('🔃');
        expect(buf2.toString('utf-8')).assertEqual('🔃🔃');
        expect(buf3.toString('utf-8')).assertEqual('🔃🔃🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_0900
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('🍁');
        expect(buf2.toString('utf-8')).assertEqual('🍁🍁');
        expect(buf3.toString('utf-8')).assertEqual('🍁🍁🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1000
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0010";
      try {
        const emoji = '\u2666';
        let buf1 = buffer.alloc(3, emoji, 'utf8');
        let buf2 = buffer.alloc(6, emoji, 'utf8');
        let buf3 = buffer.alloc(9, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('♦');
        expect(buf2.toString('utf-8')).assertEqual('♦♦');
        expect(buf3.toString('utf-8')).assertEqual('♦♦♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1100
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBufferAllocEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        let buf1 = buffer.alloc(4, emoji, 'utf8');
        let buf2 = buffer.alloc(8, emoji, 'utf8');
        let buf3 = buffer.alloc(12, emoji, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('👈');
        expect(buf2.toString('utf-8')).assertEqual('👈👈');
        expect(buf3.toString('utf-8')).assertEqual('👈👈👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferAllocEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1200
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferAllocEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0012";
      try {
        // 定义填充用的表情符号，13个字节
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';

        // 使用 'utf8' 编码，并确保字节数大小正好为所需字节数的整数倍
        let buf1 = buffer.alloc(13, emoji, 'utf8');
        let buf2 = buffer.alloc(26, emoji, 'utf8');
        let buf3 = buffer.alloc(39, emoji, 'utf8');

        console.log(`${TAG} success: ${buf1.toString('utf-8')}`);
        console.log(`${TAG} success: ${buf2.toString('utf-8')}`);
        console.log(`${TAG} success: ${buf3.toString('utf-8')}`);
        expect(buf1.toString('utf-8')).assertEqual('🤼‍♂️');
        expect(buf2.toString('utf-8')).assertEqual('🤼‍♂️🤼‍♂️');
        expect(buf3.toString('utf-8')).assertEqual('🤼‍♂️🤼‍♂️🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1300
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferByteLength0001";
      try {
        const emoji = '\ud83d\ude0a';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1400
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1500
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1600
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0004";
      try {
        const emoji = '\u260e';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1700
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1800
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0006";
      try {
        const emoji = '\ud83d\udc79';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_1900
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0007";
      try {
        const emoji = '\ud83d\udc79';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2000
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2100
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength00010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2200
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji00010";
      try {
        const emoji = '\u2666';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(3)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength00011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2300
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji00011";
      try {
        const emoji = '\ud83d\udc48';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(4)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferByteLength00012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2400
     * @tc.desc   Testing the Buffer interface buffer.byteLength with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferByteLength00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEmoji00012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let num: number = buffer.byteLength(emoji);
        expect(num).assertEqual(13)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2500
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0001";
      try {
        const emoji = '\ud83d\ude0a';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2600
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0002";
      try {
        const emoji = '\ud83d\udc64';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2700
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0003";
      try {
        const emoji = '\ud83d\udc6b';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2800
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0004";
      try {
        const emoji = '\u260e';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_2900
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0005";
      try {
        const emoji = '\ud83d\udc79';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3000
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0006";
      try {
        const emoji = '\ud83d\udd5b';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3100
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0007";
      try {
        const emoji = '\ud83c\udf4f';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3200
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0008";
      try {
        const emoji = '\ud83d\udd03';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3300
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding0009";
      try {
        const emoji = '\ud83c\udf41';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding00010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3400
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding00010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding00010";
      try {
        const emoji = '\u2666';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding00011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3500
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding00011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding00011";
      try {
        const emoji = '\ud83d\udc48';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testBufferIsEncoding00012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_3600
     * @tc.desc   Testing the Buffer interface buffer.isEncoding with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferIsEncoding00012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncoding00012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let flag: boolean = buffer.isEncoding(emoji);
        expect(flag).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.name   testfillEmoji_0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_3700
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0001";
      try {
        const emoji = '\ud83d\ude0a';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("😊ð");
        expect(result2.toString()).assertEqual("😊😊ð");
        expect(result3.toString()).assertEqual("😊😊😊ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_3800
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0002";
      try {
        const emoji = '\ud83d\udc64';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("👤ð");
        expect(result2.toString()).assertEqual("👤👤ð");
        expect(result3.toString()).assertEqual("👤👤👤ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_3900
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0003";
      try {
        const emoji = '\ud83d\udc6b';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("👫ð");
        expect(result2.toString()).assertEqual("👫👫ð");
        expect(result3.toString()).assertEqual("👫👫👫ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4000
     * @tc.desc   Test the Buffer interface fill with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0004";
      try {
        const emoji = '\u260e';
        let result1 = buffer.allocUninitializedFromPool(5).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(8).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(11).fill(emoji);
        expect(result1.toString()).assertEqual("☎â");
        expect(result2.toString()).assertEqual("☎☎â");
        expect(result3.toString()).assertEqual("☎☎☎â");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4100
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0005";
      try {
        const emoji = '\ud83d\udc79';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("👹ð");
        expect(result2.toString()).assertEqual("👹👹ð");
        expect(result3.toString()).assertEqual("👹👹👹ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4200
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0006";
      try {
        const emoji = '\ud83d\udd5b';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("🕛ð");
        expect(result2.toString()).assertEqual("🕛🕛ð");
        expect(result3.toString()).assertEqual("🕛🕛🕛ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4300
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0007";
      try {
        const emoji = '\ud83c\udf4f';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("🍏ð");
        expect(result2.toString()).assertEqual("🍏🍏ð");
        expect(result3.toString()).assertEqual("🍏🍏🍏ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4400
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0008";
      try {
        const emoji = '\ud83d\udd03';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("🔃ð");
        expect(result2.toString()).assertEqual("🔃🔃ð");
        expect(result3.toString()).assertEqual("🔃🔃🔃ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4500
     * @tc.desc   Test the Buffer interface fill with input emoji  \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0009";
      try {
        const emoji = '\ud83c\udf41';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("🍁ð");
        expect(result2.toString()).assertEqual("🍁🍁ð");
        expect(result3.toString()).assertEqual("🍁🍁🍁ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4600
     * @tc.desc   Test the Buffer interface fill with input emoji \u2666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0010";
      try {
        const emoji = '\u2666';
        let result1 = buffer.allocUninitializedFromPool(5).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(8).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(11).fill(emoji);
        expect(result1.toString()).assertEqual("♦â");
        expect(result2.toString()).assertEqual("♦♦â");
        expect(result3.toString()).assertEqual("♦♦♦â");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4700
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0011";
      try {
        const emoji = '\ud83d\udc48';
        let result1 = buffer.allocUninitializedFromPool(6).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(10).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(14).fill(emoji);
        expect(result1.toString()).assertEqual("👈ð");
        expect(result2.toString()).assertEqual("👈👈ð");
        expect(result3.toString()).assertEqual("👈👈👈ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testfillEmoji_0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4800
     * @tc.desc   Test the Buffer interface fill with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testfillEmoji_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEmoji_0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let result1 = buffer.allocUninitializedFromPool(15).fill(emoji);
        let result2 = buffer.allocUninitializedFromPool(28).fill(emoji);
        let result3 = buffer.allocUninitializedFromPool(41).fill(emoji);
        expect(result1.toString()).assertEqual("🤼‍♂️ð");
        expect(result2.toString()).assertEqual("🤼‍♂️🤼‍♂️ð");
        expect(result3.toString()).assertEqual("🤼‍♂️🤼‍♂️🤼‍♂️ð");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_4900
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0001";
      try {
        const emoji = '\ud83d\ude0a';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5000
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0002";
      try {
        const emoji = '\ud83d\udc64';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5100
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0003";
      try {
        const emoji = '\ud83d\udc6b';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5200
     * @tc.desc   Test the Buffer interface includes with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0004";
      try {
        const emoji = '\u260e';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5300
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0005";
      try {
        const emoji = '\ud83d\udc79';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5400
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0006";
      try {
        const emoji = '\ud83d\udd5b';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5500
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0007";
      try {
        const emoji = '\ud83c\udf4f';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5600
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0008";
      try {
        const emoji = '\ud83d\udd03';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5700
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0009";
      try {
        const emoji = '\ud83c\udf41';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5800
     * @tc.desc   Test the Buffer interface includes with input emoji \u2666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0010";
      try {
        const emoji = '\u2666';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_5900
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0011";
      try {
        const emoji = '\ud83d\udc48';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testincludesEmoji_0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_Buffer_EMOJI_6000
     * @tc.desc   Test the Buffer interface includes with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testincludesEmoji_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEmoji_0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let buf = buffer.from(emoji);
        let result = buf.includes(buf);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferIndexOfEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6100
     * @tc.desc   Test the function of the Interface emoji  😊  \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('😊')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6200
     * @tc.desc   Test the function of the Interface emoji  👤  \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('👤')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6300
     * @tc.desc   Test the function of the Interface emoji  👫  \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('👫')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6400
     * @tc.desc   Test the function of the Interface emoji  ☎  \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0004";
      try {
        const emoji = '\u260e';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('☎')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6500
     * @tc.desc   Test the function of the Interface emoji  👹  \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('👹')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6600
     * @tc.desc   Test the function of the Interface emoji  🕛  \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('🕛')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6700
     * @tc.desc   Test the function of the Interface emoji  🍏  \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('🍏')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6800
     * @tc.desc   Test the function of the Interface emoji  🔃  \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('🔃')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_6900
     * @tc.desc   Test the function of the Interface emoji  🍁  \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('🍁')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_7000
     * @tc.desc   Test the function of the Interface emoji  ♦   \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0010";
      try {
        const emoji = '\u2666';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('♦')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_7100
     * @tc.desc   Test the function of the Interface emoji  👈  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('👈')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferIndexOfEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Emoji_7200
     * @tc.desc   Test the function of the Interface emoji  🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferIndexOfEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.indexOf('🤼‍♂️')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBufferLastIndexOfEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7300
     * @tc.desc   Test the function of the Interface emoji  😊  \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0001";
      try {
        const emoji = '\ud83d\ude0a';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('😊')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7400
     * @tc.desc   Test the function of the Interface emoji  👤  \ud83d\udc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0002";
      try {
        const emoji = '\ud83d\udc64';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('👤')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7500
     * @tc.desc   Test the function of the Interface emoji  👫  \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0003";
      try {
        const emoji = '\ud83d\udc6b';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('👫')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7600
     * @tc.desc   Test the function of the Interface emoji  ☎  \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0004";
      try {
        const emoji = '\u260e';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('☎')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOffEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7700
     * @tc.desc   Test the function of the Interface emoji  👹  \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOffEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0005";
      try {
        const emoji = '\ud83d\udc79';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('👹')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7800
     * @tc.desc   Test the function of the Interface emoji  🕛  \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0006";
      try {
        const emoji = '\ud83d\udd5b';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('🕛')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_7900
     * @tc.desc   Test the function of the Interface emoji  🍏  \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0007";
      try {
        const emoji = '\ud83c\udf4f';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('🍏')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_8000
     * @tc.desc   Test the function of the Interface emoji  🔃  \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0008";
      try {
        const emoji = '\ud83d\udd03';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('🔃')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_8100
     * @tc.desc   Test the function of the Interface emoji  🍁  \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0009";
      try {
        const emoji = '\ud83c\udf41';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('🍁')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_8200
     * @tc.desc   Test the function of the Interface emoji  ♦   \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0010";
      try {
        const emoji = '\u2666';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('♦')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_8300
     * @tc.desc   Test the function of the Interface emoji  👈  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0011";
      try {
        const emoji = '\ud83d\udc48';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('👈')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBufferLastIndexOfEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Emoji_8300
     * @tc.desc   Test the function of the Interface emoji  🤼‍♂️ \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testBufferLastIndexOfEmoji0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEmoji0012";
      try {
        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        console.log(`${TAG} success: ${emoji}`);
        let result = emoji.lastIndexOf('🤼‍♂️')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBuffertoJSONEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_8500
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0001";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x98, 0x8A]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,152,138]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_8600
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0002";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x91, 0x94]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,145,148]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_8700
     * @tc.desc   Test the function of the interface toJSON with input emoji  \ud83d\udc6b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0003";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x91, 0xAB]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,145,171]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_8800
     * @tc.desc   Test the function of the interface toJSON with input emoji \u260e .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0004";
      try {
        let buf1 = buffer.from([0xE2, 0x98, 0x8E]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[226,152,142]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_8900
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83d\udc79 .
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0005";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x91, 0xB9]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,145,185]}");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9000
     * @tc.desc   Test the function of the interface toJSON with input emoji  \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0006";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x95, 0xBB]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,149,187]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9100
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0007";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x8D, 0x8F]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,141,143]}");
        ;

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9200
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0008";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x94, 0x83]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,148,131]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9300
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0009";
      try {
        let buf1 = buffer.from([0xF0, 0x9F, 0x8D, 0x81]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,141,129]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   testBuffertoJSONEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9400
     * @tc.desc   Test the function of the interface toJSON with input emoji \u2666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0010";
      try {
        let buf1 = buffer.from([0xE2, 0x99, 0xA6]);
        let obj = buf1.toJSON();
        console.log('Buffer toJSON result:', JSON.stringify(obj));
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[226,153,166]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9500
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0011";
      try {
        let buf1 = buffer.from([0xf0, 0x9f, 0x91, 0x88]);
        let obj = buf1.toJSON();
        expect(JSON.stringify(obj)).assertEqual("{\"type\":\"Buffer\",\"data\":[240,159,145,136]}");

      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoJSONEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9600
     * @tc.desc   Test the function of the interface toJSON with input emoji \ud83e\udd3c\u200d\u2642\ufe0f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoJSONEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoJSONEmoji0012";
      try {

        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let buf1 = buffer.from(emoji, 'utf-8');
        let obj = buf1.toJSON();
        console.log('Buffer toJSON result:', JSON.stringify(obj));
        expect(typeof obj).assertEqual('object');
        expect(buf1.toString('utf-8')).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9700
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\ude0a.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0001";
      try {

        const emoji = '\ud83d\ude0a';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9800
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0002";
      try {

        const emoji = '\ud83d\udc64';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('👤');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_9900
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udc64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0003";
      try {

        const emoji = '\ud83d\udc6b';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('👫');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10000
     * @tc.desc   Test the function of the interface toString with input emoji \u260e.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0004";
      try {

        const emoji = '\u260e';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('☎');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10100
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udc79.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0005";
      try {

        const emoji = '\ud83d\udc79';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('👹');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10200
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udd5b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0006";
      try {

        const emoji = '\ud83d\udd5b';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('🕛');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10300
     * @tc.desc   Test the function of the interface toString with input emoji \ud83c\udf4f.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0007";
      try {

        const emoji = '\ud83c\udf4f';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('🍏');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10400
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udd03.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0008";
      try {

        const emoji = '\ud83d\udd03';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('🔃');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10500
     * @tc.desc   Test the function of the interface toString with input emoji \ud83c\udf41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0009";
      try {

        const emoji = '\ud83c\udf41';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('🍁');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10600
     * @tc.desc   Test the function of the interface toString with input emoji \u2666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0010";
      try {

        const emoji = '\u2666';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('♦');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10700
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0011";
      try {

        const emoji = '\ud83d\udc48';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('👈');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testBuffertoStringEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10800
     * @tc.desc   Test the function of the interface toString with input emoji \ud83d\udc48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertoStringEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEmoji0012";
      try {

        const emoji = '\ud83e\udd3c\u200d\u2642\ufe0f';
        let buf1 = buffer.from(emoji, 'utf-8');
        expect(buf1.toString('utf-8')).assertEqual('🤼‍♂️');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    })
    /**
     * @tc.name   testBufferwriteEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_10900
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0001";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\ude0a'
        let length1 = buf.write('😊', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11000
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\uc64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0002";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udc64'
        let length1 = buf.write('👤', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11100
     * @tc.desc   Testing the Buffer interface Alloc with input emoji  \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0003";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udc6b'
        let length1 = buf.write('👫', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11200
     * @tc.desc   Testing the Buffer interface Alloc with input emoji   \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0004";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\u260e'
        let length1 = buf.write('☎', 0);
        expect(length1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11300
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0005";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udc79 '
        let length1 = buf.write('👹', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11400
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0006";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udd5b '
        let length1 = buf.write('🕛', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11500
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0007";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83c\udf4f'
        let length1 = buf.write('🍏', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11600
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0008";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udd03'
        let length1 = buf.write('🔃', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11700
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0009";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83c\udf41'
        let length1 = buf.write('🍁', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11800
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0010";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\u2666'
        let length1 = buf.write('♦', 0);
        expect(length1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_11900
     * @tc.desc   Testing the Buffer interface Alloc with input emoji  \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0011";
      try {
        let buf = buffer.alloc(256);
        const emoji = '\ud83d\udc48'
        let length1 = buf.write('👈', 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBufferwriteEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12000
     * @tc.desc   Testing the Buffer interface Alloc with input emoji   \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBufferwriteEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteEmoji0012";
      try {
        let buf = buffer.alloc(256);
        const emoji = ' \ud83e\udd3c\u200d\u2642\ufe0f'
        let length1 = buf.write('🤼‍♂️', 0);
        expect(length1).assertEqual(13);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12100
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0001";
      try {
        let blob = new buffer.Blob(['😊']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '😊',got'${val}'`);
          expect(val).assertEqual('😊');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12200
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\ude0a
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0002";
      try {
        let blob = new buffer.Blob(['👤']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '👤',got'${val}'`);
          expect(val).assertEqual('👤');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12300
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc6b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0003";
      try {
        let blob = new buffer.Blob(['👫']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '👫',got'${val}'`);
          expect(val).assertEqual('👫');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12400
     * @tc.desc   Testing the Buffer interface Alloc with input emoji  \u260e
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0004";
      try {
        let blob = new buffer.Blob(['☎']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '☎',got'${val}'`);
          expect(val).assertEqual('☎');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12500
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc79
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0005";
      try {
        let blob = new buffer.Blob(['👹']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '👹',got'${val}'`);
          expect(val).assertEqual('👹');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12700
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd5b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0006";
      try {
        let blob = new buffer.Blob(['🕛']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '🕛',got'${val}'`);
          expect(val).assertEqual('🕛');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12800
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udd03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0007";
      try {
        let blob = new buffer.Blob(['🍏']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '🍏',got'${val}'`);
          expect(val).assertEqual('🍏');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_12900
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf4f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0008";
      try {
        let blob = new buffer.Blob(['🔃']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '🔃',got'${val}'`);
          expect(val).assertEqual('🔃');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_13000
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83c\udf41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0009";
      try {
        let blob = new buffer.Blob(['🍁']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '🍁',got'${val}'`);
          expect(val).assertEqual('🍁');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_13100
     * @tc.desc   Testing the Buffer interface Alloc with input emoji  \u2666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0010";
      try {
        let blob = new buffer.Blob(['♦']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '♦',got'${val}'`);
          expect(val).assertEqual('♦');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_13200
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83d\udc48
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0011";
      try {
        let blob = new buffer.Blob(['👈']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '👈',got'${val}'`);
          expect(val).assertEqual('👈');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.name   testBuffertextEmoji0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_EMOJI_13300
     * @tc.desc   Testing the Buffer interface Alloc with input emoji \ud83e\udd3c\u200d\u2642\ufe0f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBuffertextEmoji0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertextEmoji0012";
      try {
        let blob = new buffer.Blob(['🤼‍♂️']);
        let pro = blob.text();
        pro.then((val: string) => {
          console.log(`Test case : Expected '🤼‍♂️',got'${val}'`);
          expect(val).assertEqual('🤼‍♂️');
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
  })
}