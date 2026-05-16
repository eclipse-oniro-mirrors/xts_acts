/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function stdio_group_test() {
  describe("ActsToolChainHapTest_src_functionalext_supplement_stdio", () => {
    /**
     * @tc.name   fbufsize
     * @tc.number SUB_THIRDPARTY_MUSL_FBUFSIZE_0100
     * @tc.desc   libc-test __fbufsize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fbufsize", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fbufsize");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   flbf
     * @tc.number SUB_THIRDPARTY_MUSL_FLBF_0100
     * @tc.desc   libc-test __flbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("flbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__flbf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clearerr
     * @tc.number SUB_THIRDPARTY_MUSL_CLEARERR_0100
     * @tc.desc   libc-test clearerr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clearerr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clearerr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fflush
     * @tc.number SUB_THIRDPARTY_MUSL_FFLUSH_0100
     * @tc.desc   libc-test fflush
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fflush", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fflush");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   open_wmemstream
     * @tc.number SUB_THIRDPARTY_MUSL_OPEN_WMEMSTREAM_0100
     * @tc.desc   libc-test open_wmemstream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("open_wmemstream", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("open_wmemstream");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   printf
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_0100
     * @tc.desc   libc-test printf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putc_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_PUTC_UNLOCKED_0100
     * @tc.desc   libc-test putc_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putc_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putc_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putchar
     * @tc.number SUB_THIRDPARTY_MUSL_PUTCHAR_0100
     * @tc.desc   libc-test putchar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putchar", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putchar");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putchar_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_PUTCHAR_UNLOCKED_0100
     * @tc.desc   libc-test putchar_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putchar_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putchar_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   puts
     * @tc.number SUB_THIRDPARTY_MUSL_PUTS_0100
     * @tc.desc   libc-test puts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("puts", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("puts");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putwchar
     * @tc.number SUB_THIRDPARTY_MUSL_PUTWCHAR_0100
     * @tc.desc   libc-test putwchar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putwchar", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putwchar");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sprintf
     * @tc.number SUB_THIRDPARTY_MUSL_SPRINTF_0100
     * @tc.desc   libc-test sprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   swscanf
     * @tc.number SUB_THIRDPARTY_MUSL_SWSCANF_0100
     * @tc.desc   libc-test swscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("swscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("swscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tempnam
     * @tc.number SUB_THIRDPARTY_MUSL_TEMPNAM_0100
     * @tc.desc   libc-test tempnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tempnam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tempnam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tmpnam
     * @tc.number SUB_THIRDPARTY_MUSL_TMPNAM_0100
     * @tc.desc   libc-test tmpnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tmpnam", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tmpnam");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vasprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VASPRINTF_0100
     * @tc.desc   libc-test vasprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vasprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vasprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VPRINTF_0100
     * @tc.desc   libc-test vprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsnprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSNPRINTF_0100
     * @tc.desc   libc-test vsnprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsnprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsnprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSPRINTF_0100
     * @tc.desc   libc-test vsprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vsscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VSSCANF_0100
     * @tc.desc   libc-test vsscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vsscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vsscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vswprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VSWPRINTF_0100
     * @tc.desc   libc-test vswprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vswprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vswprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vswscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VSWSCANF_0100
     * @tc.desc   libc-test vswscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vswscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vswscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vwprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VWPRINTF_0100
     * @tc.desc   libc-test vwprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vwprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vwprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoll
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOLL_0100
     * @tc.desc   libc-test wcstoll
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoll", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoll");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstoull
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOULL_0100
     * @tc.desc   libc-test wcstoull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstoull", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstoull");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wprintf
     * @tc.number SUB_THIRDPARTY_MUSL_WPRINTF_0100
     * @tc.desc   libc-test wprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   asprintf
     * @tc.number SUB_THIRDPARTY_MUSL_ASPRINTF_0100
     * @tc.desc   libc-test asprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   dprintf
     * @tc.number SUB_THIRDPARTY_MUSL_DPRINTF_0100
     * @tc.desc   libc-test dprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fgetln
     * @tc.number SUB_THIRDPARTY_MUSL_FGETLN_0100
     * @tc.desc   libc-test fgetln
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgetln", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgetln");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fgetpos
     * @tc.number SUB_THIRDPARTY_MUSL_FGETPOS_0100
     * @tc.desc   libc-test fgetpos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgetpos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgetpos");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fgets
     * @tc.number SUB_THIRDPARTY_MUSL_FGETS_0100
     * @tc.desc   libc-test fgets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgets", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgets");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fgetws
     * @tc.number SUB_THIRDPARTY_MUSL_FGETWS_0100
     * @tc.desc   libc-test fgetws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgetws", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgetws");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   flockfile
     * @tc.number SUB_THIRDPARTY_MUSL_FLOCKFILE_0100
     * @tc.desc   libc-test flockfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("flockfile", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("flockfile");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fprintf
     * @tc.number SUB_THIRDPARTY_MUSL_FPRINTF_0100
     * @tc.desc   libc-test fprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fputc
     * @tc.number SUB_THIRDPARTY_MUSL_FPUTC_0100
     * @tc.desc   libc-test fputc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fputc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fputc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fputs
     * @tc.number SUB_THIRDPARTY_MUSL_FPUTS_0100
     * @tc.desc   libc-test fputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fputs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fputs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fputwc
     * @tc.number SUB_THIRDPARTY_MUSL_FPUTWC_0100
     * @tc.desc   libc-test fputwc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fputwc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fputwc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fputws
     * @tc.number SUB_THIRDPARTY_MUSL_FPUTWS_0100
     * @tc.desc   libc-test fputws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fputws", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fputws");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   freopen
     * @tc.number SUB_THIRDPARTY_MUSL_FREOPEN_0100
     * @tc.desc   libc-test freopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("freopen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("freopen");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fseeko
     * @tc.number SUB_THIRDPARTY_MUSL_FSEEKO_0100
     * @tc.desc   libc-test fseeko
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fseeko", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fseeko");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ftell
     * @tc.number SUB_THIRDPARTY_MUSL_FTELL_0100
     * @tc.desc   libc-test ftell
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ftell", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ftell");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ftrylockfile
     * @tc.number SUB_THIRDPARTY_MUSL_FTRYLOCKFILE_0100
     * @tc.desc   libc-test ftrylockfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ftrylockfile", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ftrylockfile");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   funlockfile
     * @tc.number SUB_THIRDPARTY_MUSL_FUNLOCKFILE_0100
     * @tc.desc   libc-test funlockfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("funlockfile", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("funlockfile");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fwide
     * @tc.number SUB_THIRDPARTY_MUSL_FWIDE_0100
     * @tc.desc   libc-test fwide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fwide", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fwide");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fwprintf
     * @tc.number SUB_THIRDPARTY_MUSL_FWPRINTF_0100
     * @tc.desc   libc-test fwprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fwprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fwprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fwrite
     * @tc.number SUB_THIRDPARTY_MUSL_FWRITE_0100
     * @tc.desc   libc-test fwrite
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fwrite", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fwrite");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getc
     * @tc.number SUB_THIRDPARTY_MUSL_GETC_0100
     * @tc.desc   libc-test getc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getc_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_GETC_UNLOCKED_0100
     * @tc.desc   libc-test getc_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getc_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getc_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getchar
     * @tc.number SUB_THIRDPARTY_MUSL_GETCHAR_0100
     * @tc.desc   libc-test getchar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getchar", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getchar");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getchar_unlocked
     * @tc.number SUB_THIRDPARTY_MUSL_GETCHAR_UNLOCKED_0100
     * @tc.desc   libc-test getchar_unlocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getchar_unlocked", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getchar_unlocked");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getdelim
     * @tc.number SUB_THIRDPARTY_MUSL_GETDELIM_0100
     * @tc.desc   libc-test getdelim
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getdelim", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getdelim");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getline
     * @tc.number SUB_THIRDPARTY_MUSL_GETLINE_0100
     * @tc.desc   libc-test getline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getline", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getline");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   putw
     * @tc.number SUB_THIRDPARTY_MUSL_PUTW_0100
     * @tc.desc   libc-test putw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putw", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putw");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   remove
     * @tc.number SUB_THIRDPARTY_MUSL_REMOVE_0100
     * @tc.desc   libc-test remove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("remove", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("remove");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rename
     * @tc.number SUB_THIRDPARTY_MUSL_RENAME_0100
     * @tc.desc   libc-test rename
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rename", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rename");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setbuf
     * @tc.number SUB_THIRDPARTY_MUSL_SETBUF_0100
     * @tc.desc   libc-test setbuf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setbuf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setbuf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setbuffer
     * @tc.number SUB_THIRDPARTY_MUSL_SETBUFFER_0100
     * @tc.desc   libc-test setbuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setbuffer", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setbuffer");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setlinebuf
     * @tc.number SUB_THIRDPARTY_MUSL_SETLINEBUF_0100
     * @tc.desc   libc-test setlinebuf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setlinebuf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setlinebuf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   setvbuf
     * @tc.number SUB_THIRDPARTY_MUSL_SETVBUF_0100
     * @tc.desc   libc-test setvbuf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setvbuf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setvbuf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ungetwc
     * @tc.number SUB_THIRDPARTY_MUSL_UNGETWC_0100
     * @tc.desc   libc-test ungetwc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ungetwc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ungetwc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vdprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VDPRINTF_0100
     * @tc.desc   libc-test vdprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vdprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vdprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vfprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VFPRINTF_0100
     * @tc.desc   libc-test vfprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vfprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vfprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vfscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VFSCANF_0100
     * @tc.desc   libc-test vfscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vfscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vfscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vfwprintf
     * @tc.number SUB_THIRDPARTY_MUSL_VFWPRINTF_0100
     * @tc.desc   libc-test vfwprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vfwprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vfwprintf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   vfwscanf
     * @tc.number SUB_THIRDPARTY_MUSL_VFWSCANF_0100
     * @tc.desc   libc-test vfwscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vfwscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vfwscanf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_fpending
     * @tc.number SUB_THIRDPARTY_MUSL___FPENDING_0100
     * @tc.desc   libc-test __fpending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_fpending", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fpending");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_fpurge
     * @tc.number SUB_THIRDPARTY_MUSL___FPURGE_0100
     * @tc.desc   libc-test __fpurge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_fpurge", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fpurge");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_freadable
     * @tc.number SUB_THIRDPARTY_MUSL___FREADABLE_0100
     * @tc.desc   libc-test __freadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_freadable", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__freadable");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_freading
     * @tc.number SUB_THIRDPARTY_MUSL___FREADING_0100
     * @tc.desc   libc-test __freading
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_freading", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__freading");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_fseterr
     * @tc.number SUB_THIRDPARTY_MUSL___FSETERR_0100
     * @tc.desc   libc-test __fseterr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_fseterr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fseterr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_fwritable
     * @tc.number SUB_THIRDPARTY_MUSL___FWRITABLE_0100
     * @tc.desc   libc-test __fwritable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_fwritable", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fwritable");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_fwriting
     * @tc.number SUB_THIRDPARTY_MUSL___FWRITING_0100
     * @tc.desc   libc-test __fwriting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_fwriting", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("__fwriting");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   test_flushlbf
     * @tc.number SUB_THIRDPARTY_MUSL__FLUSHLBF_0100
     * @tc.desc   libc-test _flushlbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("test_flushlbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("_flushlbf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fsetpos
     * @tc.number SUB_THIRDPARTY_MUSL_FSETPOS_0100
     * @tc.desc   libc-test fsetpos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fsetpos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fsetpos");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   getwc
     * @tc.number SUB_THIRDPARTY_MUSL_GETWC_0100
     * @tc.desc   libc-test getwc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getwc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getwc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   rewind
     * @tc.number SUB_THIRDPARTY_MUSL_REWIND_0100
     * @tc.desc   libc-test rewind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rewind", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rewind");
      expect(result).assertEqual(0);
      done();
    });
  });
}
