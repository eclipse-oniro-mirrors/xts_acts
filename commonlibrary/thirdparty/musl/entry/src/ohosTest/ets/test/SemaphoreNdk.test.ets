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
import semaphore from 'libsemaphorendk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'


export default function semaphoreNdkTest() {

  describe('MuslSemaphoreTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMGETVALUE_0100
     * @tc.name       : testMuslSemaphoreSemGetvalue001
     * @tc.desc       : test sem_getvalue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemGetvalue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number= semaphore.sem_getvalue(testParam);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMOPEN_0100
     * @tc.name       : testMuslSemaphoreSemOpen001
     * @tc.desc       : test sem_open
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number= semaphore.sem_open(1);
      expect(result).assertEqual(-1000);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMINIT_0100
     * @tc.name       : testMuslSemaphoreSemInit001
     * @tc.desc       : test sem_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 0
      let result:number= semaphore.sem_init(testParam);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMINIT_0200
     * @tc.name       : testMuslSemaphoreSemInit002
     * @tc.desc       : test sem_init
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemInit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = -1
      let result:number= semaphore.sem_init(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMDESTROY_0100
     * @tc.name       : testMuslSemaphoreSemDestroy001
     * @tc.desc       : test sem_destroy
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let result:number= semaphore.sem_destroy();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMPOST_0100
     * @tc.name       : testMuslSemaphoreSemPost001
     * @tc.desc       : test sem_post
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemPost001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number= semaphore.sem_post();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMWAIT_0100
     * @tc.name       : testMuslSemaphoreSemWait001
     * @tc.desc       : test sem_wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testMuslSemaphoreSemWait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number= semaphore.sem_wait(testParam);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTRYWAIT_0100
     * @tc.name       : testMuslSemaphoreSemTrywait001
     * @tc.desc       : test sem_trywait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTrywait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 0
      let result:number= semaphore.sem_trywait(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTRYWAIT_0200
     * @tc.name       : testMuslSemaphoreSemTrywait002
     * @tc.desc       : test sem_trywait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTrywait002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number= semaphore.sem_trywait(testParam);
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTIMEDWAIT_0100
     * @tc.name       : testMuslSemaphoreSemTimedwait001
     * @tc.desc       : test sem_timedwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTimedwait001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 0
      let result:number= semaphore.sem_timedwait(testParam);
      expect(result).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMTIMEDWAIT_0200
     * @tc.name       : testMuslSemaphoreSemTimedwait002
     * @tc.desc       : test sem_timedwait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemTimedwait002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let testParam = 1
      let result:number= semaphore.sem_timedwait(testParam);
      expect(result).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMCLOSE_0100
     * @tc.name       : testMuslSemaphoreSemClose001
     * @tc.desc       : test sem_close
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslSemaphoreSemClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a : number = semaphore.sem_close();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEMAPHORE_SEMUNLINK_0100
     * @tc.name       : testMuslSemaphoreSemUnlink001
     * @tc.desc       : test sem_unlink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    //block
  })
}