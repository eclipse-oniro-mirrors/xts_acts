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
import time1 from 'libtimendk1.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function timeNdk1Test() {

  describe('MuslTime1Test', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMER_GETTIME64_0100
     * @tc.name       : testMuslTimeTimerGetTime64001
     * @tc.desc       : test the normal condition of Timer_getTime64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerGetTime64001', 0, async (done: Function) => {
      expect(time1.Timer_getTime64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMER_GETTIME64_0200
     * @tc.name       : testMuslTimeTimerGetTime64002
     * @tc.desc       : test the abnormal condition of Timer_getTime64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerGetTime64002', 0, async (done: Function) => {
      expect(time1.Timer_getTime64_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMER_SETTIME64_0100
     * @tc.name       : testMuslTimeTimerSetTime64001
     * @tc.desc       : test the normal condition of Timer_setTime64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerSetTime64001', 0, async (done: Function) => {
      expect(time1.Timer_setTime64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TIMER_SETTIME64_0200
     * @tc.name       : testMuslTimeTimerSetTime64002
     * @tc.desc       : test the abnormal condition of Timer_setTime64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeTimerSetTime64002', 0, async (done: Function) => {
      expect(time1.Timer_setTime64_Two()).assertEqual(1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMES_0100
    * @tc.name       : testMuslTimeFutimes001
    * @tc.desc       : test the normal condition of Futimes_One
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMuslTimeFutimes001', 0, async (done: Function) => {
      expect(time1.Futimes_One()).assertEqual(1);
      done()
    });

    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMES_0200
    * @tc.name       : testMuslTimeFutimes002
    * @tc.desc       : test the abnormal condition of Futimes_Two
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMuslTimeFutimes002', 0, async (done: Function) => {
      expect(time1.Futimes_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMESAT_0100
     * @tc.name       : testMuslTimeFutimesat001
     * @tc.desc       : test the normal condition of Futimesat_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeFutimesat001', 0, async (done: Function) => {
      expect(time1.Futimesat_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_FUTIMESAT_0200
     * @tc.name       : testMuslTimeFutimesat002
     * @tc.desc       : test the abnormal condition of Futimesat_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeFutimesat002', 0, async (done: Function) => {
      expect(time1.Futimesat_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TZNAME_0100
     * @tc.name       : testMuslTimeTzName001
     * @tc.desc       : test the normal condition of TzName_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeTzName001', 0, async (done: Function) => {
      expect(time1.TzName_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_TZNAME_0200
     * @tc.name       : testMuslTimeTzName002
     * @tc.desc       : test the normal condition of TzName_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTimeTzName002', 0, async (done: Function) => {
      expect(time1.TzName_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_UTIMES_0100
     * @tc.name       : testMuslTimeUtimes001
     * @tc.desc       : test the normal condition of Utimes_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeUtimes001', 0, async (done: Function) => {
      expect(time1.Utimes_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_UTIMES_0200
     * @tc.name       : testMuslTimeUtimes002
     * @tc.desc       : test the abnormal condition of Utimes_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeUtimes002', 0, async (done: Function) => {
      expect(time1.Utimes_Two()).assertEqual(1);
      done()
    });

  })
}