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
import termios from 'libtermiosndk1.so'

export default function termiosNdk1Test() {
  describe('MuslTermios1Test', () => {
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_TERMIOS_CFGETOSPEDD_0100
     * @tc.name       : testMuslTermiosCfgetospeed001
     * @tc.desc       : test cfgetospeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslTermiosCfgetospeed001', 0, async (done: Function) => {
      let result: number = termios.cfgetospeed();
      expect(result).assertEqual(0);
      done()
    });
  })
}
