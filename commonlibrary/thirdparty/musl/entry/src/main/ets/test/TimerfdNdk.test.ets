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
import timerfd from 'libtimerfdndk.so'

export default function timerfdNdkTest() {
  describe('MuslTimerfdTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDCREATE_0100
     * @tc.name       : testMuslTimerfdTimerfdCreate001
     * @tc.desc       : test timerfd_create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimerfdTimerfdCreate001', 0, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_create(a);
      expect(c).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDGETTIME_0100
     * @tc.name       : testMuslTimerfdTimerfdGettime001
     * @tc.desc       : test timerfd_gettime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimerfdTimerfdGettime001', 0, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_gettime(a);
      expect(c).assertEqual(-1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TIMERFD_TIMERFDSETTIME_0100
     * @tc.name       : testMuslTimerfdTimerfdSettime001
     * @tc.desc       : test timerfd_settime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslTimerfdTimerfdSettime001', 0, async (done: Function) => {
      let a = 1;
      let c: number = timerfd.timerfd_settime(a);
      expect(c).assertEqual(0);
      done()
    });
  })
}
