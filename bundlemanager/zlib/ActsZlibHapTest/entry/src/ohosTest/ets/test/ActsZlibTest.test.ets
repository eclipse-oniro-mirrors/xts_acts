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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import zLib from 'libentry.so';

export default function ActsZlibTest() {
  describe('ActsZlibTest', () => {

    /**
     * @tc.name   ActsZlibTestCompress
     * @tc.number ActsZlibTest_0100
     * @tc.desc   Test ActsZlibTestCompress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestCompress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestCompress();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzio
     * @tc.number ActsZlibTest_0200
     * @tc.desc   Test ActsZlibTestGzio
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzio();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestDeflate
     * @tc.number ActsZlibTest_0300
     * @tc.desc   Test ActsZlibTestDeflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestDeflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestDeflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflate
     * @tc.number ActsZlibTest_0400
     * @tc.desc   Test ActsZlibTestInflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestLargeDeflate
     * @tc.number ActsZlibTest_0500
     * @tc.desc   Test ActsZlibTestLargeDeflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestLargeDeflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestLargeDeflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestLargeInflate
     * @tc.number ActsZlibTest_0600
     * @tc.desc   Test ActsZlibTestLargeInflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestLargeInflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestLargeInflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestFlush
     * @tc.number ActsZlibTest_0700
     * @tc.desc   Test ActsZlibTestFlush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestFlush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestFlush();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestSync
     * @tc.number ActsZlibTest_0800
     * @tc.desc   Test ActsZlibTestSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestDictDeflate
     * @tc.number ActsZlibTest_0900
     * @tc.desc   Test ActsZlibTestDictDeflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestDictDeflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestDictDeflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestDictInflate
     * @tc.number ActsZlibTest_1000
     * @tc.desc   Test ActsZlibTestDictInflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestDictInflate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestDictInflate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestCompress2
     * @tc.number ActsZlibTest_1100
     * @tc.desc   Test ActsZlibTestCompress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestCompress2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestCompress2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestAdler
     * @tc.number ActsZlibTest_1200
     * @tc.desc   Test ActsZlibTestAdler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestAdler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestAdler();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestDeflateState
     * @tc.number ActsZlibTest_1300
     * @tc.desc   Test ActsZlibTestDeflateState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestDeflateState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestDeflateState();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestDeflateBound
     * @tc.number ActsZlibTest_1400
     * @tc.desc   Test ActsZlibTestDeflateBound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestDeflateBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestDeflateBound();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestCRC
     * @tc.number ActsZlibTest_1500
     * @tc.desc   Test ActsZlibTestCRC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestCRC', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestCRC();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGetCrcTable
     * @tc.number ActsZlibTest_1600
     * @tc.desc   Test ActsZlibTestGetCrcTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGetCrcTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGetCrcTable();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzBuffer
     * @tc.number ActsZlibTest_1700
     * @tc.desc   Test ActsZlibTestGzBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzFlush
     * @tc.number ActsZlibTest_1800
     * @tc.desc   Test ActsZlibTestGzFlush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzFlush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzFlush();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzFread
     * @tc.number ActsZlibTest_1900
     * @tc.desc   Test ActsZlibTestGzFread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzFread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzFread();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzWrite
     * @tc.number ActsZlibTest_2000
     * @tc.desc   Test ActsZlibTestGzWrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzWrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzWrite();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzGetc
     * @tc.number ActsZlibTest_2100
     * @tc.desc   Test ActsZlibTestGzGetc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzGetc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzGetc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzUnGetc
     * @tc.number ActsZlibTest_2101
     * @tc.desc   Test ActsZlibTestGzUnGetc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzUnGetc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzUnGetc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzGetcx
     * @tc.number ActsZlibTest_2200
     * @tc.desc   Test ActsZlibTestGzGetcx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzGetcx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzGetcx();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzGets
     * @tc.number ActsZlibTest_2300
     * @tc.desc   Test ActsZlibTestGzGets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzGets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzGets();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzOffset64
     * @tc.number ActsZlibTest_2400
     * @tc.desc   Test ActsZlibTestGzOffset64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzOffset64', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzOffset64();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzOpen
     * @tc.number ActsZlibTest_2500
     * @tc.desc   Test ActsZlibTestGzOpen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzOpen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzOpen();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzPrintf
     * @tc.number ActsZlibTest_2600
     * @tc.desc   Test ActsZlibTestGzPrintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzPrintf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzPrintf();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzPutc
     * @tc.number ActsZlibTest_2700
     * @tc.desc   Test ActsZlibTestGzPutc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzPutc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzPutc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzPuts
     * @tc.number ActsZlibTest_2800
     * @tc.desc   Test ActsZlibTestGzPuts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzPuts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzPuts();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzRead
     * @tc.number ActsZlibTest_2900
     * @tc.desc   Test ActsZlibTestGzRead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzRead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzRead();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzRewind
     * @tc.number ActsZlibTest_3000
     * @tc.desc   Test ActsZlibTestGzRewind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzRewind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzRewind();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzseek
     * @tc.number ActsZlibTest_3100
     * @tc.desc   Test ActsZlibTestGzseek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzseek', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzseek();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzSetParams
     * @tc.number ActsZlibTest_3200
     * @tc.desc   Test ActsZlibTestGzSetParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzSetParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzSetParams();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzTell
     * @tc.number ActsZlibTest_3300
     * @tc.desc   Test ActsZlibTestGzTell
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzTell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzTell();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzVprintf
     * @tc.number ActsZlibTest_3400
     * @tc.desc   Test ActsZlibTestGzVprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzVprintf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzVprintf();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzwrite
     * @tc.number ActsZlibTest_3500
     * @tc.desc   Test ActsZlibTestGzwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzwrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzwrite();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzInflateBack
     * @tc.number ActsZlibTest_3600
     * @tc.desc   Test ActsZlibTestGzInflateBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzInflateBack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzInflateBack();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateCodesUsed
     * @tc.number ActsZlibTest_3700
     * @tc.desc   Test ActsZlibTestInflateCodesUsed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateCodesUsed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateCodesUsed();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateCopyEnd
     * @tc.number ActsZlibTest_3800
     * @tc.desc   Test ActsZlibTestInflateCopyEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateCopyEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateCopyEnd();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateGetDictionary
     * @tc.number ActsZlibTest_3900
     * @tc.desc   Test ActsZlibTestInflateGetDictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateGetDictionary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateGetDictionary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateGetHeader
     * @tc.number ActsZlibTest_4000
     * @tc.desc   Test ActsZlibTestInflateGetHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateGetHeader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateGetHeader();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateInitx
     * @tc.number ActsZlibTest_4100
     * @tc.desc   Test ActsZlibTestInflateInitx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateInitx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateInitx();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflatePrime
     * @tc.number ActsZlibTest_4200
     * @tc.desc   Test ActsZlibTestInflatePrime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflatePrime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflatePrime();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateReset
     * @tc.number ActsZlibTest_4300
     * @tc.desc   Test ActsZlibTestInflateReset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateReset();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateSetDictionary
     * @tc.number ActsZlibTest_4400
     * @tc.desc   Test ActsZlibTestInflateSetDictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateSetDictionary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateSetDictionary();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateSyncPoint
     * @tc.number ActsZlibTest_4500
     * @tc.desc   Test ActsZlibTestInflateSyncPoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateSyncPoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateSyncPoint();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateUndermine
     * @tc.number ActsZlibTest_4600
     * @tc.desc   Test ActsZlibTestInflateUndermine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateUndermine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateUndermine();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestInflateValidate
     * @tc.number ActsZlibTest_4700
     * @tc.desc   Test ActsZlibTestInflateValidate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestInflateValidate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestInflateValidate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestzlibCompileFlags
     * @tc.number ActsZlibTest_4800
     * @tc.desc   Test ActsZlibTestzlibCompileFlags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestzlibCompileFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestzlibCompileFlags();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestzError
     * @tc.number ActsZlibTest_5000
     * @tc.desc   Test ActsZlibTestzError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestzError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestzError();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestzlibVersion
     * @tc.number ActsZlibTest_5100
     * @tc.desc   Test ActsZlibTestzlibVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestzlibVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestzlibVersion();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ActsZlibTestGzdopen
     * @tc.number ActsZlibTest_5200
     * @tc.desc   Test ActsZlibTestGzdopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsZlibTestGzdopen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result = zLib.ActsZlibTestGzdopen();
      expect(result).assertEqual(0);
      done();
    });

  });
}