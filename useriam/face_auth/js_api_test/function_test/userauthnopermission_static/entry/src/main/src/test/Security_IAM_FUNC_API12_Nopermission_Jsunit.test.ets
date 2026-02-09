/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';

import userAuth from '@ohos.userIAM.userAuth'
import { checkSupportOrNot } from './utils/commonFunc';

// import { cryptoFramework } from '@ohos.security.cryptoFramework';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let format: string = '%{public}s'
let testAbilityContext:common.UIAbilityContext;

export default function userauthTest_Nopermission_API12() {
  describe('userauthTest_Nopermission_API12', (): void => {
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, tag, '%{public}s', 'onAbilityCreate end');
        },
      }, (err: BusinessError<void> | null) : void => {
        if (err != null ) {
          hilog.info(domain, tag, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.myapplication101.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   SUB_Security_IAM_Func_API12_static_0110
     * @tc.number SUB_Security_IAM_Func_API12_static_0110
     * @tc.desc   Unapplied permission call GetEnrolledState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_IAM_Func_API12_static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'testFace SUB_Security_IAM_Func_API12_static_0110 start');
      let authType:userAuth.UserAuthType = userAuth.UserAuthType.PIN
      try {
        userAuth.getEnrolledState(authType);
      } catch (e:BusinessError) {
        hilog.info(domain, tag, format, "SUB_Security_IAM_Func_API12_static_0110 fail " + 'authType:' + authType + 'e.code:' + e.code);
        expect(e.code).assertEqual(201);
      }
      done();
    })

    /**
     * @tc.name   SUB_Security_IAM_UserAuth_FUNC_Static_0140
     * @tc.number SUB_Security_IAM_UserAuth_FUNC_Static_0140
     * @tc.desc   getAuthLockState Nopermission API12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_UserAuth_FUNC_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'testFace SUB_Security_IAM_UserAuth_FUNC_Static_0140 start');
      let authType:userAuth.UserAuthType = userAuth.UserAuthType.PIN
      try {
        await userAuth.getAuthLockState(authType);
      } catch (error:BusinessError) {
        hilog.info(domain, tag, format, "SUB_Security_IAM_UserAuth_FUNC_Static_0140 fail code is " + 'error.code:' + error.code);
        expect(error.code).assertEqual(201);
      }
      done();
    })

  });
};

