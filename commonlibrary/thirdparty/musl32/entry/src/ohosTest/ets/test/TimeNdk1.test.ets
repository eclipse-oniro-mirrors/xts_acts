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
import time1 from 'libtimendk32.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function timeNdk1Test() {

  describe('MuslTime1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTimeTimerGetTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMER_GETTIME64_0100
     * @tc.desc   test the normal condition of Timer_getTime64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerGetTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Timer_getTime64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimerGetTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMER_GETTIME64_0200
     * @tc.desc   test the abnormal condition of Timer_getTime64_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerGetTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Timer_getTime64_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimerSetTime64001
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMER_SETTIME64_0100
     * @tc.desc   test the normal condition of Timer_setTime64_One
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerSetTime64001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Timer_setTime64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testMuslTimeTimerSetTime64002
     * @tc.number SUB_THIRDPARTY_MUSL_TIME_TIMER_SETTIME64_0200
     * @tc.desc   test the abnormal condition of Timer_setTime64_Two
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimeTimerSetTime64002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(time1.Timer_setTime64_Two()).assertEqual(1);
      done()
    });

  })
}
