/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium'
import zLib from 'libentry.so'

const Z_OK: number = 0;
const Z_NULL: number = 0;
const Z_BUF_ERROR: number = -5;
const Z_DATA_ERROR: number = -3;
const Z_STREAM_ERROR: number = -2;
const TEST_SUCCESS: number = 1;
const Z_NO_COMPRESSION: number = 0;
const Z_BEST_SPEED: number = 1;
const Z_BEST_COMPRESSION: number = 9;
const Z_DEFAULT_COMPRESSION: number = -1;
const Z_ERROR_COMPRESSION: number = -2;

export default function zlibNdkTest() {
  describe('zlibNdkTest', () => {

    /**
     * @tc.name   testCompress001
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS_0100
     * @tc.desc   test Compress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress(Z_OK);
      console.info("testCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress002
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS_0200
     * @tc.desc   test Compress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress(Z_BUF_ERROR);
      console.info("testCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testUnCompress001
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0100
     * @tc.desc   test unCompress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnCompress001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_OK);
      console.info("testUnCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testUnCompress002
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0200
     * @tc.desc   test unCompress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnCompress002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_BUF_ERROR);
      console.info("testUnCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testUnCompress003
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0300
     * @tc.desc   test unCompress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnCompress003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_DATA_ERROR);
      console.info("testUnCompress003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2001
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0100
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_NO_COMPRESSION, Z_OK);
      console.info("testCompress2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2002
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0200
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress2002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_SPEED, Z_OK);
      console.info("testCompress2002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2003
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0300
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress2003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_COMPRESSION, Z_OK);
      console.info("testCompress2003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2004
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0400
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress2004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_OK);
      console.info("testCompress2004 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2005
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0500
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCompress2005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_BUF_ERROR);
      console.info("testCompress2005 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompress2006
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESS2_0600
     * @tc.desc   test compress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCompress2006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.compress2(Z_ERROR_COMPRESSION, Z_STREAM_ERROR);
      console.info("testCompress2006 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCompressBound001
     * @tc.number SUB_THIRDPARTY_ZLIB_COMPRESSBOUND_0100
     * @tc.desc   test compressBound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCompressBound001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.compressBound();
      console.info("testCompressBound001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCrc32001
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_0100
     * @tc.desc   test crc32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCrc32001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32(Z_NULL);
      console.info("testCrc32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCrc32002
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_0200
     * @tc.desc   test crc32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCrc32002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32(1);
      console.info("testCrc32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCrc32Z001
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_Z_0100
     * @tc.desc   test crc32_z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCrc32Z001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32_z();
      console.info("testCrc32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testCrc32Combine001
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_COMBINE_0100
     * @tc.desc   test crc32Combine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCrc32Combine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32Combine();
      console.info("testCrc32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testAdler32001
     * @tc.number SUB_THIRDPARTY_ZLIB_ADLER32_0100
     * @tc.desc   test adler32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdler32001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32(Z_NULL);
      console.info("testAdler32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testAdler32002
     * @tc.number SUB_THIRDPARTY_ZLIB_ADLER32_0200
     * @tc.desc   test adler32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdler32002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32(1);
      console.info("testAdler32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testAdler32Z001
     * @tc.number SUB_THIRDPARTY_ZLIB_ADLER32_Z_0100
     * @tc.desc   test adler32_z
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdler32Z001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32_z();
      console.info("testAdler32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testAdler32Combine001
     * @tc.number SUB_THIRDPARTY_ZLIB_ADLER32_COMBINE_0100
     * @tc.desc   test adler32Combine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAdler32Combine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32Combine();
      console.info("testAdler32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testDeflate001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATE_0100
     * @tc.desc   test unCompress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeflate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.deflate();
      console.info("testDeflate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibVersion001
     * @tc.number SUB_THIRDPARTY_ZLIB_ZLIBVERSION_0100
     * @tc.desc   test zlibVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testZLibVersion001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zLibVersion();
      console.info("testZLibVersion001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibCompileFlags001
     * @tc.number SUB_THIRDPARTY_ZLIB_ZLIBCOMPILEFLAGS_0100
     * @tc.desc   test zlibCompileFlags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testZLibCompileFlags001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zLibCompileFlags();
      console.info("testZLibCompileFlags001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibZError001
     * @tc.number SUB_THIRDPARTY_ZLIB_ZERROR_0100
     * @tc.desc   test zError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testZLibZError001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zError();
      console.info("testZLibZError001 data = " + JSON.stringify(data));
      expect(data).assertEqual("data error")
      done()
    });

    /**
     * @tc.name   testZLibUnCompress2001
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0100
     * @tc.desc   test unCompress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibUnCompress2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_OK);
      console.info("testZLibUnCompress2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibUnCompress2002
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0200
     * @tc.desc   test unCompress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibUnCompress2002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_BUF_ERROR);
      console.info("testZLibUnCompress2002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibUnCompress2003
     * @tc.number SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0300
     * @tc.desc   test unCompress2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibUnCompress2003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_DATA_ERROR);
      console.info("testZLibUnCompress2003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateValidate001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEVALIDATE_0100
     * @tc.desc   test inflateValidate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateValidate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateValidate();
      console.info("testZLibInflateValidate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateUndermine001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEUNDERMINE_0100
     * @tc.desc   test inflateUndermine
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateUndermine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateUndermine();
      console.info("testZLibInflateUndermine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateSyncPoint001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATESYNCPOINT_0100
     * @tc.desc   test inflateSyncPoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateSyncPoint001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateSyncPoint();
      console.info("testZLibInflateSyncPoint001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });
    /**
     * @tc.name   testZLibInflateSync001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATESYNC_0100
     * @tc.desc   test inflateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateSync001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateSync();
      console.info("testZLibInflateSync001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testDeflateBound001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEBOUND_0100
     * @tc.desc   test deflateBound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeflateBound001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateBound();
      console.info("testDeflateBound001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateResetKeep001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATERESETKEEP_0100
     * @tc.desc   test inflateResetKeep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateResetKeep001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateResetKeep();
      console.info("testZLibInflateResetKeep001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateReset001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATERESET_0100
     * @tc.desc   test inflateReset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateReset001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateReset();
      console.info("testZLibInflateReset001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateReset2001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATERESET2_0100
     * @tc.desc   test inflateReset2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateReset2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateReset2();
      console.info("testZLibInflateReset2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateMark001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEMARK_0100
     * @tc.desc   test inflateMark
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateMark001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateMark();
      console.info("testZLibInflateMark001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateInit2001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEINIT2_0100
     * @tc.desc   test inflateInit2_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateInit2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateInit2();
      console.info("testZLibInflateInit2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateInit001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEINIT_0100
     * @tc.desc   test inflateInit_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateInit();
      console.info("testZLibInflateInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflatePrime001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEPRIME_0100
     * @tc.desc   test inflatePrime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflatePrime001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflatePrime();
      console.info("testZLibInflatePrime001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateGetHeader001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEGETHEADER_0100
     * @tc.desc   test inflateGetHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateGetHeader001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateGetHeader();
      console.info("testZLibInflateGetHeader001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateGetDictionary001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEGETDICTIONARY_0100
     * @tc.desc   test inflateGetDictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateGetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateGetDictionary();
      console.info("testZLibInflateGetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateEnd001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEEND_0100
     * @tc.desc   test inflateEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateEnd();
      console.info("testZLibInflateEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateCopy001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATECOPY_0100
     * @tc.desc   test inflateCopy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateCopy001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateCopy();
      console.info("testZLibInflateCopy001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateCodesUsed001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATECODESUSED_0100
     * @tc.desc   test inflateCodesUsed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateCodesUsed001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateCodesUsed();
      console.info("testZLibInflateCodesUsed001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateBackInit001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEBACKINIT_0100
     * @tc.desc   test inflateBackInit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateBackInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBackInit();
      console.info("testZLibInflateBackInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateBack001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEBACK_0100
     * @tc.desc   test inflateBack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateBack001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBack();
      console.info("testZLibInflateBack001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflateBackEnd001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATEBACKEND_0100
     * @tc.desc   test inflateBackEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflateBackEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBackEnd();
      console.info("testZLibInflateBackEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibInflate001
     * @tc.number SUB_THIRDPARTY_ZLIB_INFLATE_0100
     * @tc.desc   test inflate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibInflate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflate();
      console.info("testZLibInflate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzWrite001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZWRITE_0100
     * @tc.desc   test gzwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzWrite001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzWrite();
      console.info("testZLibGzWrite001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzvPrintf001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZVPRINTF_0100
     * @tc.desc   test gzvprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzvPrintf001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzvPrintf();
      console.info("testZLibGzvPrintf001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzUnGetC001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZUNGETC_0100
     * @tc.desc   test gzungetc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzUnGetC001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzUnGetC();
      console.info("testZLibGzUnGetC001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzTell64001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZTELL64_0100
     * @tc.desc   test gztell64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzTell64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzTell64();
      console.info("testZLibGzTell64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzTell001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZTELL_0100
     * @tc.desc   test gztell
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzTell001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzTell();
      console.info("testZLibGzTell001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzSetParams001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZSETPARAMS_0100
     * @tc.desc   test gzsetparams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzSetParams001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSetParams();
      console.info("testZLibGzSetParams001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzSeek64001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZSEEK64_0100
     * @tc.desc   test gzseek64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzSeek64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSeek64();
      console.info("testZLibGzSeek64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzSeek001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZSEEK_0100
     * @tc.desc   test gzseek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzSeek001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSeek();
      console.info("testZLibGzSeek001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzRewind001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZREWIND_0100
     * @tc.desc   test gzrewind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzRewind001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzRewind();
      console.info("testZLibGzRewind001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzRead001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZREAD_0100
     * @tc.desc   test gzread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzRead001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzRead();
      console.info("testZLibGzRead001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzPuts001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZPUTS_0100
     * @tc.desc   test gzputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzPuts001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPuts();
      console.info("testZLibGzPuts001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzPutc001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZPUTC_0100
     * @tc.desc   test gzputc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzPutc001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPutc();
      console.info("testZLibGzPutc001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzPrintf001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZPRINTF_0100
     * @tc.desc   test gzprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzPrintf001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPrintf();
      console.info("testZLibGzPrintf001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzOpenW001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZOPEN_W_0100
     * @tc.desc   test gzopen_w
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzOpenW001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpenW();
      console.info("testZLibGzOpenW001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzOpen64001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZOPEN64_0100
     * @tc.desc   test gzopen64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzOpen64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpen64();
      console.info("testZLibGzOpen64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzOpen001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZOPEN_0100
     * @tc.desc   test gzopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzOpen001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpen();
      console.info("testZLibGzOpen001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzOffset64001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZOFFSET64_0100
     * @tc.desc   test gzoffset64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzOffset64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOffset64();
      console.info("testZLibGzOffset64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzGets001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZGETS_0100
     * @tc.desc   test gzgets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzGets001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGets();
      console.info("testZLibGzGets001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzGetC1001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZGETC__0100
     * @tc.desc   test gzgetc_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzGetC1001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGetC_();
      console.info("testZLibGzGetC1001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzGetC001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZGETC_0100
     * @tc.desc   test gzgetc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzGetC001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGetC();
      console.info("testZLibGzGetC001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzFWrite001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZFWRITE_0100
     * @tc.desc   test gzfwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzFWrite001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFWrite();
      console.info("testZLibGzFWrite001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzFRead001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZFREAD_0100
     * @tc.desc   test gzfread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzFRead001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFRead();
      console.info("testZLibGzFRead001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzFlush001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZFLUSH_0100
     * @tc.desc   test gzflush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzFlush001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFlush();
      console.info("testZLibGzFlush001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzError001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZERROR_0100
     * @tc.desc   test gzerror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzError001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzError();
      console.info("testZLibGzError001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzEof001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZEOF_0100
     * @tc.desc   test gzeof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzEof001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzEof();
      console.info("testZLibGzEof001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzDOpen001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZDOPEN_0100
     * @tc.desc   test gzdopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzDOpen001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzDOpen();
      console.info("testZLibGzDOpen001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzDirect001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZDIRECT_0100
     * @tc.desc   test gzdirect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzDirect001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzDirect();
      console.info("testZLibGzDirect001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzCloseW001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZCLOSE_W_0100
     * @tc.desc   test gzclose_w
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzCloseW001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzCloseW();
      console.info("testZLibGzCloseW001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzCloseR001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZCLOSE_R_0100
     * @tc.desc   test gzclose_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzCloseR001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzCloseR();
      console.info("testZLibGzCloseR001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzClose001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZCLOSE_0100
     * @tc.desc   test gzclose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzClose001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzClose();
      console.info("testZLibGzClose001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzClearErr001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZCLEARERR_0100
     * @tc.desc   test gzclearerr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzClearErr001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzClearErr();
      console.info("testZLibGzClearErr001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGzBuffer001
     * @tc.number SUB_THIRDPARTY_ZLIB_GZBUFFER_0100
     * @tc.desc   test gzbuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGzBuffer001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzBuffer();
      console.info("testZLibGzBuffer001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibGetCrcTable001
     * @tc.number SUB_THIRDPARTY_ZLIB_GET_CRC_TABLE_0100
     * @tc.desc   test get_crc_table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibGetCrcTable001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.getCrcTable();
      console.info("testZLibGetCrcTable001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateTune001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATETUNE_0100
     * @tc.desc   test get_crc_table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateTune001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateTune();
      console.info("testZLibDeflateTune001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateSetHeader001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATESETHEADER_0100
     * @tc.desc   test deflateSetHeader
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateSetHeader001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateSetHeader();
      console.info("testZLibDeflateSetHeader001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateSetDictionary001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATESETDICTIONARY_0100
     * @tc.desc   test deflateSetDictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateSetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateSetDictionary();
      console.info("testZLibDeflateSetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateResetKeep001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATERESETKEEP_0100
     * @tc.desc   test deflateResetKeep
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateResetKeep001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateResetKeep();
      console.info("testZLibDeflateResetKeep001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateReset001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATERESET_0100
     * @tc.desc   test deflateReset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateReset001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateReset();
      console.info("testZLibDeflateReset001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflatePrime001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEPRIME_0100
     * @tc.desc   test deflatePrime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflatePrime001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflatePrime();
      console.info("testZLibDeflatePrime001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflatePending001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEPENDING_0100
     * @tc.desc   test deflatePrime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflatePending001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflatePending();
      console.info("testZLibDeflatePending001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateParams001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEPARAMS_0100
     * @tc.desc   test deflateParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateParams001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateParams();
      console.info("testZLibDeflateParams001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateInit001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEINIT_0100
     * @tc.desc   test deflateInit_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateInit();
      console.info("testZLibDeflateInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateInit2001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEINIT2_0100
     * @tc.desc   test deflateInit2_
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateInit2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateInit2();
      console.info("testZLibDeflateInit2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateGetDictionary001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEGETDICTIONARY_0100
     * @tc.desc   test deflateGetDictionary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateGetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateGetDictionary();
      console.info("testZLibDeflateGetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateEnd001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATEEND_0100
     * @tc.desc   test deflateEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateEnd();
      console.info("testZLibDeflateEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDeflateCopy001
     * @tc.number SUB_THIRDPARTY_ZLIB_DEFLATECOPY_0100
     * @tc.desc   test deflateCopy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDeflateCopy001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateCopy();
      console.info("testZLibDeflateCopy001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibCrc32Combine64001
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_COMBINE64_0100
     * @tc.desc   test crc32_combine64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibCrc32Combine64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.crc32Combine64();
      console.info("testZLibCrc32Combine64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibAdler32Combine64001
     * @tc.number SUB_THIRDPARTY_ZLIB_CRC32_ADLER32_COMBINE64_0100
     * @tc.desc   test adler32_combine64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibAdler32Combine64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.adler32Combine64();
      console.info("testZLibAdler32Combine64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibDistCode001
     * @tc.number SUB_THIRDPARTY_ZLIB_DIST_CODE_0100
     * @tc.desc   test _dist_code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibDistCode001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.distCode();
      console.info("testZLibDistCode001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibLengthCode001
     * @tc.number SUB_THIRDPARTY_ZLIB_LENGTH_CODE_0100
     * @tc.desc   test _length_code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibLengthCode001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.lengthCode();
      console.info("testZLibLengthCode001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrAlign001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_ALIGN_0100
     * @tc.desc   test _tr_align
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrAlign001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trAlign();
      console.info("testZLibTrAlign001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrFlushBits001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_FLUSH_BITS_0100
     * @tc.desc   test _tr_flush_bits
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrFlushBits001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trFlushBits();
      console.info("testZLibTrFlushBits001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrFlushBlock001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_FLUSH_BLOCK_0100
     * @tc.desc   test _tr_flush_block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrFlushBlock001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trFlushBlock();
      console.info("testZLibTrFlushBlock001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrInit001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_INIT_0100
     * @tc.desc   test _tr_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trInit();
      console.info("testZLibTrInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrStoredBlock001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_STORED_BLOCK_0100
     * @tc.desc   test _tr_stored_block
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrStoredBlock001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trStoredBlock();
      console.info("testZLibTrStoredBlock001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.name   testZLibTrTally001
     * @tc.number SUB_THIRDPARTY_ZLIB_TR_TALLY_0100
     * @tc.desc   test _tr_tally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testZLibTrTally001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trTally();
      console.info("testZLibTrTally001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });
  })
}