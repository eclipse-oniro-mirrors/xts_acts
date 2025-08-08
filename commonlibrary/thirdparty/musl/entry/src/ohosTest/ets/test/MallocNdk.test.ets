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
import malloc from 'libmallocndk.so'

export default function mallocNdkTest() {
  describe('MuslMallocTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MALLOC_MALLOC_0100
     * @tc.name       : testMuslMallocMalloc001
     * @tc.desc       : test malloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMallocMalloc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let a: number = malloc.malloc();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MALLOC_MEMALIGN_0100
     * @tc.name       : testMuslMallocMemalign001
     * @tc.desc       : test memalign
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMallocMemalign001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let b = 0
      let a: number = malloc.memalign();
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MALLOC_MALLOCUSABLESIZE_0100
     * @tc.name       : testMuslMallocMallocUsableSize001
     * @tc.desc       : test malloc_usable_size
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslMallocMallocUsableSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = malloc.mallocUsableSize();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MALLOC_MALLOPT_0100
     * @tc.name       : testMuslMallocMallopt001
     * @tc.desc       : test mallopt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMallocMallopt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let a: number = malloc.mallopt();
      expect(a).assertEqual(0);
      done()
    });

  })
}