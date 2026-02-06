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
import uchar from 'libucharndk.so'

export default function ucharNdkTest() {
  describe('MuslUcharTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UCHAR_C16RTOMB_0100
     * @tc.name       : testMuslUcharC16rtomb001
     * @tc.desc       : test c16rtomb
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUcharC16rtomb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = uchar.c16rtomb();
      expect(result).assertEqual(resultTrue);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UCHAR_C32RTOMB_0100
     * @tc.name       : testMuslUcharC32rtomb001
     * @tc.desc       : test c32rtomb
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUcharC32rtomb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let resultTrue = 1;
      let result: number = uchar.c32rtomb();
      expect(result).assertEqual(resultTrue);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UCHAR_MBRTOC16_0100
     * @tc.name     : testMuslUcharMbrtoc16001
     * @tc.desc     : test mbrtoc16
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUcharMbrtoc16001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = uchar.mbrtoc16();
      expect(result).assertEqual(1)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_UCHAR_MBRTOC32_0100
     * @tc.name     : testMuslUcharMbrtoc32001
     * @tc.desc     : test mbrtoc32
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslUcharMbrtoc32001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: number = uchar.mbrtoc32();
      expect(result).assertEqual(1)
      done()
    });
  })
}