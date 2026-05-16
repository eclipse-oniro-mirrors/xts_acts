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
import timerfd from 'libtimerfdndk.so'

export default function timerfdNdkTest() {
  describe('MuslTimerfdTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslTimerfdTimerfdCreate001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDCREATE_0100
     * @tc.desc   test timerfd_create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimerfdTimerfdCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_create(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslTimerfdTimerfdGettime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDGETTIME_0100
     * @tc.desc   test timerfd_gettime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimerfdTimerfdGettime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_gettime(a);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.name   testMuslTimerfdTimerfdSettime001
     * @tc.number SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDSETTIME_0100
     * @tc.desc   test timerfd_settime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslTimerfdTimerfdSettime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_settime(a);
      expect(c).assertEqual(0);
      done()
    });
  })
}
