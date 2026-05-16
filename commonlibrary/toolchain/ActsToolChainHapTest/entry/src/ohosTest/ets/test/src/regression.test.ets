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

export default function regression_group_test() {
  describe("ActsToolChainHapTest_src_regression", () => {
    /**
     * @tc.name   daemon_failure
     * @tc.number SUB_THIRDPARTY_MUSL_DAEMON_FAILURE_0100
     * @tc.desc   libc-test daemon-failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("daemon_failure", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("daemon-failure");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dn_expand_empty
     * @tc.number SUB_THIRDPARTY_MUSL_DN_EXPAND_EMPTY_0100
     * @tc.desc   libc-test dn_expand-empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dn_expand_empty", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dn_expand-empty");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dn_expand_ptr_0
     * @tc.number SUB_THIRDPARTY_MUSL_DN_EXPAND_PTR_ZERO_0100
     * @tc.desc   libc-test dn_expand-ptr-0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dn_expand_ptr_0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dn_expand-ptr-0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fgets_eof
     * @tc.number SUB_THIRDPARTY_MUSL_FGETS_EOF_0100
     * @tc.desc   libc-test fgets-eof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgets_eof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgets-eof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fgetwc_buffering
     * @tc.number SUB_THIRDPARTY_MUSL_FGETWC_BUFFERING_0100
     * @tc.desc   libc-test fgetwc-buffering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fgetwc_buffering", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fgetwc-buffering");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getpwnam_r_crash
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWNAM_R_CRASH_0100
     * @tc.desc   libc-test getpwnam_r-crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getpwnam_r_crash", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getpwnam_r-crash");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getpwnam_r_errno
     * @tc.number SUB_THIRDPARTY_MUSL_GETPWNAM_R_ERRNO_0100
     * @tc.desc   libc-test getpwnam_r-errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getpwnam_r_errno", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getpwnam_r-errno");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   inet_ntop_v4mapped
     * @tc.number SUB_THIRDPARTY_MUSL_INET_NTOP_V_FOUR_MAPPED_0100
     * @tc.desc   libc-test inet_ntop-v4mapped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_ntop_v4mapped", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_ntop-v4mapped");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   inet_pton_empty_last_field
     * @tc.number SUB_THIRDPARTY_MUSL_INET_PTON_EMPTY_LAST_FIELD_0100
     * @tc.desc   libc-test inet_pton-empty-last-field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_pton_empty_last_field", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_pton-empty-last-field");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iswspace_null
     * @tc.number SUB_THIRDPARTY_MUSL_ISWSPACE_NULL_0100
     * @tc.desc   libc-test iswspace-null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iswspace_null", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iswspace-null");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   lrand48_signextend
     * @tc.number SUB_THIRDPARTY_MUSL_LRAND_FOUR_EIGHT_SIGNEXTEND_0100
     * @tc.desc   libc-test lrand48-signextend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("lrand48_signextend", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("lrand48-signextend");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_0
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_ZERO_0100
     * @tc.desc   libc-test malloc-0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_pressure
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_PRESSURE_0100
     * @tc.desc   libc-test malloc-pressure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_pressure", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-pressure");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mbsrtowcs_overflow
     * @tc.number SUB_THIRDPARTY_MUSL_MBSRTOWCS_OVERFLOW_0100
     * @tc.desc   libc-test mbsrtowcs-overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbsrtowcs_overflow", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbsrtowcs-overflow");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   memmem_oob
     * @tc.number SUB_THIRDPARTY_MUSL_MEMMEM_OOB_0100
     * @tc.desc   libc-test memmem-oob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memmem_oob", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memmem-oob");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   memmem_oob_read
     * @tc.number SUB_THIRDPARTY_MUSL_MEMMEM_OOB_READ_0100
     * @tc.desc   libc-test memmem-oob-read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("memmem_oob_read", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("memmem-oob-read");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mkdtemp_failure
     * @tc.number SUB_THIRDPARTY_MUSL_MKDTEMP_FAILURE_0100
     * @tc.desc   libc-test mkdtemp-failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkdtemp_failure", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkdtemp-failure");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mkstemp_failure
     * @tc.number SUB_THIRDPARTY_MUSL_MKSTEMP_FAILURE_0100
     * @tc.desc   libc-test mkstemp-failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mkstemp_failure", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mkstemp-failure");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   printf_1e9_oob
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_ONE_E_NINE_OOB_0100
     * @tc.desc   libc-test printf-1e9-oob
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf_1e9_oob", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf-1e9-oob");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   printf_fmt_g_round
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_FMT_G_ROUND_0100
     * @tc.desc   libc-test printf-fmt-g-round
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf_fmt_g_round", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf-fmt-g-round");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   printf_fmt_g_zeros
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_FMT_G_ZEROS_0100
     * @tc.desc   libc-test printf-fmt-g-zeros
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf_fmt_g_zeros", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf-fmt-g-zeros");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   printf_fmt_n
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_FMT_N_0100
     * @tc.desc   libc-test printf-fmt-n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("printf_fmt_n", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("printf-fmt-n");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_exit_cancel
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_EXIT_CANCEL_0100
     * @tc.desc   libc-test pthread_exit-cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_exit_cancel", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_exit-cancel");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   putenv_doublefree
     * @tc.number SUB_THIRDPARTY_MUSL_PUTENV_DOUBLEFREE_0100
     * @tc.desc   libc-test putenv-doublefree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("putenv_doublefree", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("putenv-doublefree");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regex_backref_0
     * @tc.number SUB_THIRDPARTY_MUSL_REGEX_BACKREF_ZERO_0100
     * @tc.desc   libc-test regex-backref-0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regex_backref_0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regex-backref-0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regex_bracket_icase
     * @tc.number SUB_THIRDPARTY_MUSL_REGEX_BRACKET_ICASE_0100
     * @tc.desc   libc-test regex-bracket-icase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regex_bracket_icase", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regex-bracket-icase");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regex_ere_backref
     * @tc.number SUB_THIRDPARTY_MUSL_REGEX_ERE_BACKREF_0100
     * @tc.desc   libc-test regex-ere-backref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regex_ere_backref", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regex-ere-backref");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regex_escaped_high_byte
     * @tc.number SUB_THIRDPARTY_MUSL_REGEX_ESCAPED_HIGH_BYTE_0100
     * @tc.desc   libc-test regex-escaped-high-byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regex_escaped_high_byte", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regex-escaped-high-byte");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regex_negated_range
     * @tc.number SUB_THIRDPARTY_MUSL_REGEX_NEGATED_RANGE_0100
     * @tc.desc   libc-test regex-negated-range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regex_negated_range", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regex-negated-range");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   regexec_nosub
     * @tc.number SUB_THIRDPARTY_MUSL_REGEXEC_NOSUB_0100
     * @tc.desc   libc-test regexec-nosub
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("regexec_nosub", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("regexec-nosub");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   rewind_clear_error
     * @tc.number SUB_THIRDPARTY_MUSL_REWIND_CLEAR_ERROR_0100
     * @tc.desc   libc-test rewind-clear-error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rewind_clear_error", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rewind-clear-error");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   rlimit_open_files
     * @tc.number SUB_THIRDPARTY_MUSL_RLIMIT_OPEN_FILES_0100
     * @tc.desc   libc-test rlimit-open-files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("rlimit_open_files", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("rlimit-open-files");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scanf_bytes_consumed
     * @tc.number SUB_THIRDPARTY_MUSL_SCANF_BYTES_CONSUMED_0100
     * @tc.desc   libc-test scanf-bytes-consumed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scanf_bytes_consumed", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scanf-bytes-consumed");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scanf_match_literal_eof
     * @tc.number SUB_THIRDPARTY_MUSL_SCANF_MATCH_LITERAL_EOF_0100
     * @tc.desc   libc-test scanf-match-literal-eof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scanf_match_literal_eof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scanf-match-literal-eof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   scanf_nullbyte_char
     * @tc.number SUB_THIRDPARTY_MUSL_SCANF_NULLBYTE_CHAR_0100
     * @tc.desc   libc-test scanf-nullbyte-char
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("scanf_nullbyte_char", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("scanf-nullbyte-char");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   setvbuf_unget
     * @tc.number SUB_THIRDPARTY_MUSL_SETVBUF_UNGET_0100
     * @tc.desc   libc-test setvbuf-unget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setvbuf_unget", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setvbuf-unget");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigprocmask_internal
     * @tc.number SUB_THIRDPARTY_MUSL_SIGPROCMASK_INTERNAL_0100
     * @tc.desc   libc-test sigprocmask-internal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigprocmask_internal", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigprocmask-internal");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sscanf_eof
     * @tc.number SUB_THIRDPARTY_MUSL_SSCANF_EOF_0100
     * @tc.desc   libc-test sscanf-eof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sscanf_eof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sscanf-eof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   string_strcspn
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCSPN_0100
     * @tc.desc   libc-test string_strcspn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_strcspn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_strcspn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   syscall_sign_extend
     * @tc.number SUB_THIRDPARTY_MUSL_SYSCALL_SIGN_EXTEND_0100
     * @tc.desc   libc-test syscall-sign-extend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("syscall_sign_extend", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("syscall-sign-extend");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   uselocale_0
     * @tc.number SUB_THIRDPARTY_MUSL_USELOCALE_ZERO_0100
     * @tc.desc   libc-test uselocale-0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("uselocale_0", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("uselocale-0");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   wcsncpy_read_overflow
     * @tc.number SUB_THIRDPARTY_MUSL_WCSNCPY_READ_OVERFLOW_0100
     * @tc.desc   libc-test wcsncpy-read-overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsncpy_read_overflow", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsncpy-read-overflow");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   wcsstr_false_negative
     * @tc.number SUB_THIRDPARTY_MUSL_WCSSTR_FALSE_NEGATIVE_0100
     * @tc.desc   libc-test wcsstr-false-negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsstr_false_negative", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsstr-false-negative");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iconv_roundtrips
     * @tc.number SUB_THIRDPARTY_MUSL_ICONV_ROUNDTRIPS_0100
     * @tc.desc   libc-test iconv-roundtrips
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iconv_roundtrips", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iconv-roundtrips");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   malloc_free_performance
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_FREE_PERFORMANCE_0100
     * @tc.desc   libc-test malloc-free-performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_free_performance", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-free-performance");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   malloc_multi_thread_performance
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_MULTI_THREAD_PERFORMANCE_0100
     * @tc.desc   libc-test malloc-multi-thread-performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "malloc_multi_thread_performance",
      Level.LEVEL1,
      async (done: Function) => {
        const result = await testNapi.runTest(
          "malloc-multi-thread-performance",
        );
        expect(result).assertEqual(0);
        done();
      },
    );
    /**
     * @tc.name   pthread_condattr_setclock
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CONDATTR_SETCLOCK_0100
     * @tc.desc   libc-test pthread_condattr_setclock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_condattr_setclock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_condattr_setclock");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   raise_race
     * @tc.number SUB_THIRDPARTY_MUSL_RAISE_RACE_0100
     * @tc.desc   libc-test raise-race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("raise_race", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("raise-race");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   sigaltstack
     * @tc.number SUB_THIRDPARTY_MUSL_SIGALTSTACK_0100
     * @tc.desc   libc-test sigaltstack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigaltstack", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigaltstack");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   execle_env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_EXECLE_ENV_0100
     * @tc.desc   libc-test execle-env
     */
    it("execle_env", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("execle-env");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ftello_unflushed_append
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_FTELLO_UNFLUSHED_APPEND_0100
     * @tc.desc   libc-test ftello-unflushed-append
     */
    it("ftello_unflushed_append", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ftello-unflushed-append");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_modify_pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_MODIFY_POINTER_0100
     * @tc.desc   libc-test malloc-modify-pointer
     */
    it("malloc_modify_pointer", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-modify-pointer");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_robust_detach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ROBUST_DETACH_0100
     * @tc.desc   libc-test pthread-robust-detach
     */
    it("pthread_robust_detach", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread-robust-detach");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_cond_smasher
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_SMASHER_0100
     * @tc.desc   libc-test pthread_cond-smasher
     */
    it("pthread_cond_smasher", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond-smasher");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_create_oom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_CREATE_OOM_0100
     * @tc.desc   libc-test pthread_create-oom
     */
    it("pthread_create_oom", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_create-oom");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_once_deadlock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_ONCE_DEADLOCK_0100
     * @tc.desc   libc-test pthread_once-deadlock
     */
    it("pthread_once_deadlock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_once-deadlock");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_rwlock_ebusy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_RWLOCK_EBUSY_0100
     * @tc.desc   libc-test pthread_rwlock-ebusy
     */
    it("pthread_rwlock_ebusy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_rwlock-ebusy");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   setenv_oom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_SETENV_OOM_0100
     * @tc.desc   libc-test setenv-oom
     */
    it("setenv_oom", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setenv-oom");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_get_new_dtv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_GET_NEW_DTV_0100
     * @tc.desc   libc-test tls_get_new-dtv
     */
    it("tls_get_new_dtv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_get_new-dtv");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_double_free_check
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_DOUBLE_FREE_CHECK_0100
     * @tc.desc   libc-test malloc-double-free-check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_double_free_check", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-double-free-check");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_encode_pointer
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_ENCODE_POINTER_0100
     * @tc.desc   libc-test malloc-encode-pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_encode_pointer", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-encode-pointer");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_oom
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_OOM_0100
     * @tc.desc   libc-test malloc-oom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_oom", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-oom");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   malloc_safe_unlink
     * @tc.number SUB_THIRDPARTY_MUSL_MALLOC_SAFE_UNLINK_0100
     * @tc.desc   libc-test malloc-safe-unlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("malloc_safe_unlink", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("malloc-safe-unlink");
      expect(result).assertEqual(0);
      done();
    });

  });
}
