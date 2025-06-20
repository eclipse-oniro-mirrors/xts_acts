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
import { stream } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

let writeSuccess = false;

class Resettable {
  constructor() {
    writeSuccess = false;
  }
}

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.log(`result: Writable chunk is ` + chunk);
    callback();
  }
}

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }

  doRead(size: number) {
  }
}

class TestDuplex extends stream.Duplex {
  constructor() {
    super();
  }

  doRead(size: number) {
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    writeSuccess = true;
    console.info("duplexStream chunk is", chunk);
    callback();
  }
}

export default function StreamTest() {
  describe('streamTest', () => {
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
    afterEach(async () => {
      new Resettable();
      await sleep(50);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0100
     * @tc.name       : testStreamWritable0001
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0001';
      try {
        let writableStream = new TestWritable();
        writableStream.write();
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of undefined must be string or UintArray');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0200
     * @tc.name       : testStreamWritable0002
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0002';
      try {
        let writableStream = new TestWritable();
        writableStream.write(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of undefined must be string or UintArray');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0300
     * @tc.name       : testStreamWritable0003
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0003';
      try {
        let writableStream = new TestWritable();
        writableStream.write(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of null must be string or UintArray');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0400
     * @tc.name       : testStreamWritable0004
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0004';
      try {
        let writableStream = new TestWritable();
        writableStream.write(' ', 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0500
     * @tc.name       : testStreamWritable0005
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0005';
      try {
        let writableStream = new TestWritable();
        writableStream.write('0', 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0600
     * @tc.name       : testStreamWritable0006
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0006';
      try {
        let stringA = 'test';
        for (let i = 0; i < 9999; i++) {
          stringA += 'test';
        }
        let writableStream = new TestWritable();
        writableStream.write(stringA, 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0700
     * @tc.name       : testStreamWritable0007
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0007';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test/', 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0800
     * @tc.name       : testStreamWritable0008
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0008';
      try {
        let writableStream = new TestWritable();
        writableStream.write('😊', 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_0900
     * @tc.name       : testStreamWritable0009
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0009';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'utf-8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1000
     * @tc.name       : testStreamWritable0010
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0010';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb18030');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1100
     * @tc.name       : testStreamWritable0011
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0011';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gbk');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1200
     * @tc.name       : testStreamWritable0012
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0012';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb2312');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1300
     * @tc.name       : testStreamWritable0013
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0013';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', '1111');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding: 1111');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1400
     * @tc.name       : testStreamWritable0014
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0014';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1500
     * @tc.name       : testStreamWritable0015
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0015';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1600
     * @tc.name       : testStreamWritable0016
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0016';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', '');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1700
     * @tc.name       : testStreamWritable0017
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0017';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'utf-8', () => {
          return true
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1800
     * @tc.name       : testStreamWritable0018
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0018';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb18030', () => {
          return true
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_1900
     * @tc.name       : testStreamWritable0019
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0019';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gbk', () => {
          return true
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2000
     * @tc.name       : testStreamWritable0020
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0020';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb2312', () => {
          return true
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2100
     * @tc.name       : testStreamWritable0021
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0021';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'utf-8', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2200
     * @tc.name       : testStreamWritable0022
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0022';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb18030', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2300
     * @tc.name       : testStreamWritable0023
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0023';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gbk', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2400
     * @tc.name       : testStreamWritable0024
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0024';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb2312', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2500
     * @tc.name       : testStreamWritable0025
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0025';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'utf-8', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2600
     * @tc.name       : testStreamWritable0026
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0026';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb18030', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2700
     * @tc.name       : testStreamWritable0027
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0027';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gbk', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2800
     * @tc.name       : testStreamWritable0028
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0028';
      try {
        let writableStream = new TestWritable();
        writableStream.write('test', 'gb2312', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_2900
     * @tc.name       : testStreamWritable0029
     * @tc.desc       : Test the function of the interface In the Stream_Writable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritable0029';
      try {
        const arr = new Uint8Array([21, 31]);
        let writableStream = new TestWritable();
        writableStream.write(arr, 'utf-8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3000
     * @tc.name       : testStreamWritableEnd0001
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0001';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('finish');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3100
     * @tc.name       : testStreamWritableEnd0002
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0002';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end();
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3200
     * @tc.name       : testStreamWritableEnd0003
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0003';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end(undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3300
     * @tc.name       : testStreamWritableEnd0004
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0004';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end(null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3400
     * @tc.name       : testStreamWritableEnd0005
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0005';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3500
     * @tc.name       : testStreamWritableEnd0006
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0006';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end(' ');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3600
     * @tc.name       : testStreamWritableEnd0007
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0007';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('0');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3700
     * @tc.name       : testStreamWritableEnd0008
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0008';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test/');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3800
     * @tc.name       : testStreamWritableEnd0009
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0009';
      try {
        let stringA = 'test';
        for (let i = 0; i < 9999; i++) {
          stringA += 'test';
        }
        let writableStream = new TestWritable();
        let res = writableStream.end(stringA);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_3900
     * @tc.name       : testStreamWritableEnd0010
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0010';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('😊');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4000
     * @tc.name       : testStreamWritableEnd0011
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End 'utf-8'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0011';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'utf-8');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4100
     * @tc.name       : testStreamWritableEnd0012
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End 'gb18030'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0012';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb18030');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4200
     * @tc.name       : testStreamWritableEnd0013
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End 'gbk'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0013';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gbk');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4300
     * @tc.name       : testStreamWritableEnd0014
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End 'gb2312'
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0014';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb2312');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4400
     * @tc.name       : testStreamWritableEnd0015
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0015';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', '1111');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4500
     * @tc.name       : testStreamWritableEnd0016
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0016';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4600
     * @tc.name       : testStreamWritableEnd0017
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0017';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4700
     * @tc.name       : testStreamWritableEnd0018
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0018';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', '');
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4800
     * @tc.name       : testStreamWritableEnd0019
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0019';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'utf-8', () => {
          return true
        });
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_4900
     * @tc.name       : testStreamWritableEnd0020
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0020';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb18030', () => {
          return true
        });
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5000
     * @tc.name       : testStreamWritableEnd0021
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0021';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gbk', () => {
          return true
        });
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5100
     * @tc.name       : testStreamWritableEnd0022
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0022';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb2312', () => {
          return true
        });
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5200
     * @tc.name       : testStreamWritableEnd0023
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0023';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'utf-8', undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5300
     * @tc.name       : testStreamWritableEnd0024
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0024';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb18030', undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5400
     * @tc.name       : testStreamWritableEnd0025
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0025';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gbk', undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5500
     * @tc.name       : testStreamWritableEnd0026
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0026';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb2312', undefined);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5600
     * @tc.name       : testStreamWritableEnd0027
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0027';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'utf-8', null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5700
     * @tc.name       : testStreamWritableEnd0028
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0028';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb18030', null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5800
     * @tc.name       : testStreamWritableEnd0029
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0029';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gbk', null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_5900
     * @tc.name       : testStreamWritableEnd0030
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0030';
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end('test', 'gb2312', null);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6000
     * @tc.name       : testStreamWritableEnd0031
     * @tc.desc       : Test the function of the interface In the Stream_Writable_End
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testStreamWritableEnd0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testStreamWritableEnd0031';
      try {
        const arr = new Uint8Array([21, 31]);
        let writableStream = new TestWritable();
        let res = writableStream.end(arr);
        expect(res.writable).assertEqual(false);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6100
     * @tc.name       : testSetDefaultEncoding0001
     * @tc.desc       : Test the function of the interface testSetDefaultEncoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetDefaultEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0001";
      try {
        const x = new stream.Writable;
        expect(x.setDefaultEncoding()).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6200
     * @tc.name       : testSetDefaultEncoding0002
     * @tc.desc       : Test the function of the interface testSetDefaultEncoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetDefaultEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0002";
      try {
        const x = new stream.Writable;
        expect(x.setDefaultEncoding("")).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6300
     * @tc.name       : testSetDefaultEncoding0003
     * @tc.desc       : Test the function of the interface testSetDefaultEncoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetDefaultEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0003";
      try {
        const x = new stream.Writable;
        x.setDefaultEncoding(' ');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding:  ');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6400
     * @tc.name       : testSetDefaultEncoding0004
     * @tc.desc       : Test the function of the interface testSetDefaultEncoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetDefaultEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0004";
      try {
        const x = new stream.Writable;
        let y = x.setDefaultEncoding('11');
        console.log(`${TAG} result: ` + y);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding: 11');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6500
     * @tc.name       : testSetDefaultEncoding0005
     * @tc.desc       : Test the function of the interface testSetDefaultEncoding.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetDefaultEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSetDefaultEncoding0005";
      try {
        const x = new stream.Writable;
        expect(x.setDefaultEncoding('utf-8')).assertTrue();
        expect(x.setDefaultEncoding('gb18030')).assertTrue();
        expect(x.setDefaultEncoding('gbk')).assertTrue();
        expect(x.setDefaultEncoding('gb2312')).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6600
     * @tc.name       : testCork0001
     * @tc.desc       : Test the function of the interface testCork.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testCork0001";
      try {
        const x = new stream.Writable;
        expect(x.cork()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6700
     * @tc.name       : testUnCork0001
     * @tc.desc       : Test the function of the interface test UnCork.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUnCork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUnCork0001";
      try {
        const x = new stream.Writable;
        expect(x.uncork()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6800
     * @tc.name       : testOn0001
     * @tc.desc       : Test the function of the interface testOn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOn0001";
      try {
        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback(new Error());
          }
        }

        let callbackwriteSuccess = false;
        let writable = new TestWritable();
        writable.on('error', () => {
          console.info("Writable event test", callbackwriteSuccess.toString());
        })
        writable.write('hello', 'utf8', () => {
        })
        expect(writable.write('hello', 'utf8', () => {
        })).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_6900
     * @tc.name       : testOn0002
     * @tc.desc       : Test the function of the interface testOn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOn0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = "testOn0002";
      try {
        let writableStream = new TestWritable();
        let testListenerwriteSuccess = false;
        let testListener = () => {
          testListenerwriteSuccess = true;
        };
        writableStream.on('finish', testListener);
        writableStream.write('test');
        writableStream.end();
        setTimeout(() => {
          expect(testListenerwriteSuccess).assertEqual(true);
          console.info("Writable test", testListenerwriteSuccess.toString());
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7000
     * @tc.name       : testOn0003
     * @tc.desc       : Test the function of the interface testOn.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOn0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = "testOn0003";
      try {
        let writableStream = new TestWritable();
        let testListenerwriteSuccess = false;
        let testListener = () => {
          testListenerwriteSuccess = true;
        };
        writableStream.on('close', testListener);
        writableStream.write('test');
        writableStream.end();
        setTimeout(() => {
          expect(testListenerwriteSuccess).assertEqual(true);
          console.info("Writable test", testListenerwriteSuccess.toString());
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7100
     * @tc.name       : testOn0004
     * @tc.desc       : Test the function of the interface testOn drain.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOn0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testOn0004";
      try {
        let writableStream = new TestWritable();
        let res = writableStream.end();
        expect(writeSuccess).assertEqual(false);
        expect(res.writable).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7200
     * @tc.name       : testWritableDoInitialize0001
     * @tc.desc       : Test the function of the interface testDoInitialize.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWritableDoInitialize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testWritableDoInitialize0001";
      try {
        class MyWritable extends stream.Writable {
          doInitialize(callback: Function) {
            super.doInitialize(callback);
            doInitializewriteSuccess = true;
            console.info("Writable doInitialize");
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            super.doWrite(chunk, encoding, callback);
          }
        }

        let doInitializewriteSuccess = false;
        let writableStream = new MyWritable();
        writableStream.on('finish', () => {
        })
        expect(doInitializewriteSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7300
     * @tc.name       : testDoWrite0001
     * @tc.desc       : Test the function of the interface testDoWrite.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDoWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDoWrite0001";
      try {
        let writableStream = new TestWritable();
        writableStream.write('data', 'utf8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7400
     * @tc.name       : testDoWritev0001
     * @tc.desc       : Test the function of the interface testDoWritev.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDoWritev0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDoWritev0001";
      try {
        let writableStream = new TestWritable();
        writableStream.write('data1', 'utf8');
        writableStream.write('data2', 'utf8');
        writableStream.uncork();
        writableStream.end();
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7500
     * @tc.name       : testReadableOptions0001
     * @tc.desc       : Test the function of the interface ReadableOptions.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReadableOptions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testReadableOptions0001';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableEncoding?.toString()}`);
        expect(value.readableEncoding?.toString()).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7600
     * @tc.name       : testAttribute0001
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0001';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableObjectMode}`);
        expect(value.readableObjectMode).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7700
     * @tc.name       : testAttribute0002
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0002';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readable}`);
        expect(value.readable).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7800
     * @tc.name       : testAttribute0003
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0003';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableHighWatermark?.toString()}`);
        expect(value.readableHighWatermark?.toString()).assertEqual('16384')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_7900
     * @tc.name       : testAttribute0004
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0004';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableFlowing}`);
        expect(value.readableFlowing).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8000
     * @tc.name       : testAttribute0005
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0005';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableLength}`);
        expect(value.readableLength).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8100
     * @tc.name       : testAttribute0006
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0006';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableEncoding?.toString()}`);
        expect(value.readableEncoding?.toString()).assertEqual('utf-8')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8200
     * @tc.name       : testAttribute0007
     * @tc.desc       : Test the function of the interface Attribute.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAttribute0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testAttribute0007';
      try {
        let value = new stream.Readable();
        console.log(`${TAG} result: ${value.readableEnded}`);
        expect(value.readableEnded).assertEqual(false)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8300
     * @tc.name       : testConstructor0001
     * @tc.desc       : Test the function of the interface Constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConstructor0001';
      try {
        let value = new stream.Readable();
        expect(value instanceof stream.Readable).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8400
     * @tc.name       : testConstructor0002
     * @tc.desc       : Test the function of the interface Constructor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testConstructor0002';
      try {
        let value = new stream.Readable({
          encoding: undefined
        })
        expect(value instanceof stream.Readable).assertEqual(true)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8500
     * @tc.name       : testRead0001
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0001';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read();
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8600
     * @tc.name       : testRead0002
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0002';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(undefined);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8700
     * @tc.name       : testRead0003
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0003';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(null);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8800
     * @tc.name       : testRead0004
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0004';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(0);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_8900
     * @tc.name       : testRead0005
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0005';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(-0);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9000
     * @tc.name       : testRead0006
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0006';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(2);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9100
     * @tc.name       : testRead0007
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0007';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(2.2);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9200
     * @tc.name       : testRead0008
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0008';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(Infinity);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9300
     * @tc.name       : testRead0009
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0009';
      try {
        let readableStream = new TestReadable();
        let dataChunk = readableStream.read(-Infinity);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9400
     * @tc.name       : testRead0010
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0010';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read();
        expect(dataChunk).assertEqual('test')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9500
     * @tc.name       : testRead0011
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0011';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(undefined);
        expect(dataChunk).assertEqual('test')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9600
     * @tc.name       : testRead0012
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0012';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(null);
        expect(dataChunk).assertEqual('test')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9700
     * @tc.name       : testRead0013
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0013';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(0);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9800
     * @tc.name       : testRead0014
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0014';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(-0);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_9900
     * @tc.name       : testRead0015
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0015';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(2);
        expect(dataChunk).assertEqual('te')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10000
     * @tc.name       : testRead0016
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0016';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(2.2);
        expect(dataChunk).assertEqual('te')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10100
     * @tc.name       : testRead0017
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0017';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(-2.2);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10200
     * @tc.name       : testRead0018
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0018';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(Infinity);
        expect(dataChunk).assertEqual('test')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10300
     * @tc.name       : testRead0019
     * @tc.desc       : Test the function of the interface Read.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testRead0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testRead0019';
      try {
        let readableStream = new TestReadable();
        readableStream.push('test');
        readableStream.pause();
        let dataChunk = readableStream.read(-Infinity);
        expect(dataChunk).assertEqual(null)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10400
     * @tc.name       : testResume0001
     * @tc.desc       : Switch the read mode of the stream from pause to flow mode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testResume0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testResume0001';
      try {
        let readableStream = new TestReadable();
        readableStream.resume();
        expect(readableStream.isPaused()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10500
     * @tc.name       : testPause0001
     * @tc.desc       : Switch the read mode of the stream from flow to pause mode.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPause0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPause0001';
      try {
        let readableStream = new TestReadable();
        readableStream.pause();
        expect(readableStream.isPaused()).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10600
     * @tc.name       : testSetEncoding0001
     * @tc.desc       : Sets the character encoding for the readable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetEncoding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0001';
      try {
        let readableStream = new TestReadable();
        let result = readableStream.setEncoding();
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10700
     * @tc.name       : testSetEncoding0002
     * @tc.desc       : Sets the character encoding for the readable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetEncoding0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0002';
      try {
        let readableStream = new TestReadable();
        let result = readableStream.setEncoding('');
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10800
     * @tc.name       : testSetEncoding0003
     * @tc.desc       : Sets the character encoding for the readable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetEncoding0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0003';
      try {
        let readableStream = new TestReadable();
        let result = readableStream.setEncoding(' ');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of   must be string.');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_10900
     * @tc.name       : testSetEncoding0004
     * @tc.desc       : Sets the character encoding for the readable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetEncoding0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0004';
      try {
        let readableStream = new TestReadable();
        let result = readableStream.setEncoding('11');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of 11 must be string.');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11000
     * @tc.name       : testSetEncoding0005
     * @tc.desc       : Sets the character encoding for the readable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSetEncoding0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testSetEncoding0005';
      try {
        let readableStream = new TestReadable();
        let result = readableStream.setEncoding('utf-8');
        let result1 = readableStream.setEncoding('gb18030');
        let result2 = readableStream.setEncoding('gbk');
        let result3 = readableStream.setEncoding('gb2312');
        expect(result).assertEqual(true);
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11100
     * @tc.name       : testIsPaused0001
     * @tc.desc       : Check if the stream is in pause mode, true when calling pause () and false when calling resume ().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsPaused0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testIsPaused0001';
      try {
        let readableStream = new TestReadable();
        expect(readableStream.isPaused()).assertEqual(false);
        readableStream.pause();
        expect(readableStream.isPaused()).assertEqual(true);
        readableStream.resume();
        expect(readableStream.isPaused()).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11200
     * @tc.name       : testPipe0001
     * @tc.desc       : Connect a readable stream with a writable stream to achieve automatic data transmission.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPipe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPipe0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            readable.push('test');
            readable.push(null);
          }
        }

        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            expect(chunk).assertEqual('test');
            console.info("Readable test pipe", chunk);
            callback();
          }
        }

        let readable = new TestReadable();
        let writable = new TestWritable();
        readable.pipe(writable);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11300
     * @tc.name       : testUnpipe0001
     * @tc.desc       : Removes all or specified connected readable streams from the writable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUnpipe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testUnpipe0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            readable.push('test');
            readable.push(null);
          }
        }

        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            expect(chunk).assertEqual('test');
            aaa = true;
            console.info("Readable test pipe", chunk);
            callback();
          }
        }

        let readable = new TestReadable();
        let writable = new TestWritable();
        let aaa = false;
        readable.pipe(writable);
        readable.unpipe(writable);
        readable.on('data', () => {
          console.info("Readable test unpipe data event writeSuccess");
        })
        setTimeout(() => {
          expect(aaa).assertEqual(false);
          console.log('Readable test pipe true');
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11400
     * @tc.name       : testOnClose0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOnClose0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOnClose0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('close', () => {
          writeSuccess = true;
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11500
     * @tc.name       : testOnData0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOnData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOnData0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('data', () => {
          writeSuccess = true;
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11600
     * @tc.name       : testOnEnd0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOnEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOnEnd0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push(null);
        readable.on('end', () => {
          writeSuccess = true;
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11700
     * @tc.name       : testOnError0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOnError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOnError0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('error', () => {
          writeSuccess = true;
          console.info("error event writeSuccess");
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11800
     * @tc.name       : testOnReadable0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOnReadable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOnReadable0001';
      try {
        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('readable', () => {
          writeSuccess = true;
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          expect(readable.readable).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_11900
     * @tc.name       : testOffClose0001
     * @tc.desc       : Register event handling functions to listen for different events on readable streams.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOffClose0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOffClose0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('close', () => {
          writeSuccess = true;
        });
        readable.off('close');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(false);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12000
     * @tc.name       : testOffData0001
     * @tc.desc       : Cancels event handlers registered with on.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOffData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOffData0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('data', () => {
          writeSuccess = true;
        })
        readable.off('data');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(false);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12100
     * @tc.name       : testOffEnd0001
     * @tc.desc       : Cancels event handlers registered with on.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOffEnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOffEnd0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push(null);
        readable.on('end', () => {
          writeSuccess = true;
        })
        readable.off('end');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(false);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12200
     * @tc.name       : testOffError0001
     * @tc.desc       : Cancels event handlers registered with on.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOffError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOffError0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push(null);
        readable.on('error', () => {
          writeSuccess = true;
        })
        readable.off('error');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(false);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12300
     * @tc.name       : testOffReadable0001
     * @tc.desc       : Cancels event handlers registered with on.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOffReadable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testOffReadable0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            throw new Error('Simulated error');
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.push('test');
        readable.on('readable', () => {
          writeSuccess = true;
        })
        readable.off('readable');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(false);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12400
     * @tc.name       : testReadableDoInitialize0001
     * @tc.desc       : The consumer implements this function, which is writeSuccess the first time the on listener is used on
     *                 the readable stream. Use callback asynchronous callback.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testReadableDoInitialize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testReadableDoInitialize0001';
      try {
        class MyReadable extends stream.Readable {
          doInitialize(callback: Function) {
            super.doInitialize(callback);
            writeSuccess = true;
          }

          doRead(size: number) {
          }
        }

        let myReadable = new MyReadable();
        let writeSuccess = false;
        myReadable.on('data', () => {
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12500
     * @tc.name       : testDoRead0001
     * @tc.desc       : The data reading interface needs to be implemented in a subclass.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDoRead0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testDoRead0001';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            writeSuccess = true;
            console.info("doRead writeSuccess");
          }
        }

        let readable = new TestReadable();
        let writeSuccess = false;
        readable.on('data', () => {
        })
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12600
     * @tc.name       : testPush0001
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0001';
      try {
        let readable = new TestReadable();
        let testData = undefined
        let result = readable.push(testData);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12700
     * @tc.name       : testPush0002
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0002';
      try {
        let readable = new TestReadable();
        let testData = null
        let result = readable.push(testData);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12800
     * @tc.name       : testPush0003
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0003';
      try {
        let readable = new TestReadable();
        let testData = ''
        let result = readable.push(testData);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('src is not iterable');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_12900
     * @tc.name       : testPush0004
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0004';
      try {
        let readable = new TestReadable();
        let testData = ' '
        let result = readable.push(testData);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13000
     * @tc.name       : testPush0005
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0005';
      try {
        let readable = new TestReadable();
        let testData = '0'
        let result = readable.push(testData);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13100
     * @tc.name       : testPush0006
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0006';
      try {
        let stringA = 'test';
        for (let i = 0; i < 9999; i++) {
          stringA += 'test';
        }
        let readable = new TestReadable();
        let testData = stringA
        let result = readable.push(testData);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13200
     * @tc.name       : testPush0007
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0007';
      try {
        let readable = new TestReadable();
        let testData = 'test/'
        let result = readable.push(testData);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13300
     * @tc.name       : testPush0008
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0008';
      try {
        let readable = new TestReadable();
        let testData = '✌️'
        let result = readable.push(testData);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13400
     * @tc.name       : testPush0009
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0009';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', 'utf-8');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13500
     * @tc.name       : testPush0010
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0010';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', 'gb18030');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13600
     * @tc.name       : testPush0011
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0011';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', 'gbk');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13700
     * @tc.name       : testPush0012
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0012';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', 'gb2312');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13800
     * @tc.name       : testPush0013
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0013';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', '1111');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of 1111 must be string.');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_13900
     * @tc.name       : testPush0014
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0014';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', undefined);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14000
     * @tc.name       : testPush0015
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0015';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', null);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14100
     * @tc.name       : testPush0016
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0016';
      try {
        let readable = new TestReadable();
        let result = readable.push('test', '');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14200
     * @tc.name       : testPush0017
     * @tc.desc       : Push data into the readable stream buffer.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPush0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testPush0017';
      try {
        let readable = new TestReadable();
        let uint8Array = new Uint8Array(5);
        let result = readable.push(uint8Array);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14300
     * @tc.name       : testDuplexConstructor0001
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0001';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableHighWatermark}`);
        expect(x.writableHighWatermark).assertEqual(16384);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14400
     * @tc.name       : testDuplexConstructor0002
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0002';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableObjectMode}`);
        expect(x.writableObjectMode).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14500
     * @tc.name       : testDuplexConstructor0003
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0003';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableLength}`);
        expect(x.writableLength).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14600
     * @tc.name       : testDuplexConstructor0004
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0004';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writable}`);
        expect(x.writable).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14700
     * @tc.name       : testDuplexConstructor0005
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0005';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableCorked}`);
        expect(x.writableCorked).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14800
     * @tc.name       : testDuplexConstructor0006
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0006';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableEnded}`);
        expect(x.writableEnded).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_14900
     * @tc.name       : testDuplexConstructor0007
     * @tc.desc       : The constructor of Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplexConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplexConstructor0007';
      try {
        let x = new stream.Duplex();
        console.error(`${TAG} catch error: ${x.writableFinished}`);
        expect(x.writableFinished).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15000
     * @tc.name       : testDuplex0001
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0001';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write();
        console.info("duplexStream result", result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of undefined must be string or UintArray');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15100
     * @tc.name       : testDuplex0002
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0002';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write(undefined);
        console.info("duplexStream result", result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of undefined must be string or UintArray');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15200
     * @tc.name       : testDuplex0003
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0003';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write(null);
        console.info("duplexStream result", result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Parameter error. The type of null must be string or UintArray');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15300
     * @tc.name       : testDuplex0004
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0004';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('');
        console.info("duplexStream result", result);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Cannot read property byteLength of undefined');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15400
     * @tc.name       : testDuplex0005
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0005';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write(' ');
        console.info("duplexStream result", result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15500
     * @tc.name       : testDuplex0006
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0006';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('0');
        console.info("duplexStream result", result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15600
     * @tc.name       : testDuplex0007
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0007';
      try {
        let duplexStream = new TestDuplex();
        let stringA = 'test';
        for (let i = 0; i < 9999; i++) {
          stringA += 'test';
        }
        let result = duplexStream.write(stringA);
        console.info("duplexStream result", result);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15700
     * @tc.name       : testDuplex0008
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0008';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('test/');
        console.info("duplexStream result", result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15800
     * @tc.name       : testDuplex0009
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0009';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('😀');
        console.info("duplexStream result", result);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_15900
     * @tc.name       : testDuplex0010
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0010';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result1 = duplexStream.write('test', 'utf-8');
        let result2 = duplexStream.write('test', 'gb18030');
        let result3 = duplexStream.write('test', 'gbk');
        let result4 = duplexStream.write('test', 'gb2312');
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
        expect(result4).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16000
     * @tc.name       : testDuplex0011
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0011';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('test', '1111');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding: 1111');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16100
     * @tc.name       : testDuplex0012
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0012';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('test', undefined);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16200
     * @tc.name       : testDuplex0013
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0013';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('test', null);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16300
     * @tc.name       : testDuplex0014
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0014';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result = duplexStream.write('test', '');
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16400
     * @tc.name       : testDuplex0015
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0015';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result1 = duplexStream.write('test', 'utf-8', () => {
          return true;
        })
        let result2 = duplexStream.write('test', 'gb18030', () => {
          return true;
        })
        let result3 = duplexStream.write('test', 'gbk', () => {
          return true;
        })
        let result4 = duplexStream.write('test', 'gb2312', () => {
          return true;
        })
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
        expect(result4).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16500
     * @tc.name       : testDuplex0016
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0016';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result1 = duplexStream.write('test', 'utf-8', undefined);
        let result2 = duplexStream.write('test', 'gb18030', undefined);
        let result3 = duplexStream.write('test', 'gbk', undefined);
        let result4 = duplexStream.write('test', 'gb2312', undefined);
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
        expect(result4).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16600
     * @tc.name       : testDuplex0017
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0017';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        let result1 = duplexStream.write('test', 'utf-8', null);
        let result2 = duplexStream.write('test', 'gb18030', null);
        let result3 = duplexStream.write('test', 'gbk', null);
        let result4 = duplexStream.write('test', 'gb2312', null);
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(true);
        expect(result4).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16700
     * @tc.name       : testDuplex0018
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0018';
      try {
        let duplex = new stream.Duplex();
        let duplexStream = new TestDuplex();
        const uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
        let result = duplexStream.write(uint8Array);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16800
     * @tc.name       : testDuplex0019
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0019';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end();
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_16900
     * @tc.name       : testDuplex0020
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0020';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end(undefined);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17000
     * @tc.name       : testDuplex0021
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0021';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end(null);
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17100
     * @tc.name       : testDuplex0022
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0022';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('');
        expect(writeSuccess).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17200
     * @tc.name       : testDuplex0023
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0023';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end(' ');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17300
     * @tc.name       : testDuplex0024
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0024';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('0');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17400
     * @tc.name       : testDuplex0025
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0025';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test/');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17500
     * @tc.name       : testDuplex0026
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0026';
      try {
        let duplexStream = new TestDuplex();
        let stringA = 'test';
        for (let i = 0; i < 9999; i++) {
          stringA += 'test';
        }
        let res = duplexStream.end(stringA);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17600
     * @tc.name       : testDuplex0027
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0027';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('😀😀');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17700
     * @tc.name       : testDuplex0028
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0028';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'utf-8');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17800
     * @tc.name       : testDuplex0029
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0029';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb18030');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_17900
     * @tc.name       : testDuplex0030
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0030';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gbk');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18000
     * @tc.name       : testDuplex0031
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0031';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb2312');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18100
     * @tc.name       : testDuplex0032
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0032';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', '1111');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18200
     * @tc.name       : testDuplex0033
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0033';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18300
     * @tc.name       : testDuplex0034
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0034';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18400
     * @tc.name       : testDuplex0035
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0035';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', '');
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18500
     * @tc.name       : testDuplex0036
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0036';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'utf-8', () => {
          return true;
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18600
     * @tc.name       : testDuplex0037
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0037';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb18030', () => {
          return true;
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18700
     * @tc.name       : testDuplex0038
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0038';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gbk', () => {
          return true;
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18800
     * @tc.name       : testDuplex0039
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0039';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb2312', () => {
          return true;
        })
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_18900
     * @tc.name       : testDuplex0040
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0040';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'utf-8', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19000
     * @tc.name       : testDuplex0041
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0041';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb18030', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19100
     * @tc.name       : testDuplex0042
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0042';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gbk', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19200
     * @tc.name       : testDuplex0043
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0043';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb2312', undefined);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19300
     * @tc.name       : testDuplex0044
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0044';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'utf-8', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19400
     * @tc.name       : testDuplex0045
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0045';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb18030', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19500
     * @tc.name       : testDuplex0046
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0046';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gbk', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19600
     * @tc.name       : testDuplex0047
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0047';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.end('test', 'gb2312', null);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19700
     * @tc.name       : testDuplex0048
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0048';
      try {
        let duplexStream = new TestDuplex();
        const uint8Array = new Uint8Array([10, 20, 30, 40, 50]);
        let res = duplexStream.end(uint8Array);
        expect(writeSuccess).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19800
     * @tc.name       : testDuplex0049
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0049';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding();
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_19900
     * @tc.name       : testDuplex0050
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0050';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('');
        expect(res).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20000
     * @tc.name       : testDuplex0051
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0051';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding(' ');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding:  ');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20100
     * @tc.name       : testDuplex0052
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0052';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('11');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('Unknown encoding: 11');
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20200
     * @tc.name       : testDuplex0053
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0053';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('utf-8');
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20300
     * @tc.name       : testDuplex0054
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0054';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('gb18030');
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20400
     * @tc.name       : testDuplex0055
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0055';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('gbk');
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20500
     * @tc.name       : testDuplex0056
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0056';
      try {
        let duplexStream = new TestDuplex();
        let res = duplexStream.setDefaultEncoding('gb2312');
        expect(res).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20600
     * @tc.name       : testDuplex0057
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0057';
      try {
        let duplexStream = new stream.Duplex();
        let result = duplexStream.cork();
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20700
     * @tc.name       : testDuplex0058
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0058';
      try {
        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            dataWritten += chunk;
            callback();
          }
        }

        let dataWritten = '';
        let duplexStream = new TestDuplex();
        duplexStream.cork();
        duplexStream.write('a');
        duplexStream.write('b');
        let result = duplexStream.uncork();
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20800
     * @tc.name       : testDuplex0059
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testDuplex0059';
      try {
        let duplexStream = new TestDuplex();
        duplexStream.write('test');
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_20900
     * @tc.name       : testDuplex0060
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testDuplex0060';
      try {
        let writeSuccess = false;

        class TestDuplex extends stream.Duplex {
          constructor() {
            super();
          }

          doRead(size: number) {
          }

          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            callback();
          }

          doWritev(chunks: string[] | Uint8Array[], callback: Function) {
            writeSuccess = true;
            callback();
          }
        }

        let duplexStream = new TestDuplex();
        duplexStream.cork();
        duplexStream.write('test1');
        duplexStream.write('test2');
        duplexStream.uncork();
        duplexStream.end();
        setTimeout(() => {
          expect(writeSuccess).assertEqual(true);
          done();
        });
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21000
     * @tc.name       : testDuplex0061
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0061';
      try {
        let stringChunk = '';

        class TestTransform extends stream.Transform {
          constructor() {
            super();
          }

          doTransform(chunk: string, encoding: string, callback: Function) {
            stringChunk = chunk.toString().toUpperCase();
            tr.push(stringChunk);
            callback();
          }
        }

        let tr = new TestTransform();
        tr.write("hello");
        expect(stringChunk).assertEqual('HELLO');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21100
     * @tc.name       : testDuplex0062
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDuplex0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDuplex0062';
      try {
        class TestTransform extends stream.Transform {
          constructor() {
            super();
          }

          doTransform(chunk: string, encoding: string, callback: Function) {
            callback();
          }

          doFlush(callback: Function) {
            callback(null, 'test');
          }
        }

        let transform = new TestTransform();
        transform.end('my test');
        transform.on('data', (data) => {
          expect(data.data).assertEqual('test');
        })
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21200
     * @tc.name       : testWrite0063
     * @tc.desc       : Test the function of the interface Duplex.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testWrite0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const TAG = 'testWrite0063';
      class TestWritable1 extends stream.Writable {
        constructor() {
          super();
        }

        doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
          callback();
        }
      }
      let res = true;
      let writableStream = new TestWritable1();
      let testListenerCalled = false;
      let testListener = () => {
        testListenerCalled = true;
      };
      writableStream.on('finish', testListener);
      writableStream.off('finish', testListener);
      writableStream.write('test');
      writableStream.end();
      setTimeout(() => {
        expect(testListenerCalled.toString()).assertEqual("true")
        res = testListenerCalled;
      }, 80);
      sleep(3000);
      clearTimeout();
      expect(res).assertEqual(true);
      done();
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_STREAM_21300
     * @tc.name       : testUnpipe0002
     * @tc.desc       : Removes all or specified connected readable streams from the writable stream.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUnpipe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const TAG = 'testUnpipe0002';
      try {
        class TestReadable extends stream.Readable {
          constructor() {
            super();
          }

          doRead(size: number) {
            readable.push('test');
            readable.push(null);
          }
        }
        class TestWritable extends stream.Writable {
          constructor() {
            super();
          }
          doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
            expect(chunk).assertEqual('test');
            aaa = true;
            console.info("Readable test pipe", chunk);
            callback();
          }
        }
        let readable = new TestReadable();
        let writable = new TestWritable();
        let aaa = false;
        readable.pipe(writable);
        readable.unpipe();
        readable.on('data', () => {
          console.info("Readable test unpipe data event writeSuccess");
        })
        setTimeout(() => {
          expect(aaa).assertEqual(true);
          console.log('Readable test pipe true');
          done();
        });
        sleep(1000);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })

  })
}
