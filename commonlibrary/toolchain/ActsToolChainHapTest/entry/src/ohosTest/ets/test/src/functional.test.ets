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

export default function functional_group_test() {
  describe("ActsToolChainHapTest_src_functional", () => {
    /**
     * @tc.name   argv
     * @tc.number SUB_THIRDPARTY_MUSL_ARGV_0100
     * @tc.desc   libc-test argv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("argv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("argv");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   basename
     * @tc.number SUB_THIRDPARTY_MUSL_BASENAME_0100
     * @tc.desc   libc-test basename
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("basename", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("basename");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   crypt
     * @tc.number SUB_THIRDPARTY_MUSL_CRYPT_0100
     * @tc.desc   libc-test crypt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("crypt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("crypt");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dirname
     * @tc.number SUB_THIRDPARTY_MUSL_DIRNAME_0100
     * @tc.desc   libc-test dirname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dirname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dirname");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   env
     * @tc.number SUB_THIRDPARTY_MUSL_ENV_0100
     * @tc.desc   libc-test env
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("env", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("env");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fnmatch
     * @tc.number SUB_THIRDPARTY_MUSL_FNMATCH_0100
     * @tc.desc   libc-test fnmatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fnmatch", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fnmatch");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_gettid_np
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETTID_NP_0100
     * @tc.desc   libc-test pthread_gettid_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_gettid_np", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_gettid_np");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sched_cpualloc
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_CPUALLOC_0100
     * @tc.desc   libc-test sched_cpualloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_cpualloc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_cpualloc");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sched_setscheduler
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_SETSCHEDULER_0100
     * @tc.desc   libc-test sched_setscheduler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_setscheduler", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_setscheduler");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   search_insque
     * @tc.number SUB_THIRDPARTY_MUSL_SEARCH_INSQUE_0100
     * @tc.desc   libc-test search_insque
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("search_insque", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("search_insque");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   search_lsearch
     * @tc.number SUB_THIRDPARTY_MUSL_SEARCH_LSEARCH_0100
     * @tc.desc   libc-test search_lsearch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("search_lsearch", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("search_lsearch");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   setjmp
     * @tc.number SUB_THIRDPARTY_MUSL_SETJMP_0100
     * @tc.desc   libc-test setjmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setjmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setjmp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sscanf_long
     * @tc.number SUB_THIRDPARTY_MUSL_SSCANF_LONG_0100
     * @tc.desc   libc-test sscanf_long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sscanf_long", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sscanf_long");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   string_memcpy
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMCPY_0100
     * @tc.desc   libc-test string_memcpy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_memcpy", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_memcpy");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strtod_long
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOD_LONG_0100
     * @tc.desc   libc-test strtod_long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtod_long", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtod_long");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strtod_simple
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOD_SIMPLE_0100
     * @tc.desc   libc-test strtod_simple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtod_simple", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtod_simple");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tgkill
     * @tc.number SUB_THIRDPARTY_MUSL_TGKILL_0100
     * @tc.desc   libc-test tgkill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tgkill", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tgkill");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_init
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_INIT_0100
     * @tc.desc   libc-test tls_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tls_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_init");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ftw
     * @tc.number SUB_THIRDPARTY_MUSL_FTW_0100
     * @tc.desc   libc-test ftw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ftw", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ftw");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   getdtablesize
     * @tc.number SUB_THIRDPARTY_MUSL_GETDTABLESIZE_0100
     * @tc.desc   libc-test getdtablesize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("getdtablesize", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("getdtablesize");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   gethostname
     * @tc.number SUB_THIRDPARTY_MUSL_GETHOSTNAME_0100
     * @tc.desc   libc-test gethostname
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("gethostname", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("gethostname");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iconv
     * @tc.number SUB_THIRDPARTY_MUSL_ICONV_0100
     * @tc.desc   libc-test iconv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iconv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iconv");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   issetugid
     * @tc.number SUB_THIRDPARTY_MUSL_ISSETUGID_0100
     * @tc.desc   libc-test issetugid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("issetugid", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("issetugid");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   langinfo
     * @tc.number SUB_THIRDPARTY_MUSL_LANGINFO_0100
     * @tc.desc   libc-test langinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("langinfo", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("langinfo");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   readahead
     * @tc.number SUB_THIRDPARTY_MUSL_READAHEAD_0100
     * @tc.desc   libc-test readahead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("readahead", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("readahead");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sched_getcpu
     * @tc.number SUB_THIRDPARTY_MUSL_SCHED_GETCPU_0100
     * @tc.desc   libc-test sched_getcpu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sched_getcpu", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sched_getcpu");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   setpgrp
     * @tc.number SUB_THIRDPARTY_MUSL_SETPGRP_0100
     * @tc.desc   libc-test setpgrp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setpgrp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setpgrp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   setpriority
     * @tc.number SUB_THIRDPARTY_MUSL_SETPRIORITY_0100
     * @tc.desc   libc-test setpriority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("setpriority", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("setpriority");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigpending
     * @tc.number SUB_THIRDPARTY_MUSL_SIGPENDING_0100
     * @tc.desc   libc-test sigpending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigpending", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigpending");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sigreturn
     * @tc.number SUB_THIRDPARTY_MUSL_SIGRETURN_0100
     * @tc.desc   libc-test sigreturn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sigreturn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sigreturn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strverscmp
     * @tc.number SUB_THIRDPARTY_MUSL_STRVERSCMP_0100
     * @tc.desc   libc-test strverscmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strverscmp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strverscmp");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   verr
     * @tc.number SUB_THIRDPARTY_MUSL_VERR_0100
     * @tc.desc   libc-test verr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("verr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("verr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   verrx
     * @tc.number SUB_THIRDPARTY_MUSL_VERRX_0100
     * @tc.desc   libc-test verrx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("verrx", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("verrx");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   vwarn
     * @tc.number SUB_THIRDPARTY_MUSL_VWARN_0100
     * @tc.desc   libc-test vwarn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vwarn", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vwarn");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   vwarnx
     * @tc.number SUB_THIRDPARTY_MUSL_VWARNX_0100
     * @tc.desc   libc-test vwarnx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("vwarnx", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("vwarnx");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   wcsftime
     * @tc.number SUB_THIRDPARTY_MUSL_WCSFTIME_0100
     * @tc.desc   libc-test wcsftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsftime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsftime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iconv_open
     * @tc.number SUB_THIRDPARTY_MUSL_ICONV_OPEN_0100
     * @tc.desc   libc-test iconv_open
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iconv_open", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iconv_open");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   iconv_test
     * @tc.number SUB_THIRDPARTY_MUSL_ICONV_TEST_0100
     * @tc.desc   libc-test iconv_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iconv_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iconv_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   iconv_joint_icu_test
     * @tc.number SUB_THIRDPARTY_MUSL_ICONV_JOINT_ICU_TEST_0100
     * @tc.desc   libc-test iconv_joint_icu_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("iconv_joint_icu_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("iconv_joint_icu_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   mbc
     * @tc.number SUB_THIRDPARTY_MUSL_MBC_0100
     * @tc.desc   libc-test mbc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("mbc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("mbc");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   pthread_getname_np
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_GETNAME_NP_0100
     * @tc.desc   libc-test pthread_getname_np
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_getname_np", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_getname_np");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   search_hsearch
     * @tc.number SUB_THIRDPARTY_MUSL_SEARCH_HSEARCH_0100
     * @tc.desc   libc-test search_hsearch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("search_hsearch", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("search_hsearch");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strftime
     * @tc.number SUB_THIRDPARTY_MUSL_STRFTIME_0100
     * @tc.desc   libc-test strftime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strftime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strftime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   string_strstr
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRSTR_0100
     * @tc.desc   libc-test string_strstr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_strstr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_strstr");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   reloc_symver
     * @tc.number SUB_THIRDPARTY_MUSL_RELOC_SYMVER_0100
     * @tc.desc   libc-test reloc_symver
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("reloc_symver", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("reloc_symver");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dlsym
     * @tc.number SUB_THIRDPARTY_MUSL_DLSYM_0100
     * @tc.desc   libc-test dlsym
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dlsym", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dlsym");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dlvsym
     * @tc.number SUB_THIRDPARTY_MUSL_DLVSYM_0100
     * @tc.desc   libc-test dlvsym
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dlvsym", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dlvsym");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dynlink
     * @tc.number SUB_THIRDPARTY_MUSL_DYNLINK_0100
     * @tc.desc   libc-test dynlink
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dynlink", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dynlink");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strptime
     * @tc.number SUB_THIRDPARTY_MUSL_STRPTIME_0100
     * @tc.desc   libc-test strptime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strptime", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strptime");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strtol
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_0100
     * @tc.desc   libc-test strtol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtol", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtol");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   strtold
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOLD_0100
     * @tc.desc   libc-test strtold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtold", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtold");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   udiv
     * @tc.number SUB_THIRDPARTY_MUSL_UDIV_0100
     * @tc.desc   libc-test udiv
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("udiv", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("udiv");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcsstr
     * @tc.number SUB_THIRDPARTY_MUSL_WCSSTR_0100
     * @tc.desc   libc-test wcsstr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcsstr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcsstr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   wcstol
     * @tc.number SUB_THIRDPARTY_MUSL_WCSTOL_0100
     * @tc.desc   libc-test wcstol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("wcstol", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("wcstol");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   clocale_mbfuncs
     * @tc.number SUB_THIRDPARTY_MUSL_CLOCALE_MBFUNCS_0100
     * @tc.desc   libc-test clocale_mbfuncs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("clocale_mbfuncs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("clocale_mbfuncs");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dl_multithread_lock
     * @tc.number SUB_THIRDPARTY_MUSL_DL_MULTITHREAD_LOCK_0100
     * @tc.desc   libc-test dl_multithread_lock
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dl_multithread_lock", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dl_multithread_lock");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dl_multithread_test
     * @tc.number SUB_THIRDPARTY_MUSL_DL_MULTITHREAD_TEST_0100
     * @tc.desc   libc-test dl_multithread_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dl_multithread_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dl_multithread_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fdopen
     * @tc.number SUB_THIRDPARTY_MUSL_FDOPEN_0100
     * @tc.desc   libc-test fdopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdopen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdopen");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fcntl
     * @tc.number SUB_THIRDPARTY_MUSL_FCNTL_0100
     * @tc.desc   libc-test fcntl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fcntl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fcntl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   fopencookie_test
     * @tc.number SUB_THIRDPARTY_MUSL_FOPENCOOKIE_TEST_0100
     * @tc.desc   libc-test fopencookie_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fopencookie_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fopencookie_test");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   inet_pton
     * @tc.number SUB_THIRDPARTY_MUSL_INET_PTON_0100
     * @tc.desc   libc-test inet_pton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("inet_pton", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("inet_pton");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_mutex
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_0100
     * @tc.desc   libc-test pthread_mutex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_mutex_pi
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_MUTEX_PI_0100
     * @tc.desc   libc-test pthread_mutex_pi
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_mutex_pi", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_mutex_pi");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_tsd
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_TSD_0100
     * @tc.desc   libc-test pthread_tsd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_tsd", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_tsd");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   search_tsearch
     * @tc.number SUB_THIRDPARTY_MUSL_SEARCH_TSEARCH_0100
     * @tc.desc   libc-test search_tsearch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("search_tsearch", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("search_tsearch");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sem_init
     * @tc.number SUB_THIRDPARTY_MUSL_SEM_INIT_0100
     * @tc.desc   libc-test sem_init
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sem_init", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sem_init");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   snprintf
     * @tc.number SUB_THIRDPARTY_MUSL_SNPRINTF_0100
     * @tc.desc   libc-test snprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("snprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("snprintf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   sscanf
     * @tc.number SUB_THIRDPARTY_MUSL_SSCANF_0100
     * @tc.desc   libc-test sscanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("sscanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("sscanf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   string
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_0100
     * @tc.desc   libc-test string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   string_memmem
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMMEM_0100
     * @tc.desc   libc-test string_memmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_memmem", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_memmem");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strtod
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOD_0100
     * @tc.desc   libc-test strtod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtod", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtod");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   strtof
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOF_0100
     * @tc.desc   libc-test strtof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("strtof", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("strtof");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   swprintf
     * @tc.number SUB_THIRDPARTY_MUSL_SWPRINTF_0100
     * @tc.desc   libc-test swprintf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("swprintf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("swprintf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   time
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_0100
     * @tc.desc   libc-test time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("time", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("time");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_align
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_ALIGN_0100
     * @tc.desc   libc-test tls_align
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tls_align", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_align");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_align_dlopen
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_ALIGN_DLOPEN_0100
     * @tc.desc   libc-test tls_align_dlopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tls_align_dlopen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_align_dlopen");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_init_dlopen
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_INIT_DLOPEN_0100
     * @tc.desc   libc-test tls_init_dlopen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tls_init_dlopen", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_init_dlopen");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   tls_local_exec
     * @tc.number SUB_THIRDPARTY_MUSL_TLS_LOCAL_EXEC_0100
     * @tc.desc   libc-test tls_local_exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tls_local_exec", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tls_local_exec");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   qsort
     * @tc.number SUB_THIRDPARTY_MUSL_QSORT_0100
     * @tc.desc   libc-test qsort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("qsort", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("qsort");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   renameat2_test
     * @tc.number SUB_THIRDPARTY_MUSL_RENAMEAT_TWO_TEST_0100
     * @tc.desc   libc-test renameat2_test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("renameat2_test", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("renameat2_test");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   string_strchr
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_STRCHR_0100
     * @tc.desc   libc-test string_strchr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_strchr", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_strchr");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   tgmath
     * @tc.number SUB_THIRDPARTY_MUSL_TGMATH_0100
     * @tc.desc   libc-test tgmath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("tgmath", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("tgmath");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   pthread_cond
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_COND_0100
     * @tc.desc   libc-test pthread_cond
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("pthread_cond", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("pthread_cond");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   socket
     * @tc.number SUB_THIRDPARTY_MUSL_SOCKET_0100
     * @tc.desc   libc-test socket
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("socket", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("socket");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   string_memset
     * @tc.number SUB_THIRDPARTY_MUSL_STRING_MEMSET_0100
     * @tc.desc   libc-test string_memset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("string_memset", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("string_memset");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atexit_dlclose
     * @tc.number SUB_THIRDPARTY_MUSL_ATEXIT_DLCLOSE_0100
     * @tc.desc   libc-test atexit_dlclose
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atexit_dlclose", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atexit_dlclose");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dl_different_hash_exe
     * @tc.number SUB_THIRDPARTY_MUSL_DL_DIFFERENT_HASH_EXE_0100
     * @tc.desc   libc-test dl_different_hash_exe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dl_different_hash_exe", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dl_different_hash_exe");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dlclose_reset
     * @tc.number SUB_THIRDPARTY_MUSL_DLCLOSE_RESET_0100
     * @tc.desc   libc-test dlclose_reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dlclose_reset", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dlclose_reset");
      expect(result).assertEqual(0);
      done();
    });
  });
}
