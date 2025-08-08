/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

import tsan from 'libentry.so'
import Utils from './Utils'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium";

export default function abilityTest() {

  describe('ActsThirdPartyTsanTest', () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(100)
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(100)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_DATARACE_0100
     * @tc.name       : testTsanDataRace001
     * @tc.desc       : test dataRace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanDataRace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.dataRace();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_DATARACEONVPTR_0100
     * @tc.name       : testTsanDataRaceOnVptr001
     * @tc.desc       : test dataRace on vptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanDataRaceOnVptr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.dataRaceOnVptr();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_USEAFTERFREE_0100
     * @tc.name       : testTsanUseAfterFree001
     * @tc.desc       : test useAfterFree
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanUseAfterFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.heapUseAfterFree();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_USEAFTERFREE_0200
     * @tc.name       : testTsanUseAfterFree002
     * @tc.desc       : test useAfterFree virtual call
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanUseAfterFree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.virtualCallVSFree();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_SIGNALCHECK_0100
     * @tc.name       : testTsanSignalCheck001
     * @tc.desc       : test signalCheck unsafe call inside of asignal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanSignalCheck001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.signalHandlerUnsafe();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_TSAN_SIGNALCHECK_0200
     * @tc.name       : testTsanSignalCheck002
     * @tc.desc       : test signalCheck handler spoils errno
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testTsanSignalCheck002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = tsan.signalHandlerError();
      expect(result).assertEqual(1);
    });

  })
}
