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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import pwd from 'libpwdndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function pwdNdkTest() {
  describe('MuslPwdTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PWD_SETPWENT_0100
     * @tc.name       : testMuslPwdSetpwent001
     * @tc.desc       : test setpwent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPwdSetpwent001', 0, async (done: Function) => {
      let result:number = pwd.setpwent();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_PWD_ENDPWENT_0100
     * @tc.name       : testMuslPwdEndPWent001
     * @tc.desc       : test endpwent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testMuslPwdEndPWent001', 0, async (done: Function) => {
      expect(pwd.endpwent()).assertEqual(0);
      done()
    });
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_PWD_GETPWENT_0100
     * @tc.name     : testMuslPwdGetpwent001
     * @tc.desc     : test getpwent
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslPwdGetpwent001', 0, async (done: Function) => {
      let result:number = pwd.getpwent();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_PWD_GETPWNAM_0100
     * @tc.name     : testMuslPwdGetpwnam001
     * @tc.desc     : test getpwnam
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslPwdGetpwnam001', 0, async (done: Function) => {
      let result:number = pwd.getpwnam();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_PWD_GETPWNAM_R_0100
     * @tc.name     : testMuslPwdGetpwnamR001
     * @tc.desc     : test getpwnam_r
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslPwdGetpwnamR001', 0, async (done: Function) => {
      let result:number = pwd.getpwnamR();
      expect(result).assertEqual(0)
      done()
    });


    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_PWD_GETPWUID_0100
     * @tc.name     : testMuslPwdGetpwuid001
     * @tc.desc     : test getpwuid
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslPwdGetpwuid001', 0, async (done: Function) => {
      let result:number = pwd.getpwuid();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_PWD_GETPWUID_R_0100
     * @tc.name     : testMuslPwdGetpwuidR001
     * @tc.desc     : test getpwuid_r
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslPwdGetpwuidR001', 0, async (done: Function) => {
      let result:number = pwd.getpwuidR();
      expect(result).assertEqual(0)
      done()
    });
  })
}