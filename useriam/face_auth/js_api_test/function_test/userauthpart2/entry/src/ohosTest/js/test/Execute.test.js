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
import { checkSupportOrNot } from './utils/commonFunc';

const authParamDefault = {
  challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
  authType: [userAuth.UserAuthType.PIN],
  authTrustLevel: userAuth.AuthTrustLevel.ATL1,
};
const widgetParamDefault = {
  title: '使用密码验证',
};

const widgetParam = {
  title: '请输入密码',
  uiContext: null,
};

export default function signNormalAccessBiometricExecute() {
  describe('signNormalAccessBiometricExecute', function () {
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
                console.info('onResult.result is ' + onResult.result);
                console.info('onResult.enrolledState is ' + onResult.enrolledState);
                expect(onResult.result == args[3] || onResult.result == args[4]).assertTrue();
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

    function userAuthPromiseFace(...args){
      return new Promise((resolve, reject) => {
        try {
          const userAuthInstance = userAuth.getUserAuthInstance(args[0], args[1]);
          userAuthInstance.on('result', {
            onResult: (onResult) => {
              try {
                console.info(`${args[2]} onResult ${onResult}`);
                console.info('onResult.token is ' + onResult.token);
                console.info('onResult.authType is ' + onResult.authType);
                console.info('onResult.result is ' + onResult.result);
                expect(onResult.result == args[3] || onResult.result == args[4] || onResult.result == args[5]).assertTrue();
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
      * @tc.number    : Security_IAM_getUserAuthInstance_Func_0043
      * @tc.name      : execute_getUserAuthInstance_params_onResult_offResult_start_cancel
      * @tc.size      : MediumTest
      * @tc.type      : Function
      * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_getUserAuthInstance_Func_0043', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_getUserAuthInstance_Func_0043 start");
      const authParams = [
        {
          ...authParamDefault
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FACE]
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FINGERPRINT]
        },
        {
          ...authParamDefault,
          authTrustLevel: userAuth.AuthTrustLevel.ATL2
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FACE],
          authTrustLevel: userAuth.AuthTrustLevel.ATL2
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FINGERPRINT],
          authTrustLevel: userAuth.AuthTrustLevel.ATL2
        },
        {
          ...authParamDefault,
          authTrustLevel: userAuth.AuthTrustLevel.ATL3
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FINGERPRINT],
          authTrustLevel: userAuth.AuthTrustLevel.ATL3
        },
        {
          ...authParamDefault,
          authTrustLevel: userAuth.AuthTrustLevel.ATL4
        },
        {
          ...authParamDefault,
          authType: [userAuth.UserAuthType.FACE],
          authTrustLevel: userAuth.AuthTrustLevel.ATL3
        }
      ];
      let checkFace = await checkSupportOrNot(userAuth.UserAuthType.FACE);
      let checkPin = await checkSupportOrNot(userAuth.UserAuthType.PIN);
      let checkFingerprint = await checkSupportOrNot(userAuth.UserAuthType.FINGERPRINT);
      if (checkFace == 0 && checkPin == 0 && checkFingerprint == 0) {
        let stepIndex = 1;
        for (let index = 0; index < authParams.length; index++) {
          console.info("Security_IAM_getUserAuthInstance_Func_0043 authParams: " + JSON.stringify(authParams[index]));
          await userAuthPromise(authParams[index], widgetParamDefault,
                                'Security_IAM_getUserAuthInstance_Func_0043 step' + stepIndex,
                                userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
          stepIndex++;
        }
  
        const notSupportTLParams  = [
          {
            ...authParamDefault,
            authType: [userAuth.UserAuthType.FINGERPRINT],
            authTrustLevel: userAuth.AuthTrustLevel.ATL4
          }
        ];
        console.info("Security_IAM_getUserAuthInstance_Func_0043 authParams: " + JSON.stringify(authParams[0]));
        await userAuthPromiseFace(notSupportTLParams[0], widgetParamDefault,
                              'Security_IAM_getUserAuthInstance_Func_0043 step' + stepIndex,
                              userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT,
                              userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
        stepIndex++;
        const notSupportTLParams1  = [
          {
            ...authParamDefault,
            authType: [userAuth.UserAuthType.FACE],
            authTrustLevel: userAuth.AuthTrustLevel.ATL4
          }
        ];
        console.info("Security_IAM_getUserAuthInstance_Func_0043 authParams: " + JSON.stringify(authParams[0]));
        await userAuthPromiseFace(notSupportTLParams1[0], widgetParamDefault,
                                  'Security_IAM_getUserAuthInstance_Func_0043 step' + stepIndex,
                                  userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT,
                                  userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
        stepIndex++;
        
        // 补充到60个字符
        let widgetParams = [
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
          console.info("Security_IAM_getUserAuthInstance_Func_0043 widgetParams: " + JSON.stringify(widgetParams[index]));
          await userAuthPromise({
                                  ...authParamDefault,
                                  authType: [userAuth.UserAuthType.FACE]
                                }, widgetParams[index],
                                'Security_IAM_getUserAuthInstance_Func_0043 step' + stepIndex,
                                userAuth.UserAuthResultCode.NOT_ENROLLED, userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT);
          stepIndex++;
        }
      }
      
      done();
    });
  
    /*
        * @tc.number    : Security_IAM_getUserAuthInstance_Func_0107
        * @tc.name      : execute_getUserAuthInstance_params
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_getUserAuthInstance_Func_0107', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_getUserAuthInstance_Func_0107 start");
      const authParamWithoutType = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authTrustLevel: userAuth.AuthTrustLevel.ATL1,
      };

      const authParamWithoutTL = {
        challenge: new Uint8Array([49, 49, 49, 49, 49, 49]),
        authType: [userAuth.UserAuthType.PIN]
      };
      
      const authTestParams = [
        {
          authParam: {
            authType: [userAuth.UserAuthType.PIN],
            authTrustLevel: userAuth.AuthTrustLevel.ATL1,
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamDefault,
            challenge: null,
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamDefault,
            challenge: new Uint8Array(['aaa']),
          },
          ret: 0
        },
        {
          authParam: {
            ...authParamWithoutType
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamWithoutType,
            authType: null,
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamWithoutType,
            authType: [5],
          },
          ret: userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT
        },
        {
          authParam: {
            ...authParamWithoutType,
            authType: [-1],
          },
          ret: userAuth.UserAuthResultCode.TYPE_NOT_SUPPORT
        },
        {
          authParam: {
            ...authParamWithoutType,
            authType: ['a']
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamWithoutTL
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamWithoutTL,
            authTrustLevel: null,
          },
          ret: 401
        },
        {
          authParam: {
            ...authParamWithoutTL,
            authTrustLevel: -1,
          },
          ret: userAuth.UserAuthResultCode.TRUST_LEVEL_NOT_SUPPORT
        },
        {
          authParam: {
            ...authParamWithoutTL,
            authTrustLevel: 'a',
          },
          ret: 401
        }        
      ];
      let stepIndex = 1;
      for (let index = 0; index < authTestParams.length; index++) {
        try {
          console.info("Security_IAM_getUserAuthInstance_Func_0107 authTestParams: " + JSON.stringify(authTestParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance(authTestParams[index].authParam, widgetParamDefault);
          console.info(`Security_IAM_getUserAuthInstance_Func_0107 step${stepIndex} success`);
          if (authTestParams[index].ret === 0) {
            expect(userAuthInstance).not().assertNull();
          } else {
            expect(null).assertFail();
          }
        } catch (e) {
          console.info(`Security_IAM_getUserAuthInstance_Func_0107 step${stepIndex} fail ${e.code}`);
          if (authTestParams[index].ret === 0) {
            expect(null).assertFail();
          } else {
            expect(e.code).assertEqual(authTestParams[index].ret);
          }
        }
        stepIndex++;
      }

      const widgetTestParams = [
        {
          widgetParam: {
            title: '使用密码验证',
            navigationButtonText: 1,
            uiContext : undefined
          },
          ret: 401
        },
        {
          widgetParam: {
            title: '使用密码验证',
            navigationButtonText: 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijj',
          },
          ret: 401
        },
        {
          widgetParam: {
            navigationButtonText: '确定',
          },
          ret: 401
        },
        {
          widgetParam: {
            title: null,
            navigationButtonText: '确定',
          },
          ret: 401
        },
        {
          widgetParam: {
            title:'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
            'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
            'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
            'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
            'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij' +
            'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijj',
            navigationButtonText: '确定',
          },
          ret: 401
        },
      ];      
      for (let index = 0; index < widgetTestParams.length; index++) {
        try {
          console.info("Security_IAM_getUserAuthInstance_Func_0107 widgetTestParams: " + JSON.stringify(widgetTestParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance({
                                                                  ...authParamDefault,
                                                                  authType: [userAuth.UserAuthType.FACE]
                                                                }, widgetTestParams[index].widgetParam);
          console.info(`Security_IAM_getUserAuthInstance_Func_0107 step${stepIndex} success`);
          if (widgetTestParams[index].ret === 0) {
            expect(userAuthInstance).not().assertNull();
          } else {
            expect(null).assertFail();
          }
        } catch (e) {
          console.info(`Security_IAM_getUserAuthInstance_Func_0107 step${stepIndex} fail ${e.code}`);
          if (widgetTestParams[index].ret === 0) {
            expect(null).assertFail();
          } else {
            expect(e.code).assertEqual(widgetTestParams[index].ret);
          }
        }
        stepIndex++;
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0004
        * @tc.name      : execute_userAuthInstance_on_is_aaaa_null_undefined
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0004', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0004 start");
      const eventParams = [
        {
          type: "aaaa",
          cb: { callback:(result) => {} }
        },
        {
          type: null,
          cb: { callback:(result) => {} }
        },
        {
          type: 0,
          cb: 0          
        },
        {
          type: "result",
          cb: 0
        },
        {
          type: "result",
          cb: null
        }        
      ];
      for (let index = 0; index < eventParams.length; index++) {
        try {
          console.info("Security_IAM_UserAuthInstance_Func_0004 eventParams: " + JSON.stringify(eventParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
          if (eventParams[index].type === 0) {
            userAuthInstance.on();
          } else if (eventParams[index].cb === 0) {
            userAuthInstance.on(eventParams[index].type);
          } else {
            userAuthInstance.on(eventParams[index].type, eventParams[index].cb);
          }
          console.info(`Security_IAM_UserAuthInstance_Func_0004 step${index + 1} success`);
          expect(null).assertFail();
        } catch (e) {
          console.info(`Security_IAM_UserAuthInstance_Func_0004 step${index + 1} fail ${e.code}`);
          expect(e.code).assertEqual(401);
        }
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0005
        * @tc.name      : execute_userAuthInstance_off_is_aaaa_null_undefined_callbackUndefined
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0005', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0005 start");
      const eventParams = [
        {
          type: "aaaa",
          cb: { callback:(result) => {} }
        },
        {
          type: null,
          cb: { callback:(result) => {} }
        },
        {
          type: 0,
          cb: 0
        },
        {
          type: "result",
          cb: null
        }        
      ];
      for (let index = 0; index < eventParams.length; index++) {
        try {
          console.info("Security_IAM_UserAuthInstance_Func_0005 eventParams: " + JSON.stringify(eventParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
          if (eventParams[index].type === 0) {
            userAuthInstance.off();
          } else if (eventParams[index].cb === 0) {
            userAuthInstance.off(eventParams[index].type);
          } else {
            userAuthInstance.off(eventParams[index].type, eventParams[index].cb);
          }
          console.info(`Security_IAM_UserAuthInstance_Func_0005 step${index + 1} success`);
          expect(null).assertFail();
        } catch (e) {
          console.info(`Security_IAM_UserAuthInstance_Func_0005 step${index + 1} fail ${e.code}`);
          expect(e.code).assertEqual(401);
        }
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0007
        * @tc.name      : execute_userAuthInstance_start_is_aaaa_null
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0007', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0007 start");
      const startParams = [ "aaaa", null ];
      for (let index = 0; index < startParams.length; index++) {
        try {
          console.info("Security_IAM_UserAuthInstance_Func_0007 startParams: " + JSON.stringify(startParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
          userAuthInstance.start(startParams[index]);
          console.info(`Security_IAM_UserAuthInstance_Func_0007 step${index + 1} success`);
          expect(null).assertFail();
        } catch (e) {
          console.info(`Security_IAM_UserAuthInstance_Func_0007 step${index + 1} fail ${e.code}`);
          expect(e.code).assertEqual(401);
        }
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_UserAuthInstance_Func_0009
        * @tc.name      : execute_userAuthInstance_cancel_is_aaaa_null
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_UserAuthInstance_Func_0009', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_UserAuthInstance_Func_0009 start");
      const cancelParams = [ "aaaa", null ];
      for (let index = 0; index < cancelParams.length; index++) {
        try {
          console.info("Security_IAM_UserAuthInstance_Func_0009 cancelParams: " + JSON.stringify(cancelParams[index]));
          const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
          userAuthInstance.start();
          userAuthInstance.cancel(cancelParams[index]);
          console.info(`Security_IAM_UserAuthInstance_Func_0009 step${index + 1} success`);
          expect(null).assertFail();
        } catch (e) {
          console.info(`Security_IAM_UserAuthInstance_Func_0009 step${index + 1} fail ${e.code}`);
          expect(e.code).assertEqual(401);
        }
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_getUserAuthInstance_Func_0088
        * @tc.name      : execute_userAuthInstance_off
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_getUserAuthInstance_Func_0088', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_getUserAuthInstance_Func_0088 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.off();
        console.info(`Security_IAM_getUserAuthInstance_Func_0088 step1 success`);
        expect(null).assertFail();
      } catch (e) {
        console.info(`Security_IAM_getUserAuthInstance_Func_0088 step1 fail ${e.code}`);
        expect(e.code).assertEqual(401);
      }
      done();
    });

    /*
        * @tc.number    : Security_IAM_getUserAuthInstance_Func_0089
        * @tc.name      : execute_userAuthInstance_cancel
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level.LEVEL2
    */
    it('Security_IAM_getUserAuthInstance_Func_0089', Level.LEVEL2, async function (done) {
      console.info("Security_IAM_getUserAuthInstance_Func_0089 start");
      try {
        const userAuthInstance = userAuth.getUserAuthInstance(authParamDefault, widgetParamDefault);
        userAuthInstance.off();
        console.info(`Security_IAM_getUserAuthInstance_Func_0089 step$1 success`);
        expect(null).assertFail();
      } catch (e) {
        console.info(`Security_IAM_getUserAuthInstance_Func_0089 step1 fail ${e.code}`);
        expect(e.code).assertEqual(401);
      }
      done();
    });    
  });
};
