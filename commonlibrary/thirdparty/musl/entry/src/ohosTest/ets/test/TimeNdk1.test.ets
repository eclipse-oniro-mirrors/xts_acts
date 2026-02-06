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
import time1 from 'libtimendk1.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function timeNdk1Test() {

  describe('MuslTime1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTimeFutimes001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_FUTIMES_0100
     * @tc.desc   test the normal condition of Futimes_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeFutimes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Futimes_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeFutimes002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_FUTIMES_0200
     * @tc.desc   test the abnormal condition of Futimes_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeFutimes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Futimes_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeFutimesat001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_FUTIMESAT_0100
     * @tc.desc   test the normal condition of Futimesat_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeFutimesat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Futimesat_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeFutimesat002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_FUTIMESAT_0200
     * @tc.desc   test the abnormal condition of Futimesat_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeFutimesat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Futimesat_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTzName001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TZNAME_0100
     * @tc.desc   test the normal condition of TzName_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTzName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.TzName_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTzName002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TZNAME_0200
     * @tc.desc   test the normal condition of TzName_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTzName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.TzName_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeUtimes001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_UTIMES_0100
     * @tc.desc   test the normal condition of Utimes_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeUtimes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Utimes_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeUtimes002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_UTIMES_0200
     * @tc.desc   test the abnormal condition of Utimes_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeUtimes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Utimes_Two()).assertEqual(1);
      done()
    });

  })
}