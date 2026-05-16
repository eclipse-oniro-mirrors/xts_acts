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

const widgetParam: userAuth.WidgetParam  = {
  title: '请输入密码',
  uiContext: undefined,
};

async function userAuthPromise(...args: (userAuth.AuthParam | userAuth.WidgetParam | string | int)[]): Promise<void> {
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
            expect(result.result == args[3] || result.result == args[4]).assertTrue();
          } catch (e) {
            hilog.info(domain, tag, format, `error is ${e}`);
            expect(null).assertFail();
          } finally {
            resolve(undefined);
          }
        }
      });
      userAuthInstance.start();
      await Utils.msSleep(2000);
    } catch (e: BusinessError) {
      hilog.info(domain, tag, format, `${args[2]} fail ${e.code}`);
      expect(null).assertFail();
      reject({});
    } finally {

    }
  })
}

async function userAuthPromiseFace(...args: (userAuth.AuthParam | userAuth.WidgetParam | string | int)[]): Promise<void> {
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
            expect(result.result == args[3] || result.result == args[4] || result.result == args[5]).assertTrue();
          } catch (e) {
            hilog.info(domain, tag, format, `error is ${e}`);
            expect(null).assertFail();
          } finally {
            resolve(undefined);
          }
        }
      });
      userAuthInstance.start();
      await Utils.msSleep(2000);
    } catch (e: BusinessError) {
      hilog.info(domain, tag, format, `${args[2]} fail ${e.code}`);
      expect(null).assertFail();
      reject({});
    } finally {
    }
  })
}

export default function signNormalAccessBiometricExecute() {
  describe('signNormalAccessBiometricExecute', (): void => {
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
     * @tc.name   Security_IAM_getUserAuthInstance_Func_Static_0043
     * @tc.number Security_IAM_getUserAuthInstance_Func_Static_0043
     * @tc.desc   call any userauth UserAuthResultCode return value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Security_IAM_getUserAuthInstance_Func_Static_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, format, 'Security_IAM_getUserAuthInstance_Func_Static_0043 start');
        const authParams: userAuth.AuthParam[] = [
          authParamDefault,
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authTrustLevel: userAuth.AuthTrustLevel.ATL1,
            authType: [userAuth.UserAuthType.FACE]
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authTrustLevel: userAuth.AuthTrustLevel.ATL1,
            authType: [userAuth.UserAuthType.FINGERPRINT]
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.PIN],
            authTrustLevel: userAuth.AuthTrustLevel.ATL2
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FACE],
            authTrustLevel: userAuth.AuthTrustLevel.ATL2
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FINGERPRINT],
            authTrustLevel: userAuth.AuthTrustLevel.ATL2
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.PIN],
            authTrustLevel: userAuth.AuthTrustLevel.ATL3
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FINGERPRINT],
            authTrustLevel: userAuth.AuthTrustLevel.ATL3
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.PIN],
            authTrustLevel: userAuth.AuthTrustLevel.ATL4
          },
          {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FACE],
            authTrustLevel: userAuth.AuthTrustLevel.ATL3
          }
        ];
        let checkFace = checkSupportOrNot(userAuth.UserAuthType.FACE);
        let checkPin = checkSupportOrNot(userAuth.UserAuthType.PIN);
        let checkFingerprint = checkSupportOrNot(userAuth.UserAuthType.FINGERPRINT);
        if (checkFace == 0 && checkPin == 0 && checkFingerprint == 0) {
          let stepIndex = 1;
          for (let index = 0; index < authParams.length; index++) {
            hilog.info(domain, tag, format,
              `Security_IAM_getUserAuthInstance_Func_Static_0043 authParams: ${JSON.stringify(authParams[index])}`)
            userAuthPromise(authParams[index], widgetParamDefault,
              'Security_IAM_getUserAuthInstance_Func_Static_0043 step' + stepIndex,
              userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
            stepIndex++;
            await Utils.msSleep(2000);
          }

          const notSupportTLParams: userAuth.AuthParam = {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FINGERPRINT],
            authTrustLevel: userAuth.AuthTrustLevel.ATL4
          }
          hilog.info(domain, tag, format,
            `Security_IAM_getUserAuthInstance_Func_Static_0043 authParams: ${JSON.stringify(authParams[0])}`)
          await userAuthPromiseFace(notSupportTLParams, widgetParamDefault,
            'Security_IAM_getUserAuthInstance_Func_Static_0043 step' + stepIndex,
            userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT,
            userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
          stepIndex++;
          await Utils.msSleep(2000);

          const notSupportTLParams1: userAuth.AuthParam = {
            challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
            authType: [userAuth.UserAuthType.FACE],
            authTrustLevel: userAuth.AuthTrustLevel.ATL4
          }
          hilog.info(domain, tag, format,
            `Security_IAM_getUserAuthInstance_Func_Static_0043 authParams: ${JSON.stringify(authParams[0])}`)
          await userAuthPromiseFace(notSupportTLParams1, widgetParamDefault,
            'Security_IAM_getUserAuthInstance_Func_Static_0043 step' + stepIndex,
            userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT,
            userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
          stepIndex++;
          await Utils.msSleep(2000);

          // 补充到60个字符
          let widgetParams:userAuth.WidgetParam[] = [
            {
              title: 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
                'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
                'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
                'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
                'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
                'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghij',
            },
            {
              title: '使用密码验证',
              navigationButtonText: 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij',
            }
          ];

          for (let index = 0; index < widgetParams.length; index++) {
            hilog.info(domain, tag, format,
              `Security_IAM_getUserAuthInstance_Func_Static_0043 widgetParams: ${JSON.stringify(widgetParams[index])}`)
            const authParam: userAuth.AuthParam = {
              challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
              authTrustLevel: userAuth.AuthTrustLevel.ATL1,
              authType: [userAuth.UserAuthType.FACE]
            };
            await userAuthPromise(authParam, widgetParams[index],
              'Security_IAM_getUserAuthInstance_Func_Static_0043 step' + stepIndex,
              userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
            stepIndex++;
            await Utils.msSleep(2000);
          }
        }
        done();
      });



     /**
      * @tc.name   Security_IAM_getUserAuthInstance_Func_Static_0088
      * @tc.number Security_IAM_getUserAuthInstance_Func_Static_0088
      * @tc.desc   call off return value check
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('Security_IAM_getUserAuthInstance_Func_Static_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
       hilog.info(domain, tag, format,"Security_IAM_getUserAuthInstance_Func_Static_0088 start");
       try {
         const userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
         userAuthInstance.offResult({
           onResult:(result:userAuth.UserAuthResult)=>{
           }
         });
         hilog.info(domain, tag, format,`Security_IAM_getUserAuthInstance_Func_Static_0088 step1 success`);
         expect(null).assertFail();
       } catch (e:BusinessError) {
         hilog.info(domain, tag, format,`Security_IAM_getUserAuthInstance_Func_Static_0088 step1 fail ${e.code}`);
         expect(e.code).assertEqual(12500002);
       }
       done();
     });

    /**
     * @tc.name   Security_IAM_getUserAuthInstance_Func_Static_0089
     * @tc.number Security_IAM_getUserAuthInstance_Func_Static_0089
     * @tc.desc   call cancel return value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_getUserAuthInstance_Func_Static_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, format,"Security_IAM_getUserAuthInstance_Func_Static_0089 start");
      try {
        const userAuthInstance:userAuth.UserAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.cancel();
        hilog.info(domain, tag, format,`Security_IAM_getUserAuthInstance_Func_Static_0089 success`);
        expect(null).assertFail();
      } catch (e:BusinessError) {
        hilog.info(domain, tag, format,`Security_IAM_getUserAuthInstance_Func_Static_0089 fail ${e.code}`);
        expect(e.code).assertEqual(12500002);
      }
      done();
    });
  });
};
