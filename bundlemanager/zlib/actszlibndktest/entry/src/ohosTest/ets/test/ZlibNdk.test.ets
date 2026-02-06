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
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS_0100
     * @tc.name       : testCompress001
     * @tc.desc       : test Compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress(Z_OK);
      console.info("testCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS_0200
     * @tc.name       : testCompress002
     * @tc.desc       : test Compress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress(Z_BUF_ERROR);
      console.info("testCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0100
     * @tc.name       : testUnCompress001
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_OK);
      console.info("testUnCompress001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0200
     * @tc.name       : testUnCompress002
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_BUF_ERROR);
      console.info("testUnCompress002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS_0300
     * @tc.name       : testUnCompress003
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnCompress003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.unCompress(Z_DATA_ERROR);
      console.info("testUnCompress003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0100
     * @tc.name       : testCompress2001
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_NO_COMPRESSION, Z_OK);
      console.info("testCompress2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0200
     * @tc.name       : testCompress2002
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_SPEED, Z_OK);
      console.info("testCompress2002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0300
     * @tc.name       : testCompress2003
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_BEST_COMPRESSION, Z_OK);
      console.info("testCompress2003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0400
     * @tc.name       : testCompress2004
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2004', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_OK);
      console.info("testCompress2004 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0500
     * @tc.name       : testCompress2005
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2005', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let data = zLib.compress2(Z_DEFAULT_COMPRESSION, Z_BUF_ERROR);
      console.info("testCompress2005 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESS2_0600
     * @tc.name       : testCompress2006
     * @tc.desc       : test compress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompress2006', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.compress2(Z_ERROR_COMPRESSION, Z_STREAM_ERROR);
      console.info("testCompress2006 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_COMPRESSBOUND_0100
     * @tc.name       : testCompressBound001
     * @tc.desc       : test compressBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCompressBound001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.compressBound();
      console.info("testCompressBound001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_0100
     * @tc.name       : testCrc32001
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32(Z_NULL);
      console.info("testCrc32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_0200
     * @tc.name       : testCrc32002
     * @tc.desc       : test crc32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32(1);
      console.info("testCrc32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_Z_0100
     * @tc.name       : testCrc32Z001
     * @tc.desc       : test crc32_z
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32Z001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32_z();
      console.info("testCrc32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_COMBINE_0100
     * @tc.name       : testCrc32Combine001
     * @tc.desc       : test crc32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testCrc32Combine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.crc32Combine();
      console.info("testCrc32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_0100
     * @tc.name       : testAdler32001
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32(Z_NULL);
      console.info("testAdler32001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_0200
     * @tc.name       : testAdler32002
     * @tc.desc       : test adler32
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32(1);
      console.info("testAdler32002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_Z_0100
     * @tc.name       : testAdler32Z001
     * @tc.desc       : test adler32_z
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32Z001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32_z();
      console.info("testAdler32Z001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ADLER32_COMBINE_0100
     * @tc.name       : testAdler32Combine001
     * @tc.desc       : test adler32Combine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAdler32Combine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.adler32Combine();
      console.info("testAdler32Combine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATE_0100
     * @tc.name       : testDeflate001
     * @tc.desc       : test unCompress
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testDeflate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.deflate();
      console.info("testDeflate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ZLIBVERSION_0100
     * @tc.name       : testZLibVersion001
     * @tc.desc       : test zlibVersion
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibVersion001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zLibVersion();
      console.info("testZLibVersion001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ZLIBCOMPILEFLAGS_0100
     * @tc.name       : testZLibCompileFlags001
     * @tc.desc       : test zlibCompileFlags
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibCompileFlags001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zLibCompileFlags();
      console.info("testZLibCompileFlags001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_ZERROR_0100
     * @tc.name       : testZLibZError001
     * @tc.desc       : test zError
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibZError001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let data = zLib.zError();
      console.info("testZLibZError001 data = " + JSON.stringify(data));
      expect(data).assertEqual("data error")
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0100
     * @tc.name       : testZLibUnCompress2001
     * @tc.desc       : test unCompress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibUnCompress2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_OK);
      console.info("testZLibUnCompress2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0200
     * @tc.name       : testZLibUnCompress2002
     * @tc.desc       : test unCompress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibUnCompress2002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_BUF_ERROR);
      console.info("testZLibUnCompress2002 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_UNCOMPRESS2_0300
     * @tc.name       : testZLibUnCompress2003
     * @tc.desc       : test unCompress2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibUnCompress2003', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.unCompress2(Z_DATA_ERROR);
      console.info("testZLibUnCompress2003 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEVALIDATE_0100
     * @tc.name       : testZLibInflateValidate001
     * @tc.desc       : test inflateValidate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibInflateValidate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateValidate();
      console.info("testZLibInflateValidate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEUNDERMINE_0100
     * @tc.name       : testZLibInflateUndermine001
     * @tc.desc       : test inflateUndermine
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateUndermine001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateUndermine();
      console.info("testZLibInflateUndermine001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATESYNCPOINT_0100
     * @tc.name       : testZLibInflateSyncPoint001
     * @tc.desc       : test inflateSyncPoint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateSyncPoint001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateSyncPoint();
      console.info("testZLibInflateSyncPoint001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATESYNC_0100
     * @tc.name       : testZLibInflateSync001
     * @tc.desc       : test inflateSync
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateSync001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateSync();
      console.info("testZLibInflateSync001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEBOUND_0100
     * @tc.name       : testZLibInflateSync001
     * @tc.desc       : test deflateBound
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDeflateBound001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateBound();
      console.info("testDeflateBound001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATERESETKEEP_0100
     * @tc.name       : testZLibInflateResetKeep001
     * @tc.desc       : test inflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateResetKeep001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateResetKeep();
      console.info("testZLibInflateResetKeep001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATERESET_0100
     * @tc.name       : testZLibInflateReset001
     * @tc.desc       : test inflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateReset001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateReset();
      console.info("testZLibInflateReset001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATERESET2_0100
     * @tc.name       : testZLibInflateReset2001
     * @tc.desc       : test inflateReset2
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateReset2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateReset2();
      console.info("testZLibInflateReset2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEMARK_0100
     * @tc.name       : testZLibInflateMark001
     * @tc.desc       : test inflateMark
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateMark001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateMark();
      console.info("testZLibInflateMark001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEINIT2_0100
     * @tc.name       : testZLibInflateInit2001
     * @tc.desc       : test inflateInit2_
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateInit2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateInit2();
      console.info("testZLibInflateInit2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEINIT_0100
     * @tc.name       : testZLibInflateInit001
     * @tc.desc       : test inflateInit_
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateInit();
      console.info("testZLibInflateInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEPRIME_0100
     * @tc.name       : testZLibInflatePrime001
     * @tc.desc       : test inflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflatePrime001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflatePrime();
      console.info("testZLibInflatePrime001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEGETHEADER_0100
     * @tc.name       : testZLibInflateGetHeader001
     * @tc.desc       : test inflateGetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateGetHeader001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateGetHeader();
      console.info("testZLibInflateGetHeader001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEGETDICTIONARY_0100
     * @tc.name       : testZLibInflateGetDictionary001
     * @tc.desc       : test inflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateGetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateGetDictionary();
      console.info("testZLibInflateGetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEEND_0100
     * @tc.name       : testZLibInflateEnd001
     * @tc.desc       : test inflateEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateEnd();
      console.info("testZLibInflateEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATECOPY_0100
     * @tc.name       : testZLibInflateCopy001
     * @tc.desc       : test inflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateCopy001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateCopy();
      console.info("testZLibInflateCopy001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATECODESUSED_0100
     * @tc.name       : testZLibInflateCodesUsed001
     * @tc.desc       : test inflateCodesUsed
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateCodesUsed001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateCodesUsed();
      console.info("testZLibInflateCodesUsed001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEBACKINIT_0100
     * @tc.name       : testZLibInflateBackInit001
     * @tc.desc       : test inflateBackInit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateBackInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBackInit();
      console.info("testZLibInflateBackInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEBACK_0100
     * @tc.name       : testZLibInflateBack001
     * @tc.desc       : test inflateBack
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateBack001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBack();
      console.info("testZLibInflateBack001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATEBACKEND_0100
     * @tc.name       : testZLibInflateBackEnd001
     * @tc.desc       : test inflateBackEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflateBackEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflateBackEnd();
      console.info("testZLibInflateBackEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_INFLATE_0100
     * @tc.name       : testZLibInflate001
     * @tc.desc       : test inflate
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibInflate001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.inflate();
      console.info("testZLibInflate001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZWRITE_0100
     * @tc.name       : testZLibGzWrite001
     * @tc.desc       : test gzwrite
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzWrite001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzWrite();
      console.info("testZLibGzWrite001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZVPRINTF_0100
     * @tc.name       : testZLibGzvPrintf001
     * @tc.desc       : test gzvprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzvPrintf001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzvPrintf();
      console.info("testZLibGzvPrintf001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZUNGETC_0100
     * @tc.name       : testZLibGzUnGetC001
     * @tc.desc       : test gzungetc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzUnGetC001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzUnGetC();
      console.info("testZLibGzUnGetC001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZTELL64_0100
     * @tc.name       : testZLibGzTell64001
     * @tc.desc       : test gztell64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzTell64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzTell64();
      console.info("testZLibGzTell64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZTELL_0100
     * @tc.name       : testZLibGzTell001
     * @tc.desc       : test gztell
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzTell001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzTell();
      console.info("testZLibGzTell001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZSETPARAMS_0100
     * @tc.name       : testZLibGzSetParams001
     * @tc.desc       : test gzsetparams
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzSetParams001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSetParams();
      console.info("testZLibGzSetParams001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZSEEK64_0100
     * @tc.name       : testZLibGzSeek64001
     * @tc.desc       : test gzseek64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzSeek64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSeek64();
      console.info("testZLibGzSeek64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZSEEK_0100
     * @tc.name       : testZLibGzSeek001
     * @tc.desc       : test gzseek
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzSeek001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzSeek();
      console.info("testZLibGzSeek001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZREWIND_0100
     * @tc.name       : testZLibGzRewind001
     * @tc.desc       : test gzrewind
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzRewind001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzRewind();
      console.info("testZLibGzRewind001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZREAD_0100
     * @tc.name       : testZLibGzRead001
     * @tc.desc       : test gzread
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzRead001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzRead();
      console.info("testZLibGzRead001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZPUTS_0100
     * @tc.name       : testZLibGzPuts001
     * @tc.desc       : test gzputs
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzPuts001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPuts();
      console.info("testZLibGzPuts001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZPUTC_0100
     * @tc.name       : testZLibGzPutc001
     * @tc.desc       : test gzputc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzPutc001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPutc();
      console.info("testZLibGzPutc001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZPRINTF_0100
     * @tc.name       : testZLibGzPrintf001
     * @tc.desc       : test gzprintf
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzPrintf001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzPrintf();
      console.info("testZLibGzPrintf001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZOPEN_W_0100
     * @tc.name       : testZLibGzOpenW001
     * @tc.desc       : test gzopen_w
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzOpenW001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpenW();
      console.info("testZLibGzOpenW001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZOPEN64_0100
     * @tc.name       : testZLibGzOpen64001
     * @tc.desc       : test gzopen64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzOpen64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpen64();
      console.info("testZLibGzOpen64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZOPEN_0100
     * @tc.name       : testZLibGzOpen001
     * @tc.desc       : test gzopen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzOpen001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOpen();
      console.info("testZLibGzOpen001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZOFFSET64_0100
     * @tc.name       : testZLibGzOffset64001
     * @tc.desc       : test gzoffset64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzOffset64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzOffset64();
      console.info("testZLibGzOffset64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZGETS_0100
     * @tc.name       : testZLibGzGets001
     * @tc.desc       : test gzgets
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzGets001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGets();
      console.info("testZLibGzGets001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZGETC__0100
     * @tc.name       : testZLibGzGetC1001
     * @tc.desc       : test gzgetc_
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzGetC1001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGetC_();
      console.info("testZLibGzGetC1001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZGETC_0100
     * @tc.name       : testZLibGzGetC001
     * @tc.desc       : test gzgetc
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzGetC001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzGetC();
      console.info("testZLibGzGetC001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZFWRITE_0100
     * @tc.name       : testZLibGzFWrite001
     * @tc.desc       : test gzfwrite
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzFWrite001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFWrite();
      console.info("testZLibGzFWrite001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZFREAD_0100
     * @tc.name       : testZLibGzFRead001
     * @tc.desc       : test gzfread
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzFRead001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFRead();
      console.info("testZLibGzFRead001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZFLUSH_0100
     * @tc.name       : testZLibGzFlush001
     * @tc.desc       : test gzflush
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzFlush001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzFlush();
      console.info("testZLibGzFlush001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZERROR_0100
     * @tc.name       : testZLibGzError001
     * @tc.desc       : test gzerror
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzError001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzError();
      console.info("testZLibGzError001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZEOF_0100
     * @tc.name       : testZLibGzEof001
     * @tc.desc       : test gzeof
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzEof001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzEof();
      console.info("testZLibGzEof001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZDOPEN_0100
     * @tc.name       : testZLibGzDOpen001
     * @tc.desc       : test gzdopen
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzDOpen001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzDOpen();
      console.info("testZLibGzDOpen001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZDIRECT_0100
     * @tc.name       : testZLibGzDirect001
     * @tc.desc       : test gzdirect
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzDirect001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzDirect();
      console.info("testZLibGzDirect001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZCLOSE_W_0100
     * @tc.name       : testZLibGzCloseW001
     * @tc.desc       : test gzclose_w
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzCloseW001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzCloseW();
      console.info("testZLibGzCloseW001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZCLOSE_R_0100
     * @tc.name       : testZLibGzCloseR001
     * @tc.desc       : test gzclose_r
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzCloseR001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzCloseR();
      console.info("testZLibGzCloseR001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZCLOSE_0100
     * @tc.name       : testZLibGzClose001
     * @tc.desc       : test gzclose
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzClose001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzClose();
      console.info("testZLibGzClose001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZCLEARERR_0100
     * @tc.name       : testZLibGzClearErr001
     * @tc.desc       : test gzclearerr
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzClearErr001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzClearErr();
      console.info("testZLibGzClearErr001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GZBUFFER_0100
     * @tc.name       : testZLibGzBuffer001
     * @tc.desc       : test gzbuffer
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGzBuffer001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.gzBuffer();
      console.info("testZLibGzBuffer001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_GET_CRC_TABLE_0100
     * @tc.name       : testZLibGetCrcTable001
     * @tc.desc       : test get_crc_table
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibGetCrcTable001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.getCrcTable();
      console.info("testZLibGetCrcTable001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATETUNE_0100
     * @tc.name       : testZLibDeflateTune001
     * @tc.desc       : test get_crc_table
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateTune001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateTune();
      console.info("testZLibDeflateTune001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATESETHEADER_0100
     * @tc.name       : testZLibDeflateSetHeader001
     * @tc.desc       : test deflateSetHeader
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateSetHeader001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateSetHeader();
      console.info("testZLibDeflateSetHeader001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATESETDICTIONARY_0100
     * @tc.name       : testZLibDeflateSetDictionary001
     * @tc.desc       : test deflateSetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateSetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateSetDictionary();
      console.info("testZLibDeflateSetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATERESETKEEP_0100
     * @tc.name       : testZLibDeflateResetKeep001
     * @tc.desc       : test deflateResetKeep
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateResetKeep001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateResetKeep();
      console.info("testZLibDeflateResetKeep001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATERESET_0100
     * @tc.name       : testZLibDeflateReset001
     * @tc.desc       : test deflateReset
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateReset001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateReset();
      console.info("testZLibDeflateReset001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEPRIME_0100
     * @tc.name       : testZLibDeflatePrime001
     * @tc.desc       : test deflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflatePrime001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflatePrime();
      console.info("testZLibDeflatePrime001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEPENDING_0100
     * @tc.name       : testZLibDeflatePending001
     * @tc.desc       : test deflatePrime
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflatePending001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflatePending();
      console.info("testZLibDeflatePending001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEPARAMS_0100
     * @tc.name       : testZLibDeflateParams001
     * @tc.desc       : test deflateParams
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateParams001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateParams();
      console.info("testZLibDeflateParams001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEINIT_0100
     * @tc.name       : testZLibDeflateInit001
     * @tc.desc       : test deflateInit_
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateInit();
      console.info("testZLibDeflateInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEINIT2_0100
     * @tc.name       : testZLibDeflateInit2001
     * @tc.desc       : test deflateInit2_
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateInit2001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateInit2();
      console.info("testZLibDeflateInit2001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEGETDICTIONARY_0100
     * @tc.name       : testZLibDeflateGetDictionary001
     * @tc.desc       : test deflateGetDictionary
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateGetDictionary001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateGetDictionary();
      console.info("testZLibDeflateGetDictionary001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATEEND_0100
     * @tc.name       : testZLibDeflateEnd001
     * @tc.desc       : test deflateEnd
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateEnd001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateEnd();
      console.info("testZLibDeflateEnd001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DEFLATECOPY_0100
     * @tc.name       : testZLibDeflateCopy001
     * @tc.desc       : test deflateCopy
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibDeflateCopy001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.deflateCopy();
      console.info("testZLibDeflateCopy001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_COMBINE64_0100
     * @tc.name       : testZLibCrc32Combine64001
     * @tc.desc       : test crc32_combine64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibCrc32Combine64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.crc32Combine64();
      console.info("testZLibCrc32Combine64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_CRC32_ADLER32_COMBINE64_0100
     * @tc.name       : testZLibAdler32Combine64001
     * @tc.desc       : test adler32_combine64
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testZLibAdler32Combine64001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.adler32Combine64();
      console.info("testZLibAdler32Combine64001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_DIST_CODE_0100
     * @tc.name       : testZLibDistCode001
     * @tc.desc       : test _dist_code
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibDistCode001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.distCode();
      console.info("testZLibDistCode001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_LENGTH_CODE_0100
     * @tc.name       : testZLibLengthCode001
     * @tc.desc       : test _length_code
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibLengthCode001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.lengthCode();
      console.info("testZLibLengthCode001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_ALIGN_0100
     * @tc.name       : testZLibTrAlign001
     * @tc.desc       : test _tr_align
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrAlign001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trAlign();
      console.info("testZLibTrAlign001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_FLUSH_BITS_0100
     * @tc.name       : testZLibTrFlushBits001
     * @tc.desc       : test _tr_flush_bits
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrFlushBits001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trFlushBits();
      console.info("testZLibTrFlushBits001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_FLUSH_BLOCK_0100
     * @tc.name       : testZLibTrFlushBlock001
     * @tc.desc       : test _tr_flush_block
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrFlushBlock001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trFlushBlock();
      console.info("testZLibTrFlushBlock001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_INIT_0100
     * @tc.name       : testZLibTrInit001
     * @tc.desc       : test _tr_init
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrInit001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trInit();
      console.info("testZLibTrInit001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_STORED_BLOCK_0100
     * @tc.name       : testZLibTrStoredBlock001
     * @tc.desc       : test _tr_stored_block
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrStoredBlock001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trStoredBlock();
      console.info("testZLibTrStoredBlock001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_ZLIB_TR_TALLY_0100
     * @tc.name       : testZLibTrTally001
     * @tc.desc       : test _tr_tally
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testZLibTrTally001', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let data = zLib.trTally();
      console.info("testZLibTrTally001 data = " + JSON.stringify(data));
      expect(data).assertEqual(TEST_SUCCESS)
      done()
    });
  })
}