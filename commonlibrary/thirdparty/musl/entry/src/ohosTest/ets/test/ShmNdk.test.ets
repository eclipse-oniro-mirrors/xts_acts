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
import shm from 'libshmndk.so'

export default function shmNdkTest() {
  describe('MuslShmTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslShmShmget001
     * @tc.number SUB_THIRDPARTY_MUSL_SHM_SHMGET_0100
     * @tc.desc   test shmget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslShmShmget001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a : number = shm.shmget();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslShmShmctl001
     * @tc.number SUB_THIRDPARTY_MUSL_SHM_SHMCTL_0100
     * @tc.desc   test shmctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslShmShmctl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a : number = shm.shmctl();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslShmShmat001
     * @tc.number SUB_THIRDPARTY_MUSL_SHM_SHMAT_0100
     * @tc.desc   test shmat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslShmShmat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a : number = shm.shmat();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslShmShmdt001
     * @tc.number SUB_THIRDPARTY_MUSL_SHM_SHMDT_0100
     * @tc.desc   test shmdt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslShmShmdt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a : number = shm.shmdt();
      expect(a).assertEqual(0);
      done()
    });
  })
}