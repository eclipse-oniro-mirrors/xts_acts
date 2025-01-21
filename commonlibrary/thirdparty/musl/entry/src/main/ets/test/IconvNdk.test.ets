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
import iconv from 'libiconvndk.so'

export default function muslIconvNdkTest() {
  describe('MuslIconvTest', () => {

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_ICONV_ICONV_0100
     * @tc.name     : testMuslIconvIconv001
     * @tc.desc     : test iconv
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIconvIconv001', 0, async (done: Function) => {
      let result: number = iconv.iconv();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_ICONV_ICONV_OPEN_0100
     * @tc.name     : testMuslIconvIconvOpen001
     * @tc.desc     : test iconv_open
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIconvIconvOpen001', 0, async (done: Function) => {
      let result: number = iconv.iconvOpen();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_ICONV_ICONV_CLOSE_0100
     * @tc.name     : testMuslIconvIconvClose001
     * @tc.desc     : test iconv_close
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIconvIconvClose001', 0, async (done: Function) => {
      let result: number = iconv.iconvClose();
      expect(result).assertEqual(0)
      done()
    });
  })
}