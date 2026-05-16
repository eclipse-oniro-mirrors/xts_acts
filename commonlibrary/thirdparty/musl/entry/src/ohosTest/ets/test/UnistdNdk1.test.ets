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
import unistd1 from 'libunistdndk1.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function unistdNdk1Test() {

  describe('MuslUnistd1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslUnistdGetCwdChk001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0100
     * @tc.desc   test the normal condition of GetcwdChk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetCwdChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.GetcwdChk_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslUnistdGetCwdChk002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0200
     * @tc.desc   test the abnormal condition of GetcwdChk_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetCwdChk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.GetcwdChk_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslUnistdGetCwdChk003
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0300
     * @tc.desc   test the abnormal condition of GetcwdChk_Three
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdGetCwdChk003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.GetcwdChk_Three()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslUnistdPreadchk001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PREADCHK_0100
     * @tc.desc   test the normal condition of PreadChk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPreadchk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PreadChk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPreadchk002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PREADCHK_0200
     * @tc.desc   test the abnormal condition of PreadChk_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPreadchk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdReadChk001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_READ_CHK_0100
     * @tc.desc   test the normal condition of ReadChk_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdReadChk001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdReadChk002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_READ_CHK_0200
     * @tc.desc   test the abnormal condition of ReadChk_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdReadChk002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPRead64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PREAD64_0100
     * @tc.desc   test the normal condition of PRead64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPRead64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PRead64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPRead64002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PREAD64_0200
     * @tc.desc   test the abnormal condition of PRead64_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPRead64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PRead64_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPWrite001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PWRITE_0100
     * @tc.desc   test the normal condition of PWrite_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PWrite_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPWrite002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PWRITE_0200
     * @tc.desc   test the abnormal condition of PWrite_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PWrite_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPWrite64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PWRITE64_0100
     * @tc.desc   test the normal condition of PWrite64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPWrite64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PWrite64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdPWrite64002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_PWRITE64_0200
     * @tc.desc   test the abnormal condition of PWrite64_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdPWrite64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.PWrite64_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLseek64001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LSEEK64_0100
     * @tc.desc   test the normal condition of Lseek64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLseek64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.Lseek64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLseek64002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LSEEK64_0200
     * @tc.desc   test the abnormal condition of Lseek64_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLseek64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.Lseek64_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLseek001
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LSEEK_0100
     * @tc.desc   test the abnormal condition of Lseek_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLseek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.Lseek_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.name   testMuslUnistdLseek002
     * @tc.number SUB_THIRDPARTY_MUSL_UNISTD_LSEEK_0200
     * @tc.desc   test the abnormal abcondition of Lseek_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslUnistdLseek002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(unistd1.Lseek_Two()).assertEqual(1);
      done();
    });


  })
}