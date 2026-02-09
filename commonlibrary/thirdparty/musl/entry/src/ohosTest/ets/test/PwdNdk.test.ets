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
import pwd from 'libpwdndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function pwdNdkTest() {
  describe('MuslPwdTest', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.name   testMuslPwdSetpwent001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_SETPWENT_0100
     * @tc.desc   test setpwent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdSetpwent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.setpwent();
      expect(result).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testMuslPwdEndPWent001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_ENDPWENT_0100
     * @tc.desc   test endpwent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdEndPWent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      expect(pwd.endpwent()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testMuslPwdGetpwent001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_GETPWENT_0100
     * @tc.desc   test getpwent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdGetpwent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.getpwent();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslPwdGetpwnam001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_GETPWNAM_0100
     * @tc.desc   test getpwnam
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdGetpwnam001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.getpwnam();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslPwdGetpwnamR001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_GETPWNAM_R_0100
     * @tc.desc   test getpwnam_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdGetpwnamR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.getpwnamR();
      expect(result).assertEqual(0)
      done()
    });


    /**
     * @tc.name   testMuslPwdGetpwuid001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_GETPWUID_0100
     * @tc.desc   test getpwuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdGetpwuid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.getpwuid();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.name   testMuslPwdGetpwuidR001
     * @tc.number SUB_THIRDPARTY_MUSL_PWD_GETPWUID_R_0100
     * @tc.desc   test getpwuid_r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPwdGetpwuidR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result:number = pwd.getpwuidR();
      expect(result).assertEqual(0)
      done()
    });
  })
}