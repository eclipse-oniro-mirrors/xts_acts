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
import unistd1 from 'libunistdndk1.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function unistdNdk1Test() {

  describe('MuslUnistd1Test', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0100
     * @tc.name       : testMuslUnistdGetCwdChk001
     * @tc.desc       : test the normal condition of GetcwdChk_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetCwdChk001', 0, async (done: Function) => {
      expect(unistd1.GetcwdChk_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0200
     * @tc.name       : testMuslUnistdGetCwdChk002
     * @tc.desc       : test the abnormal condition of GetcwdChk_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetCwdChk002', 0, async (done: Function) => {
      expect(unistd1.GetcwdChk_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_GETCWD_CHK_0300
     * @tc.name       : testMuslUnistdGetCwdChk003
     * @tc.desc       : test the abnormal condition of GetcwdChk_Three
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdGetCwdChk003', 0, async (done: Function) => {
      expect(unistd1.GetcwdChk_Three()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PREADCHK_0100
     * @tc.name       : testMuslUnistdPreadchk001
     * @tc.desc       : test the normal condition of PreadChk_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdPreadchk001', 0, async (done: Function) => {
      expect(unistd1.PreadChk_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PREADCHK_0200
     * @tc.name       : testMuslUnistdPreadchk002
     * @tc.desc       : test the abnormal condition of PreadChk_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslUnistdPreadchk002', 0, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_READ_CHK_0100
     * @tc.name       : testMuslUnistdReadChk001
     * @tc.desc       : test the normal condition of ReadChk_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdReadChk001', 0, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_READ_CHK_0200
     * @tc.name       : testMuslUnistdReadChk002
     * @tc.desc       : test the abnormal condition of ReadChk_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdReadChk002', 0, async (done: Function) => {
      expect(unistd1.PreadChk_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PREAD64_0100
     * @tc.name       : testMuslUnistdPRead64001
     * @tc.desc       : test the normal condition of PRead64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPRead64001', 0, async (done: Function) => {
      expect(unistd1.PRead64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PREAD64_0200
     * @tc.name       : testMuslUnistdPRead64002
     * @tc.desc       : test the abnormal condition of PRead64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPRead64002', 0, async (done: Function) => {
      expect(unistd1.PRead64_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PWRITE_0100
     * @tc.name       : testMuslUnistdPWrite001
     * @tc.desc       : test the normal condition of PWrite_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPWrite001', 0, async (done: Function) => {
      expect(unistd1.PWrite_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PWRITE_0200
     * @tc.name       : testMuslUnistdPWrite002
     * @tc.desc       : test the abnormal condition of PWrite_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPWrite002', 0, async (done: Function) => {
      expect(unistd1.PWrite_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PWRITE64_0100
     * @tc.name       : testMuslUnistdPWrite64001
     * @tc.desc       : test the normal condition of PWrite64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPWrite64001', 0, async (done: Function) => {
      expect(unistd1.PWrite64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UNISTD_PWRITE64_0200
     * @tc.name       : testMuslUnistdPWrite64002
     * @tc.desc       : test the abnormal condition of PWrite64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUnistdPWrite64002', 0, async (done: Function) => {
      expect(unistd1.PWrite64_Two()).assertEqual(1);
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_LSEEK64_0100
     * @tc.name     : testMuslUnistdLseek64001
     * @tc.desc     : test the normal condition of Lseek64_One
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUnistdLseek64001', 0, async (done: Function) => {
      expect(unistd1.Lseek64_One()).assertEqual(1);
      done();
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_LSEEK64_0200
     * @tc.name     : testMuslUnistdLseek64002
     * @tc.desc     : test the abnormal condition of Lseek64_Two
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUnistdLseek64002', 0, async (done: Function) => {
      expect(unistd1.Lseek64_Two()).assertEqual(1);
      done();
    });

    /**
    * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_LSEEK_0100
    * @tc.name     : testMuslUnistdLseek001
    * @tc.desc     : test the abnormal condition of Lseek_One
    * @tc.size     : MediumTest
    * @tc.type     : Function
    * @tc.level    : Level 1
    */
    it('testMuslUnistdLseek001', 0, async (done: Function) => {
      expect(unistd1.Lseek_One()).assertEqual(1);
      done();
    });

    /**
    * @tc.number   : SUB_THIRDPARTY_MUSL_UNISTD_LSEEK_0200
    * @tc.name     : testMuslUnistdLseek002
    * @tc.desc     : test the abnormal abcondition of Lseek_Two
    * @tc.size     : MediumTest
    * @tc.type     : Function
    * @tc.level    : Level 1
    */
    it('testMuslUnistdLseek002', 0, async (done: Function) => {
      expect(unistd1.Lseek_Two()).assertEqual(1);
      done();
    });


  })
}