/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect } from "@ohos/hypium"
import swapndk from 'libswapndk.so'

export default function swapNdkTest() {
  describe('SwapNdkTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SWAP_SWAPON_0100
     * @tc.name       : testMuslSwapSwapOn001
     * @tc.desc       : test swapon
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSwapSwapOn001', 0, async (done: Function) => {
      expect(swapndk.swapon()).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_SWAP_SWAPOFF_0100
     * @tc.name       : testMuslSwapSwapOff001
     * @tc.desc       : test swapoff
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslSwapSwapOff001', 0, async (done: Function) => {
      expect(swapndk.swapoff()).assertEqual(0);
      done()
    });

  })
}
