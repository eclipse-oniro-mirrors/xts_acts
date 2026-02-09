/*
 * Copyright (C) 2022-2026 Huawei Device Co., Ltd.
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

export default function userAuthTestExecute() {
  describe('userAuthTestExecute', (): void => {
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
     * @tc.name   Security_IAM_Nopermission_API9_Func_static_0104
     * @tc.number Security_IAM_Nopermission_API9_Func_static_0104
     * @tc.desc   Unapplied permission call GetEnrolledState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Security_IAM_Nopermission_API9_Func_static_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, 'testFace Security_IAM_Nopermission_API9_Func_static_0104 start');
      let authType:userAuth.UserAuthType[] = [userAuth.UserAuthType.FACE, userAuth.UserAuthType.FINGERPRINT];
      for (let idx0 = 0; idx0 < authType.length; idx0++) {
        try {
          userAuth.getAvailableStatus(authType[idx0], userAuth.AuthTrustLevel.ATL1);
          hilog.info(domain, tag, format,"Security_IAM_Nopermission_API9_Func_static_0104  success " );
          done()
        } catch (e) {
          hilog.info(domain, tag, format,"Security_IAM_Nopermission_API9_Func_static_0104  fail " + e.code);
          expect((e as BusinessError).code).assertEqual(201);
          done()
        }
      }
    })




  });
};

