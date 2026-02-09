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

import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import stdioext from 'libstdioextndk.so'

export default function muslStdioExtTest() {
  describe('MuslStdioExtTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStdioExtFSetErr001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETERR_0100
     * @tc.desc   test fSetErr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFSetErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fSetErr()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFSetLocking001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETLOCKING_0100
     * @tc.desc   test fSetLocking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFSetLocking001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fSetLocking()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFlushLbf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLUSH_LBF_0100
     * @tc.desc   test flushLbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFlushLbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.flushLbf()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWriting001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0100
     * @tc.desc   test fWriting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWriting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fWriting()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFPending001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0100
     * @tc.desc   test fpending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFPending001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fPending()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFPurge001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FPURGE_0100
     * @tc.desc   test fpurge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFPurge001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fPurge()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReadable001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0100
     * @tc.desc   test freadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReadable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fReadable()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFReading001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0100
     * @tc.desc   test freading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFReading001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fReading()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFWritable001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0100
     * @tc.desc   test fWritable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFWritable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fWritable()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtFLbf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0100
     * @tc.desc   test fLbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtFLbf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fLbf()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioExtfBufSize001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0100
     * @tc.desc   test fBufSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioExtfBufSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fBufSize()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFdOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FDOPEN_0100
     * @tc.desc   test fdopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFdOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fdopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFFlush001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_0100
     * @tc.desc   test fflush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fflush()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetC001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETC_0100
     * @tc.desc   test fgetc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgetc()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetPos64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETPOS64_0100
     * @tc.desc   test fgetpos64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetPos64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgetpos64()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetPos001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETPOS_0100
     * @tc.desc   test fgetpos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetPos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgetpos()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetS001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETS_0100
     * @tc.desc   test fgets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetS001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgets()).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslStdioFError001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FERROR_0100
     * @tc.desc   test ferror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.ferror()).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslStdioFileNo001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FILENO_0100
     * @tc.desc   test fileno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFileNo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = false;
      if (stdioext.fileno() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslStdioFLockFile001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FLOCKFILE_0100
     * @tc.desc   test flockfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFLockFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.flockfile()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFMemOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FMEMOPEN_0100
     * @tc.desc   test fmemopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFMemOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fmemopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFClose001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FCLOSE_0100
     * @tc.desc   test fclose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fclose()).assertEqual(0);
      done()
    });



    /**
     * @tc.name   testMuslStdioFileNoUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FILENO_UNLOCKED_0100
     * @tc.desc   test fileno_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFileNoUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = false;
      if (stdioext.fileno_unlocked() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetSUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETSO_UNLOCKED_0100
     * @tc.desc   test fgets_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetSUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgets_unlocked()).assertEqual(0);
      done()
    });



    /**
     * @tc.name   testMuslStdioFGetLn001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETLN_0100
     * @tc.desc   test fgetln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetLn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgetln()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFGetCUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETC_UNLOCKED_0100
     * @tc.desc   test fgetc_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetCUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fgetc_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslStdioFFlushUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_UNLOCKED_0100
     * @tc.desc   test fflush_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFFlushUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.fflush_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslStdioFErrorUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FERROR_UNLOCKED_0100
     * @tc.desc   test ferror_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFErrorUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.ferror_unlocked()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslStdioFEofUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FEOF_UNLOCKED_0100
     * @tc.desc   test feof_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFEofUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdioext.feof_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.name   testMuslStdioDPrintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_DPRINTF_0100
     * @tc.desc   test dprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioDPrintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result = false;
      if (stdioext.dprintf() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })
}