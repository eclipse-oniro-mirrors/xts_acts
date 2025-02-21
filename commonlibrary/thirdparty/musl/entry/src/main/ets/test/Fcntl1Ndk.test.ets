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

import { describe, expect, it } from '@ohos/hypium'
import fcntl from 'libfcntl1ndk.so'

export default function fcntl1NdkTest() {
  describe('MuslFcntl1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_TEE_0200
     * @tc.name       : testMuslFcntlTee002
     * @tc.desc       : test tee
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlTee002', 0, async (done: Function) => {
      let c: number = fcntl.tee(-1);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_VMSPLICE_0200
     * @tc.name       : testMuslFcntlVmsplice002
     * @tc.desc       : test vmsplice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlVmsplice002', 0, async (done: Function) => {
      let c: number = fcntl.vmsplice(-1);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_READAHEAD_0200
     * @tc.name       : testMuslFcntlReadahead002
     * @tc.desc       : test readahead
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlReadahead002', 0, async (done: Function) => {
      let result: number = fcntl.readahead(-1);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FADVISE_0200
     * @tc.name       : testMuslFcntlPosixFadvise002
     * @tc.desc       : test posixfadvise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFadvise002', 0, async (done: Function) => {
      expect(fcntl.posixfadvise(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FALLOCATE_0200
     * @tc.name       : testMuslFcntlPosixFallocate002
     * @tc.desc       : test posixfallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFallocate002', 0, async (done: Function) => {
      expect(fcntl.posixfallocate(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FCNTL_0200
     * @tc.name       : testMuslFcntlFcnTl002
     * @tc.desc       : test fcntl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFcnTl002', 0, async (done: Function) => {
      expect(fcntl.fcntl(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FALLOCATE_0200
     * @tc.name       : testMuslFcntlFalLocate002
     * @tc.desc       : test fallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFalLocate002', 0, async (done: Function) => {
      expect(fcntl.fallocate(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FALLOCATE64_0200
     * @tc.name       : testMuslFcntlFalLocate64002
     * @tc.desc       : test fallocate64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFalLocate64002', 0, async (done: Function) => {
      expect(fcntl.fallocate64(-1)).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN_0200
     * @tc.name       : testMuslFcntlOpen002
     * @tc.desc       : test open
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpen002', 0, async (done: Function) => {
      let data: number = fcntl.open(-1);
      expect(data).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN64_0200
     * @tc.name       : testMuslFcntlOpen64002
     * @tc.desc       : test open64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpen64002', 0, async (done: Function) => {
      let data: number = fcntl.open64(-1);
      expect(data).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FWRITECHK_0100
     * @tc.name       : testMuslFcntlFwritechk001
     * @tc.desc       : test __fwrite_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFwritechk001', 0, async (done: Function) => {
      expect(fcntl.fwritechk()).assertEqual(1);
      done()
    });
  })
}