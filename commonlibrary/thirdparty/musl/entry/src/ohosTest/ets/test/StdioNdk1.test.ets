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
import stdio1 from 'libstdiondk1.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'


export default function muslStdio1Test() {
  describe('MuslStdio1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStdioFgetsChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETSCHK_0100
     * @tc.desc   test the normal condition of Fgets_chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFgetsChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgets_chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFreadChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FREAD_CHK_0100
     * @tc.desc   test the normal condition of Fread_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFreadChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fread_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPwriteChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PWRITE_CHK_0100
     * @tc.desc   test the normal condition of Pwrite_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPwriteChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Pwrite_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSnprintfChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SNPRINTF_CHK_0100
     * @tc.desc   test the normal condition of Snprintf_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSnprintfChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Snprintf_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSprintfChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SPRINTF_CHK_0100
     * @tc.desc   test the normal condition of Sprintf_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSprintfChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Sprintf_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVsnprintfChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VSNPRINTF_CHK_0100
     * @tc.desc   test the normal condition of Vsnprintf_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVsnprintfChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vsnprintf_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioWriteChk001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_WRITE_CHK_0100
     * @tc.desc   test the normal condition of Write_Chk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioWriteChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Write_Chk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioAsprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_ASPRINTF_0100
     * @tc.desc   test the normal condition of Asprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioAsprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Asprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioClearerr001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_CLEARERR_0100
     * @tc.desc   test the normal condition of ClearErr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioClearerr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.ClearErr_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioClearerrUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_CLEARERR_UNLOCKED_0100
     * @tc.desc   test the normal condition of Clearerr_Unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioClearerrUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Clearerr_Unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioDPrintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_DPRINTF_0100
     * @tc.desc   test the normal condition of Dprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioDPrintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Dprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFClose001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FCLOSE_0100
     * @tc.desc   test the normal condition of Fclose_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fclose_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFdOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FDOPEN_0100
     * @tc.desc   test the normal condition of Fdopen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFdOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fdopen_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFEofUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FEOF_UNLOCKED_0100
     * @tc.desc   test the normal condition of Feof_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFEofUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Feof_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFError001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FERROR_0100
     * @tc.desc   test the normal condition of Ferror_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ferror_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFErrorUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FERROR_UNLOCKED_0100
     * @tc.desc   test the normal condition of Ferror_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFErrorUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ferror_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFFlush001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_0100
     * @tc.desc   test the normal condition of Fflush_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fflush_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFFlushUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FFLUSH_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fflush_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFFlushUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fflush_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetC001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETC_0100
     * @tc.desc   test the normal condition of Fgetc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgetc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetCUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETC_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fgetc_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetCUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgetc_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetLn001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETLN_0100
     * @tc.desc   test the normal condition of Fgetin_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetLn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgetin_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetPos001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETPOS_0100
     * @tc.desc   test the normal condition of Fgetpos_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetPos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgetpos_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetPos64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETPOS64_0100
     * @tc.desc   test the normal condition of Fgetpos64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetPos64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgetpos64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetS001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETS_0100
     * @tc.desc   test the normal condition of Fgets_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetS001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgets_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFGetSUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FGETS_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fgets_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFGetSUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fgets_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFileNo001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FILENO_0100
     * @tc.desc   test the normal condition of Fileno_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFileNo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fileno_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFileNoUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FILENO_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fileno_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFileNoUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fileno_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFLockFile001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FLOCKFILE_0100
     * @tc.desc   test the normal condition of Flockfile_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFLockFile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Flockfile_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFMemOpen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FMEMOPEN_0100
     * @tc.desc   test the normal condition of Fmemopen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFMemOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fmemopen_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFopen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FOPEN_0100
     * @tc.desc   test the normal condition of Fopen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFopen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fopen_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFopen64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FOPEN64_0100
     * @tc.desc   test the normal condition of Fopen64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFopen64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fopen64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPRINTF_0100
     * @tc.desc   test the normal condition of Fprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFPurge001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPURGE_0100
     * @tc.desc   test the normal condition of Fpurge_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFPurge001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fpurge_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFputc001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPUTC_0100
     * @tc.desc   test the normal condition of Fputc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFputc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fputc_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslStdioFputcUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPUTC_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fputc_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFputcUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fputc_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFputs001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPUTS_0100
     * @tc.desc   test the normal condition of Fputs_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFputs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fputs_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFputsUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FPUTS_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fputs_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFputsUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fputs_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFread001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FREAD_0100
     * @tc.desc   test the normal condition of Fread_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFread001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fread_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFreadUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FREAD_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fread_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFreadUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fread_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFreopen001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FREOPEN_0100
     * @tc.desc   test the normal condition of Freopen_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFreopen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Freopen_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFreopen64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FREOPEN64_0100
     * @tc.desc   test the normal condition of Freopen64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFreopen64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Freopen64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSCANF_0100
     * @tc.desc   test the normal condition of Fscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFseek001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSEEK_0100
     * @tc.desc   test the normal condition of Fseek_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFseek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fseek_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFseeko001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSEEKO_0100
     * @tc.desc   test the normal condition of Fseeko_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFseeko001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fseeko_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFseeko64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSEEKO64_0100
     * @tc.desc   test the normal condition of Fseeko64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFseeko64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fseeko64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFsetpos001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSETPOS_0100
     * @tc.desc   test the normal condition of Fsetpos_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFsetpos001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fsetpos_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFsetpos64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FSETPOS64_0100
     * @tc.desc   test the normal condition of Fsetpos64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFsetpos64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fsetpos64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFtell001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FTELL_0100
     * @tc.desc   test the normal condition of Ftell_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFtell001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ftell_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFtello001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FTELLO_0100
     * @tc.desc   test the normal condition of Ftello_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFtello001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ftello_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFtello64001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FTELLO64_0100
     * @tc.desc   test the normal condition of Ftello64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFtello64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ftello64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFtrylockfile001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FTRYLOCKFILE_0100
     * @tc.desc   test the normal condition of Ftrylockfile_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFtrylockfile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ftrylockfile_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFunlockfile001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FUNLOCKFILE_0100
     * @tc.desc   test the normal condition of Funlockfile_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFunlockfile001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Funlockfile_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFwrite001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FWRITE_0100
     * @tc.desc   test the normal condition of Fwrite_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFwrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fwrite_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioFwriteUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_FWRITE_UNLOCKED_0100
     * @tc.desc   test the normal condition of Fwrite_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioFwriteUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Fwrite_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetc001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETC_0100
     * @tc.desc   test the normal condition of Getc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Getc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetCUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETC_UNLOCKED_0100
     * @tc.desc   test the normal condition of Getc_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetCUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Getc_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetchar001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETCHAR_0100
     * @tc.desc   test the normal condition of GetChar_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetchar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.GetChar_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetCharUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETCHAR_UNLOCKED_0100
     * @tc.desc   test the normal condition of GetChar_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetCharUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.GetChar_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutcUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTCUNLOCKED_0100
     * @tc.desc   test the normal condition of PutC_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutcUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.PutC_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutcharUnlocked001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTCHARUNLOCKED_0100
     * @tc.desc   test the normal condition of PutChar_unlocked_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutcharUnlocked001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.PutChar_unlocked_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetdelim001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETDELIM_0100
     * @tc.desc   test the normal condition of Getdelim_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetdelim001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Getdelim_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGetLine001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETLINE_0100
     * @tc.desc   test the normal condition of Getline_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGetLine001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Getline_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioGets001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_GETS_0100
     * @tc.desc   test the normal condition of Gets_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioGets001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Gets_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdlibNrand48001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_NRAND48_0100
     * @tc.desc   test the normal condition of Nrand48_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdlibNrand48001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Nrand48_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioOpenMemstream001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_OPEN_MEMSTREAM_0100
     * @tc.desc   test the normal condition of Open_Memstream_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioOpenMemstream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Open_Memstream_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPerror001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PERROR_0100
     * @tc.desc   test the normal condition of Perror_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPerror001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Perror_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPrintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PRINTF_0100
     * @tc.desc   test the normal condition of Printf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPrintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Printf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutc001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTC_0100
     * @tc.desc   test the normal condition of Putc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Putc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutchar001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTCHAR_0100
     * @tc.desc   test the normal condition of Putchar_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutchar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Putchar_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutenv001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTENV_0100
     * @tc.desc   test the normal condition of Putenv_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutenv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Putenv_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPuts001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTS_0100
     * @tc.desc   test the normal condition of Puts_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPuts001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Puts_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioPutw001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_PUTW_0100
     * @tc.desc   test the normal condition of Putw_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioPutw001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Putw_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioRemove001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_REMOVE_0100
     * @tc.desc   test the normal condition of Remove_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioRemove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Remove_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioRename001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_RENAME_0100
     * @tc.desc   test the normal condition of Rename_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioRename001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Rename_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioRenameat001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_RENAMEAT_0100
     * @tc.desc   test the normal condition of Renameat_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioRenameat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Renameat_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioRewind001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_REWIND_0100
     * @tc.desc   test the normal condition of Rewind_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioRewind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Rewind_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioScanf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SCANF_0100
     * @tc.desc   test the normal condition of Scanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioScanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Scanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSetvbuf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SETVBUF_0100
     * @tc.desc   test the normal condition of Setvbuf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSetvbuf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Setvbuf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSnprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SNPRINTF_0100
     * @tc.desc   test the normal condition of Snprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSnprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Snprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SPRINTF_0100
     * @tc.desc   test the normal condition of Sprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Sprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioSscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_SSCANF_0100
     * @tc.desc   test the normal condition of Sscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioSscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Sscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioStdErr001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_STDERR_0100
     * @tc.desc   test the normal condition of Stderr_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioStdErr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Stderr_One()).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslStdioStdIn001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_STDIN_0100
     * @tc.desc   test the normal condition of Stdin_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioStdIn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Stdin_One()).assertEqual(1);
      done();
    });
    /**
     * @tc.name   testMuslStdioStdOut001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_STDOUT_0100
     * @tc.desc   test the normal condition of Stdout_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioStdOut001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Stdout_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioTempnam001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_TEMPNAM_0100
     * @tc.desc   test the normal condition of Tempnam_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioTempnam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Tempnam_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioTmpnam001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_TMPNAM_0100
     * @tc.desc   test the normal condition of Tmpname_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioTmpnam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Tmpname_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioUngetc001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_UNGETC_0100
     * @tc.desc   test the normal condition of Ungetc_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioUngetc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Ungetc_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVasprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VASPRINTF_0100
     * @tc.desc   test the normal condition of Vasprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVasprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vasprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVdprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VDPRINTF_0100
     * @tc.desc   test the normal condition of Vdprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVdprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vdprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVfprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VFPRINTF_0100
     * @tc.desc   test the normal condition of Vfprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVfprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vfprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVfscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VFSCANF_0100
     * @tc.desc   test the normal condition of Vfscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVfscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vfscanf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VPRINTF_0100
     * @tc.desc   test the normal condition of Vprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVsnprintf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VSNPRINTF_0100
     * @tc.desc   test the normal condition of Vsnprintf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVsnprintf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vsnprintf_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslStdioVsscanf001
     * @tc.number SUB_THIRDPARTY_MUSL_STDIO_VSSCANF_0100
     * @tc.desc   test the normal condition of Vsscanf_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStdioVsscanf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(stdio1.Vsscanf_One()).assertEqual(1);
      done();
    });

  })
}
