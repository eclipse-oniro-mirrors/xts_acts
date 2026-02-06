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
import fcntl from 'libfcntlndk.so'

export default function fcntlNdkTest() {

  describe('MuslFcntlTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_SPLICE_0100
     * @tc.name       : testMuslFcntlSplice001
     * @tc.desc       : test splice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlSplice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1
      let c: number = fcntl.splice(a);
      expect((c != -1)).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_SPLICE_0200
     * @tc.name       : testMuslFcntlSplice002
     * @tc.desc       : test splice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlSplice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 2
      let c: number = fcntl.splice(a);
      expect((c != -1)).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_SPLICE_0300
     * @tc.name       : testMuslFcntlSplice003
     * @tc.desc       : test splice
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlSplice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 3
      let c: number = fcntl.splice(a);
      expect((c != -1)).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_TEE_0100
     * @tc.name       : testMuslFcntlTee001
     * @tc.desc       : test tee
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlTee001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let c: number = fcntl.tee();
      expect(c).assertEqual(5);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_READAHEAD_0100
     * @tc.name       : testMuslFcntlReadahead001
     * @tc.desc       : test readahead
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlReadahead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = fcntl.readahead();
      console.info("Test result = " + JSON.stringify(result));
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FALLOCATE_0100
     * @tc.name       : testMuslFcntlPosixFallocate001
     * @tc.desc       : test posixfallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFallocate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.posixfallocate()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FALLOCATE64_0100
     * @tc.name       : testMuslFcntlPosixFallocate64001
     * @tc.desc       : test posixfallocate64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFallocate64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.posixfallocate64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FADVISE_0100
     * @tc.name       : testMuslFcntlPosixFadvise001
     * @tc.desc       : test posixfallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFadvise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.posixfadvise()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_POSIX_FADVISE64_0100
     * @tc.name       : testMuslFcntlPosixFadvise64001
     * @tc.desc       : test posixfallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlPosixFadvise64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.posixfadvise64()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FCNTL_0100
     * @tc.name       : testMuslFcntlFcnTl001
     * @tc.desc       : test fcntl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFcnTl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.fcntl()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FALLOCATE_0100
     * @tc.name       : testMuslFcntlFalLocate001
     * @tc.desc       : test fallocate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFalLocate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.fallocate()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_FALLOCATE64_0100
     * @tc.name       : testMuslFcntlFalLocate64001
     * @tc.desc       : test fallocate64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFcntlFalLocate64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(fcntl.fallocate64()).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_NAME_TO_HANDLE_AT_0100
     * @tc.name       : testMuslFcntlNameToHandleAt001
     * @tc.desc       : test name_to_handle_at
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlNameToHandleAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = fcntl.nameToHandleAt();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN_0100
     * @tc.name       : testMuslFcntlOpen001
     * @tc.desc       : test open
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.open();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN64_0100
     * @tc.name       : testMuslFcntlOpen64001
     * @tc.desc       : test open64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpen64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.open64();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN_BY_HANDLE_AT_0100
     * @tc.name       : testMuslFcntlOpenByHandleAt001
     * @tc.desc       : test open_by_handle_at
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenByHandleAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openByHandleAt();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPENAT_0100
     * @tc.name       : testMuslFcntlOpenat001
     * @tc.desc       : test openat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openat();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPENAT64_0100
     * @tc.name       : testMuslFcntlOpenat64001
     * @tc.desc       : test openat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenat64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openat64();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN_CHK_0100
     * @tc.name       : testMuslFcntlOpenChk001
     * @tc.desc       : test __open_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openChk();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPEN64_CHK_0100
     * @tc.name       : testMuslFcntlOpen64Chk001
     * @tc.desc       : test __open64_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpen64Chk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.open64Chk();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPENAT_CHK_0100
     * @tc.name       : testMuslFcntlOpenatChk001
     * @tc.desc       : test __openat_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenatChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openatChk();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FCNTL_OPENAT64_CHK_0100
     * @tc.name       : testMuslFcntlOpenat64Chk001
     * @tc.desc       : test __openat64_chk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslFcntlOpenat64Chk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = fcntl.openat64Chk();
      console.info("Test NAPI data = \"" + data + "\"");
      expect(data).assertEqual(0);
      done();
    });

  })
}
