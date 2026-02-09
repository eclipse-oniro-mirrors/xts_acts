/*
* Copyright (c) 2026 Huawei Technology Development Co., LTD.
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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { fastbuffer } from '@kit.ArkTS';

let TAG = "FastBufferNullUndefinedTest";

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve()
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function FastBuffer4() {
  describe('FastBuffer4', () => {
    afterEach(async (done: Function) => {
      await sleep(20);
      done();
    })

    /**
     * @tc.name   testFastBufferAllocEncodingNull
     * @tc.number SUB_FASTBUFFER_ALLOC_ENCODING_NULLA_0100
     * @tc.desc   Testing fastbuffer.alloc with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferAllocEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferAllocEncodingNull";
      try {
        let buf = fastbuffer.alloc(10, 'abc', null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferAllocEncodingUndefined
     * @tc.number SUB_FASTBUFFER_ALLOC_ENCODING_UNDEF_0100
     * @tc.desc   Testing fastbuffer.alloc with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferAllocEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferAllocEncodingUndefined";
      try {
        let buf = fastbuffer.alloc(10, 'abc', undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferAllocFillNull
     * @tc.number SUB_FASTBUFFER_ALLOC_FILL_NULL_0100
     * @tc.desc   Testing fastbuffer.alloc with fill as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferAllocFillNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferAllocFillNull";
      try {
        let buf = fastbuffer.alloc(10, null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferAllocFillUndefined
     * @tc.number SUB_FASTBUFFER_ALLOC_FILL_UNDEF_0100
     * @tc.desc   Testing fastbuffer.alloc with fill as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferAllocFillUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferAllocFillUndefined";
      try {
        let buf = fastbuffer.alloc(10, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferByteLengthEncodingNull
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_ENC_NULL_0100
     * @tc.desc   Testing fastbuffer.byteLength with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferByteLengthEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferByteLengthEncodingNull";
      try {
        let len = fastbuffer.byteLength('hello', null);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferByteLengthEncodingUndefined
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_ENC_UNDEF_0100
     * @tc.desc   Testing fastbuffer.byteLength with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferByteLengthEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferByteLengthEncodingUndefined";
      try {
        let len = fastbuffer.byteLength('hello', undefined);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferByteLengthValueEmpty
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_VALUE_EMPTY_0100
     * @tc.desc   Testing fastbuffer.byteLength with value as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferByteLengthValueEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferByteLengthValueEmpty";
      try {
        let len = fastbuffer.byteLength('');
        expect(len).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferConcatListNull
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_NULL_0100
     * @tc.desc   Testing fastbuffer.concat with list as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferConcatListNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferConcatListNull";
      try {
        let result = fastbuffer.concat(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferConcatTotalLengthNull
     * @tc.number SUB_FASTBUFFER_CONCAT_TOTAL_NULL_0100
     * @tc.desc   Testing fastbuffer.concat with totalLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferConcatTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferConcatTotalLengthNull";
      try {
        let buf1 = fastbuffer.alloc(5);
        let buf2 = fastbuffer.alloc(5);
        let result = fastbuffer.concat([buf1, buf2], null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferConcatTotalLengthUndefined
     * @tc.number SUB_FASTBUFFER_CONCAT_TOTAL_UNDEF_0100
     * @tc.desc   Testing fastbuffer.concat with totalLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferConcatTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferConcatTotalLengthUndefined";
      try {
        let buf1 = fastbuffer.alloc(5);
        let buf2 = fastbuffer.alloc(5);
        let result = fastbuffer.concat([buf1, buf2], undefined);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferConcatEmptyArray
     * @tc.number SUB_FASTBUFFER_CONCAT_EMPTY_ARRAY_0100
     * @tc.desc   Testing fastbuffer.concat with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferConcatEmptyArray', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferConcatEmptyArray";
      try {
        let result = fastbuffer.concat([]);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeFromEncNull
     * @tc.number SUB_FASTBUFFER_TRANSCODE_FROM_NULL_0100
     * @tc.desc   Testing fastbuffer.transcode with fromEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeFromEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeFromEncNull";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, null, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeFromEncUndefined
     * @tc.number SUB_FASTBUFFER_TRANSCODE_FROM_UNDEF_0100
     * @tc.desc   Testing fastbuffer.transcode with fromEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeFromEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeFromEncUndefined";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, undefined, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeFromEncEmpty
     * @tc.number SUB_FASTBUFFER_TRANSCODE_FROM_EMPTY_0100
     * @tc.desc   Testing fastbuffer.transcode with fromEnc as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeFromEncEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeFromEncEmpty";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, '', 'utf8');
        expect(result.length).assertEqual(5);
        expect(result.toString()).assertEqual("hello");
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeToEncNull
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TO_NULL_0100
     * @tc.desc   Testing fastbuffer.transcode with toEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeToEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeToEncNull";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, 'utf8', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeToEncUndefined
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TO_UNDEF_0100
     * @tc.desc   Testing fastbuffer.transcode with toEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeToEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeToEncUndefined";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, 'utf8', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferTranscodeToEncEmpty
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TO_EMPTY_0100
     * @tc.desc   Testing fastbuffer.transcode with toEnc as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferTranscodeToEncEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferTranscodeToEncEmpty";
      try {
        let buf = fastbuffer.from('hello');
        let result = fastbuffer.transcode(buf, 'utf8', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFastBufferFillValueNull
     * @tc.number SUB_FASTBUFFER_FILL_VALUE_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with value as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillValueNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillValueNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill(null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferFillValueUndefined
     * @tc.number SUB_FASTBUFFER_FILL_VALUE_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with value as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillValueUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillValueUndefined";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill(undefined);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferFillOffsetNull
     * @tc.number SUB_FASTBUFFER_FILL_OFFSET_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillOffsetNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill(1, null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferFillEndNull
     * @tc.number SUB_FASTBUFFER_FILL_END_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillEndNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill(1, 0, null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferFillEndUndefined
     * @tc.number SUB_FASTBUFFER_FILL_END_UNDEFINED_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillEndUndefined";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill(1, 0, undefined);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferFillEncodingNull
     * @tc.number SUB_FASTBUFFER_FILL_ENCODING_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.fill with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferFillEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferFillEncodingNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill('abc', 0, 10, null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCompareTargetEndNull
     * @tc.number SUB_FASTBUFFER_COMPARE_TEND_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.compare with targetEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCompareTargetEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCompareTargetEndNull";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.from('abc');
        let result = buf1.compare(buf2, 0, null, 0, 3);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCompareTargetEndUndefined
     * @tc.number SUB_FASTBUFFER_COMPARE_TEND_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.compare with targetEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCompareTargetEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCompareTargetEndUndefined";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.from('abc');
        let result = buf1.compare(buf2, 0, undefined, 0, 3);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCompareSourceEndNull
     * @tc.number SUB_FASTBUFFER_COMPARE_SEND_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.compare with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCompareSourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCompareSourceEndNull";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.from('abc');
        let result = buf1.compare(buf2, 0, 3, 0, null);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCompareSourceEndUndefined
     * @tc.number SUB_FASTBUFFER_COMPARE_SEND_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.compare with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCompareSourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCompareSourceEndUndefined";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.from('abc');
        let result = buf1.compare(buf2, 0, 3, 0, undefined);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopyTargetStartNull
     * @tc.number SUB_FASTBUFFER_COPY_TSTART_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with targetStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopyTargetStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopyTargetStartNull";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, null, 0, 3);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopyTargetStartUndefined
     * @tc.number SUB_FASTBUFFER_COPY_TSTART_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with targetStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopyTargetStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopyTargetStartUndefined";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, undefined, 0, 3);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopySourceStartNull
     * @tc.number SUB_FASTBUFFER_COPY_SSTART_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with sourceStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopySourceStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopySourceStartNull";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, 0, null, 3);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopySourceStartUndefined
     * @tc.number SUB_FASTBUFFER_COPY_SSTART_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with sourceStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopySourceStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopySourceStartUndefined";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, 0, undefined, 3);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopySourceEndNull
     * @tc.number SUB_FASTBUFFER_COPY_SEND_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopySourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopySourceEndNull";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, 0, 0, null);
        expect(result.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferCopySourceEndUndefined
     * @tc.number SUB_FASTBUFFER_COPY_SEND_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.copy with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferCopySourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferCopySourceEndUndefined";
      try {
        let buf1 = fastbuffer.from('abc');
        let buf2 = fastbuffer.alloc(5);
        let result = buf1.copy(buf2, 0, 0, undefined);
        expect(result).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringEncodingNull
     * @tc.number SUB_FASTBUFFER_TOSTRING_ENC_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringEncodingNull";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString(null);
        expect(result).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringEncodingUndefined
     * @tc.number SUB_FASTBUFFER_TOSTRING_ENC_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringEncodingUndefined";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString(undefined);
        expect(result).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringEncodingEmpty
     * @tc.number SUB_FASTBUFFER_TOSTRING_ENC_EMPTY_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with encoding as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringEncodingEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringEncodingEmpty";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString('');
        expect(result.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringStartNull
     * @tc.number SUB_FASTBUFFER_TOSTRING_START_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with start as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringStartNull";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString('utf8', null, 5);
        expect(result).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringStartUndefined
     * @tc.number SUB_FASTBUFFER_TOSTRING_START_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with start as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringStartUndefined";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString('utf8', undefined, 5);
        expect(result).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringEndNull
     * @tc.number SUB_FASTBUFFER_TOSTRING_END_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringEndNull";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString('utf8', 0, null);
        expect(result).assertEqual('');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferToStringEndUndefined
     * @tc.number SUB_FASTBUFFER_TOSTRING_END_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.toString with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferToStringEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferToStringEndUndefined";
      try {
        let buf = fastbuffer.from('hello');
        let result = buf.toString('utf8', 0, undefined);
        expect(result).assertEqual('hello');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteOffsetNull
     * @tc.number SUB_FASTBUFFER_WRITE_OFFSET_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.write with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteOffsetNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', null);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteOffsetUndefined
     * @tc.number SUB_FASTBUFFER_WRITE_OFFSET_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.write with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteOffsetUndefined";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', undefined);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteLengthNull
     * @tc.number SUB_FASTBUFFER_WRITE_LENGTH_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.write with length as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteLengthNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, null);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteLengthUndefined
     * @tc.number SUB_FASTBUFFER_WRITE_LENGTH_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.write with length as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteLengthUndefined";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, undefined);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteEncodingNull
     * @tc.number SUB_FASTBUFFER_WRITE_ENC_NULL_0100
     * @tc.desc   Testing FastBuffer.prototype.write with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteEncodingNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, null);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteEncodingUndefined
     * @tc.number SUB_FASTBUFFER_WRITE_ENC_UNDEF_0100
     * @tc.desc   Testing FastBuffer.prototype.write with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteEncodingUndefined";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, undefined);
        expect(result).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFastBufferWriteEncodingEmpty
     * @tc.number SUB_FASTBUFFER_WRITE_ENC_EMPTY_0100
     * @tc.desc   Testing FastBuffer.prototype.write with encoding as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFastBufferWriteEncodingEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFastBufferWriteEncodingEmpty";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testAllocEncodingNull
     * @tc.number SUB_FASTBUFFER_ALLOC_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.alloc with encoding parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocEncodingNull";
      try {

        let buf = fastbuffer.alloc(10, 'a', null);
        expect(buf.length).assertEqual(10);
        expect(buf.toString()).assertEqual('aaaaaaaaaa');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocEncodingUndefined
     * @tc.number SUB_FASTBUFFER_ALLOC_ENCODING_UNDEFINED_0100
     * @tc.desc   Testing Buffer.alloc with encoding parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocEncodingUndefined";
      try {

        let buf = fastbuffer.alloc(10, 'a', undefined);
        expect(buf.length).assertEqual(10);
        expect(buf.toString()).assertEqual('aaaaaaaaaa');
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillNullEncodingNull
     * @tc.number SUB_FASTBUFFER_ALLOC_FILL_NULL_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.alloc with fill as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillNullEncodingNull";
      try {

        let buf = fastbuffer.alloc(10, null, null);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillUndefinedEncodingUndefined
     * @tc.number SUB_FASTBUFFER_ALLOC_FILL_UNDEF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.alloc with fill as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillUndefinedEncodingUndefined";
      try {

        let buf = fastbuffer.alloc(10, undefined, undefined);
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testAllocFillNullWithEncoding
     * @tc.number SUB_FASTBUFFER_ALLOC_FILL_NULL_WITH_ENCODING_0100
     * @tc.desc   Testing Buffer.alloc with fill as null and encoding as utf8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testAllocFillNullWithEncoding', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testAllocFillNullWithEncoding";
      try {

        let buf = fastbuffer.alloc(10, null, 'utf8');
        expect(buf.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthEncodingNull
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with encoding parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthEncodingNull";
      try {

        let len = fastbuffer.byteLength('hello world', null);
        expect(len).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthEncodingUndefined
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with encoding parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthEncodingUndefined";
      try {

        let len = fastbuffer.byteLength('hello world', undefined);
        expect(len).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthStringNullEncodingNull
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_STR_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with string as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthStringNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthStringNullEncodingNull";
      try {

        let len = fastbuffer.byteLength(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testByteLengthStringUndefinedEncodingUndefined
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_STR_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with string as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthStringUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthStringUndefinedEncodingUndefined";
      try {

        let len = fastbuffer.byteLength(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testByteLengthBufferEncodingNull
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_BUFFER_ENC_NULL_0100
     * @tc.desc   Testing Buffer.byteLength with Buffer and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthBufferEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthBufferEncodingNull";
      try {

        let buf = fastbuffer.from('hello');
        let len = fastbuffer.byteLength(buf, null);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testByteLengthBufferEncodingUndefined
     * @tc.number SUB_FASTBUFFER_BYTELENGTH_BUFFER_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.byteLength with Buffer and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testByteLengthBufferEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testByteLengthBufferEncodingUndefined";
      try {

        let buf = fastbuffer.from('hello');
        let len = fastbuffer.byteLength(buf, undefined);
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListNull
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_NULLA_0100
     * @tc.desc   Testing Buffer.concat with list parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListNull";
      try {

        let result = fastbuffer.concat(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListUndefined
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with list parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListUndefined";
      try {

        let result = fastbuffer.concat(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatTotalLengthNull
     * @tc.number SUB_FASTBUFFER_CONCAT_TOTALLEN_NULL_0100
     * @tc.desc   Testing Buffer.concat with totalLength parameter as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatTotalLengthNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('world');
        let result = fastbuffer.concat([buf1, buf2], null);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatTotalLengthUndefined
     * @tc.number SUB_FASTBUFFER_CONCAT_TOTALLEN_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with totalLength parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatTotalLengthUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('world');
        let result = fastbuffer.concat([buf1, buf2], undefined);
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListNullTotalLengthNull
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_NULL_TL_NULL_0100
     * @tc.desc   Testing Buffer.concat with list as null and totalLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListNullTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListNullTotalLengthNull";
      try {

        let result = fastbuffer.concat(null, null);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListUndefinedTotalLengthUndefined
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_UNDEF_TL_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with list as undefined and totalLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListUndefinedTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListUndefinedTotalLengthUndefined";
      try {

        let result = fastbuffer.concat(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testConcatListEmptyTotalLengthNull
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_EMPTY_TL_NULL_0100
     * @tc.desc   Testing Buffer.concat with empty list and totalLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListEmptyTotalLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListEmptyTotalLengthNull";
      try {

        let result = fastbuffer.concat([], null);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testConcatListEmptyTotalLengthUndefined
     * @tc.number SUB_FASTBUFFER_CONCAT_LIST_EMPTY_TL_UNDEF_0100
     * @tc.desc   Testing Buffer.concat with empty list and totalLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testConcatListEmptyTotalLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testConcatListEmptyTotalLengthUndefined";
      try {

        let result = fastbuffer.concat([], undefined);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayEmpty
     * @tc.number SUB_FASTBUFFER_FROM_ARRAY_EMPTY_0100
     * @tc.desc   Testing Buffer.from with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayEmpty', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayEmpty";
      try {

        let result = fastbuffer.from([]);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferByteOffsetNull
     * @tc.number SUB_FASTBUFFER_FROM_ARRAYBUF_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferByteOffsetNull";
      try {

        let ab = new ArrayBuffer(10);
        let result = fastbuffer.from(ab, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferByteOffsetUndefined
     * @tc.number SUB_FASTBUFFER_FROM_ARRAYBUF_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferByteOffsetUndefined";
      try {

        let ab = new ArrayBuffer(10);
        let result = fastbuffer.from(ab, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferLengthNull
     * @tc.number SUB_FASTBUFFER_FROM_ARRAYBUF_LENGTH_NULL_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and length as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferLengthNull";
      try {

        let ab = new ArrayBuffer(10);
        let result = fastbuffer.from(ab, 0, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromArrayBufferLengthUndefined
     * @tc.number SUB_FASTBUFFER_FROM_ARRAYBUF_LENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.from with ArrayBuffer and length as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromArrayBufferLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromArrayBufferLengthUndefined";
      try {

        let ab = new ArrayBuffer(10);
        let result = fastbuffer.from(ab, 0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromObjectNull
     * @tc.number SUB_FASTBUFFER_FROM_OBJECT_NULL_0100
     * @tc.desc   Testing Buffer.from with object as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectNull";
      try {

        let result = fastbuffer.from(null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFromObjectUndefined
     * @tc.number SUB_FASTBUFFER_FROM_OBJECT_UNDEF_0100
     * @tc.desc   Testing Buffer.from with object as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromObjectUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromObjectUndefined";
      try {

        let result = fastbuffer.from(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })


    /**
     * @tc.name   testFromStringEncodingNull
     * @tc.number SUB_FASTBUFFER_FROM_STRING_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.from with string and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromStringEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromStringEncodingNull";
      try {

        let result = fastbuffer.from('hello', null);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFromStringEncodingUndefined
     * @tc.number SUB_FASTBUFFER_FROM_STRING_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.from with string and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFromStringEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFromStringEncodingUndefined";
      try {

        let result = fastbuffer.from('hello', undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testTranscodeFromEncNull
     * @tc.number SUB_FASTBUFFER_TRANSCODE_FROMENC_NULL_0100
     * @tc.desc   Testing Buffer.transcode with fromEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeFromEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeFromEncNull";
      try {

        let buf = fastbuffer.from('hello', 'utf8');
        let result = fastbuffer.transcode(buf, null, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeFromEncUndefined
     * @tc.number SUB_FASTBUFFER_TRANSCODE_FROMENC_UNDEF_0100
     * @tc.desc   Testing Buffer.transcode with fromEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeFromEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeFromEncUndefined";
      try {

        let buf = fastbuffer.from('hello', 'utf8');
        let result = fastbuffer.transcode(buf, undefined, 'utf8');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncEmptyString
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TOENC_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncEmptyString";
      try {

        let buf = fastbuffer.from('hello', 'utf8');
        let result = fastbuffer.transcode(buf, 'utf8', '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncNull
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TOENC_NULL_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncNull";
      try {

        let buf = fastbuffer.from('hello', 'utf8');
        let result = fastbuffer.transcode(buf, 'utf8', null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTranscodeToEncUndefined
     * @tc.number SUB_FASTBUFFER_TRANSCODE_TOENC_UNDEF_0100
     * @tc.desc   Testing Buffer.transcode with toEnc as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testTranscodeToEncUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testTranscodeToEncUndefined";
      try {

        let buf = fastbuffer.from('hello', 'utf8');
        let result = fastbuffer.transcode(buf, 'utf8', undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testFillValueNull
     * @tc.number SUB_FASTBUFFER_FILL_VALUE_NULLA_0100
     * @tc.desc   Testing Buffer.prototype.fill with value as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillValueNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillValueNull";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill(null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillValueUndefined
     * @tc.number SUB_FASTBUFFER_FILL_VALUE_UNDEFINED_0100
     * @tc.desc   Testing Buffer.prototype.fill with value as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillValueUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillValueUndefined";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill(undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillOffsetNull
     * @tc.number SUB_FASTBUFFER_FILL_OFFSET_NULLA_0100
     * @tc.desc   Testing Buffer.prototype.fill with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillOffsetNull";
      try {
        let buf = fastbuffer.alloc(10);
        let result = buf.fill('a', null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillOffsetUndefined
     * @tc.number SUB_FASTBUFFER_FILL_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill('a', undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEndUndefined
     * @tc.number SUB_FASTBUFFER_FILL_END_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEndUndefined";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill('a', 0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEncodingNull
     * @tc.number SUB_FASTBUFFER_FILL_ENCODING_NULLA_0100
     * @tc.desc   Testing Buffer.prototype.fill with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEncodingNull";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill('a', 0, 10, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testFillEncodingUndefined
     * @tc.number SUB_FASTBUFFER_FILL_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.fill with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFillEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testFillEncodingUndefined";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.fill('a', 0, 10, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareTargetEndNull
     * @tc.number SUB_FASTBUFFER_COMPARE_TARGETEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with targetEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareTargetEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareTargetEndNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, null);
        expect(result === 0 || result === -1 || result === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareTargetEndUndefined
     * @tc.number SUB_FASTBUFFER_COMPARE_TARGETEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with targetEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareTargetEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareTargetEndUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, undefined);
        expect(result === 0 || result === -1 || result === 1).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCompareSourceStartNull
     * @tc.number SUB_FASTBUFFER_COMPARE_SOURCESTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceStartNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceStartUndefined
     * @tc.number SUB_FASTBUFFER_COMPARE_SOURCESTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceStartUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceEndNull
     * @tc.number SUB_FASTBUFFER_COMPARE_SOURCEEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceEndNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCompareSourceEndUndefined
     * @tc.number SUB_FASTBUFFER_COMPARE_SOURCEEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.compare with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCompareSourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCompareSourceEndUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.from('hello');
        let result = buf1.compare(buf2, 0, 10, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(10200001);
      }
    })

    /**
     * @tc.name   testCopyTargetStartNull
     * @tc.number SUB_FASTBUFFER_COPY_TARGETSTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with targetStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopyTargetStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopyTargetStartNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopyTargetStartUndefined
     * @tc.number SUB_FASTBUFFER_COPY_TARGETSTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with targetStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopyTargetStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopyTargetStartUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceStartNull
     * @tc.number SUB_FASTBUFFER_COPY_SOURCESTART_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceStart as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceStartNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceStartUndefined
     * @tc.number SUB_FASTBUFFER_COPY_SOURCESTART_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceStart as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceStartUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceEndNull
     * @tc.number SUB_FASTBUFFER_COPY_SOURCEEND_NULL_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceEnd as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceEndNull";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, 0, 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testCopySourceEndUndefined
     * @tc.number SUB_FASTBUFFER_COPY_SOURCEEND_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.copy with sourceEnd as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCopySourceEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testCopySourceEndUndefined";
      try {

        let buf1 = fastbuffer.from('hello');
        let buf2 = fastbuffer.alloc(10);
        let result = buf1.copy(buf2, 0, 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetNull
     * @tc.number SUB_FASTBUFFER_INDEXOF_BYTEOFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetUndefined
     * @tc.number SUB_FASTBUFFER_INDEXOF_BYTEOFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfEncodingNull
     * @tc.number SUB_FASTBUFFER_INDEXOF_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfEncodingNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfEncodingUndefined
     * @tc.number SUB_FASTBUFFER_INDEXOF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfEncodingUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetNullEncodingNull
     * @tc.number SUB_FASTBUFFER_INDEXOF_OFFSET_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetNullEncodingNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', null, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testIndexOfByteOffsetUndefinedEncodingUndefined
     * @tc.number SUB_FASTBUFFER_INDEXOF_OFFSET_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.indexOf with byteOffset as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testIndexOfByteOffsetUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testIndexOfByteOffsetUndefinedEncodingUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.indexOf('hello', undefined, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfEncodingNull
     * @tc.number SUB_FASTBUFFER_LASTINDEXOF_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfEncodingNull";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', 0, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfEncodingUndefined
     * @tc.number SUB_FASTBUFFER_LASTINDEXOF_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfEncodingUndefined";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', 0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetNullEncodingNull
     * @tc.number SUB_FASTBUFFER_LASTINDEXOF_OFFSET_NULL_ENC_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as null and encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetNullEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetNullEncodingNull";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', null, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetUndefinedEncodingUndefined
     * @tc.number SUB_FASTBUFFER_LASTINDEXOF_OFFSET_UNDEF_ENC_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as undefined and encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetUndefinedEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetUndefinedEncodingUndefined";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', undefined, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testReadIntBEByteLengthNull
     * @tc.number SUB_FASTBUFFER_READINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEOffsetNullByteLengthNull
     * @tc.number SUB_FASTBUFFER_READINTBE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEOffsetNullByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntBEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READINTBE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntBE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntBEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntBEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntBE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEByteLengthNull
     * @tc.number SUB_FASTBUFFER_READINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEOffsetNullByteLengthNull
     * @tc.number SUB_FASTBUFFER_READINTLE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEOffsetNullByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadIntLEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READINTLE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readIntLE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadIntLEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadIntLEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readIntLE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEByteLengthNull
     * @tc.number SUB_FASTBUFFER_READUINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READUINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEOffsetNullByteLengthNull
     * @tc.number SUB_FASTBUFFER_READUINTBE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEOffsetNullByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntBEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READUINTBE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntBE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntBEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntBEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntBE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEByteLengthNull
     * @tc.number SUB_FASTBUFFER_READUINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READUINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(0, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEOffsetNullByteLengthNull
     * @tc.number SUB_FASTBUFFER_READUINTLE_OFFSET_NULL_BL_NULL_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with offset as null and byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEOffsetNullByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEOffsetNullByteLengthNull";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(null, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testReadUIntLEOffsetUndefinedByteLengthUndefined
     * @tc.number SUB_FASTBUFFER_READUINTLE_OFFSET_UNDEF_BL_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.readUIntLE with offset as undefined and byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReadUIntLEOffsetUndefinedByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testReadUIntLEOffsetUndefinedByteLengthUndefined";
      try {

        let buf = fastbuffer.from([0x01, 0x02, 0x03, 0x04, 0x05, 0x06]);
        let result = buf.readUIntLE(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testSubarrayEndNull
     * @tc.number SUB_FASTBUFFER_SUBARRAY_END_NULL_0100
     * @tc.desc   Testing Buffer.prototype.subarray with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSubarrayEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSubarrayEndNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.subarray(0, null);
        expect(result != null).assertTrue();
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSubarrayEndUndefined
     * @tc.number SUB_FASTBUFFER_SUBARRAY_END_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.subarray with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSubarrayEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSubarrayEndUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.subarray(0, undefined);
        expect(result != null).assertTrue();
        expect(result.length).assertLarger(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringStartNull
     * @tc.number SUB_FASTBUFFER_TOSTRING_START_NULLA_0100
     * @tc.desc   Testing Buffer.prototype.toString with start as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringStartNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringStartNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.toString('utf8', null);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringStartUndefined
     * @tc.number SUB_FASTBUFFER_TOSTRING_START_UNDEFINED_0100
     * @tc.desc   Testing Buffer.prototype.toString with start as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringStartUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringStartUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.toString('utf8', undefined);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringEndNull
     * @tc.number SUB_FASTBUFFER_TOSTRING_END_NULLA_0100
     * @tc.desc   Testing Buffer.prototype.toString with end as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringEndNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringEndNull";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.toString('utf8', 0, null);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testToStringEndUndefined
     * @tc.number SUB_FASTBUFFER_TOSTRING_END_UNDEFINED_0100
     * @tc.desc   Testing Buffer.prototype.toString with end as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testToStringEndUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testToStringEndUndefined";
      try {

        let buf = fastbuffer.from('hello world');
        let result = buf.toString('utf8', 0, undefined);
        expect(typeof result === 'string').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteEncodingEmptyString
     * @tc.number SUB_FASTBUFFER_WRITE_ENCODING_EMPTYSTR_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingEmptyString', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingEmptyString";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, '');
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteEncodingNull
     * @tc.number SUB_FASTBUFFER_WRITE_ENCODING_NULL_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingNull";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteEncodingUndefined
     * @tc.number SUB_FASTBUFFER_WRITE_ENCODING_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.write with encoding as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteEncodingUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteEncodingUndefined";
      try {

        let buf = fastbuffer.alloc(10);
        let result = buf.write('hello', 0, 5, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64BEOffsetNull
     * @tc.number SUB_FASTBUFFER_WRITEBIGINT64BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigInt64BE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64BEOffsetUndefined
     * @tc.number SUB_FASTBUFFER_WRITEBIGINT64BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigInt64BE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGINT64LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigInt64LE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigInt64LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGINT64LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigInt64LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigInt64LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigInt64LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigInt64LE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGUINT64BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigUInt64BE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGUINT64BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigUInt64BE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEBIGUINT64LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigUInt64LE(BigInt(42), null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteBigUInt64LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEBIGUINT64LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeBigUInt64LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteBigUInt64LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteBigUInt64LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeBigUInt64LE(BigInt(42), undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEDOUBLEBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleBEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeDoubleBE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEDOUBLEBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleBEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeDoubleBE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEDOUBLELE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleLEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeDoubleLE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteDoubleLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEDOUBLELE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeDoubleLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteDoubleLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteDoubleLEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeDoubleLE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatBEOffsetNull
     * @tc.number SUB_BUFFER_WRITEFLOATBE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatBE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatBEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatBEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeFloatBE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatBEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEFLOATBE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatBE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatBEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatBEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeFloatBE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatLEOffsetNull
     * @tc.number SUB_BUFFER_WRITEFLOATLE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatLE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatLEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatLEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeFloatLE(3.14, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteFloatLEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEFLOATLE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeFloatLE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteFloatLEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteFloatLEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeFloatLE(3.14, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt8OffsetNull
     * @tc.number SUB_BUFFER_WRITEINT8_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt8 with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt8OffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt8OffsetNull";
      try {

        let buf = fastbuffer.alloc(2);
        let result = buf.writeInt8(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt8OffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT8_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt8 with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt8OffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt8OffsetUndefined";
      try {

        let buf = fastbuffer.alloc(2);
        let result = buf.writeInt8(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT16BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeInt16BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT16BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeInt16BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT16LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeInt16LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt16LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT16LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt16LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt16LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt16LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeInt16LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT32BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeInt32BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT32BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeInt32BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEINT32LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeInt32LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteInt32LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEINT32LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeInt32LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteInt32LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteInt32LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeInt32LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteIntBEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEByteLengthNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeIntBE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntBEByteLengthUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeIntBE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEByteLengthNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeIntLE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteIntLEByteLengthUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeIntLE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUInt8OffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT8_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt8 with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt8OffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt8OffsetNull";
      try {

        let buf = fastbuffer.alloc(2);
        let result = buf.writeUInt8(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt8OffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT8_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt8 with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt8OffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt8OffsetUndefined";
      try {

        let buf = fastbuffer.alloc(2);
        let result = buf.writeUInt8(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT16BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeUInt16BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT16BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeUInt16BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT16LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeUInt16LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt16LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT16LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt16LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt16LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt16LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(4);
        let result = buf.writeUInt16LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32BEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT32BE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32BE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32BEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32BEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUInt32BE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32BEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT32BE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32BE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32BEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32BEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUInt32BE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32LEOffsetNull
     * @tc.number SUB_BUFFER_WRITEUINT32LE_OFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32LE with offset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32LEOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32LEOffsetNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUInt32LE(42, null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUInt32LEOffsetUndefined
     * @tc.number SUB_BUFFER_WRITEUINT32LE_OFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUInt32LE with offset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUInt32LEOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUInt32LEOffsetUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUInt32LE(42, undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testWriteUIntBEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEUINTBE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEByteLengthNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUIntBE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntBEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEUINTBE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntBE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntBEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntBEByteLengthUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUIntBE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEByteLengthNull
     * @tc.number SUB_BUFFER_WRITEUINTLE_BYTELENGTH_NULL_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with byteLength as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEByteLengthNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEByteLengthNull";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUIntLE(42, 0, null);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testWriteUIntLEByteLengthUndefined
     * @tc.number SUB_BUFFER_WRITEUINTLE_BYTELENGTH_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.writeUIntLE with byteLength as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testWriteUIntLEByteLengthUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testWriteUIntLEByteLengthUndefined";
      try {

        let buf = fastbuffer.alloc(8);
        let result = buf.writeUIntLE(42, 0, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetNull
     * @tc.number SUB_BUFFER_LASTINDEXOF_BYTEOFFSET_NULL_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetNull', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetNull";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', null);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testLastIndexOfByteOffsetUndefined
     * @tc.number SUB_BUFFER_LASTINDEXOF_BYTEOFFSET_UNDEF_0100
     * @tc.desc   Testing Buffer.prototype.lastIndexOf with byteOffset as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testLastIndexOfByteOffsetUndefined', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testLastIndexOfByteOffsetUndefined";
      try {

        let buf = fastbuffer.from('hello world hello');
        let result = buf.lastIndexOf('hello', undefined);
        expect(typeof result === 'number').assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap16ReturnLength
     * @tc.number SUB_BUFFER_SWAP16_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap16 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap16ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap16ReturnLength";
      try {
        let buf = fastbuffer.from('1234');
        let result = buf.swap16();
        expect(result.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap16ReturnBuffer
     * @tc.number SUB_BUFFER_SWAP16_RETURN_BUFFER_0100
     * @tc.desc   Testing Buffer.prototype.swap16 return value fastbuffer property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap16ReturnBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap16ReturnBuffer";
      try {
        let buf = fastbuffer.from('1234');
        let result = buf.swap16();
        expect(result.buffer instanceof ArrayBuffer).assertTrue();
        expect(result.buffer.byteLength).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap16ReturnByteOffset
     * @tc.number SUB_BUFFER_SWAP16_RETURN_BYTEOFFSET_0100
     * @tc.desc   Testing Buffer.prototype.swap16 return value byteOffset property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap16ReturnByteOffset', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap16ReturnByteOffset";

      let buf = fastbuffer.from('1234');
      let result = buf.swap16();
      expect(typeof result.byteOffset).assertEqual('number');
      expect(result.byteOffset).assertEqual(0);


    })

    /**
     * @tc.name   testSwap32ReturnLength
     * @tc.number SUB_BUFFER_SWAP32_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap32 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap32ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap32ReturnLength";
      try {
        let buf = fastbuffer.from('12345678');
        let result = buf.swap32();
        expect(result.length).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap32ReturnBuffer
     * @tc.number SUB_BUFFER_SWAP32_RETURN_BUFFER_0100
     * @tc.desc   Testing Buffer.prototype.swap32 return value fastbuffer property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap32ReturnBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap32ReturnBuffer";
      let buf = fastbuffer.from('12345678');
      let result = buf.swap32();
      expect(result.buffer instanceof ArrayBuffer).assertTrue();
      expect(result.buffer.byteLength).assertEqual(8);
    })

    /**
     * @tc.name   testSwap32ReturnByteOffset
     * @tc.number SUB_BUFFER_SWAP32_RETURN_BYTEOFFSET_0100
     * @tc.desc   Testing Buffer.prototype.swap32 return value byteOffset property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap32ReturnByteOffset', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap32ReturnByteOffset";

      let buf = fastbuffer.from('12345678');
      let result = buf.swap32();
      expect(typeof result.byteOffset).assertEqual('number');
      expect(result.byteOffset).assertEqual(0);

    })

    /**
     * @tc.name   testSwap64ReturnLength
     * @tc.number SUB_BUFFER_SWAP64_RETURN_LENGTH_0100
     * @tc.desc   Testing Buffer.prototype.swap64 return value length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap64ReturnLength', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap64ReturnLength";
      try {
        let buf = fastbuffer.from('1234567812345678');
        let result = buf.swap64();
        expect(result.length).assertEqual(16);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testSwap64ReturnBuffer
     * @tc.number SUB_BUFFER_SWAP64_RETURN_BUFFER_0100
     * @tc.desc   Testing Buffer.prototype.swap64 return value fastbuffer property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap64ReturnBuffer', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap64ReturnBuffer";

      let buf = fastbuffer.from('1234567812345678');
      let result = buf.swap64();
      expect(result.buffer instanceof ArrayBuffer).assertTrue();
      expect(result.buffer.byteLength).assertEqual(16);

    })

    /**
     * @tc.name   testSwap64ReturnByteOffset
     * @tc.number SUB_BUFFER_SWAP64_RETURN_BYTEOFFSET_0100
     * @tc.desc   Testing Buffer.prototype.swap64 return value byteOffset property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSwap64ReturnByteOffset', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      TAG = "testSwap64ReturnByteOffset";
      let buf = fastbuffer.from('1234567812345678');
      let result = buf.swap64();
      expect(typeof result.byteOffset).assertEqual('number');
      expect(result.byteOffset).assertEqual(0);
    })
  })
}
