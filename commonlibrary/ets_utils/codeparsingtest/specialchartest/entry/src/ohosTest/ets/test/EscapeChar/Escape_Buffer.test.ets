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

export default function EscapeBufferTest() {
  describe('EscapeBufferTest', () => {
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
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0100
     * @tc.name       : testBufferAllocEscape0001
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0001";
      try {
        const escape = 'aaa\b';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0200
     * @tc.name       : testBufferAllocEscape0002
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0002";
      try {
        const escape = 'aaa\f';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0300
     * @tc.name       : testBufferAllocEscape0003
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0003";
      try {
        const escape = 'aaa\n';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0400
     * @tc.name       : testBufferAllocEscape0004
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0004";
      try {
        const escape = 'aaa\r';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0500
     * @tc.name       : testBufferAllocEscape0005
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0005";
      try {
        const escape = 'aaa\t';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0600
     * @tc.name       : testBufferAllocEscape0006
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0006";
      try {
        const escape = 'aaa\v';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0700
     * @tc.name       : testBufferAllocEscape0007
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0007";
      try {
        const escape = 'aaa\x24';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0800
     * @tc.name       : testBufferAllocEscape0008
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0008";
      try {
        const escape = '\开';
        let buf1 = buffer.alloc(3, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_0900
     * @tc.name       : testBufferAllocEscape0009
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0009";
      try {
        const escape = '\😊';
        let buf1 = buffer.alloc(4, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1000
     * @tc.name       : testBufferAllocEscape0010
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBufferAllocEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testBufferAllocEscape0010";
      try {
        const escape = '\0';
        let buf1 = buffer.alloc(2, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual("\0\0");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1100
     * @tc.name       : testBufferAllocEscape0011
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferAllocEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0011";
      try {
        const escape = '\\b';
        let buf1 = buffer.alloc(2, escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1200
     * @tc.name       : testBufferbyteLengthEscape0001
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0001";
      try {
        const escape = 'aaa\b';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1300
     * @tc.name       : testBufferbyteLengthEscape0002
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0002";
      try {
        const escape = 'aaa\f';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1400
     * @tc.name       : testBufferbyteLengthEscape0003
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0003";
      try {
        const escape = 'aaa\n';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1500
     * @tc.name       : testBufferbyteLengthEscape0004
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0004";
      try {
        const escape = 'aaa\r';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1600
     * @tc.name       : testBufferbyteLengthEscape0005
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0005";
      try {
        const escape = 'aaa\t';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1700
     * @tc.name       : testBufferbyteLengthEscape0006
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0006";
      try {
        const escape = 'aaa\v';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1800
     * @tc.name       : testBufferbyteLengthEscape0007
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0007";
      try {
        const escape = 'aaa\x24';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_1900
     * @tc.name       : testBufferbyteLengthEscape0008
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0008";
      try {
        const escape = '\开';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2000
     * @tc.name       : testBufferbyteLengthEscape0009
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0009";
      try {
        const escape = '\😊';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2100
     * @tc.name       : testBufferbyteLengthEscape0010
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0010";
      try {
        const escape = '\0';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2200
     * @tc.name       : testBufferbyteLengthEscape0011
     * @tc.desc       : Testing the Buffer interface byteLength with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferbyteLengthEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferAllocEscape0011";
      try {
        const escape = '\\b';
        let buf1 = buffer.byteLength(escape, 'utf8');
        expect(buf1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2300
     * @tc.name       : testBufferCompareEscape0001
     * @tc.desc       : Testing the Buffer interface Compare with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0001";
      try {
        const escape = 'aaa\b';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2400
     * @tc.name       : testBufferCompareEscape0002
     * @tc.desc       : Testing the Buffer interface Compare with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0002";
      try {
        const str1 = 'aaa\f';
        const str2 = 'aa';
        let buf1 = buffer.from(str1, 'utf8');
        let buf2 = buffer.from(str2, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2500
     * @tc.name       : testBufferCompareEscape0003
     * @tc.desc       : Testing the Buffer interface Compare with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0003";
      try {
        const escape = 'aaa\n';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2600
     * @tc.name       : testBufferCompareEscape0004
     * @tc.desc       : Testing the Buffer interface Compare with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0004";
      try {
        const escape = 'aaa\r';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2700
     * @tc.name       : testBufferCompareEscape0005
     * @tc.desc       : Testing the Buffer interface Compare with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0005";
      try {
        const escape = 'aaa\t';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2800
     * @tc.name       : testBufferCompareEscape0006
     * @tc.desc       : Testing the Buffer interface Compare with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0006";
      try {
        const escape = 'aaa\v';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_2900
     * @tc.name       : testBufferCompareEscape0007
     * @tc.desc       : Testing the Buffer interface Compare with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0007";
      try {
        const escape = 'aaa\x24';
        const escape1 = 'aa';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3000
     * @tc.name       : testBufferCompareEscape0008
     * @tc.desc       : Testing the Buffer interface Compare with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0008";
      try {
        const escape = '\开';
        const escape1 = '开';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3100
     * @tc.name       : testBufferCompareEscape0009
     * @tc.desc       : Testing the Buffer interface Compare with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0009";
      try {
        const escape = '\😊';
        const escape1 = '😊';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3200
     * @tc.name       : testBufferCompareEscape0010
     * @tc.desc       : Testing the Buffer interface Compare with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0010";
      try {
        const escape = '\0';
        const escape1 = 'null';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3300
     * @tc.name       : testBufferCompareEscape0011
     * @tc.desc       : Testing the Buffer interface Compare with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferCompareEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferCompareEscape0011";
      try {
        const escape = '\0';
        const escape1 = 'null';
        let buf1 = buffer.from(escape, 'utf8');
        let buf2 = buffer.from(escape1, 'utf8');
        let res = buf1.compare(buf2);
        expect(res).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3400
     * @tc.name       : testBufferFromEscape0001
     * @tc.desc       : Testing the Buffer interface From with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0001";
      try {
        const escape = 'aaa\b';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3500
     * @tc.name       : testBufferFromEscape0002
     * @tc.desc       : Testing the Buffer interface From with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0002";
      try {
        const escape = 'aaa\f';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3600
     * @tc.name       : testBufferFromEscape0003
     * @tc.desc       : Testing the Buffer interface From with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0003";
      try {
        const escape = 'aaa\n';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3700
     * @tc.name       : testBufferFromEscape0004
     * @tc.desc       : Testing the Buffer interface From with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0004";
      try {
        const escape = 'aaa\r';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3800
     * @tc.name       : testBufferFromEscape0005
     * @tc.desc       : Testing the Buffer interface From with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0005";
      try {
        const escape = 'aaa\t';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_3900
     * @tc.name       : testBufferFromEscape0006
     * @tc.desc       : Testing the Buffer interface From with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0006";
      try {
        const escape = 'aaa\v';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4000
     * @tc.name       : testBufferFromEscape0007
     * @tc.desc       : Testing the Buffer interface From with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0007";
      try {
        const escape = 'aaa\x24';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4100
     * @tc.name       : testBufferFromEscape0008
     * @tc.desc       : Testing the Buffer interface From with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0008";
      try {
        const escape = '\开';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4200
     * @tc.name       : testBufferFromEscape0009
     * @tc.desc       : Testing the Buffer interface From with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0009";
      try {
        const escape = '\😊';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4300
     * @tc.name       : testBufferFromEscape0010
     * @tc.desc       : Testing the Buffer interface Alloc with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0010";
      try {
        const escape = '\0';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('\0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4400
     * @tc.name       : testBufferFromEscape0011
     * @tc.desc       : Testing the Buffer interface From with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferFromEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferFromEscape0011";
      try {
        const escape = '\\b';
        let buf1 = buffer.from(escape, 'utf8');
        expect(buf1.toString('utf-8')).assertEqual('\\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4500
     * @tc.name       : testBufferIsEncodingEscape0001
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0001";
      try {
        const escape = 'aaa\b';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4600
     * @tc.name       : testBufferIsEncodingEscape0002
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0002";
      try {
        const escape = 'aaa\f';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4700
     * @tc.name       : testBufferIsEncodingEscape0003
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0003";
      try {
        const escape = 'aaa\n';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4800
     * @tc.name       : testBufferIsEncodingEscape0004
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0004";
      try {
        const escape = 'aaa\r';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_4900
     * @tc.name       : testBufferIsEncodingEscape0005
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0005";
      try {
        const escape = 'aaa\t';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5000
     * @tc.name       : testBufferIsEncodingEscape0006
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0006";
      try {
        const escape = 'aaa\v';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5100
     * @tc.name       : testBufferIsEncodingEscape0007
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0007";
      try {
        const escape = 'aaa\x24';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5200
     * @tc.name       : testBufferIsEncodingEscape0008
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0008";
      try {
        const escape = '\开';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5300
     * @tc.name       : testBufferIsEncodingEscape0009
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0009";
      try {
        const escape = '\😊';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5400
     * @tc.name       : testBufferIsEncodingEscape0010
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0010";
      try {
        const escape = '\0';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5500
     * @tc.name       : testBufferIsEncodingEscape0011
     * @tc.desc       : Testing the Buffer interface IsEncoding with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferIsEncodingEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIsEncodingEscape0011";
      try {
        const escape = '\\b';
        let buf1: boolean = buffer.isEncoding(escape);
        expect(buf1).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5600
     * @tc.name       : testfillEscape0001
     * @tc.desc       : Testing the Buffer interface fill with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0001";
      try {
        const escape = 'aaa\b';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5700
     * @tc.name       : testfillEscape0002
     * @tc.desc       : Testing the Buffer interface fill with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0002";
      try {
        const escape = 'aaa\f';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5800
     * @tc.name       : testfillEscape0003
     * @tc.desc       : Testing the Buffer interface fill with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0003";
      try {
        const escape = 'aaa\n';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_5900
     * @tc.name       : testfillEscape0004
     * @tc.desc       : Testing the Buffer interface fill with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0004";
      try {
        const escape = 'aaa\r';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6000
     * @tc.name       : testfillEscape0005
     * @tc.desc       : Testing the Buffer interface fill with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0005";
      try {
        const escape = 'aaa\t';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6100
     * @tc.name       : testfillEscape0006
     * @tc.desc       : Testing the Buffer interface fill with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0006";
      try {
        const escape = 'aaa\v';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6200
     * @tc.name       : testfillEscape0007
     * @tc.desc       : Testing the Buffer interface fill with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0007";
      try {
        const escape = 'aaa\x24';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6300
     * @tc.name       : testfillEscape0008
     * @tc.desc       : Testing the Buffer interface fill with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0008";
      try {
        const escape = '\开';
        let result1 = buffer.allocUninitializedFromPool(3).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual('开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6400
     * @tc.name       : testfillEscape0009
     * @tc.desc       : Testing the Buffer interface fill with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0009";
      try {
        const escape = '\😊';
        let result1 = buffer.allocUninitializedFromPool(4).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6500
     * @tc.name       : testfillEscape0010
     * @tc.desc       : Testing the Buffer interface fill with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0010";
      try {
        const escape = 'aa\0';
        let result1 = buffer.allocUninitializedFromPool(2).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString()).assertEqual("aa");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6600
     * @tc.name       : testfillEscape0011
     * @tc.desc       : Testing the Buffer interface fill with input escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testfillEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testfillEscape0011";
      try {
        const escape = '\\b';
        let result1 = buffer.allocUninitializedFromPool(2).fill(escape);
        console.log(`${TAG} success: ${result1.toString('utf-8')}`);
        expect(result1.toString('utf-8')).assertEqual(escape);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6700
     * @tc.name       : testincludesEscape0001
     * @tc.desc       : Testing the Buffer interface fill with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0001";
      try {
        const escape = 'aaa\b';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6800
     * @tc.name       : testincludesEscape0002
     * @tc.desc       : Testing the Buffer interface fill with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0002";
      try {
        const escape = 'aaa\f';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_6900
     * @tc.name       : testincludesEscape0003
     * @tc.desc       : Testing the Buffer interface fill with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0003";
      try {
        const escape = 'aaa\n';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7000
     * @tc.name       : testincludesEscape0004
     * @tc.desc       : Testing the Buffer interface fill with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0004";
      try {
        const escape = 'aaa\r';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7100
     * @tc.name       : testincludesEscape0005
     * @tc.desc       : Testing the Buffer interface fill with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0005";
      try {
        const escape = 'aaa\t';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7200
     * @tc.name       : testincludesEscape0006
     * @tc.desc       : Testing the Buffer interface fill with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0006";
      try {
        const escape = 'aaa\v';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7300
     * @tc.name       : testincludesEscape0007
     * @tc.desc       : Testing the Buffer interface fill with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0007";
      try {
        const escape = 'aaa\x24';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7400
     * @tc.name       : testincludesEscape0008
     * @tc.desc       : Testing the Buffer interface fill with input escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0008";
      try {
        const escape = '\开';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7500
     * @tc.name       : testincludesEscape0009
     * @tc.desc       : Testing the Buffer interface fill with input escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0009";
      try {
        const escape = '\😊';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7600
     * @tc.name       : testincludesEscape0010
     * @tc.desc       : Testing the Buffer interface fill with input escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0010";
      try {
        const escape = '\0';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_7700
     * @tc.name       : testincludesEscape0011
     * @tc.desc       : Testing the Buffer interface fill with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testincludesEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testincludesEscape0011";
      try {
        const escape = '\b';
        let buf = buffer.from(escape);
        let result = buf.includes(buf);
        console.log(`${TAG} success: ${result.toString()}`);
        expect(result.toString()).assertEqual("true");
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_7800
     * @tc.name       : testBufferIndexOfEmoji0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEmoji0001";
      try {
        const escape = '\b';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_7900
     * @tc.name       : testBufferIndexOfEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0002";
      try {
        const escape = '\f';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8000
     * @tc.name       : testBufferIndexOfEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0003";
      try {
        const escape = '\n';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8100
     * @tc.name       : testBufferIndexOfEscape0004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0004";
      try {
        const escape = '\r';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8200
     * @tc.name       : testBufferIndexOfEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0005";
      try {
        const escape = '\t';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8300
     * @tc.name       : testBufferIndexOfEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0006";
      try {
        const escape = '\v';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8400
     * @tc.name       : testBufferIndexOfEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0007";
      try {
        const escape = '\x24';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8500
     * @tc.name       : testBufferIndexOfEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0008";
      try {
        const escape = '\开';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8600
     * @tc.name       : testBufferIndexOfEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0009";
      try {
        const escape = '\😊';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8700
     * @tc.name       : testBufferIndexOfEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0010";
      try {
        const escape = '\0';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_indexOf_Escape_8800
     * @tc.name       : testBufferIndexOfEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferIndexOfEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferIndexOfEscape0011";
      try {
        const escape = '\\b';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.indexOf(escape)
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_8900
     * @tc.name       : testBufferLastIndexOfEscape0001
     * @tc.desc       : Test the function of the Interface escape \b.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEscape0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0001";
      try {
        const escape = '\b';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\b')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9000
     * @tc.name       : testBufferLastIndexOfEscape0002
     * @tc.desc       : Test the function of the Interface escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0002";
      try {
        const escape = '\f';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\f')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9100
     * @tc.name       : testBufferLastIndexOfEscape0003
     * @tc.desc       : Test the function of the Interface escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0003";
      try {
        const escape = '\n';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\n')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9200
     * @tc.name       : testBufferLastIndexOfEscape004
     * @tc.desc       : Test the function of the Interface escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEscape004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape004";
      try {
        const escape = '\r';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\r')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9300
     * @tc.name       : testBufferLastIndexOfEscape0005
     * @tc.desc       : Test the function of the Interface escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0005";
      try {
        const escape = '\t';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\t')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9400
     * @tc.name       : testBufferIndexOfEscape0006
     * @tc.desc       : Test the function of the Interface escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0006";
      try {
        const escape = '\v';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\v')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9500
     * @tc.name       : testBufferLastIndexOfEscape0007
     * @tc.desc       : Test the function of the Interface escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0007";
      try {
        const escape = '\x24';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\x24')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9600
     * @tc.name       : testBufferLastIndexOfEscape0008
     * @tc.desc       : Test the function of the Interface escape \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0008";
      try {
        const escape = '\开';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\开')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9700
     * @tc.name       : testBufferIndexOfEscape0009
     * @tc.desc       : Test the function of the Interface escape \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0009";
      try {
        const escape = '\😊';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\😊')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9800
     * @tc.name       : testBufferLastIndexOfEscape0010
     * @tc.desc       : Test the function of the Interface escape \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0010";
      try {
        const escape = '\0';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\0')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_LastIndexOf_Escape_9900
     * @tc.name       : testBufferLastIndexOfEscape0011
     * @tc.desc       : Test the function of the Interface escape \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testBufferLastIndexOfEmoji0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferLastIndexOfEscape0011";
      try {
        const escape = '\\b';
        console.log(`${TAG} success: ${escape}`);
        let result = escape.lastIndexOf('\\b')
        expect(result).assertEqual(0);
      } catch (error) {
        console.error(`${TAG} failed,error: ${error.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10000
     * @tc.name       : testBuffertoStringEscape0001
     * @tc.desc       : Testing the Buffer interface toString with input escape \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0001";
      try {
        let buf1 = buffer.from([0x08]);
        expect(buf1.toString('utf-8')).assertEqual('\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10100
     * @tc.name       : testBuffertoStringEscape0002
     * @tc.desc       : Testing the Buffer interface toString with input escape \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0002";
      try {
        let buf1 = buffer.from([0x0C]);
        expect(buf1.toString('utf-8')).assertEqual('\f');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10200
     * @tc.name       : testBuffertoStringEscape0003
     * @tc.desc       : Testing the Buffer interface toString with input escape \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0003";
      try {
        let buf1 = buffer.from([0x0A]);
        expect(buf1.toString('utf-8')).assertEqual('\n');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10300
     * @tc.name       : testBuffertoStringEscape0004
     * @tc.desc       : Testing the Buffer interface toString with input escape \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0004";
      try {
        let buf1 = buffer.from([0x0D]);
        expect(buf1.toString('utf-8')).assertEqual('\r');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_104000
     * @tc.name       : testBuffertoStringEscape0005
     * @tc.desc       : Testing the Buffer interface toString with input escape \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0005";
      try {
        let buf1 = buffer.from([0x09]);
        expect(buf1.toString('utf-8')).assertEqual('\t');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10500
     * @tc.name       : testBuffertoStringEscape0006
     * @tc.desc       : Testing the Buffer interface toString with input escape \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0006";
      try {
        let buf1 = buffer.from([0x0B]);
        expect(buf1.toString('utf-8')).assertEqual('\v');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10600
     * @tc.name       : testBuffertoStringEscape0007
     * @tc.desc       : Testing the Buffer interface toString with input escape \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0007";
      try {
        let buf1 = buffer.from([0x24]);
        expect(buf1.toString('utf-8')).assertEqual('\x24');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10700
     * @tc.name       : testBuffertoStringEscape0008
     * @tc.desc       : Testing the Buffer interface toString with input escape \开 == 开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0008";
      try {
        let buf1 = buffer.from('\\开== 开');
        expect(buf1.toString('utf-8')).assertEqual('\\开== 开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10800
     * @tc.name       : testBuffertoStringEscape0009
     * @tc.desc       : Testing the Buffer interface toString with input escape \😊 == 😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0009";
      try {
        let buf1 = buffer.from('\\😊 == 😊');
        expect(buf1.toString('utf-8')).assertEqual('\\😊 == 😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_10900
     * @tc.name       : testBuffertoStringEscape0010
     * @tc.desc       : Testing the Buffer interface toString with input escape \0 == null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0010";
      try {
        let buf1 = buffer.from([0x00]);
        expect(buf1.toString('utf-8').charCodeAt(0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_11000
     * @tc.name       : testBuffertoStringEscape0011
     * @tc.desc       : Testing the Buffer interface toString with input escape \\b == \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertoStringEscape0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBuffertoStringEscape0011";
      try {
        let buf1 = buffer.from([0x5C, 0x62]);
        expect(buf1.toString('utf-8')).assertEqual('\\b');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11100
     * @tc.name       : testBufferwriteESCAPE0001
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0001";
      try {
        const escape = 'aaa\b'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11200
     * @tc.name       : testBufferwriteESCAPE0002
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0002";
      try {
        const escape = 'aaa\f'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11300
     * @tc.name       : testBufferwriteESCAPE0003
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE 换行
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0003";
      try {
        const escape = 'aaa\n'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11400
     * @tc.name       : testBufferwriteESCAPE0004
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0004";
      try {
        const escape = 'aaa\r'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11500
     * @tc.name       : testBufferwriteESCAPE0005
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0005";
      try {
        const escape = 'aaa\t'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11600
     * @tc.name       : testBufferwriteESCAPE0006
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0006";
      try {
        const escape = 'aaa\v'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11700
     * @tc.name       : testBufferwriteESCAPE0007
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0007";
      try {
        const escape = 'aaa\x24'
        let buf = buffer.alloc(256);
        let length1 = buf.write('\x24', 0);
        expect(length1).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11800
     * @tc.name       : testBufferwriteESCAPE0008
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0008";
      try {
        const escape = '\开'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_11900
     * @tc.name       : testBufferwriteESCAPE0009
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0009";
      try {
        const escape = '\😊'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_12000
     * @tc.name       : testBufferwriteESCAPE0010
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0010";
      try {
        const escape = '\\0'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_12100
     * @tc.name       : testBufferwriteESCAPE0011
     * @tc.desc       : Testing the Buffer interface write with input ESCAPE \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBufferwriteESCAPE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testBufferwriteESCAPE0011";
      try {
        const escape = '\\b'
        let buf = buffer.alloc(256);
        let length1 = buf.write(escape, 0);
        expect(length1).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_E_BUFFER_ESCAPE_12200
     * @tc.name       : testBuffertextESCAPE0001
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE \b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0001";
      try {
        let blob = new buffer.Blob(['aa\b']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('aa%08');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12300
     * @tc.name       : testBuffertextESCAPE0002
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE \f
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0002";
      try {
        let blob = new buffer.Blob(['\f']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('%0C');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12400
     * @tc.name       : testBuffertextESCAPE0003
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE \n
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0003";
      try {
        let blob = new buffer.Blob(['aa\n']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('aa%0A');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12500
     * @tc.name       : testBuffertextESCAPE0004
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \r
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0004";
      try {
        let blob = new buffer.Blob(['aa\r']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('aa%0D');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12600
     * @tc.name       : testBuffertextESCAPE0005
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \t
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0005";
      try {
        let blob = new buffer.Blob(['aa\t']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('aa%09');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12700
     * @tc.name       : testBuffertextESCAPE0006
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \v
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0006";
      try {
        let blob = new buffer.Blob(['aa\v']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('aa%0B');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12800
     * @tc.name       : testBuffertextESCAPE0007
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \x24
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0007";
      try {
        let blob = new buffer.Blob(['55\x24']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('55$');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_12900
     * @tc.name       : testBuffertextESCAPE0008
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \开
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0008";
      try {
        let blob = new buffer.Blob(['\开']);
        let pro = await blob.text();
        expect(pro.toString()).assertEqual('开');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_13000
     * @tc.name       : testBuffertextESCAPE0009
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \😊
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0009";
      try {
        let blob = new buffer.Blob(['\😊']);
        let pro = await blob.text();
        expect(pro.toString()).assertEqual('😊');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_13100
     * @tc.name       : testBuffertextESCAPE0010
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0010";
      try {
        let blob = new buffer.Blob(['a\0']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('a%00');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_BUFFER_ESCAPE_13200
     * @tc.name       : testBuffertextESCAPE0011
     * @tc.desc       : Testing the Buffer interface text with input ESCAPE  \\b
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testBuffertextESCAPE0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG = "testBuffertextESCAPE0011";
      try {
        let blob = new buffer.Blob(['abc\b']);
        let pro = await blob.text();
        let res = encodeURI(pro);
        expect(res).assertEqual('abc%08');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertFail();
      }
    });
  })
}