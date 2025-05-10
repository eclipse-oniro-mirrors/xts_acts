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
import fnmatchndk1 from 'libfnmatchndk1.so'

export default function fnmatchNdk1Test() {
  describe('FnMatchNdk1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_TIMEDWAIT_TIME64_0100
     * @tc.name       : testMuslThreadsCndTimedWaitTime64001
     * @tc.desc       : test __cnd_timedwait_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndTimedWaitTime64001', 0, async (done: Function) => {
      expect(fnmatchndk1.__cnd_timedwait_time64_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_THREADS_CND_TIMEDWAIT_TIME64_0200
     * @tc.name       : testMuslThreadsCndTimedWaitTime64002
     * @tc.desc       : test __cnd_timedwait_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslThreadsCndTimedWaitTime64002', 0, async (done: Function) => {
      expect(fnmatchndk1.__cnd_timedwait_time64_Two()).assertEqual(4);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAIT4_TIME64_0100
     * @tc.name       : testMuslWaitWait4Time64001
     * @tc.desc       : test __wait4_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWaitWait4Time64001', 0, async (done: Function) => {
      expect(fnmatchndk1.__wait4_time64_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_WAIT_WAIT4_TIME64_0200
     * @tc.name       : testMuslWaitWait4Time64002
     * @tc.desc       : test __wait4_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslWaitWait4Time64002', 0, async (done: Function) => {
      expect(fnmatchndk1.__wait4_time64_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_TIMEDWAIT_TIME64_0100
     * @tc.name       : testMuslPthreadPthreadCondTimedWait64001
     * @tc.desc       : test __pthread_cond_timedwait_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPthreadPthreadCondTimedWait64001', 0, async (done: Function) => {
      expect(fnmatchndk1.__pthread_cond_timedwait_time64_One()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PTHREAD_PTHREAD_COND_TIMEDWAIT_TIME64_0200
     * @tc.name       : testMuslPthreadPthreadCondTimedWait64002
     * @tc.desc       : test __pthread_cond_timedwait_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPthreadPthreadCondTimedWait64002', 0, async (done: Function) => {
      expect(fnmatchndk1.__pthread_cond_timedwait_time64_Two()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEM_TIMEDWAIT_TIME64_0100
     * @tc.name       : testMuslSemaphoreSemTimedWaitTime64001
     * @tc.desc       : test __sem_timedwait_time64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSemaphoreSemTimedWaitTime64001', 0, async (done: Function) => {
      expect(fnmatchndk1.__sem_timedwait_time64()).assertEqual(0);
      done()
    });
  })
}
