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
    } catch (e) {
      hilog.info(domain, tag, format, `${args[2]} fail ${e.code}`);
      expect(null).assertFail();
      reject({});
    } finally {
    }
  })
}

export default function userauthTest_API12() {
  describe('userauthTest_API12', (): void => {
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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.myapplication102.static");
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   SUB_Security_IAM_Func_API12_Static_0100
     * @tc.number SUB_Security_IAM_Func_API12_Static_0100
     * @tc.desc   GetEnrolledState parameter validity check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_IAM_Func_API12_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,'testFace SUB_Security_IAM_Func_API12_Static_0100 start');
      if (!checkSupportOrNot(userAuth.UserAuthType.FACE)){
        try {
          let EnrolledState:userAuth.EnrolledState = userAuth.getEnrolledState(userAuth.UserAuthType.FACE);
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialDigest:' + EnrolledState.credentialDigest)
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialCount:' + EnrolledState.credentialCount)
        } catch (e) {
          hilog.info(domain, tag, format,"SUB_Security_IAM_Func_API12_Static_0100 fail " + 'FACE' + 'e.code:' + e.code);
          expect(''+(e as BusinessError).code).assertEqual(''+userAuth.UserAuthResultCode.NOT_ENROLLED);
        }
      }
      if (!checkSupportOrNot(userAuth.UserAuthType.FINGERPRINT)){
        try {
          let EnrolledState:userAuth.EnrolledState = userAuth.getEnrolledState(userAuth.UserAuthType.FINGERPRINT);
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialDigest:' + EnrolledState.credentialDigest)
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialCount:' + EnrolledState.credentialCount)
        } catch (e) {
          hilog.info(domain, tag, format,"SUB_Security_IAM_Func_API12_Static_0100 fail " + 'FINGERPRINT' +  'e.code:' + e.code);
          expect(''+(e as BusinessError).code).assertEqual(''+userAuth.UserAuthResultCode.NOT_ENROLLED);
        }
      }
      if (!checkSupportOrNot(userAuth.UserAuthType.PIN)){
        try {
          let EnrolledState:userAuth.EnrolledState = userAuth.getEnrolledState(userAuth.UserAuthType.PIN);
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialDigest:' + EnrolledState.credentialDigest)
          hilog.info(domain, tag, format,'SUB_Security_IAM_Func_API12_Static_0100 EnrolledState.credentialCount:' + EnrolledState.credentialCount)
        } catch (e) {
          hilog.info(domain, tag, format,"SUB_Security_IAM_Func_API12_Static_0100 fail " + 'PIN' + 'e.code:' + e.code);
          expect(''+(e as BusinessError).code).assertEqual(''+userAuth.UserAuthResultCode.NOT_ENROLLED);
        }
      }
      done();
    })
    /**
     * @tc.name   SUB_Security_IAM_authWidget_API_Static_0120
     * @tc.number SUB_Security_IAM_authWidget_API_Static_0120
     * @tc.desc   ReuseUnlockResultDuration: 120000. ReuseUnlockResultMode: 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_IAM_authWidget_API_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,"SUB_Security_IAM_authWidget_API_Static_0120 start");
      let reuseUnlockResult:userAuth.ReuseUnlockResult = {
        reuseMode: userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT,
        reuseDuration: 120000,
      }
      const authParam: userAuth.AuthParam = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
        reuseUnlockResult: reuseUnlockResult,
      };
      const widgetParam:userAuth.WidgetParam = {
        title: '请输入密码',
      };
      let stepIndex:number = 1
      await userAuthPromise(authParam, widgetParam,
        'SUB_Security_IAM_authWidget_API_Static_0120 step' + stepIndex, 12500010);
      done();
    });

    /**
     * @tc.name   SUB_Security_IAM_authWidget_API_Static_0140
     * @tc.number SUB_Security_IAM_authWidget_API_Static_0140
     * @tc.desc   reuseUnlockResultMode Parameter transmission test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_IAM_authWidget_API_Static_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,"SUB_Security_IAM_authWidget_API_Static_0140 start");
      let checkFace = checkSupportOrNot(userAuth.UserAuthType.FACE);
      if (checkFace == 0) {
        let reuseMode:userAuth.ReuseMode[] = [userAuth.ReuseMode.AUTH_TYPE_RELEVANT, userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT, userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_RELEVANT, userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_IRRELEVANT];
        const widgetParam:userAuth.WidgetParam = {
          title: '请输入密码',
        };
        for (let idx0 = 0; idx0 <reuseMode.length; idx0++){
          let reuseUnlockResult1:userAuth.ReuseUnlockResult = {
            reuseMode: reuseMode[idx0],
            reuseDuration: 120000,
          }
          const authParam1: userAuth.AuthParam = {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.PIN],
            authTrustLevel: userAuth.AuthTrustLevel.ATL1,
            reuseUnlockResult: reuseUnlockResult1,
          };
          let stepIndex:number = 1
          await userAuthPromise(authParam1, widgetParam,
            'SUB_Security_IAM_authWidget_API_Static_0140 step' + stepIndex, 12500010);
          stepIndex++;
        }
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_IAM_authWidget_API_Static_0130
     * @tc.number SUB_Security_IAM_authWidget_API_Static_0130
     * @tc.desc   reuseUnlockResultDuration Parameter transmission test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_IAM_authWidget_API_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format, "SUB_Security_IAM_authWidget_API_Static_0130 start");
      let reuseDuration1:int[] = [-1, 300001, 0];
      let reuseDuration2:int[] = [1, 5, userAuth.MAX_ALLOWABLE_REUSE_DURATION];
      const widgetParam:userAuth.WidgetParam = {
        title: '请输入密码',
      };
      for (let idx0 = 0; idx0 <reuseDuration1.length; idx0++){
        let reuseUnlockResult:userAuth.ReuseUnlockResult = {
          reuseMode: userAuth.ReuseMode.AUTH_TYPE_RELEVANT,
          reuseDuration: reuseDuration1[idx0],
        }
        const authParam:userAuth.AuthParam = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult,
        };

        try {
          let userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
          userAuthInstance.onResult({
            onResult :(result:userAuth.UserAuthResult) => {
              hilog.info(domain, tag, format, 'userAuthInstance callback result = ' + JSON.stringify(result));
            }
          });
          expect(null).assertFail();
        }catch (error) {
          hilog.info(domain, tag, format, 'SUB_Security_IAM_authWidget_API_Static_0130 catch error: ' + JSON.stringify(error));
          hilog.info(domain, tag, format, 'SUB_Security_IAM_authWidget_API_Static_0130 error.code: ' + error.code);
          expect((error as BusinessError).code).assertEqual(401);
        }
      }

      let stepIndex:number = 1
      for (let idx0 = 0; idx0 <reuseDuration2.length; idx0++){
        let reuseUnlockResult1:userAuth.ReuseUnlockResult = {
          reuseMode: userAuth.ReuseMode.AUTH_TYPE_RELEVANT,
          reuseDuration: reuseDuration2[idx0],
        }
        const authParam1:userAuth.AuthParam = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult1,
        };

        await userAuthPromise(authParam1, widgetParam,
          'SUB_Security_IAM_authWidget_API_Static_0130 step' + stepIndex, 12500010);
        stepIndex++;
      }
      done();
    });
  });
};
