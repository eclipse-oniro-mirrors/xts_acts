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
import fenvndk from 'libfenvndk.so'

export default function fenvNdkTest() {
  describe('FenvNdkTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FETESTEXCEPT_0100
     * @tc.name       : testMuslFEnvFeTestExcept001
     * @tc.desc       : test fetestexcept
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeTestExcept001', 0, async (done: Function) => {
      let a = 0;
      let data: number = fenvndk.fetestexcept(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FEUPDATEENV_0100
     * @tc.name       : testMuslFEnvFeUpdateEnv001
     * @tc.desc       : test feupdateenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeUpdateEnv001', 0, async (done: Function) => {
      let data: number = fenvndk.feupdateenv();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FESETROUND_0100
     * @tc.name       : testMuslFEnvFeSetRound001
     * @tc.desc       : test fesetround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeSetRound001', 0, async (done: Function) => {
      let a = 0x800000;
      let data: number = fenvndk.fesetround(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FESETEXCEPTFLAG_0100
     * @tc.name       : testMuslFEnvFeSetExceptFlag001
     * @tc.desc       : test fesetexceptflag
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeSetExceptFlag001', 0, async (done: Function) => {
      let a = 1;
      let data: number = fenvndk.fesetexceptflag(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FESETENV_0100
     * @tc.name       : testMuslFEnvFeSetEnv001
     * @tc.desc       : test fesetenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeSetEnv001', 0, async (done: Function) => {
      let data: number = fenvndk.fesetenv();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FERAISEEXCEPT_0100
     * @tc.name       : testMuslFEnvFeRaiseExcept001
     * @tc.desc       : test feraiseexcept
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeRaiseExcept001', 0, async (done: Function) => {
      let a = 1;
      let data: number = fenvndk.feraiseexcept(a);
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FEHOLDEXCEPT_0100
     * @tc.name       : testMuslFEnvFeHoldExcept001
     * @tc.desc       : test feholdexcept
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeHoldExcept001', 0, async (done: Function) => {
      let data: number = fenvndk.feholdexcept();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FEGETROUND_0100
     * @tc.name       : testMuslFEnvFeGetRound001
     * @tc.desc       : test fegetround
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeGetRound001', 0, async (done: Function) => {
      let data: number = fenvndk.fegetround();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FEGETEENV_0100
     * @tc.name       : testMuslFEnvFeGetEnv001
     * @tc.desc       : test fegetenv
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeGetEnv001', 0, async (done: Function) => {
      let data: number = fenvndk.fegetenv();
      expect(data).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_FENV_FECLEAREXCEPT_0100
     * @tc.name       : testMuslFEnvFeClearExcept001
     * @tc.desc       : test feclearexcept
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslFEnvFeClearExcept001', 0, async (done: Function) => {
      let a = 0;
      let data: number = fenvndk.feclearexcept(a);
      expect(data).assertEqual(0);
      done()
    });

  })
}
