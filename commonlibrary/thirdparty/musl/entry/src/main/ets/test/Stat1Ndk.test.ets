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
import stat from 'libstat1ndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function stat1NdkTest() {
  describe('MuslStat1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTAT_TIME64_0200
     * @tc.name       : testMuslStatFstatTime64002
     * @tc.desc       : test __fstat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatFstatTime64002', 0, async (done: Function) => {
      expect(stat.__fstat_time64()).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT_TIME64_0200
     * @tc.name       : testMuslStatLstatTime64002
     * @tc.desc       : test __lstat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatLstatTime64002', 0, async (done: Function) => {
      expect(stat.__lstat_time64()).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_STAT_TIME64_0200
     * @tc.name       : testMuslStatStatTime64002
     * @tc.desc       : test __stat_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatStatTime64002', 0, async (done: Function) => {
      expect(stat.__stat_time64()).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_CHMOD_0200
     * @tc.name       : testMuslStatChmod002
     * @tc.desc       : test chmod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatChmod002', 0, async (done: Function) => {
      let result: number = stat.chmod();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTATAT_0200
     * @tc.name       : testMuslStatFstatat002
     * @tc.desc       : test fstatat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstatat002', 0, async (done: Function) => {
      let result: number = stat.fstatat();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FSTATAT64_0200
     * @tc.name       : testMuslStatFstatat64002
     * @tc.desc       : test fstatat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFstatat64002', 0, async (done: Function) => {
      let result: number = stat.fstatat64();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT_0200
     * @tc.name       : testMuslStatLstat002
     * @tc.desc       : test lstat
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatLstat002', 0, async (done: Function) => {
      let data: number = stat.lstat();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_LSTAT64_0200
     * @tc.name       : testMuslStatLstat64002
     * @tc.desc       : test lstat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatLstat64002', 0, async (done: Function) => {
      let data: number = stat.lstat64();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_FUTIMENS_0200
     * @tc.name       : testMuslStatFutimens002
     * @tc.desc       : test futimens
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslStatFutimens002', 0, async (done: Function) => {
      let result: number = stat.futimens();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_STAT_UMASK_0200
     * @tc.name       : testMuslStatUmask002
     * @tc.desc       : test umask
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslStatUmask002', 0, async (done: Function) => {
      let result: number = stat.umask();
      expect(result).assertEqual(-1);
      done();
    });
  })
}