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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import timex1 from 'libtimexndk1.so'

export default function timexNdk1Test() {
  describe('MuslTimex1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMEX_ADJTIMEX_TIME64_0100
     * @tc.name       : testMuslTimexAdjtimexTime64001
     * @tc.desc       : test the normal condition of AdjTimex_time64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimexAdjtimexTime64001', 0, async (done: Function) => {
      expect(timex1.AdjTimex_time64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMEX_ADJTIMEX_TIME64_0200
     * @tc.name       : testMuslTimexAdjtimexTime64002
     * @tc.desc       : test the abnormal condition of AdjTimex_time64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimexAdjtimexTime64002', 0, async (done: Function) => {
      expect(timex1.AdjTimex_time64_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMEX_ADJTIMEX_0100
     * @tc.name       : testMuslTimexAdjtimex001
     * @tc.desc       : test the normal condition of AdjTimex_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimexAdjtimex001', 0, async (done: Function) => {
      expect(timex1.AdjTimex_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMEX_ADJTIMEX_0200
     * @tc.name       : testMuslTimexAdjtimex002
     * @tc.desc       : test the abnormal condition of AdjTimex_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimexAdjtimex002', 0, async (done: Function) => {
      expect(timex1.AdjTimex_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_ADJTIME64_0100
     * @tc.name       : testMuslTimeClockAdjtime64001
     * @tc.desc       : test the normal condition of Clock_adjTime64_One
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockAdjtime64001', 0, async (done: Function) => {
      expect(timex1.Clock_adjTime64_One()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_ADJTIME64_0200
     * @tc.name       : testMuslTimeClockAdjtime64002
     * @tc.desc       : test the abnormal condition of Clock_adjTime64_Two
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockAdjtime64002', 0, async (done: Function) => {
      expect(timex1.Clock_adjTime64_Two()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_ADJTIME64_0300
     * @tc.name       : testMuslTimeClockAdjtime64003
     * @tc.desc       : test the abnormal condition of Clock_adjTime64_Three
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockAdjtime64003', 0, async (done: Function) => {
     expect(timex1.Clock_adjTime64_Three()).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIME_CLOCK_ADJTIME64_0400
     * @tc.name       : testMuslTimeClockAdjtime64004
     * @tc.desc       : test the abnormal condition of Clock_adjTime64_Four
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimeClockAdjtime64004', 0, async (done: Function) => {
      expect(timex1.Clock_adjTime64_Four()).assertEqual(1);
      done()
    });

  })
}
