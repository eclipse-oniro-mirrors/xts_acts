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

import { describe, it, expect, Level } from '@ohos/hypium'
import userAuth from '@ohos.userIAM.userAuth'

const authParamDefault = {
  challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
  authType: [1],
  authTrustLevel: 10000,
};
const widgetParamDefault = {
  title: '使用密码验证',
};

let stepIndex = 1;

export default function signNormalNotAccessBiometricExecute() {
  describe('signNormalNotAccessBiometricExecute', function () {
    function userAuthPromise(...args){
      return new Promise((resolve, reject) => {
        try {
          const userAuthInstance = userAuth.getUserAuthInstance(args[0], args[1]);
          userAuthInstance.on('result', {
            onResult: (onResult) => {
              try {
                console.info(`${args[2]} onResult ${onResult}`);
                console.info('onResult.token is ' + onResult.token);
                console.info('onResult.authType is ' + onResult.authType);
                expect(onResult.result).assertEqual(args[3]);
              } catch (e) {
                console.info('error is ' + e);
                try {
                  expect(null).assertFail();
                } catch (e) {
                  console.info('assert fail');
                }
              } finally {
                resolve();
              }
            }
          });
          userAuthInstance.start();
        } catch (e) {
          console.info(`${args[2]} fail ${e.code}`);
          try {
            expect(null).assertFail();
          } catch (e) {
            console.info('assert fail');
          }
          reject();
        }
      })
    }
    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0042
        * @tc.name      : execute_userAuthInstance_on_off_result
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0042', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0042 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.on("result", { onResult: (result) => {} });
        userAuthInstance.off("result", { onResult: (result) => {} });
        console.info("Security_IAM_UserAuthInstance_Func_0042 success");
        expect(userAuthInstance).not().assertNull();
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0042 fail " + e.code);
        expect(null).assertFail();
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0050
        * @tc.name      : execute_userAuthInstance_start
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0050', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0050 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);     
        userAuthInstance.start();
        console.info("Security_IAM_UserAuthInstance_Func_0050 success");
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0050 fail " + e.code);
        expect(e.code).assertEqual(201);
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0090
        * @tc.name      : execute_userAuthInstance_cancel
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0090', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0090 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.cancel();
        console.info("Security_IAM_UserAuthInstance_Func_0090 success");
        expect(null).assertFail();
      } catch (e) {
        console.info("Security_IAM_UserAuthInstance_Func_0090 fail " + e.code);
        expect(e.code).assertEqual(userAuth.UserAuthResultCode.GENERAL_ERROR);
      }
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0130
        * @tc.name      : reuseUnlockResultDuration Parameter transmission test.
        * @tc.desc      : reuseUnlockResultDuration Parameter transmission test.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0130', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0130 start");
      let reuseDuration1 = [-1, 300001, 0];
      let reuseDuration2 = [1, 5, 300000];
      const widgetParam = {
        title: '请输入密码',
      };
      for (let idx0 = 0; idx0 <reuseDuration1.length; idx0++){
        let reuseUnlockResult = {
          reuseMode: userAuth.ReuseMode.AUTH_TYPE_RELEVANT,
          reuseDuration: reuseDuration1[idx0],
        }
        const authParam = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult,
        };

        try {
          let userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
          userAuthInstance.on('result', {
            onResult (result) {
              console.log('userAuthInstance callback result = ' + JSON.stringify(result));
            }
          });
          expect(null).assertFail();
        } catch (error) {
          console.log('SUB_Security_IAM_authWidget_API_0130 catch error: ' + JSON.stringify(error));
          console.log('SUB_Security_IAM_authWidget_API_0130 error.code: ' + error.code);
          expect(error.code).assertEqual(401);
        }
      }

      
      for (let idx0 = 0; idx0 <reuseDuration2.length; idx0++){
        let reuseUnlockResult1 = {
          reuseMode: userAuth.ReuseMode.AUTH_TYPE_RELEVANT,
          reuseDuration: reuseDuration2[idx0],
        }
        const authParam1 = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult1,
        };
  
        await userAuthPromise(authParam1, widgetParam, 
          'SUB_Security_IAM_authWidget_API_0130 step' + stepIndex, 12500010);
          stepIndex++;
      }
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0150
        * @tc.name      : Excess parameter transfer test.
        * @tc.desc      : Excess parameter transfer test.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0150', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0150 start");
      let reuseUnlockResult = {
        reuseMode: userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT,
        reuseDuration: 120000,
        other: 5555,
      }
      const authParam = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
        reuseUnlockResult: reuseUnlockResult,
      };
      const widgetParam = {
        title: '请输入密码',
      };
      await userAuthPromise(authParam, widgetParam, 
        'SUB_Security_IAM_authWidget_API_0150 step' + stepIndex, 12500010);
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0100
        * @tc.name      : ReuseUnlockResultMode does not transmit.
        * @tc.desc      : ReuseUnlockResultMode does not transmit.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0100', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0100 start");
      let reuseUnlockResult = {
        reuseMode: null,
        reuseDuration: 120000,
      }
      const authParam = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
        reuseUnlockResult: reuseUnlockResult,
      };
      const widgetParam = {
        title: '请输入密码',
      };
      try {
        let userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
        userAuthInstance.on('result', {
          onResult (result) {
            console.log('userAuthInstance callback result = ' + JSON.stringify(result));
          }
        });
        expect(null).assertFail();
      } catch (error) {
        console.log('SUB_Security_IAM_authWidget_API_0100 catch error: ' + JSON.stringify(error));
        console.log('SUB_Security_IAM_authWidget_API_0100 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0120
        * @tc.name      : ReuseUnlockResultDuration: 120000. ReuseUnlockResultMode: 2.
        * @tc.desc      : ReuseUnlockResultDuration: 120000. ReuseUnlockResultMode: 2.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0120', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0120 start");
      let reuseUnlockResult = {
        reuseMode: userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT,
        reuseDuration: 120000,
      }
      const authParam = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
        reuseUnlockResult: reuseUnlockResult,
      };
      const widgetParam = {
        title: '请输入密码',
      };
      await userAuthPromise(authParam, widgetParam, 
        'SUB_Security_IAM_authWidget_API_0120 step' + stepIndex, 12500010);
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0140
        * @tc.name      : reuseUnlockResultMode Parameter transmission test.
        * @tc.desc      : reuseUnlockResultMode Parameter transmission test.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0140', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0140 start");
      let reuseMode1 = [-1, 0, 5];
      let reuseMode2 = [1, 2, 3, 4];
      const widgetParam = {
        title: '请输入密码',
      };
      for (let idx0 = 0; idx0 <reuseMode1.length; idx0++){
        let reuseUnlockResult = {
          reuseMode: reuseMode1[idx0],
          reuseDuration: 120000,
        }
        const authParam = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult,
        };
  
        try {
          let userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
          userAuthInstance.on('result', {
            onResult (result) {
              console.log('userAuthInstance callback result = ' + JSON.stringify(result));
            }
          });
          expect(null).assertFail();
        } catch (error) {
          console.log('SUB_Security_IAM_authWidget_API_0140 catch error: ' + JSON.stringify(error));
          console.log('SUB_Security_IAM_authWidget_API_0140 error.code: ' + error.code);
          expect(error.code).assertEqual(401);
        }
      }

      for (let idx0 = 0; idx0 <reuseMode2.length; idx0++){
        let reuseUnlockResult1 = {
          reuseMode: reuseMode2[idx0],
          reuseDuration: 120000,
        }
        const authParam1 = {
          challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
          authType: [userAuth.UserAuthType.PIN],
          authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          reuseUnlockResult: reuseUnlockResult1,
        };
  
        await userAuthPromise(authParam1, widgetParam, 
          'SUB_Security_IAM_authWidget_API_0140 step' + stepIndex, 12500010);
        stepIndex++;
      }
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0110
        * @tc.name      : reuseUnlockResultDuration does not transmit.
        * @tc.desc      : reuseUnlockResultDuration does not transmit.
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0110', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0110 start");
      let reuseUnlockResult = {
        reuseMode: userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT,
        reuseDuration: null,
      }
      const authParam = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN],
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
        reuseUnlockResult: reuseUnlockResult,
      };
      const widgetParam = {
        title: '请输入密码',
      };
      try {
        let userAuthInstance = userAuth.getUserAuthInstance(authParam, widgetParam);
        userAuthInstance.on('result', {
          onResult (result) {
            console.log('userAuthInstance callback result = ' + JSON.stringify(result));
          }
        });
        expect(null).assertFail();
      } catch (error) {
        console.log('SUB_Security_IAM_authWidget_API_0110 catch error: ' + JSON.stringify(error));
        console.log('SUB_Security_IAM_authWidget_API_0110 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /*
        * @tc.number    : SUB_Security_IAM_authWidget_API_0200
        * @tc.name      : execute_enum_ReuseMode.
        * @tc.desc      : 
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL3
    */
    it('SUB_Security_IAM_authWidget_API_0200', Level.LEVEL2, async function (done) {
      console.info("SUB_Security_IAM_authWidget_API_0200 start");
      expect(1).assertEqual(userAuth.ReuseMode.AUTH_TYPE_RELEVANT);
      expect(2).assertEqual(userAuth.ReuseMode.AUTH_TYPE_IRRELEVANT);
      expect(3).assertEqual(userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_RELEVANT);
      expect(4).assertEqual(userAuth.ReuseMode.CALLER_IRRELEVANT_AUTH_TYPE_IRRELEVANT);
      console.info('SUB_Security_IAM_authWidget_API_0200 end');
      done();
    });
  });
};