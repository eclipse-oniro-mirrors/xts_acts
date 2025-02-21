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
import locale from 'liblocalendk.so'

export default function localeNdkTest() {
  describe('MuslLocaleTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_SETLOCALE_0100
     * @tc.name       : testMuslLocaleSetlocale001
     * @tc.desc       : test setlocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLocaleSetlocale001', 0, async (done: Function) => {
      let b = "C.UTF-8"
      let a: string = locale.setlocale();
      expect(a).assertEqual(b);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_USELOCALE_0100
     * @tc.name       : testMuslLocaleUselocale001
     * @tc.desc       : test uselocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLocaleUselocale001', 0, async (done: Function) => {
      let b = 0;
      let uselocaleResult: number = locale.uselocale(b);
      console.info("Test uselocaleResult = " + uselocaleResult);
      expect(uselocaleResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_USELOCALE_0200
     * @tc.name       : testMuslLocaleUselocale002
     * @tc.desc       : test uselocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLocaleUselocale002', 0, async (done: Function) => {
      let b = 1;
      let uselocaleResult: number = locale.uselocale(b);
      console.info("Test uselocaleResult = " + uselocaleResult);
      expect(uselocaleResult).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_DUPLOCALE_0100
     * @tc.name       : testMuslLocaleDupLocale001
     * @tc.desc       : test duplocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslLocaleDupLocale001', 0, async (done: Function) => {
      expect(locale.duplocale()).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_LOCALECONV_0100
     * @tc.name       : testMuslLocaleLocaleconv001
     * @tc.desc       ：testMuslLocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslLocaleLocaleconv001', 0, async (done: Function) => {
      let result: number = locale.localeconv();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_NEWLOCALE_0100
     * @tc.name       : testMuslLocaleNewlocale001
     * @tc.desc       : test newlocale
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslLocaleNewlocale001', 0, async (done: Function) => {
      let result: number = locale.newlocale();
      expect(result).assertEqual(0)
      done()
    });
    /**
    * @tc.number     : SUB_THIRDPARTY_MUSL_LOCALE_FREELOCALE_0100
    * @tc.name       : testMuslLocaleFreelocale001
    * @tc.desc       : test freelocale
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testMuslLocaleFreelocale001', 0, async (done: Function) => {
      let result: number = locale.freelocale();
      expect(result).assertEqual(0)
      done()
    });
  })
}