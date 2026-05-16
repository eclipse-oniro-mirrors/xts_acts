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
import stat from 'libstat1ndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function stat1NdkTest() {
  describe('MuslStat1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslStatChmod002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_CHMOD_0200
     * @tc.desc   test chmod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatChmod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = stat.chmod();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatFstatat002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_FSTATAT_0200
     * @tc.desc   test fstatat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatFstatat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = stat.fstatat();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatFstatat64002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_FSTATAT64_0200
     * @tc.desc   test fstatat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatFstatat64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = stat.fstatat64();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatLstat002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_LSTAT_0200
     * @tc.desc   test lstat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatLstat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = stat.lstat();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatLstat64002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_LSTAT64_0200
     * @tc.desc   test lstat64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatLstat64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = stat.lstat64();
      expect(data).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatFutimens002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_FUTIMENS_0200
     * @tc.desc   test futimens
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatFutimens002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = stat.futimens();
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslStatUmask002
     * @tc.number SUB_THIRDPARTY_MUSL_STAT_UMASK_0200
     * @tc.desc   test umask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslStatUmask002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = stat.umask();
      expect(result).assertEqual(-1);
      done();
    });
  })
}