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


const authParamDefault: userAuth.AuthParam = {
  challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
  authType: [userAuth.UserAuthType.PIN],
  authTrustLevel: userAuth.AuthTrustLevel.ATL1,
};
const widgetParamDefault: userAuth.WidgetParam = {
  title: '使用密码验证',
};

function userAuthPromise(...args: (userAuth.AuthParam | userAuth.WidgetParam | string | int)[]): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    try {
      const userAuthInstance: userAuth.UserAuthInstance =
        userAuth.getUserAuthInstance(args[0] as userAuth.AuthParam, args[1] as userAuth.WidgetParam);
      userAuthInstance.onResult({
        onResult: (result: userAuth.UserAuthResult) => {
          try {
            hilog.info(domain, tag, format, `${args[2]} onResult ${JSON.stringify(result)}`);
            hilog.info(domain, tag, format, `onResult.token is ${result.token}`);
            hilog.info(domain, tag, format, `onResult.authType is ${result.authType}`);
            hilog.info(domain, tag, format, `onResult.result is ${result.result}`);
            hilog.info(domain, tag, format, `onResult.enrolledState is ${result.enrolledState}`);
            expect(result.result).assertEqual(args[3]);
          } catch (e) {
            hilog.info(domain, tag, format, `error is ${e}`);
            expect(null).assertFail();
          } finally {
            resolve(undefined);
          }
        }
      });
      userAuthInstance.start();
    } catch (e: BusinessError) {
      hilog.info(domain, tag, format, `${args[2]} fail ${e.code}`);
      expect(null).assertFail();
      reject({});
    } finally {
    }
  })
}

export default function signNormalNotAccessBiometricExecute() {
  describe('signNormalNotAccessBiometricExecute', (): void => {
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
     * @tc.name   Security_IAM_UserAuthInstance_Func_static_0042
     * @tc.number Security_IAM_UserAuthInstance_Func_static_0042
     * @tc.desc   userAuthInstance interface not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_UserAuthInstance_Func_static_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0042 start");
      try {
        const userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.onResult({ onResult: (result:userAuth.UserAuthResult) => {} });
        userAuthInstance.offResult({ onResult: (result:userAuth.UserAuthResult) => {} });
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0042 success");
        expect(userAuthInstance).not().assertNull();
      } catch (e:BusinessError) {
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0042 fail " + e.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_IAM_UserAuthInstance_Func_static_0050
     * @tc.number Security_IAM_UserAuthInstance_Func_static_0050
     * @tc.desc   Nopermisson on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_UserAuthInstance_Func_static_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0050 start");
      try {
        const userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.onResult({onResult: (result:userAuth.UserAuthResult) => {
          hilog.info(domain, tag, format, `Security_IAM_UserAuthInstance_Func_static_0050 success ${result.result}` );
          expect(result.result).assertEqual(201);
        } });
        userAuthInstance.start();
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0050 success");
      } catch (e:BusinessError) {
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0050 fail " + e.code);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_IAM_UserAuthInstance_Func_static_0090
     * @tc.number Security_IAM_UserAuthInstance_Func_static_0090
     * @tc.desc   call cancel interface return GENERAL_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_UserAuthInstance_Func_static_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0090 start");
      try {
        const userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.cancel();
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0090 success");
        expect(null).assertFail();
      } catch (e:BusinessError) {
        hilog.info(domain, tag, format, "Security_IAM_UserAuthInstance_Func_static_0090 fail " + e.code);
        expect(''+e.code).assertEqual(''+userAuth.UserAuthResultCode.GENERAL_ERROR);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_IAM_authWidget_API_static_0200
     * @tc.number SUB_Security_IAM_authWidget_API_static_0200
     * @tc.desc   call ReuseMode interface parameter check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_IAM_authWidget_API_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,"SUB_Security_IAM_authWidget_API_static_0200 start");
      expect(''+1).assertEqual(''+userAuth.ReuseMode.AUTH_TYPE_RELEVANT);
      expect(''+2).assertEqual(''+userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT);
      expect(''+3).assertEqual(''+userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_RELEVANT);
      expect(''+4).assertEqual(''+userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_IRRELEVANT);
      hilog.info(domain, tag, format,'SUB_Security_IAM_authWidget_API_static_0200 end');
      done();
    });
  });
};

