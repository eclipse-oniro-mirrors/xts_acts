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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import stdioext from 'libstdioextndk.so'

export default function muslStdioExtTest() {
  describe('MuslStdioExtTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETERR_0100
     * @tc.name       : testMuslStdioExtFSetErr001
     * @tc.desc       : test fSetErr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFSetErr001', 0, async (done: Function) => {
      expect(stdioext.fSetErr()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FSETLOCKING_0100
     * @tc.name       : testMuslStdioExtFSetLocking001
     * @tc.desc       : test fSetLocking
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFSetLocking001', 0, async (done: Function) => {
      expect(stdioext.fSetLocking()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLUSH_LBF_0100
     * @tc.name       : testMuslStdioExtFlushLbf001
     * @tc.desc       : test flushLbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFlushLbf001', 0, async (done: Function) => {
      expect(stdioext.flushLbf()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITING_0100
     * @tc.name       : testMuslStdioExtFWriting001
     * @tc.desc       : test fWriting
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWriting001', 0, async (done: Function) => {
      expect(stdioext.fWriting()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FPENDING_0100
     * @tc.name       : testMuslStdioExtFPending001
     * @tc.desc       : test fpending
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFPending001', 0, async (done: Function) => {
      expect(stdioext.fPending()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FPURGE_0100
     * @tc.name       : testMuslStdioExtFPurge001
     * @tc.desc       : test fpurge
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFPurge001', 0, async (done: Function) => {
      expect(stdioext.fPurge()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADABLE_0100
     * @tc.name       : testMuslStdioExtFReadable001
     * @tc.desc       : test freadable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReadable001', 0, async (done: Function) => {
      expect(stdioext.fReadable()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FREADING_0100
     * @tc.name       : testMuslStdioExtFReading001
     * @tc.desc       : test freading
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFReading001', 0, async (done: Function) => {
      expect(stdioext.fReading()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FWRITABLE_0100
     * @tc.name       : testMuslStdioExtFWritable001
     * @tc.desc       : test fWritable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFWritable001', 0, async (done: Function) => {
      expect(stdioext.fWritable()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FLBF_0100
     * @tc.name       : testMuslStdioExtFLbf001
     * @tc.desc       : test fLbf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtFLbf001', 0, async (done: Function) => {
      expect(stdioext.fLbf()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_EXT_FBUF_SIZE_0100
     * @tc.name       : testMuslStdioExtfBufSize001
     * @tc.desc       : test fBufSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioExtfBufSize001', 0, async (done: Function) => {
      expect(stdioext.fBufSize()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FDOPEN_0100
     * @tc.name       : testMuslStdioFdOpen001
     * @tc.desc       : test fdopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFdOpen001', 0, async (done: Function) => {
      expect(stdioext.fdopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_0100
     * @tc.name       : testMuslStdioFFlush001
     * @tc.desc       : test fflush
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFFlush001', 0, async (done: Function) => {
      expect(stdioext.fflush()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETC_0100
     * @tc.name       : testMuslStdioFGetC001
     * @tc.desc       : test fgetc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetC001', 0, async (done: Function) => {
      expect(stdioext.fgetc()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETPOS64_0100
     * @tc.name       : testMuslStdioFGetPos64001
     * @tc.desc       : test fgetpos64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetPos64001', 0, async (done: Function) => {
      expect(stdioext.fgetpos64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETPOS_0100
     * @tc.name       : testMuslStdioFGetPos001
     * @tc.desc       : test fgetpos
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetPos001', 0, async (done: Function) => {
      expect(stdioext.fgetpos()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETS_0100
     * @tc.name       : testMuslStdioFGetS001
     * @tc.desc       : test fgets
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetS001', 0, async (done: Function) => {
      expect(stdioext.fgets()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FERROR_0100
     * @tc.name       : testMuslStdioFError001
     * @tc.desc       : test ferror
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFError001', 0, async (done: Function) => {
      expect(stdioext.ferror()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FILENO_0100
     * @tc.name       : testMuslStdioFileNo001
     * @tc.desc       : test fileno
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFileNo001', 0, async (done: Function) => {
      let result = false;
      if (stdioext.fileno() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FLOCKFILE_0100
     * @tc.name       : testMuslStdioFLockFile001
     * @tc.desc       : test flockfile
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFLockFile001', 0, async (done: Function) => {
      expect(stdioext.flockfile()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FMEMOPEN_0100
     * @tc.name       : testMuslStdioFMemOpen001
     * @tc.desc       : test fmemopen
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFMemOpen001', 0, async (done: Function) => {
      expect(stdioext.fmemopen()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FCLOSE_0100
     * @tc.name       : testMuslStdioFClose001
     * @tc.desc       : test fclose
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFClose001', 0, async (done: Function) => {
      expect(stdioext.fclose()).assertEqual(0);
      done()
    });



    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FILENO_UNLOCKED_0100
     * @tc.name       : testMuslStdioFileNoUnlocked001
     * @tc.desc       : test fileno_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFileNoUnlocked001', 0, async (done: Function) => {
      let result = false;
      if (stdioext.fileno_unlocked() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETSO_UNLOCKED_0100
     * @tc.name       : testMuslStdioFGetSUnlocked001
     * @tc.desc       : test fgets_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetSUnlocked001', 0, async (done: Function) => {
      expect(stdioext.fgets_unlocked()).assertEqual(0);
      done()
    });



    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETLN_0100
     * @tc.name       : testMuslStdioFGetLn001
     * @tc.desc       : test fgetln
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetLn001', 0, async (done: Function) => {
      expect(stdioext.fgetln()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FGETC_UNLOCKED_0100
     * @tc.name       : testMuslStdioFGetCUnlocked001
     * @tc.desc       : test fgetc_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFGetCUnlocked001', 0, async (done: Function) => {
      expect(stdioext.fgetc_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_UNLOCKED_0100
     * @tc.name       : testMuslStdioFFlushUnlocked001
     * @tc.desc       : test fflush_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFFlushUnlocked001', 0, async (done: Function) => {
      expect(stdioext.fflush_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FERROR_UNLOCKED_0100
     * @tc.name       : testMuslStdioFErrorUnlocked001
     * @tc.desc       : test ferror_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFErrorUnlocked001', 0, async (done: Function) => {
      expect(stdioext.ferror_unlocked()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_FEOF_UNLOCKED_0100
     * @tc.name       : testMuslStdioFEofUnlocked001
     * @tc.desc       : test feof_unlocked
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioFEofUnlocked001', 0, async (done: Function) => {
      expect(stdioext.feof_unlocked()).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STDIO_DPRINTF_0100
     * @tc.name       : testMuslStdioDPrintf001
     * @tc.desc       : test dprintf
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStdioDPrintf001', 0, async (done: Function) => {
      let result = false;
      if (stdioext.dprintf() >= 0) {
        result = true;
      }
      expect(result).assertTrue();
      done()
    });
  })
}