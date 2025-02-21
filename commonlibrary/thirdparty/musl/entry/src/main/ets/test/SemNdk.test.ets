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
import sem from 'libsemndk.so'

export default function semNdkTest() {
  describe('MuslSemTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEM_SEMCTL_0100
     * @tc.name       : testMuslSemSemctl001
     * @tc.desc       : test semctl
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSemSemctl001', 0, async (done: Function) => {
      let a = sem.semctl(0);
      expect(a).assertEqual(13);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEM_SEMGET_0100
     * @tc.name       : testMuslSemSemget001
     * @tc.desc       : test semget
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSemSemget001', 0, async (done: Function) => {
      let a = sem.semget();
      expect(a).assertEqual(-1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEM_SEMOP_0100
     * @tc.name       : testMuslSemSemop001
     * @tc.desc       : test semop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSemSemop001', 0, async (done: Function) => {
      let a: number = sem.semop();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SEM_SEMTIMEDOP_0100
     * @tc.name       : testMuslSemSemtimedop001
     * @tc.desc       : test semtimedop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSemSemtimedop001', 0, async (done: Function) => {
      let a: number = sem.semtimedop();
      expect(a).assertEqual(0);
      done()
    });
    
  })
}