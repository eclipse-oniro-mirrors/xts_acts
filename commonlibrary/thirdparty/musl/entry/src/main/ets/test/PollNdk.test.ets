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
import poll from 'libpollndk.so'

export default function pollNdkTest() {
  describe('MuslPollTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_POLL_POLL_0100
     * @tc.name       : testMuslPollPoll001
     * @tc.desc       : test poll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPollPoll001', 0, async (done: Function) => {
      let data: number = poll.poll();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_POLL_PPOLL_0100
     * @tc.name       : testMuslPollPpoll001
     * @tc.desc       : test ppoll
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testMuslPollPpoll001', 0, async (done: Function) => {
      let data: number = poll.ppoll();
      console.info("Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_POLL_POLLCHK_0100
     * @tc.name       : testMuslPollPollchk001
     * @tc.desc       : test pollchk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPollPollchk001', 0, async (done: Function) => {
      let result: number = poll.pollchk();
      expect(result).assertEqual(1);
      done();
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_POLL_PPOLLCHK_0100
     * @tc.name       : testMuslPollPpollchk001
     * @tc.desc       : test ppollchk
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPollPpollchk001', 0, async (done: Function) => {
      let result: number = poll.ppollchk();
      expect(result).assertEqual(1);
      done();
    });
  })
}
