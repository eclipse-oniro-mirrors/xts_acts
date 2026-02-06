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
import sem from 'libsemndk.so'

export default function semNdkTest() {
  describe('MuslSemTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslSemSemctl001
     * @tc.number SUB_THIRDPARTY_MUSL_SEM_SEMCTL_0100
     * @tc.desc   test semctl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSemSemctl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = sem.semctl(0);
      expect(a).assertEqual(13);
      done()
    });

    /**
     * @tc.name   testMuslSemSemget001
     * @tc.number SUB_THIRDPARTY_MUSL_SEM_SEMGET_0100
     * @tc.desc   test semget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSemSemget001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a = sem.semget();
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.name   testMuslSemSemop001
     * @tc.number SUB_THIRDPARTY_MUSL_SEM_SEMOP_0100
     * @tc.desc   test semop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSemSemop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = sem.semop();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslSemSemtimedop001
     * @tc.number SUB_THIRDPARTY_MUSL_SEM_SEMTIMEDOP_0100
     * @tc.desc   test semtimedop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslSemSemtimedop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = sem.semtimedop();
      expect(a).assertEqual(0);
      done()
    });
    
  })
}