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
import libgen from 'liblibgenndk.so'

export default function libgenNdkTest() {
  describe('MuslLibgenTest', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LIBGEN_BASENAME_0100
     * @tc.name       : testMuslLibgenBasename001
     * @tc.desc       : test basename
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslLibgenBasename001', 0, async (done: Function) => {
      let resultTrue = 1;
      let result: number = libgen.basename();
      expect(result).assertEqual(resultTrue);
      done()
    });

  })
}