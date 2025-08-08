/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import fastbuffer from '@ohos.fastbuffer';
import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let TAG = "testAlloc0001";

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface Options {
  type: string,
  endings: string,
}

export default function FastBufferBaseTest2() {
  describe('fastbufferBaseTest2', () => {
    afterEach(async (done: Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(10);
      done();
    })
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_05000
    * @tc.name: testFill0092
    * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFill0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(3).fill("$*$");
      let str = buf.toString();
      expect(str).assertEqual("$*$");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_05100
    * @tc.name: testFill0093
    * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFill0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf = fastbuffer.alloc(3).fill("$*$", -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: -1');
      }

    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_05200
    * @tc.name: testFill0094
    * @tc.desc: Fills buf with the specified value. If the offset and end are not given, the entire buf will be filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFill0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf = fastbuffer.alloc(3).fill("$*$", 0, 5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "end" is out of range. It must be >= 0 and <= 3. Received value is: 5');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_05900
    * @tc.name: testWrite0105
    * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWrite0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(8);
      try {
        let offset = buf.write("abcde", -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 7. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06000
    * @tc.name: testWrite0106
    * @tc.desc: Writes string to buf at offset according to the character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWrite0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(8);
      try {
        let offset = buf.write("abcde", 1, 9);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "length" is out of range. It must be >= 0 and <= 7. Received value is: 9');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06200
    * @tc.name: testCompare0110
    * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
    *           or is the same as target in sort order. Comparison is based on the actual sequence of 
    *           bytes in each fastbuffer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCompare0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      let res = buf1.compare(buf2);
      expect(res).assertEqual(1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06400
    * @tc.name: testCompare0112
    * @tc.desc: Compares buf with target and returns a number indicating whether buf comes before, after,
    *           or is the same as target in sort order. Comparison is based on the actual sequence of 
    *           bytes in each fastbuffer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCompare0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      try {
        let res = buf1.compare(buf2, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06500
    * @tc.name: testEquals0120
    * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testEquals0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(false);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06600
    * @tc.name: testEquals0121
    * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testEquals0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236测试");
      let buf2 = fastbuffer.from("1236测试");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(true);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06700
    * @tc.name: testEquals0122
    * @tc.desc: Returns true if both buf and otherBuffer have exactly the same bytes, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testEquals0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("O@O");
      let buf2 = fastbuffer.from("O^O");
      let res = buf1.equals(buf2);
      expect(res).assertEqual(false);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_06900
    * @tc.name: testSubarray0130
    * @tc.desc: Returns a new Buffer that references the same memory as the original,
    *           but offset and cropped by the start and end indices.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSubarray0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf = buf1.subarray(0, 3);
      let str = buf.toString();
      expect(str).assertEqual("123");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07000
    * @tc.name: testSubarray0133
    * @tc.desc: Returns a new Buffer that references the same memory as the original,
    *           but offset and cropped by the start and end indices.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSubarray0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf = buf1.subarray(3, 4);
      let str = buf.toString();
      expect(str).assertEqual("6");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07100
    * @tc.name: testSubarray0136
    * @tc.desc: Returns a new Buffer that references the same memory as the original,
    *           but offset and cropped by the start and end indices.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSubarray0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf = buf1.subarray(-3, 0);
      expect(buf.length).assertEqual(0);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07200
    * @tc.name: testSubarray0139
    * @tc.desc: Returns a new Buffer that references the same memory as the original,
    *           but offset and cropped by the start and end indices.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSubarray0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf = buf1.subarray(6, 9);
      expect(buf.length).assertEqual(0);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07300
    * @tc.name: testCopy0140
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let buf2 = fastbuffer.from("1235");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("1236");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07400
    * @tc.name: testCopy0141
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abcdefg");
      let buf2 = fastbuffer.from("1235789");
      let num = buf1.copy(buf2, 2, 1, 3);
      expect(num).assertEqual(2);
      let str = buf2.toString();
      expect(str).assertEqual("12bc789");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07500
    * @tc.name: testCopy0143
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123656");
      let buf2 = fastbuffer.from("1235");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("1236");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07600
    * @tc.name: testCopy0144
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123656");
      let buf2 = fastbuffer.from("1235");
      try {
        let num = buf1.copy(buf2, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "targetStart" is out of range. It must be >= 0 and <= 4294967295. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07800
    * @tc.name: testCopy0146
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("ab$#");
      let buf2 = fastbuffer.from("123556");
      let num = buf1.copy(buf2);
      expect(num).assertEqual(4);
      let str = buf2.toString();
      expect(str).assertEqual("ab$#56");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_07900
    * @tc.name: testToString0150
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1236");
      let str = buf1.toString();
      expect(str).assertEqual("1236");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08000
    * @tc.name: testToString0151
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("张三");
      let str = buf1.toString();
      expect(str).assertEqual("张三");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08100
    * @tc.name: testToString0152
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("binary");
      expect(str).assertEqual("abc");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08200
    * @tc.name: testToString0153
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("ascii");
      expect(str).assertEqual("abc");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08300
    * @tc.name: testToString0154
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("base64");
      expect(str).assertEqual("YWJj");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08400
    * @tc.name: testToString0155
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("hex");
      expect(str).assertEqual("616263");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08500
    * @tc.name: testToString0156
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("latin1");
      expect(str).assertEqual("abc");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08600
    * @tc.name: testToString0157
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("ucs2");
      expect(str).assertEqual("扡");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08700
    * @tc.name: testToString0158
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let str = buf1.toString("utf16le");
      expect(str).assertEqual("扡");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_08800
    * @tc.name: testToString0159
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("!@#$%^&*");
      let str = buf1.toString();
      expect(str).assertEqual("!@#$%^&*");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09000
    * @tc.name: testIndexOf0170
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.indexOf("3");
      expect(index).assertEqual(1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09100
    * @tc.name: testIndexOf0171
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.indexOf("3", 2);
      expect(index).assertEqual(3);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09200
    * @tc.name: testIndexOf0173
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236235");
      let index = buf1.indexOf("23");
      expect(index).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09300
    * @tc.name: testIndexOf0174
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试特殊字符$#@!");
      let index = buf1.indexOf("@");
      expect(index).assertEqual(20);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09400
    * @tc.name: testIndexOf0175
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236235");
      let index = buf1.indexOf("23", 3);
      expect(index).assertEqual(5);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09500
    * @tc.name: testIndexOf0176
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.indexOf("a");
      expect(index).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_09900
    * @tc.name: testLastIndexOf0180
    * @tc.desc: The index of the last occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testLastIndexOf0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.lastIndexOf("3");
      expect(index).assertEqual(3);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10000
    * @tc.name: testLastIndexOf0181
    * @tc.desc: The index of the last occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testLastIndexOf0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.lastIndexOf("3", 2);
      expect(index).assertEqual(1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10100
    * @tc.name: testLastIndexOf0183
    * @tc.desc: The index of the last occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testLastIndexOf0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236235");
      let index = buf1.lastIndexOf("23");
      expect(index).assertEqual(5);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10200
    * @tc.name: testLastIndexOf0184
    * @tc.desc: The index of the last occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testLastIndexOf0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236235");
      let index = buf1.lastIndexOf("23", 3);
      expect(index).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10300
    * @tc.name: testLastIndexOf0186
    * @tc.desc: The index of the last occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testLastIndexOf0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let index = buf1.lastIndexOf("a");
      expect(index).assertEqual(-1);
    });

    /**\
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10700
    * @tc.name: testIncludes0190
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let flag = buf1.includes("3");
      expect(flag).assertEqual(true);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10800
    * @tc.name: testIncludes0191
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let flag = buf1.includes("3", 2);
      expect(flag).assertEqual(true);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_10900
    * @tc.name: testIncludes0193
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let flag = buf1.includes("32");
      expect(flag).assertEqual(true);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11000
    * @tc.name: testIncludes0194
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let flag = buf1.includes("32", 2);
      expect(flag).assertEqual(false);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11100
    * @tc.name: testIncludes0195
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("测试特殊字符$#@!");
      let flag = buf1.includes("#@");
      expect(flag).assertEqual(true);
      flag = buf1.includes("测试");
      expect(flag).assertEqual(true);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11200
    * @tc.name: testIncludes0196
    * @tc.desc: Returns true if value was found in buf, false otherwise.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIncludes0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236");
      let flag = buf1.includes("abc");
      expect(flag).assertEqual(false);
    });
  
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11500
    * @tc.name: testSwap160200
    * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSwap160200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1323");
      buf1.swap16();
      let str = buf1.toString("hex");
      expect(str).assertEqual("33313332");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11600
    * @tc.name: testSwap160201
    * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSwap160201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("132");
      try {
        buf1.swap16();
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The buffer size must be a multiple of 16-bits');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11700
    * @tc.name: testSwap320210
    * @tc.desc: Interprets buf as an array of unsigned 32-bit integers and swaps the byte order in-place.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSwap320210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1234");
      buf1.swap32();
      let str = buf1.toString();
      expect(str).assertEqual("4321");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_11800
    * @tc.name: testswap320211
    * @tc.desc: Interprets buf as an array of unsigned 16-bit integers and swaps the byte order in-place.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testswap320211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("132");
      try {
        buf1.swap32();
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The buffer size must be a multiple of 32-bits');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12000
    * @tc.name: testSwap640221
    * @tc.desc: Interprets buf as an array of unsigned 64-bit integers and swaps the byte order in-place.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testSwap640221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1234567");
      try {
        buf1.swap64();
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The buffer size must be a multiple of 64-bits');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12100
    * @tc.name: testKeys0230
    * @tc.desc: Creates and returns an iterator of buf keys (indices).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testKeys0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1234");
      let keys = buf1.keys();
      let index = 0;
      for (const key of keys) {
        expect(key).assertEqual(index);
        index++;
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12200
    * @tc.name: testKeys0235
    * @tc.desc: Creates and returns an iterator of buf keys (indices).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testKeys0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uarr = new Uint8Array(4);
      uarr[0] = 0x31;
      uarr[1] = 0x32;
      uarr[2] = 0x33;
      uarr[3] = 0x34;
      let buf1 = fastbuffer.from(uarr);
      let keys = buf1.keys();
      let index = 0;
      for (const key of keys) {
        expect(key).assertEqual(index);
        index++;
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12300
    * @tc.name: testValues0240
    * @tc.desc: Creates and returns an iterator for buf values (bytes).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testValues0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("1234");
      let keys = buf1.values();
      let va = 49;
      for (const value of keys) {
        expect(value).assertEqual(va);
        va++;
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12400
    * @tc.name: testValues0245
    * @tc.desc: Creates and returns an iterator for buf values (bytes).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testValues0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uarr = new Uint8Array(4);
      uarr[0] = 0x31;
      uarr[1] = 0x32;
      uarr[2] = 0x33;
      uarr[3] = 0x34;
      let buf1 = fastbuffer.from(uarr);
      let keys = buf1.values();
      let va = 0x31;
      for (const value of keys) {
        expect(value).assertEqual(va);
        va++;
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12700
    * @tc.name: testfrom0260
    * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uarr = new Uint8Array(3);
      uarr[0] = 0x12;
      uarr[1] = 0x34;
      uarr[2] = 0x56;
      let buf = fastbuffer.from(uarr);
      let str = buf.toString("hex");
      expect(str).assertEqual("123456");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12800
    * @tc.name: testfrom0261
    * @tc.desc: Allocates a new Buffer using an array of bytes in the range 0 – 255.
    *           Array entries outside that range will be truncated to fit into it.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf = fastbuffer.from([0x62, 0x75, 0x66, 0x66, 0x65, 0x72]);
      let str = buf.toString("hex");
      expect(str).assertEqual("627566666572");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_12900
    * @tc.name: testfrom0262
    * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Uint8Array(2);
      arr[0] = 97;
      arr[1] = 98;
      const buf = fastbuffer.from(arr.buffer);
      arr[0] = 99
      buf[1] = 100
      let str = buf.toString("hex");
      expect(str).assertEqual("6364");
      expect(arr[1]).assertEqual(100);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13000
    * @tc.name: testfrom0263
    * @tc.desc: This creates a view of the ArrayBuffer without copying the underlying memory.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Uint8Array(2);
      arr[0] = 97;
      arr[1] = 98;
      const buf = fastbuffer.from(arr.buffer, 1);
      buf[0] = 99;
      let str = buf.toString("hex");
      expect(str).assertEqual("63");
      expect(arr[1]).assertEqual(99);
      expect(buf[0]).assertEqual(99);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13100
    * @tc.name: testfrom0264
    * @tc.desc: Copies the passed buffer data onto a new Buffer instance.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf1 = fastbuffer.from('buffer');
      const buf2 = fastbuffer.from(buf1);
      buf1[0] = 0x61;
      let str = buf1.toString();
      expect(str).assertEqual("auffer");
      str = buf2.toString();
      expect(str).assertEqual("buffer");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13200
    * @tc.name: testfrom0265
    * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
    *           to be used when converting string into bytes.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf1 = fastbuffer.from('this is a test');
      let str = buf1.toString();
      expect(str).assertEqual("this is a test");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13300
    * @tc.name: testfrom0266
    * @tc.desc: Creates a new Buffer containing string. The encoding parameter identifies the character encoding
    *           to be used when converting string into bytes.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf1 = fastbuffer.from('F1刘FG', 'hex');
      let str = buf1.toString('hex');
      expect(str).assertEqual("f1");

      let buf2 = fastbuffer.from("F1FG", "ascii")
      str = buf2.toString("ascii");
      expect(str).assertEqual("F1FG");

      let buf3 = fastbuffer.from("F1FG刘", "base64")
      str = buf3.toString("base64");
      expect(str).assertEqual("F1FG");

      let buf4 = fastbuffer.from("F1FG刘", "base64url")
      str = buf4.toString("base64url");
      expect(str).assertEqual("F1FG");

      let buf5 = fastbuffer.from("F1FG", "binary")
      str = buf5.toString("binary");
      expect(str).assertEqual("F1FG");

      let buf6 = fastbuffer.from("F1FG", "latin1")
      str = buf6.toString("latin1");
      expect(str).assertEqual("F1FG");

      let buf7 = fastbuffer.from("F1FG刘", "ucs2")
      str = buf7.toString("ucs2");
      expect(str).assertEqual("F1FG刘");

      let buf8 = fastbuffer.from("F1FG刘", "utf16le")
      str = buf8.toString("utf16le");
      expect(str).assertEqual("F1FG刘");

      let buf9 = fastbuffer.from("F1FG刘", "ucs2")
      str = buf9.toString("ucs2");
      expect(str).assertEqual("F1FG刘");

      let buf10 = fastbuffer.from("F1FG刘", "utf-8")
      str = buf10.toString("utf-8");
      expect(str).assertEqual("F1FG刘");

      let buf11 = fastbuffer.from("F1FG刘", "utf8")
      str = buf11.toString("utf8");
      expect(str).assertEqual("F1FG刘");

      let buf12 = fastbuffer.from("AsD-_QWEr", "base64url")
      str = buf12.toString("hex");
      expect(str).assertEqual("02c0fefd0584");

      let buf13 = fastbuffer.from("AsDQWEr134", "base64url")
      str = buf13.toString("hex");
      expect(str).assertEqual("02c0d0584af5df");

      let buf14 = fastbuffer.from("_AsDQ-12W7Er_", "base64url")
      str = buf14.toString("hex");
      expect(str).assertEqual("fc0b0343ed765bb12b");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13400
    * @tc.name: testfrom0267
    * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
    *           or supports symbol To primitive object, a new buffer instance is created.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buf = fastbuffer.from('this is a test');
      let str = buf.toString();
      expect(str).assertEqual("this is a test");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_13600
    * @tc.name: testfrom0269
    * @tc.desc: Create a new buffer containing a newline character string. Creating using base64 encoding
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str = `MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC/OgIQLaulKklB\npZltSaWwM3Cnzcmvh+LoqYFYjCePUxnoJRDusFqy4sjwBx9fn/XSxxJ9A0KxMtXa\nr7YFjwQo3FsIjLZ3+8wS+Kydcg==`;
      const buf = fastbuffer.from(str, 'base64');
      let ref = buf.readInt8(buf.length - 1);
      expect(ref).assertEqual(114);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_14700
    * @tc.name: testWriteInt32BE0310
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32BE0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      let ref = buf.writeInt32BE(0x12345678, 0);
      expect(ref).assertEqual(4);

    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_14800
    * @tc.name: testWriteInt32BE0311
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32BE0311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_14900
    * @tc.name: testWriteInt32BE0312
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32BE0312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x123456789, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15000
    * @tc.name: testWriteInt32BE0313
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32BE0313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32BE(0x12345678, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15200
    * @tc.name: testWriteInt32LE0320
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32LE0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      let ref = buf.writeInt32LE(0x12345678, 0);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15300
    * @tc.name: testWriteInt32LE0321
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32LE0321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15400
    * @tc.name: testWriteInt32LE0322
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32LE0322", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x123456789, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -2147483648 and <= 2147483647. Received value is: 4886718345');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15500
    * @tc.name: testWriteInt32LE0323
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt32LE0323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      try {
        let ref = buf.writeInt32LE(0x12345678, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15600
    * @tc.name: testWriteInt16BE0330
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16BE0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      let ref = buf.writeInt16BE(0x7bca, 0);
      expect(ref).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15700
    * @tc.name: testWriteInt16BE0331
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16BE0331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15800
    * @tc.name: testWriteInt16BE0332
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16BE0332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x123456, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_15900
    * @tc.name: testWriteInt16BE0333
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16BE0333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16BE(0x7bca, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16000
    * @tc.name: testWriteInt16LE0340
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16LE0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      let ref = buf.writeInt16LE(0x1234, 0);
      expect(ref).assertEqual(2);

    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16100
    * @tc.name: testWriteInt16LE0341
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16LE0341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x7bca, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16200
    * @tc.name: testWriteInt16LE0342
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16LE0342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x123456, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -32768 and <= 32767. Received value is: 1193046');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16300
    * @tc.name: testWriteInt16LE0343
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid signed 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt16LE0343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      try {
        let ref = buf.writeInt16LE(0x1234, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16400
    * @tc.name: testWriteInt80350
    * @tc.desc: Writes value to buf at the specified offset.
    *           value must be a valid signed 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt80350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      let ref = buf.writeInt8(2, 0);
      expect(ref).assertEqual(1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16500
    * @tc.name: testWriteInt80351
    * @tc.desc: Writes value to buf at the specified offset.
    *           value must be a valid signed 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt80351", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(2, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16600
    * @tc.name: testWriteInt80352
    * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt80352", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      try {
        let ref = buf.writeInt8(0x13245, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= -128 and <= 127. Received value is: 78405');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16700
    * @tc.name: testWriteInt80353
    * @tc.desc: Writes value to buf at the specified offset.value must be a valid signed 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteInt80353", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      let ref = buf.writeInt8(0x2, 1);
      expect(ref).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16800
    * @tc.name: testWriteUInt16BE0360
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16BE0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16BE(0xdead, 0);
      expect(ref).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_16900
    * @tc.name: testWriteUInt16BE0361
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16BE0361", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdeadfc, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17000
    * @tc.name: testWriteUInt16BE0362
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16BE0362", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16BE(0xdead, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17100
    * @tc.name: testWriteUInt16BE0363
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16BE0363", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16BE(0xdead, 1);
      expect(ref).assertEqual(3);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17200
    * @tc.name: testWriteUInt16LE0370
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16LE0370", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16LE(0xdead, 0);
      expect(ref).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17300
    * @tc.name: testWriteUInt16LE0371
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16LE0371", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdeadfc, 0);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 65535. Received value is: 14593532');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17400
    * @tc.name: testWriteUInt16LE0372
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16LE0372", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt16LE(0xdead, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17500
    * @tc.name: testWriteUInt16LE0373
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 16-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt16LE0373", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt16LE(0xdead, 1);
      expect(ref).assertEqual(3);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17600
    * @tc.name: testWriteUInt32BE0380
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32BE0380", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt32BE(0xfeedface, 0);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17700
    * @tc.name: testWriteUInt32BE0381
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32BE0381", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17800
    * @tc.name: testWriteUInt32BE0382
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32BE0382", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32BE(0xfeedface, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_17900
    * @tc.name: testWriteUInt32LE0390
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32LE0390", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt32LE(0xfeedface, 0);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18000
    * @tc.name: testWriteUInt32LE0391
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32LE0391", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32LE(0xfeedface, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18100
    * @tc.name: testWriteUInt32LE0392
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    *           The value must be a valid unsigned 32-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt32LE0392", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt32LE(0xfeedface, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18200
    * @tc.name: testWriteUInt80400
    * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt80400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt8(0x42, 3);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18300
    * @tc.name: testWriteUInt80401
    * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt80401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUInt8(0x42, -1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0. Received value is: -1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18400
    * @tc.name: testWriteUInt80402
    * @tc.desc: Writes value to buf at the specified offset. value must be a valid unsigned 8-bit integer.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUInt80402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUInt8(0x42, 1);
      expect(ref).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18500
    * @tc.name: testWriteUIntBE0410
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntBE0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUIntBE(0x13141516, 0, 4);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18600
    * @tc.name: testWriteUIntBE0411
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntBE0411", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntBE(0x13141516, 0, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18700
    * @tc.name: testWriteUIntBE0412
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntBE0412", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntBE(0x13141516, 1, 4);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18800
    * @tc.name: testWriteUIntLE0420
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntLE0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeUIntLE(0x13141516, 0, 4);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_18900
    * @tc.name: testWriteUIntLE0421
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntLE0421", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntLE(0x13141516, 0, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "value" is out of range. It must be >= 0 and <= 255. Received value is: 320083222');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19000
    * @tc.name: testWriteUIntLE0422
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntLE0422", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeUIntLE(0x13141516, 1, 4);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19100
    * @tc.name: testWriteUIntLE0423
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteUIntLE0423", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(5);
      let ref = buf.writeUIntLE(0x13141516, 1, 4);
      expect(ref).assertEqual(5);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19200
    * @tc.name: testWriteIntBE0430
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteIntBE0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      let ref = buf.writeIntBE(0x1234567890ab, 0, 6);
      expect(ref).assertEqual(6);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19300
    * @tc.name: testWriteIntBE0431
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteIntBE0431", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntBE(0x1234567890ab, 1, 6);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19400
    * @tc.name: testWriteIntLE0440
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteIntLE0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      let ref = buf.writeIntLE(0x1234567890ab, 0, 6);
      expect(ref).assertEqual(6);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19500
    * @tc.name: testWriteIntLE0441
    * @tc.desc: Writes byteLength bytes of value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteIntLE0441", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      try {
        let ref = buf.writeIntLE(0x1234567890ab, 1, 6);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19600
    * @tc.name: testWriteDoubleBE0450
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteDoubleBE0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeDoubleBE(123.456, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19700
    * @tc.name: testWriteDoubleBE0451
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteDoubleBE0451", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleBE(123.456, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19800
    * @tc.name: testWriteDoubleLE0460
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteDoubleLE0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeDoubleLE(123.456, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_19900
    * @tc.name: testWriteDoubleLE0461
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteDoubleLE0461", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeDoubleLE(123.456, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20000
    * @tc.name: testWriteFloatBE0470
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteFloatBE0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      let ref = buf.writeFloatBE(0xcabcbcbc, 0);
      expect(ref).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20100
    * @tc.name: testWriteFloatBE0471
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteFloatBE0471", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatBE(0xcabcbcbc, 5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20200
    * @tc.name: testWriteFloatLE0480
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteFloatLE0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(16);
      let ref = buf.writeFloatLE(0xcabcbcbc, 12);
      expect(ref).assertEqual(16);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20300
    * @tc.name: testWriteFloatLE0481
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteFloatLE0481", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      try {
        let ref = buf.writeFloatLE(0xcabcbcbc, 5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 5');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20400
    * @tc.name: testWriteBigInt64BE0490
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigInt64BE0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigInt64BE(0x0102030405060708n, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20500
    * @tc.name: testWriteBigInt64BE0491
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigInt64BE0491", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64BE(0x0102030405060708n, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20600
    * @tc.name: testWriteBigInt64LE0500
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigInt64LE0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigInt64LE(0x0102030405060708n, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20700
    * @tc.name: testWriteBigInt64LE0501
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigInt64LE0501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigInt64LE(0x0102030405060708n, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20800
    * @tc.name: testWriteBigUInt64BE0510
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigUInt64BE0510", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_20900
    * @tc.name: testWriteBigUInt64BE0511
    * @tc.desc: Writes value to buf at the specified offset as big-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigUInt64BE0511", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64BE(0xdecafafecacefaden, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21000
    * @tc.name: testWriteBigUInt64LE0520
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigUInt64LE0520", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 0);
      expect(ref).assertEqual(8);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21100
    * @tc.name: testWriteBigUInt64LE0521
    * @tc.desc: Writes value to buf at the specified offset as little-endian.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testWriteBigUInt64LE0521", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      try {
        let ref = buf.writeBigUInt64LE(0xdecafafecacefaden, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21200
    * @tc.name: testReadInt32BE0530
    * @tc.desc: Reads a signed, big-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt32BE0530", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      let ref = buf.readInt32BE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21300
    * @tc.name: testReadInt32BE0531
    * @tc.desc: Reads a signed, big-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt32BE0531", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      try {
        let ref = buf.readInt32BE(1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21500
    * @tc.name: testReadInt32LE0540
    * @tc.desc: Reads a signed, little-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt32LE0540", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      let ref = buf.readInt32LE(0).toString(16);
      expect(ref).assertEqual("78563412");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21600
    * @tc.name: testReadInt32LE0541
    * @tc.desc: Reads a signed, little-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt32LE0541", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(4);
      buf.writeInt32BE(0x12345678, 0);
      try {
        let ref = buf.readInt32LE(1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21700
    * @tc.name: testReadInt16BE0550
    * @tc.desc: Reads a signed, big-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt16BE0550", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      let ref = buf.readInt16BE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21800
    * @tc.name: testReadInt16BE0551
    * @tc.desc: Reads a signed, big-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt16BE0551", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      try {
        let ref = buf.readInt16BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_21900
    * @tc.name: testReadInt16LE0560
    * @tc.desc: Reads a signed, little-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt16LE0560", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      let ref = buf.readInt16LE(0).toString(16);
      expect(ref).assertEqual("3412");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22000
    * @tc.name: testReadInt16LE0561
    * @tc.desc: Reads a signed, little-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt16LE0561", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(2);
      buf.writeInt16BE(0x1234, 0);
      try {
        let ref = buf.readInt16LE(1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22100
    * @tc.name: testReadInt80570
    * @tc.desc: Reads a signed 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt80570", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      buf.writeInt8(0x12);
      let ref = buf.readInt8(0).toString(16);
      expect(ref).assertEqual("12");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22200
    * @tc.name: testReadInt80571
    * @tc.desc: Reads a signed 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadInt80571", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(2);
      buf.writeInt8(0x12);
      try {
        let ref = buf.readInt8(2).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22300
    * @tc.name: testReadUInt16BE0580
    * @tc.desc: Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt16BE0580", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt16BE(0x1234, 0);
      let ref = buf.readUInt16BE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22400
    * @tc.name: testReadUInt16BE0581
    * @tc.desc: Reads an unsigned, big-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt16BE0581", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt16BE(0x1234, 0);
      try {
        let ref = buf.readUInt16BE(3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22500
    * @tc.name: testReadUInt16LE0590
    * @tc.desc: Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt16LE0590", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      let ref = buf.readUInt16LE(0).toString(16);
      expect(ref).assertEqual("1234");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22600
    * @tc.name: testReadUInt16LE0591
    * @tc.desc: Reads an unsigned, little-endian 16-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt16LE0591", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt16LE(0x1234, 0);
      try {
        let ref = buf.readUInt16LE(3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 2. Received value is: 3');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22700
    * @tc.name: testReadUInt32BE0600
    * @tc.desc: Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt32BE0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      let ref = buf.readUInt32BE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22800
    * @tc.name: testReadUInt32BE0601
    * @tc.desc: Reads an unsigned, big-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt32BE0601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt32BE(0x12345678, 0);
      try {
        let ref = buf.readUInt32BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_22900
    * @tc.name: testReadUInt32LE0610
    * @tc.desc: Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt32LE0610", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      let ref = buf.readUInt32LE(0).toString(16);
      expect(ref).assertEqual("12345678");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23000
    * @tc.name: testReadUInt32LE0611
    * @tc.desc: Reads an unsigned, little-endian 32-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt32LE0611", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt32LE(0x12345678, 0);
      try {
        let ref = buf.readUInt32LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23100
    * @tc.name: testReadUInt80620
    * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt80620", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt8(0x42);
      let ref = buf.readUInt8(0).toString(16);
      expect(ref).assertEqual("42");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23200
    * @tc.name: testReadUInt80621
    * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUInt80621", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUInt8(0x42);
      try {
        let ref = buf.readUInt8(4).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 3. Received value is: 4');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23300
    * @tc.name: testReadUIntBE0630
    * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUIntBE0630", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      let ref = buf.readUIntBE(0, 3).toString(16);
      expect(ref).assertEqual("131415");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23400
    * @tc.name: testReadUIntBE0631
    * @tc.desc: Reads an unsigned 8-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUIntBE0631", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUIntBE(0x13141516, 0, 4);
      try {
        let ref = buf.readUIntBE(2, 3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23500
    * @tc.name: testReadUIntLE0640
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUIntLE0640", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      let ref = buf.readUIntLE(0, 3).toString(16);
      expect(ref).assertEqual("141516");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23600
    * @tc.name: testReadUIntLE0641
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as an unsigned, little-endian integer supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadUIntLE0641", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeUIntLE(0x13141516, 0, 4);
      try {
        let ref = buf.readUIntLE(2, 3).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23700
    * @tc.name: testReadIntBE0650
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadIntBE0650", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      buf.writeIntBE(0x123456789011, 0, 6);
      let ref = buf.readIntBE(0, 5).toString(16);
      expect(ref).assertEqual("1234567890");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23800
    * @tc.name: testReadIntBE0651
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as a big-endian, two's complement signed value supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadIntBE0651", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      buf.writeIntBE(0x123456789011, 0, 6);
      try {
        let ref = buf.readIntBE(2, 5).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_23900
    * @tc.name: testReadIntLE0660
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadIntLE0660", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      buf.writeIntLE(0x123456789011, 0, 6);
      let ref = buf.readIntLE(0, 5).toString(16);
      expect(ref).assertEqual("3456789011");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24000
    * @tc.name: testReadIntLE0661
    * @tc.desc: Reads byteLength number of bytes from buf at the specified offset and interprets
    *           the result as a little-endian, two's complement signed value supporting up to 48 bits of accuracy.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadIntLE0661", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(6);
      buf.writeIntLE(0x123456789011, 0, 6);
      try {
        let ref = buf.readIntLE(2, 5).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 1. Received value is: 2');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24100
    * @tc.name: testReadDoubleBE0670
    * @tc.desc: Reads a 64-bit, big-endian double from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadDoubleBE0670", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeDoubleBE(123.456, 0);
      let ref = buf.readDoubleBE();
      expect(ref).assertEqual(123.456);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24200
    * @tc.name: testReadDoubleBE0671
    * @tc.desc: Reads a 64-bit, big-endian double from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadDoubleBE0671", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeDoubleBE(123.456, 0);
      try {
        let ref = buf.readDoubleBE(1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24300
    * @tc.name: testReadDoubleLE0680
    * @tc.desc: Reads a 64-bit, little-endian double from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadDoubleLE0680", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeDoubleLE(123.456, 0);
      let ref = buf.readDoubleLE();
      expect(ref).assertEqual(123.456);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24400
    * @tc.name: testReadDoubleLE0681
    * @tc.desc: Reads a 64-bit, little-endian double from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadDoubleLE0681", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeDoubleLE(123.456, 0);
      try {
        let ref = buf.readDoubleLE(1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24500
    * @tc.name: testReadFloatBE0690
    * @tc.desc: Reads a 32-bit, big-endian float from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadFloatBE0690", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeFloatBE(0xcabcbcbc, 0);
      let ref = buf.readFloatBE(0).toString(16);
      expect(ref).assertEqual("cabcbd00");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24600
    * @tc.name: testReadFloatBE0691
    * @tc.desc: Reads a 32-bit, big-endian float from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadFloatBE0691", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeFloatBE(0xcabcbcbc, 0);
      try {
        let ref = buf.readFloatBE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24700
    * @tc.name: testReadFloatLE0700
    * @tc.desc: Reads a 32-bit, little-endian float from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadFloatLE0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeFloatLE(0xcabcbcbc, 0);
      let ref = buf.readFloatLE(0).toString(16);
      expect(ref).assertEqual("cabcbd00");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24800
    * @tc.name: testReadFloatLE0701
    * @tc.desc: Reads a 32-bit, little-endian float from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadFloatLE0701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(4);
      buf.writeFloatLE(0xcabcbcbc, 0);
      try {
        let ref = buf.readFloatLE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_24900
    * @tc.name: testReadBigInt64BE0710
    * @tc.desc: Reads a signed, big-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigInt64BE0710", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigInt64BE(0x0102030405060708n, 0);
      let ref = buf.readBigInt64BE(0).toString(16);
      expect(ref).assertEqual("102030405060708");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25000
    * @tc.name: testReadBigInt64BE0711
    * @tc.desc: Reads a signed, big-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigInt64BE0711", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigInt64BE(0x0102030405060708n, 0);
      try {
        let ref = buf.readBigInt64BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25100
    * @tc.name: testReadBigInt64LE0720
    * @tc.desc: Reads a signed, little-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigInt64LE0720", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigInt64BE(0x0102030405060708n, 0);
      let ref = buf.readBigInt64LE(0).toString(16);
      expect(ref).assertEqual("807060504030201");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25200
    * @tc.name: testReadBigInt64LE0721
    * @tc.desc: Reads a signed, little-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigInt64LE0721", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigInt64BE(0x0102030405060708n, 0);
      try {
        let ref = buf.readBigInt64LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25300
    * @tc.name: testReadBigUInt64BE0730
    * @tc.desc: Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigUInt64BE0730", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
      let ref = buf.readBigUInt64BE(0).toString(16);
      expect(ref).assertEqual("decafafecacefade");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25400
    * @tc.name: testReadBigUInt64BE0731
    * @tc.desc: Reads a unsigned, big-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigUInt64BE0731", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
      try {
        let ref = buf.readBigUInt64BE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25500
    * @tc.name: testReadBigUInt64LE0740
    * @tc.desc: Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigUInt64LE0740", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
      let ref = buf.readBigUInt64LE(0).toString(16);
      expect(ref).assertEqual("defacecafefacade");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25600
    * @tc.name: testReadBigUInt64LE0741
    * @tc.desc: Reads a unsigned, little-endian 64-bit integer from buf at the specified offset.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testReadBigUInt64LE0741", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(8);
      buf.writeBigUInt64BE(0xdecafafecacefaden, 0);
      try {
        let ref = buf.readBigUInt64LE(1).toString(16);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "offset" is out of range. It must be >= 0 and <= 0. Received value is: 1');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_25700
    * @tc.name: testBufferLength0750
    * @tc.desc: Returns the number of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferLength0750", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from("1236");
      let len = buf.length;
      expect(len).assertEqual(4);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_LENGTH_0751
    * @tc.name: testBufferLength0751
    * @tc.desc: Returns the number of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferLength0751", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from("1236");
      try {
        buf.length = 10;
      } catch (err) {
        expect(err.name).assertEqual('TypeError');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_LENGTH_0752
    * @tc.name: testBufferLength0752
    * @tc.desc: Returns the number of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferLength0752", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from("测试特殊字符$#@!");
      let len = buf.length;
      expect(len).assertEqual(22);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_26000
    * @tc.name: testBufferByteOffset0755
    * @tc.desc: Returns the offset of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferByteOffset0755", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from("1236");
      let offset = buf.byteOffset;
      expect(offset >= 0).assertTrue();
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_26100
    * @tc.name: testBufferByteOffset0756
    * @tc.desc: Returns the offset of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferByteOffset0756", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      let offset = buf.byteOffset;
      expect(offset >= 0).assertTrue();
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_26200
    * @tc.name: testBufferByteOffset0757
    * @tc.desc: Returns the offset of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferByteOffset0757", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitializedFromPool(10);
      let offset = buf.byteOffset;
      expect(offset >= 0).assertTrue();
    });
    
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_26300
    * @tc.name: testBufferByteOffset0758
    * @tc.desc: Returns the offset of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferByteOffset0758", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitialized(10);
      let offset = buf.byteOffset;
      expect(offset >= 0).assertTrue();
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_26400
    * @tc.name: testBufferByteOffset0759
    * @tc.desc: Returns the offset of bytes in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testBufferByteOffset0759", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from("1236");
      try {
        buf.byteOffset = 3;
      } catch (err) {
        expect(err.name).assertEqual('TypeError');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27000
    * @tc.name: testAllocUninitialized0780
    * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testAllocUninitialized0780", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitialized(10);
      expect(buf.length).assertEqual(10);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27100
    * @tc.name: testAllocUninitialized0781
    * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testAllocUninitialized0781", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.allocUninitialized(0);
      expect(buf.length).assertEqual(0);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27200
    * @tc.name: testAllocUninitialized0782
    * @tc.desc: Allocates a new un-pooled Buffer for a fixed size bytes. The Buffer will not be initially filled.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testAllocUninitialized0782", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf = fastbuffer.allocUninitialized(-5);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('Parameter error. The type of "size" must be number and the value cannot be ' +
                                        'negative. Received value is: -5');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27500
    * @tc.name: testToString0785
    * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testToString0785", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      try {
        let str = buf1.toString("code");
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('Parameter error. The type of "encoding" must be BufferEncoding. the encoding ' +
                                        'code is unknown');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27600
    * @tc.name: testfrom0786
    * @tc.desc: For the object whose value returned by valueof() function is strictly equal to object
    *           or supports symbol To primitive object, a new buffer instance is created.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0786", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayBuffer = new ArrayBuffer(5);
      let array = new Int8Array(arrayBuffer);
      array[0] = 1;
      array[1] = 2;
      array[2] = 3;
      array[3] = 4;
      array[4] = 5;
      try {
        const buf = fastbuffer.from(arrayBuffer, 6, 1);
      } catch (err) {
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual('The value of "byteOffset" is out of range. It must be >= 0 and <= 5. Received value is: 6');
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27700
    * @tc.name: testfrom0787
    * @tc.desc: The buffer handles a uint8array and decodes it with base64 and base64url.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('testfrom0787', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let array = new Uint8Array([252,11,3,67,237,118,91,177,43]);
      let buf = fastbuffer.from(array);
      let strUrl = buf.toString("base64url");
      let str = buf.toString("base64");
      expect(strUrl).assertEqual("_AsDQ-12W7Er");
      expect(str).assertEqual("/AsDQ+12W7Er");

      array = new Uint8Array([2,192,254,253,5,132,69]);
      buf = fastbuffer.from(array);
      strUrl = buf.toString("base64url");
      str= buf.toString("base64");
      expect(strUrl).assertEqual("AsD-_QWERQ");
      expect(str).assertEqual("AsD+/QWERQ==");

      array = new Uint8Array([215,109,211,97,72,142,167,241]);
      buf = fastbuffer.from(array);
      strUrl = buf.toString("base64url");
      str = buf.toString("base64");
      expect(strUrl).assertEqual("123TYUiOp_E");
      expect(str).assertEqual("123TYUiOp/E=");

      array = new Uint8Array([252]);
      buf = fastbuffer.from(array);
      strUrl = buf.toString("base64url");
      str = buf.toString("base64");
      expect(strUrl).assertEqual("_A");
      expect(str).assertEqual("/A==");

      array = new Uint8Array([252,97]);
      buf = fastbuffer.from(array);
      strUrl = buf.toString("base64url");
      str = buf.toString("base64");
      expect(strUrl).assertEqual("_GE");
      expect(str).assertEqual("/GE=");

      array = new Uint8Array([252,97,142]);
      buf = fastbuffer.from(array);
      strUrl = buf.toString("base64url");
      str = buf.toString("base64");
      expect(strUrl).assertEqual("_GGO");
      expect(str).assertEqual("/GGO");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27800
    * @tc.name: testByteLength0036
    * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
    *           This is not the same as [`String.prototype.length`], which does not account
    *           for the encoding that is used to convert the string into bytes.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testByteLength0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abc");
      let byteLen = fastbuffer.byteLength(buf1);
      expect(byteLen).assertEqual(3);
    });
      
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_27900
    * @tc.name: testByteLength0037
    * @tc.desc: Returns the byte length of a string when encoded using `encoding`.
    *           This is not the same as [`String.prototype.length`], which does not account
    *           for the encoding that is used to convert the string into bytes.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testByteLength0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.alloc(8);
      let byteLen = fastbuffer.byteLength(buf1);
      expect(byteLen).assertEqual(8);
    });

    /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28000
      * @tc.name: testToString0038
      * @tc.desc: Decodes buf to a string according to the specified character encoding in encoding.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testToString0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str = "abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"
      let strbuf = fastbuffer.from(str, "latin1");
      let toStr = strbuf.toString("latin1");
      expect(toStr).assertEqual("abcdefhajksalfsdfjl12346287467823®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ");
    });

    /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28100
      * @tc.name: testLastIndexOf30000
      * @tc.desc: The index of the last occurrence of value in buf.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testLastIndexOf30000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("13236235");
      let index = buf1.lastIndexOf("23", 9999999999999);
      expect(index).assertEqual(5);
    });

    /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28200
      * @tc.name: testIncludes30010
      * @tc.desc: Returns true if value was found in buf, false otherwise.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testIncludes30010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abcdefghigk");
      let flag = buf1.includes("f", -3);
      expect(flag).assertEqual(false);
    });

      /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28300
      * @tc.name: testIncludes30020
      * @tc.desc: Returns true if value was found in buf, false otherwise.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testIncludes30020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abcdefghigk");
      let flag = buf1.includes("f", 9999999999999);
      expect(flag).assertEqual(false);
    });

      /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28400
      * @tc.name: testIncludes30030
      * @tc.desc: Returns true if value was found in buf, false otherwise.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testIncludes30030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("abcdefghigk");
      let flag = buf1.includes("f", -9999999999999);
      expect(flag).assertEqual(true);
    });

      /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28500
      * @tc.name: testAlloc30040
      * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testAlloc30040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10, '');
      expect(buf.length).assertEqual(10);
    });

      /**
      * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28600
      * @tc.name: testAlloc30050
      * @tc.desc: Allocates a new Buffer for a fixed size bytes. If fill is undefined, the Buffer will be zero-filled.
      * @tc.size: MediumTest
      * @tc.type: Function
      * @tc.level: Level 1
      */
    it("testAlloc30050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(20).fill('');
      expect(buf.length).assertEqual(20);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28700
    * @tc.name: testIndexOf30060
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf30060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123456789abcdefg");
      let index = buf1.indexOf("3", -1);
      expect(index).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28800
    * @tc.name: testIndexOf30070
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf30070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123456789abcdefg");
      let index = buf1.indexOf("3", 99999999999999);
      expect(index).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_28900
    * @tc.name: testIndexOf30080
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf30080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("123456789abcdefg");
      let index = buf1.indexOf("3", -99999999999999);
      expect(index).assertEqual(2);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29000
    * @tc.name: testIndexOf30090
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf30090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("This is a buffer");
      let index = buf1.indexOf("is", -5);
      expect(index).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29100
    * @tc.name: testIndexOf30100
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testIndexOf30100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.from("This is a buffer");
      let index = buf1.indexOf("f", -20);
      expect(index).assertEqual(12);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29200
    * @tc.name: testFrom30110
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFrom30110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf1 = fastbuffer.from(null);
      } catch(err) {
        let errStr = 'Parameter error. The type of "value" must be FastBuffer or ArrayBuffer, Array, Array-like, string, object. Received value is: null';
        expect(err.code).assertEqual(401);
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual(errStr);
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29300
    * @tc.name: testFrom30120
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFrom30120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf1 = fastbuffer.from(undefined);
      } catch(err) {
        let errStr = 'Parameter error. The type of "value" must be FastBuffer or ArrayBuffer, Array, Array-like, string, object. Received value is: undefined';
        expect(err.code).assertEqual(401);
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual(errStr);
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29600
    * @tc.name: testFrom30150
    * @tc.desc: The index of the first occurrence of value in buf.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testFrom30150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let arrBuf = new ArrayBuffer(10);
        let buf1 = fastbuffer.from(arrBuf, -1);
      } catch(err) {
        let errStr = 'The value of "byteOffset" is out of range. It must be >= 0 and <= 10. Received value is: -1';
        expect(err.code).assertEqual(10200001);
        expect(err.name).assertEqual('BusinessError');
        expect(err.message).assertEqual(errStr);
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29700
    * @tc.name: testCopy0147
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uint8array = new Uint8Array(10).fill(0);
      let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7]);
      let num = buf.copy(uint8array, 8);
      expect(num).assertEqual(2);
      let str = uint8array.toString();
      expect(str).assertEqual("0,0,0,0,0,0,0,0,1,2");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_29800
    * @tc.name: testCopy0148
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uint8array = new Uint8Array(10).fill(0);
      let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7]);
      let num = buf.copy(uint8array, 0, 3);
      expect(num).assertEqual(4);
      let str = uint8array.toString();
      expect(str).assertEqual("4,5,6,7,0,0,0,0,0,0");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30100
    * @tc.name: testCopy0151
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let uint8array = new Uint8Array(10).fill(0);
        const buf = fastbuffer.from([1,2,3,4,5,6,7]);
        let num = buf.copy(uint8array, -1, 3, 100);
      } catch (err) {
          expect(err.code).assertEqual(10200001);
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30200
    * @tc.name: testCopy0152
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uint8array = new Uint8Array(10).fill(0);
      let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7]);
      let num = buf.copy(uint8array, 0, 9, 1);
      expect(num).assertEqual(0);
      let str = uint8array.toString();
      expect(str).assertEqual("0,0,0,0,0,0,0,0,0,0");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30300
    * @tc.name: testCopy0153
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uint8array = new Uint8Array(10).fill(0);
      let buf = fastbuffer.from([1, 2, 3, 4, 5, 6, 7]);
      let num = buf.copy(uint8array, 9, 1, 5);
      expect(num).assertEqual(1);
      let str = uint8array.toString();
      expect(str).assertEqual("0,0,0,0,0,0,0,0,0,2");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30400
    * @tc.name: testCopy0154
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let uint8array = new Uint8Array(10).fill(0);
        const buf = fastbuffer.from([1,2,3,4,5,6,7]);
        let num = buf.copy(uint8array, 2, 3, -1);
      } catch (err) {
          expect(err.code).assertEqual(10200001);
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30500
    * @tc.name: testCopy0155
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let uint8array = new Uint8Array(10).fill(9);
      const buf = fastbuffer.from([1,2,3,4,5,6,7]);
      let num = buf.copy(uint8array, 9, 1, undefined);
      expect(num).assertEqual(1);
      let str = uint8array.toString();
      expect(str).assertEqual("9,9,9,9,9,9,9,9,9,2");
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30600
    * @tc.name: testCopy0156
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf1 = fastbuffer.alloc(1024);
      let buf2 = fastbuffer.alloc(512);
      let cntr = 0;
      // copy 512 bytes, from 0 to 512.
      buf1.fill(++cntr);
      buf2.fill(++cntr);
      let copied = buf1.copy(buf2, 0, 0, 1024);
      expect(copied).assertEqual(512);
      for (let i = 0; i < buf2.length; i++) {
        if(cntr - 1 != buf2[i]) {
          expect(copied).assertEqual(0);
        }
      }
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30700
    * @tc.name: testCopy0157
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      let buf1 = fastbuffer.alloc(10).fill('!');
      for (let i = 0; i < 10; i++) {
        buf[i] = i + 97;
      }
      let len = buf.copy(buf1, 0, 4, 10);
      expect(len).assertEqual(6);
      expect(buf1.toString()).assertEqual('efghij!!!!');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30800
    * @tc.name: testCopy0158
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      for (let i = 0; i < 10; i++) {
        buf[i] = i + 97;
      }
      let len = buf.copy(buf, 0, 4, 10);
      expect(len).assertEqual(6);
      expect(buf.toString()).assertEqual('efghijghij');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_30900
    * @tc.name: testCopy0159
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      for (let i = 0; i < 10; i++) {
        buf[i] = i + 97;
      }
      let len = buf.copy(buf, 2, 4);
      expect(len).assertEqual(6);
      expect(buf.toString()).assertEqual('abefghijij');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31000
    * @tc.name: testCopy0160
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      for (let i = 0; i < 10; i++) {
        buf[i] = i + 97;
      }
      let len = buf.copy(buf, 2);
      expect(len).assertEqual(8);
      expect(buf.toString()).assertEqual('ababcdefgh');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31100
    * @tc.name: testCopy0161
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testCopy0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.alloc(10);
      for (let i = 0; i < 10; i++) {
        buf[i] = i + 97;
      }
      let len = buf.copy(buf, 8);
      expect(len).assertEqual(2);
      expect(buf.toString()).assertEqual('abcdefghab');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31200
    * @tc.name: testfrom0788
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0788", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sharedArr = new SharedArrayBuffer(20)
      let uint8Arr = new Uint8Array(sharedArr);
      uint8Arr[16] = 9;
      let bufObj = fastbuffer.from(sharedArr, 0, 20);
      uint8Arr[15] = 10;
      expect(bufObj.length).assertEqual(20);
      expect(JSON.stringify(bufObj)).assertEqual('{"type":"FastBuffer","data":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,9,0,0,0]}');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31300
    * @tc.name: testfrom0789
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0789", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sharedArr = new SharedArrayBuffer(10)
      let uint8Arr = new Uint8Array(sharedArr);
      uint8Arr[9] = 9;
      let bufObj = fastbuffer.from(sharedArr, 5, 5);
      uint8Arr[1] = 10;
      expect(bufObj.length).assertEqual(5);
      expect(JSON.stringify(bufObj)).assertEqual('{"type":"FastBuffer","data":[0,0,0,0,9]}');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31400
    * @tc.name: testfrom0790
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0790", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sharedArr = new SharedArrayBuffer(1000)
      let bufObj = fastbuffer.from(sharedArr, 5, undefined);
      expect(bufObj.length).assertEqual(995);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31500
    * @tc.name: testfrom0791
    * @tc.desc: Copies data from a region of buf to a region in target,
    *           even if the target memory region overlaps with buf.
    *           If sourceEnd is greater than the length of the target, the length of the target shall prevail,
    *           and the extra part will not be overwritten.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0791", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sharedArr = new SharedArrayBuffer(10)
      let bufObj = fastbuffer.from(sharedArr, undefined, 6);
      expect(bufObj.length).assertEqual(6);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31600
    * @tc.name: testfrom0792
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0792", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ab = new ArrayBuffer(100);
      let buf = fastbuffer.from(ab, 1.2, 1.2);
      let res = buf.toString('hex');
      expect(res).assertEqual('00');
    });
  
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31700
    * @tc.name: testfrom0793
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0793", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let ab = new ArrayBuffer(100);
        let buf = fastbuffer.from(ab, 1, 1.2);
        let res = buf.toString('hex');
        expect(res).assertEqual('00');
    });
  
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31800
    * @tc.name: testfrom0794
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
      it("testfrom0794", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let ab = new ArrayBuffer(100);
        let buf = fastbuffer.from(ab, 1.2, 1);
        let res = buf.toString('hex');
        expect(res).assertEqual('00');
    });
  
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_31900
    * @tc.name: testfrom0795
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0795", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let ab = new ArrayBuffer(100);
        let buf = fastbuffer.from(ab, 9.9, 9.9);
        let res = buf.toString('hex');
        expect(res).assertEqual('000000000000000000');
    });
  
    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_32000
    * @tc.name: testfrom0796
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0796", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ab = new ArrayBuffer(100);
      let buf = fastbuffer.from(ab, 2.9, 2.9);
      let res = buf.toString('hex');
      expect(res).assertEqual('0000');
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_32700
    * @tc.name: testfrom0275
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('buffer', -4)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -5)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -6)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -7)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 1)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', 5)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 6)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 15)).assertEqual(5);
      expect(buf.lastIndexOf('buffer', 19)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 20)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 23)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', 9999)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -20)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', -999)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer', -1)).assertEqual(17);
      expect(buf.lastIndexOf('buffer', -22)).assertEqual(-1);
      expect(buf.lastIndexOf('buffer')).assertEqual(17);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_32800
    * @tc.name: testfrom0276
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from('this buffer is a buffer');
      expect(buf.lastIndexOf('is',undefined)).assertEqual(12);
      expect(buf.lastIndexOf('is', null, 'utf8')).assertEqual(-1);
      expect(buf.lastIndexOf('is', 20, 'utf16le')).assertEqual(-1);
      expect(buf.lastIndexOf('is', 1)).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_32900
    * @tc.name: testfrom0277
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let buf = fastbuffer.from([11,12,13,14,15,16,17,18,19])
      expect(buf.lastIndexOf(13,-1)).assertEqual(2);
      expect(buf.lastIndexOf(13,-999)).assertEqual(-1);
      expect(buf.lastIndexOf(13,2)).assertEqual(2);
      expect(buf.lastIndexOf(13,3)).assertEqual(2);
      expect(buf.lastIndexOf(14,8)).assertEqual(3);
      expect(buf.lastIndexOf(20,15)).assertEqual(-1);
    });

    /**
    * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_FASTBUFFER_33000
    * @tc.name: testfrom0278
    * @tc.desc: Create a new buffer containing parameter is non integer
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it("testfrom0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let buf = fastbuffer.from([11,12,13,14,15,16,17,18,19]);
        let buf1 = fastbuffer.from([1,2,3,4,5,6,8,9,19])
        buf.compare(buf1, 2, 9, -8, 8);
      } catch (err) {
        expect(err.code).assertEqual(10200001);
      }
    });
  })
}