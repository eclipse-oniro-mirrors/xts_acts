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

import api from "./src/api.test";
import eabi from "./src/eabi.test";
import functional from "./src/functional.test";
import fortify from "./src/functionalext/fortify.test";
import info from "./src/functionalext/info.test";
import ldso_cfi from "./src/functionalext/ldso_cfi.test";
import functionalext_ldso_dlopen_config_abs_path from "./src/functionalext/ldso_dlopen_config_abs_path.test";
import src_functionalext_locale from "./src/functionalext/locale.test";
import functionalext_backtrace from "./src/functionalext/backtrace.test";
import conf from "./src/functionalext/supplement/conf.test";
import ctype from "./src/functionalext/supplement/ctype.test";
import dirent from "./src/functionalext/supplement/dirent.test";
import supplement_env from "./src/functionalext/supplement/env.test";
import errno from "./src/functionalext/supplement/errno.test";
import exit from "./src/functionalext/supplement/exit.test";
import fcntl from "./src/functionalext/supplement/fcntl.test";
import fenv from "./src/functionalext/supplement/fenv.test";
import ipc from "./src/functionalext/supplement/ipc.test";
import legacy from "./src/functionalext/supplement/legacy.test";
import linux from "./src/functionalext/supplement/linux.test";
import lock_info from "./src/functionalext/supplement/lock_info.test";
import src_functionalext_supplement_locale from "./src/functionalext/supplement/locale.test";
import malloc from "./src/functionalext/supplement/malloc.test";
import manual_network from "./src/functionalext/supplement/manual/network.test";
import src_functionalext_supplement_math from "./src/functionalext/supplement/math.test";
import mbrlen from "./src/functionalext/supplement/mbrlen.test";
import mman from "./src/functionalext/supplement/mman.test";
import misc from "./src/functionalext/supplement/misc.test";
import multibyte from "./src/functionalext/supplement/multibyte.test";
import network from "./src/functionalext/supplement/network.test";
import passwd from "./src/functionalext/supplement/passwd.test";
import prng from "./src/functionalext/supplement/prng.test";
import process from "./src/functionalext/supplement/process.test";
import regex from "./src/functionalext/supplement/regex.test";
import sched from "./src/functionalext/supplement/sched.test";
import search from "./src/functionalext/supplement/search.test";
import select from "./src/functionalext/supplement/select.test";
import setjmp from "./src/functionalext/supplement/setjmp.test";
import signal from "./src/functionalext/supplement/signal.test";
import stat from "./src/functionalext/supplement/stat.test";
import stdio from "./src/functionalext/supplement/stdio.test";
import stdlib from "./src/functionalext/supplement/stdlib.test";
import string from "./src/functionalext/supplement/string.test";
import temp from "./src/functionalext/supplement/temp.test";
import termios from "./src/functionalext/supplement/termios.test";
import thread from "./src/functionalext/supplement/thread.test";
import src_functionalext_supplement_time from "./src/functionalext/supplement/time.test";
import unistd from "./src/functionalext/supplement/unistd.test";
import wctype from "./src/functionalext/supplement/wctype.test";
import src_functionalext_time from "./src/functionalext/time.test";
import ohos_dfx_log from "./src/functionalext/ohos_dfx_log.test";
import queue from "./src/functionalext/queue.test";
import functionalext_sched from "./src/functionalext/sched.test";
import functionalext_string from "./src/functionalext/string.test";
import unittest from "./src/functionalext/unittest.test";
import src_math from "./src/math.test";
import nativehook from "./src/nativehook.test";
import regression from "./src/regression.test";
import sigchain from "./src/functionalext/sigchain.test";
import functionalext_ldso_debug from "./src/functionalext/ldso_debug.test";
import functionalext_legacy from "./src/functionalext/legacy.test";
import functionalext_thread from "./src/functionalext/thread.test";
import ldso from "./src/functionalext/supplement/ldso.test";
import env from "./src/functionalext/supplement/manual/env.test";


export default function testsuite() {
  api();
  eabi();
  functional();
  fortify();
  info();
  ldso_cfi();
  functionalext_ldso_dlopen_config_abs_path();
  src_functionalext_locale();
  functionalext_backtrace();
  conf();
  ctype();
  dirent();
  supplement_env();
  errno();
  exit();
  fcntl();
  fenv();
  ipc();
  legacy();
  linux();
  lock_info();
  src_functionalext_supplement_locale();
  malloc();
  manual_network();
  src_functionalext_supplement_math();
  mbrlen();
  mman();
  misc();
  multibyte();
  network();
  passwd();
  prng();
  process();
  regex();
  sched();
  search();
  select();
  setjmp();
  signal();
  stat();
  stdio();
  stdlib();
  string();
  temp();
  termios();
  thread();
  src_functionalext_supplement_time();
  unistd();
  wctype();
  src_functionalext_time();
  ohos_dfx_log();
  queue();
  functionalext_sched();
  functionalext_string();
  unittest();
  src_math();
  nativehook();
  regression();
  sigchain();
  functionalext_ldso_debug();
  functionalext_legacy();
  functionalext_thread();
  ldso();
  env();
}
