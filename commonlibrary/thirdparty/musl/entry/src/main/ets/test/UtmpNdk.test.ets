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
import utmp from 'libutmpndk.so'

export default function utmpNdkTest() {
  describe('MuslUtmpTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_SETUTENT_0100
     * @tc.name       : testMuslUtmpSetutent001
     * @tc.desc       : test setutent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUtmpSetutent001', 0, async (done: Function) => {
      let a: number = utmp.setutent();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_PUTUTLINE_0100
     * @tc.name       : testMuslUtmpPututline001
     * @tc.desc       : test pututline
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUtmpPututline001', 0, async (done: Function) => {
      let a: number = utmp.pututline();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_GETUTENT_0100
     * @tc.name       : testMuslUtmpGetutent001
     * @tc.desc       : test getutent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUtmpGetutent001', 0, async (done: Function) => {
      let a: number = utmp.getutent();
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_LOGIN_TTY_0100
     * @tc.name       : testMuslUtmpLoginTty001
     * @tc.desc       : test login_tty
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUtmpLoginTty001', 0, async (done: Function) => {
      let a: number = utmp.loginTty();
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_UTMP_UTMPNAME_0100
     * @tc.name       : testMuslUtmpUtmpname001
     * @tc.desc       : test utmpname
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslUtmpUtmpname001', 0, async (done: Function) => {
      let a: number = utmp.utmpname();
      expect(a).assertEqual(0);
      done()
    });
  })
}