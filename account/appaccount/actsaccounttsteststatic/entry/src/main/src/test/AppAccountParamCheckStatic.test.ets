/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount';
import appAccount from '@ohos.account.appAccount';
import Want from '@ohos.app.ability.Want';
import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { RecordData } from '@ohos.base';

let tag: string = 'testTag';

export default function AppAccountParamCheckStatic() {
  describe('AppAccountParamCheckStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, '====>AppAccountManager create finish====');

    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>beforeEach start====");
      let accounts: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner("com.example.accounttstest.static");
      hilog.info(0x0000, tag, "====>getAccountsByOwner accounts length: " + JSON.stringify(accounts.length));
      for (let i: int = 0; i < accounts.length; i++) {
        let localName: string = accounts[i].name;
        try {
          await accountManager.removeAccount(localName);
        } catch (err) {
          hilog.info(0x0000, tag, "====>removeAccount err: " + JSON.stringify(err));
        }
      }
      done();
    })

    /**
     * @tc.number     AppAccountParamCheckStatic_0100
     * @tc.name       AppAccountParamCheckStatic_0100
     * @tc.desc       createAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0100 start====");
        let name: string = "";
        let customData: Record<string, string> = { 'age': '10' };
        let options: account.CreateAccountOptions = { customData };
        try {
          await accountManager.createAccount(name, options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0100 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0200
     * @tc.name       AppAccountParamCheckStatic_0200
     * @tc.desc       createAccount with options, empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0200 start====");
        let name: string = "testName";
        try {
          await accountManager.createAccount(name, undefined);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0200 success");
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0200 run err");
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0300
     * @tc.name       AppAccountParamCheckStatic_0300
     * @tc.desc       createAccountImplicitly with callback, empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0300 start====");
        let owner: string = "";
        try {
          accountManager.createAccountImplicitly(owner, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>resultcode: " + code);
              hilog.info(0x0000, tag, "====>result: " + JSON.stringify(result));
              try {
                expect(code).assertEqual(12300002);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>onRequestContinued");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0300 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0400
     * @tc.name       AppAccountParamCheckStatic_0400
     * @tc.desc       removeAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0400 start====");
        let name: string = "";
        try {
          await accountManager.removeAccount(name);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0400 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0500
     * @tc.name       AppAccountParamCheckStatic_0500
     * @tc.desc       setAppAccess with empty string name and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0500 start====");
        let name: string = "";
        let bundleName: string = "";
        try {
          await accountManager.setAppAccess(name, bundleName, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0500 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0600
     * @tc.name       AppAccountParamCheckStatic_0600
     * @tc.desc       checkAppAccess with empty string name and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0600 start====");
        let name: string = "";
        let bundleName: string = "";
        try {
          await accountManager.checkAppAccess(name, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0600 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0600 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0700
     * @tc.name       AppAccountParamCheckStatic_0700
     * @tc.desc       checkDataSyncEnabled with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0700 start====");
        let name: string = "";
        try {
          await accountManager.checkDataSyncEnabled(name);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0700 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0800
     * @tc.name       AppAccountParamCheckStatic_0800
     * @tc.desc       setCredential with empty string name, credentialType and credential parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0800 start====");
        let name: string = "";
        let credentialType: string = "";
        let credential: string = "";
        try {
          await accountManager.setCredential(name, credentialType, credential);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0800 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_0900
     * @tc.name       AppAccountParamCheckStatic_0900
     * @tc.desc       setDataSyncEnabled with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0900 start====");
        let name: string = "";
        try {
          await accountManager.setDataSyncEnabled(name, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0900 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_0900 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1000
     * @tc.name       AppAccountParamCheckStatic_1000
     * @tc.desc       setCustomData with empty string name, key and value parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1000 start====");
        let name: string = "";
        let key: string = "";
        let value: string = "";
        try {
          await accountManager.setCustomData(name, key, value);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1000 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1000 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1100
     * @tc.name       AppAccountParamCheckStatic_1100
     * @tc.desc       getAccountsByOwner with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1100 start====");
        let owner: string = "";
        try {
          await accountManager.getAccountsByOwner(owner);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1100 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1200
     * @tc.name       AppAccountParamCheckStatic_1200
     * @tc.desc       getCredential with empty string name and credentialType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1200 start====");
        let name: string = "testName";
        let credentialType: string = "";
        try {
          await accountManager.getCredential(name, credentialType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1200 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_5900
     * @tc.name       AppAccountParamCheckStatic_5900
     * @tc.desc       getCredential with empty string name and credentialType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5900 start====");
        let name: string = "";
        let credentialType: string = "testCredential";
        try {
          await accountManager.getCredential(name, credentialType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5900 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5900 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1300
     * @tc.name       AppAccountParamCheckStatic_1300
     * @tc.desc       getCustomData with empty string name and key parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1300 start====");
        let name: string = "testName";
        let key: string = "";
        try {
          accountManager.getCustomData(name, key, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1300 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1300 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1400
     * @tc.name       AppAccountParamCheckStatic_1400
     * @tc.desc       getCustomDataSync with empty string name and key parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1400 start====");
        let name: string = "testName";
        let key: string = "";
        try {
          accountManager.getCustomDataSync(name, key);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1400 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_1401
     * @tc.name       AppAccountParamCheckStatic_1401
     * @tc.desc       getCustomDataSync with empty string name and key parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1401 start====");
        let name: string = "";
        let key: string = "testKey";
        try {
          accountManager.getCustomDataSync(name, key);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1401 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1401 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_1500
     * @tc.name       AppAccountParamCheckStatic_1500
     * @tc.desc       auth with empty string name, owner and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1500 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        let options: Record<string, RecordData> = {
          'password': 'xxxx',
        };
        try {
          accountManager.auth(name, owner, authType, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1500 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1500 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1500 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1600
     * @tc.name       AppAccountParamCheckStatic_1600
     * @tc.desc       getAuthToken with empty string name, owner and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1600 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        try {
          accountManager.getAuthToken(name, owner, authType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1700
     * @tc.name       AppAccountParamCheckStatic_1700
     * @tc.desc       setAuthToken with empty string name, authType and token parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1700 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          accountManager.setAuthToken(name, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1700 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1700 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1800
     * @tc.name       AppAccountParamCheckStatic_1800
     * @tc.desc       deleteAuthToken with empty string name, owner, authType and token parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1800 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          accountManager.deleteAuthToken(name, owner, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1800 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1800 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_1900
     * @tc.name       AppAccountParamCheckStatic_1900
     * @tc.desc       setAuthTokenVisibility with empty string name, authType and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1900 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let bundleName: string = "com.example.app";
        try {
          accountManager.setAuthTokenVisibility(name, authType, bundleName, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1900 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_1900 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2000
     * @tc.name       AppAccountParamCheckStatic_2000
     * @tc.desc       checkAuthTokenVisibility with empty string name, authType and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2000 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let bundleName: string = "com.example.app";
        try {
          accountManager.checkAuthTokenVisibility(name, authType, bundleName, (err: BusinessError | null, isVisible: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2000 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2000 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2100
     * @tc.name       AppAccountParamCheckStatic_2100
     * @tc.desc       getAllAuthTokens with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2100 start====");
        let name: string = "testName";
        let owner: string = "";
        try {
          accountManager.getAllAuthTokens(name, owner, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2100 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2100 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2200
     * @tc.name       AppAccountParamCheckStatic_2200
     * @tc.desc       getAuthList with empty string name and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2200 start====");
        let name: string = "testName";
        let authType: string = "";
        try {
          accountManager.getAuthList(name, authType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2200 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2200 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2300
     * @tc.name       AppAccountParamCheckStatic_2300
     * @tc.desc       getAuthCallback with empty string sessionId parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2300 start====");
        let sessionId: string = "";
        try {
          await accountManager.getAuthCallback(sessionId);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2300 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2400
     * @tc.name       AppAccountParamCheckStatic_2400
     * @tc.desc       queryAuthenticatorInfo with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2400 start====");
        let owner: string = "";
        try {
          await accountManager.queryAuthenticatorInfo(owner);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2400 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2500
     * @tc.name       AppAccountParamCheckStatic_2500
     * @tc.desc       checkAccountLabels with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2500 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let labels: Array<string> = ["label1"];
        try {
          accountManager.checkAccountLabels(name, owner, labels, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2500 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2500 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2600
     * @tc.name       AppAccountParamCheckStatic_2600
     * @tc.desc       deleteCredential with empty string name and credentialType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2600 start====");
        let name: string = "testName";
        let credentialType: string = "";
        try {
          accountManager.deleteCredential(name, credentialType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });


    /**
     * @tc.number     AppAccountParamCheckStatic_2700
     * @tc.name       AppAccountParamCheckStatic_2700
     * @tc.desc       verifyCredential with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2700 start====");
        let name: string = "";
        let owner: string = "";
        try {
          accountManager.verifyCredential(name, owner, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2700 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2700 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2700 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2800
     * @tc.name       AppAccountParamCheckStatic_2800
     * @tc.desc       setAuthenticatorProperties with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2800 start====");
        let owner: string = "";
        try {
          accountManager.setAuthenticatorProperties(owner, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2800 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2800 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2800 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_2900
     * @tc.name       AppAccountParamCheckStatic_2900
     * @tc.desc       auth with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2900 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        try {
          accountManager.auth(name, owner, authType, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2900 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2900 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_2900 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3000
     * @tc.name       AppAccountParamCheckStatic_3000
     * @tc.desc       auth with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3000 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        try {
          accountManager.auth(name, owner, authType, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3000 onResult code: " + code);
              expect(code).assertEqual(12300113);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3000 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3000 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3100
     * @tc.name       AppAccountParamCheckStatic_3100
     * @tc.desc       auth with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3100 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        try {
          accountManager.auth(name, owner, authType, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3100 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3100 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3100 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3200
     * @tc.name       AppAccountParamCheckStatic_3200
     * @tc.desc       checkAccountLabels with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3200 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let labels: Array<string> = ["label1"];
        try {
          await accountManager.checkAccountLabels(name, owner, labels);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3200 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3300
     * @tc.name       AppAccountParamCheckStatic_3300
     * @tc.desc       checkAccountLabels with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3300 start====");
        let name: string = "testName";
        let owner: string = "";
        let labels: Array<string> = ["label1"];
        try {
          await accountManager.checkAccountLabels(name, owner, labels);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3300 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3400
     * @tc.name       AppAccountParamCheckStatic_3400
     * @tc.desc       checkAccountLabels with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3400 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let labels: Array<string> = [];
        try {
          await accountManager.checkAccountLabels(name, owner, labels);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3400 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3500
     * @tc.name       AppAccountParamCheckStatic_3500
     * @tc.desc       checkAppAccess with empty string bundleName parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3500 start====");
        let name: string = "testName";
        let bundleName: string = "";
        try {
          await accountManager.checkAppAccess(name, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3500 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3600
     * @tc.name       AppAccountParamCheckStatic_3600
     * @tc.desc       checkAppAccess with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3600 start====");
        let name: string = "";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.checkAppAccess(name, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3600 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3600 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3700
     * @tc.name       AppAccountParamCheckStatic_3700
     * @tc.desc       checkAppAccess with empty string name and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3700 start====");
        let name: string = "testName";
        let bundleName: string = "";
        try {
          accountManager.checkAppAccess(name, bundleName, (err: BusinessError | null, isAccessible: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3700 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3700 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3800
     * @tc.name       AppAccountParamCheckStatic_3800
     * @tc.desc       checkAuthTokenVisibility with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3800 start====");
        let name: string = "testName";
        let authType: string = "";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.checkAuthTokenVisibility(name, authType, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3800 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_3900
     * @tc.name       AppAccountParamCheckStatic_3900
     * @tc.desc       checkAuthTokenVisibility with empty string bundleName parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3900 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let bundleName: string = "";
        try {
          await accountManager.checkAuthTokenVisibility(name, authType, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3900 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_3900 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4000
     * @tc.name       AppAccountParamCheckStatic_4000
     * @tc.desc       checkAuthTokenVisibility with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4000 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.checkAuthTokenVisibility(name, authType, bundleName);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4000 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4000 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4100
     * @tc.name       AppAccountParamCheckStatic_4100
     * @tc.desc       checkAuthTokenVisibility with empty string name and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4100 start====");
        let name: string = "testName";
        let authType: string = "";
        let bundleName: string = "com.example.app";
        try {
          accountManager.checkAuthTokenVisibility(name, authType, bundleName, (err: BusinessError | null, isVisible: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4100 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4100 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4200
     * @tc.name       AppAccountParamCheckStatic_4200
     * @tc.desc       deleteAuthToken with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4200 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          await accountManager.deleteAuthToken(name, owner, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4200 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4300
     * @tc.name       AppAccountParamCheckStatic_4300
     * @tc.desc       deleteAuthToken with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4300 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        let token: string = "testToken";
        try {
          await accountManager.deleteAuthToken(name, owner, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4300 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4400
     * @tc.name       AppAccountParamCheckStatic_4400
     * @tc.desc       deleteAuthToken with empty string token parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4400 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        let token: string = "";
        try {
          await accountManager.deleteAuthToken(name, owner, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4400 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4500
     * @tc.name       AppAccountParamCheckStatic_4500
     * @tc.desc       deleteAuthToken with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4500 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          await accountManager.deleteAuthToken(name, owner, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4500 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4600
     * @tc.name       AppAccountParamCheckStatic_4600
     * @tc.desc       deleteAuthToken with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4600 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          accountManager.deleteAuthToken(name, owner, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });


    /**
     * @tc.number     AppAccountParamCheckStatic_4700
     * @tc.name       AppAccountParamCheckStatic_4700
     * @tc.desc       deleteCredential with empty string credentialType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4700 start====");
        let name: string = "testName";
        let credentialType: string = "";
        try {
          await accountManager.deleteCredential(name, credentialType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4700 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4800
     * @tc.name       AppAccountParamCheckStatic_4800
     * @tc.desc       deleteCredential with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4800 start====");
        let name: string = "";
        let credentialType: string = "password";
        try {
          await accountManager.deleteCredential(name, credentialType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4800 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_4900
     * @tc.name       AppAccountParamCheckStatic_4900
     * @tc.desc       getAllAuthTokens with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4900 start====");
        let name: string = "testName";
        let owner: string = "";
        try {
          await accountManager.getAllAuthTokens(name, owner);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4900 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_4900 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5000
     * @tc.name       AppAccountParamCheckStatic_5000
     * @tc.desc       getAllAuthTokens with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5000 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        try {
          await accountManager.getAllAuthTokens(name, owner);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5000 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5000 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5100
     * @tc.name       AppAccountParamCheckStatic_5100
     * @tc.desc       getAuthList with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5100 start====");
        let name: string = "testName";
        let authType: string = "";
        try {
          await accountManager.getAuthList(name, authType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5100 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5200
     * @tc.name       AppAccountParamCheckStatic_5200
     * @tc.desc       getAuthList with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5200 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        try {
          await accountManager.getAuthList(name, authType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5200 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5300
     * @tc.name       AppAccountParamCheckStatic_5300
     * @tc.desc       getAuthToken with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5300 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        try {
          await accountManager.getAuthToken(name, owner, authType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5300 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5400
     * @tc.name       AppAccountParamCheckStatic_5400
     * @tc.desc       getAuthToken with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5400 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        try {
          await accountManager.getAuthToken(name, owner, authType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5400 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5500
     * @tc.name       AppAccountParamCheckStatic_5500
     * @tc.desc       getAuthToken with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5500 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        try {
          await accountManager.getAuthToken(name, owner, authType);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5500 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5600
     * @tc.name       AppAccountParamCheckStatic_5600
     * @tc.desc       getAuthToken with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5600 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        try {
          accountManager.getAuthToken(name, owner, authType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5700
     * @tc.name       AppAccountParamCheckStatic_5700
     * @tc.desc       getCustomData with empty string key parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5700 start====");
        let name: string = "testName";
        let key: string = "";
        try {
          await accountManager.getCustomData(name, key);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5700 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_5800
     * @tc.name       AppAccountParamCheckStatic_5800
     * @tc.desc       getCustomData with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5800 start====");
        let name: string = "";
        let key: string = "testKey";
        try {
          await accountManager.getCustomData(name, key);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_5800 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });


    /**
     * @tc.number     AppAccountParamCheckStatic_6000
     * @tc.name       AppAccountParamCheckStatic_6000
     * @tc.desc       setAppAccess with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6000 start====");
        let name: string = "";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.setAppAccess(name, bundleName, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6000 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6000 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6100
     * @tc.name       AppAccountParamCheckStatic_6100
     * @tc.desc       setAppAccess with empty string bundleName parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6100 start====");
        let name: string = "testName";
        let bundleName: string = "";
        try {
          await accountManager.setAppAccess(name, bundleName, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6100 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6200
     * @tc.name       AppAccountParamCheckStatic_6200
     * @tc.desc       setAppAccess with empty string name and bundleName parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6200 start====");
        let name: string = "ZhangSan";
        let bundleName: string = "";
        try {
          accountManager.setAppAccess(name, bundleName, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6200 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6200 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6300
     * @tc.name       AppAccountParamCheckStatic_6300
     * @tc.desc       setAuthToken with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6300 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let token: string = "testToken";
        try {
          await accountManager.setAuthToken(name, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6300 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6400
     * @tc.name       AppAccountParamCheckStatic_6400
     * @tc.desc       setAuthToken with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6400 start====");
        let name: string = "testName";
        let authType: string = "";
        let token: string = "testToken";
        try {
          await accountManager.setAuthToken(name, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6400 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6500
     * @tc.name       AppAccountParamCheckStatic_6500
     * @tc.desc       setAuthToken with empty string token parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6500 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let token: string = "";
        try {
          await accountManager.setAuthToken(name, authType, token);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6500 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6600
     * @tc.name       AppAccountParamCheckStatic_6600
     * @tc.desc       setAuthToken with empty string name and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6600 start====");
        let name: string = "testName";
        let authType: string = "";
        let token: string = "testToken";
        try {
          accountManager.setAuthToken(name, authType, token, (err: BusinessError | null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6600 run success");
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6600 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6700
     * @tc.name       AppAccountParamCheckStatic_6700
     * @tc.desc       setAuthTokenVisibility with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6700 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.setAuthTokenVisibility(name, authType, bundleName, false);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6700 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6800
     * @tc.name       AppAccountParamCheckStatic_6800
     * @tc.desc       setAuthTokenVisibility with empty string authType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6800 start====");
        let name: string = "testName";
        let authType: string = "";
        let bundleName: string = "com.example.app";
        try {
          await accountManager.setAuthTokenVisibility(name, authType, bundleName, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6800 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_6900
     * @tc.name       AppAccountParamCheckStatic_6900
     * @tc.desc       setAuthTokenVisibility with empty string bundleName parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6900 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let bundleName: string = "";
        try {
          await accountManager.setAuthTokenVisibility(name, authType, bundleName, true);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6900 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_6900 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7000
     * @tc.name       AppAccountParamCheckStatic_7000
     * @tc.desc       setAuthTokenVisibility with empty string name and authType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7000 start====");
        let name: string = "testName";
        let authType: string = "";
        let bundleName: string = "com.example.app";
        try {
          accountManager.setAuthTokenVisibility(name, authType, bundleName, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7000 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7000 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7100
     * @tc.name       AppAccountParamCheckStatic_7100
     * @tc.desc       setCredential with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7100 start====");
        let name: string = "";
        let credentialType: string = "password";
        let credential: string = "testCredential";
        try {
          await accountManager.setCredential(name, credentialType, credential);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7100 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7200
     * @tc.name       AppAccountParamCheckStatic_7200
     * @tc.desc       setCredential with empty string credentialType parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7200 start====");
        let name: string = "testName";
        let credentialType: string = "";
        let credential: string = "testCredential";
        try {
          await accountManager.setCredential(name, credentialType, credential);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7200 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7200 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7300
     * @tc.name       AppAccountParamCheckStatic_7300
     * @tc.desc       setCredential with empty string credential parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7300 start====");
        let name: string = "testName";
        let credentialType: string = "password";
        let credential: string = "";
        try {
          await accountManager.setCredential(name, credentialType, credential);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7300 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7400
     * @tc.name       AppAccountParamCheckStatic_7400
     * @tc.desc       setCredential with empty string name and credentialType parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7400 start====");
        let name: string = "";
        let credentialType: string = "password";
        let credential: string = "testCredential";
        try {
          accountManager.setCredential(name, credentialType, credential, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7400 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7400 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7500
     * @tc.name       AppAccountParamCheckStatic_7500
     * @tc.desc       setCredential with empty string credentialType and credential parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7500 start====");
        let name: string = "testName";
        let credentialType: string = "";
        let credential: string = "testCredential";
        try {
          accountManager.setCredential(name, credentialType, credential, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7500 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7500 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7600
     * @tc.name       AppAccountParamCheckStatic_7600
     * @tc.desc       setCustomData with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7600 start====");
        let name: string = "";
        let key: string = "testKey";
        let value: string = "testValue";
        try {
          await accountManager.setCustomData(name, key, value);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7600 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7600 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7700
     * @tc.name       AppAccountParamCheckStatic_7700
     * @tc.desc       setCustomData with empty string key parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7700 start====");
        let name: string = "testName";
        let key: string = "";
        let value: string = "testValue";
        try {
          await accountManager.setCustomData(name, key, value);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7700 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7700 err: " + err.code);
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7800
     * @tc.name       AppAccountParamCheckStatic_7800
     * @tc.desc       setCustomData with empty string value parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7800 start====");
        let name: string = "testName";
        let key: string = "testKey";
        let value: string = "";
        try {
          await accountManager.setCustomData(name, key, value);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7800 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7800 err: " + err.code);
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_7900
     * @tc.name       AppAccountParamCheckStatic_7900
     * @tc.desc       setCustomData with empty string name and key parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7900 start====");
        let name: string = "";
        let key: string = "testKey";
        let value: string = "testValue";
        try {
          accountManager.setCustomData(name, key, value, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7900 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_7900 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_8000
     * @tc.name       AppAccountParamCheckStatic_8000
     * @tc.desc       setCustomData with empty string key and value parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8000 start====");
        let name: string = "testName";
        let key: string = "";
        let value: string = "testValue";
        try {
          accountManager.setCustomData(name, key, value, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8000 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8000 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8200
     * @tc.name       AppAccountParamCheckStatic_8200
     * @tc.desc       verifyCredential with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8200 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        try {
          accountManager.verifyCredential(name, owner, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8200 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8200 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8200 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8300
     * @tc.name       AppAccountParamCheckStatic_8300
     * @tc.desc       verifyCredential with empty string owner parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8300 start====");
        let name: string = "testName";
        let owner: string = "";
        try {
          accountManager.verifyCredential(name, owner, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8300 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8300 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8300 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8400
     * @tc.name       AppAccountParamCheckStatic_8400
     * @tc.desc       verifyCredential with empty string name and owner parameters
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8400 start====");
        let name: string = "testName";
        let owner: string = "";
        let options: account.VerifyCredentialOptions = { credentialType: 'password', credential: 'test' };

        try {
          accountManager.verifyCredential(name, owner, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8400 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8400 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8400 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8500
     * @tc.name       AppAccountParamCheckStatic_8500
     * @tc.desc       createAccountImplicitly with empty string owner parameter and options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8500 start====");
        let owner: string = "testOwner";
        let options: appAccount.CreateAccountImplicitlyOptions = {
          authType: 'getSocialData',
          requiredLabels: []
        };
        try {
          accountManager.createAccountImplicitly(owner, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8500 onResult code: " + code);
              expect(code).assertEqual(12300113);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8500 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8500 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8600
     * @tc.name       AppAccountParamCheckStatic_8600
     * @tc.desc       removeAccount with empty string name parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8600 start====");
        let name: string = "";
        try {
          accountManager.removeAccount(name, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8700
     * @tc.name       AppAccountParamCheckStatic_8700
     * @tc.desc       setAppAccess with empty string name and bundleName parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8700 start====");
        let name: string = "";
        let bundleName: string = "'com.acts.notExist'";
        try {
          accountManager.setAppAccess(name, bundleName, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8700 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8700 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8800
     * @tc.name       AppAccountParamCheckStatic_8800
     * @tc.desc       checkAppAccess with empty string name and bundleName parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8800 start====");
        let name: string = "";
        let bundleName: string = "com.example.app";
        try {
          accountManager.checkAppAccess(name, bundleName, (err: BusinessError | null, isAccessible: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8800 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8800 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_8900
     * @tc.name       AppAccountParamCheckStatic_8900
     * @tc.desc       checkDataSyncEnabled with empty string name parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8900 start====");
        let name: string = "";
        try {
          accountManager.checkDataSyncEnabled(name, (err: BusinessError | null, isEnabled: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8900 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8900 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9000
     * @tc.name       AppAccountParamCheckStatic_9000
     * @tc.desc       setCredential with empty string name, credentialType and credential parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9000 start====");
        let name: string = "testName";
        let credentialType: string = "password";
        let credential: string = "";
        try {
          accountManager.setCredential(name, credentialType, credential, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9000 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9000 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9100
     * @tc.name       AppAccountParamCheckStatic_9100
     * @tc.desc       setDataSyncEnabled with empty string name parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9100 start====");
        let name: string = "";
        try {
          accountManager.setDataSyncEnabled(name, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9100 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9100 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9200
     * @tc.name       AppAccountParamCheckStatic_9200
     * @tc.desc       setCustomData with empty string name, key and value parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9200 start====");
        let name: string = "testName";
        let key: string = "testKey";
        let value: string = "";
        try {
          accountManager.setCustomData(name, key, value, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9200 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9200 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9300
     * @tc.name       AppAccountParamCheckStatic_9300
     * @tc.desc       getAccountsByOwner with empty string owner parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9300 start====");
        let owner: string = "";
        try {
          accountManager.getAccountsByOwner(owner, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9300 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9300 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_8100
     * @tc.name       AppAccountParamCheckStatic_8100
     * @tc.desc       getCredential with empty string name and credentialType parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8100 start====");
        let name: string = "";
        let credentialType: string = "testCredential";
        try {
          accountManager.getCredential(name, credentialType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8100 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_8100 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_9400
     * @tc.name       AppAccountParamCheckStatic_9400
     * @tc.desc       getCredential with empty string name and credentialType parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9400 start====");
        let name: string = "testName";
        let credentialType: string = "";
        try {
          accountManager.getCredential(name, credentialType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9400 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9400 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9500
     * @tc.name       AppAccountParamCheckStatic_9500
     * @tc.desc       getCustomData with empty string name and key parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9500 start====");
        let name: string = "";
        let key: string = "testKey";
        try {
          accountManager.getCustomData(name, key, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9500 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9500 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9600
     * @tc.name       AppAccountParamCheckStatic_9600
     * @tc.desc       onAccountChange with null owners parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let param:Array<String> = []
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9600 start====");
        try {
          accountManager.onAccountChange(param, (accounts: Array<account.AppAccountInfo>): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9600 accounts: " + JSON.stringify(accounts));
            expect().assertFail();
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9600 err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9700
     * @tc.name       AppAccountParamCheckStatic_9700
     * @tc.desc       auth with empty string name, owner and authType parameters and options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9700 start====");
        let name: string = "testName";
        let owner: string = "";
        let authType: string = "getSocialData";
        let options: Record<string, RecordData> = {
          'password': 'xxxx',
        };
        try {
          accountManager.auth(name, owner, authType, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9700 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9700 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9700 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9800
     * @tc.name       AppAccountParamCheckStatic_9800
     * @tc.desc       getAuthToken with empty string name, owner and authType parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9800 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        try {
          accountManager.getAuthToken(name, owner, authType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9800 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9800 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_9900
     * @tc.name       AppAccountParamCheckStatic_9900
     * @tc.desc       setAuthToken with empty string name, authType and token parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9900 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let token: string = "";
        try {
          accountManager.setAuthToken(name, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9900 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_9900 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10000
     * @tc.name       AppAccountParamCheckStatic_10000
     * @tc.desc       deleteAuthToken with empty string name, owner, authType and token parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10000 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        let token: string = "testToken";
        try {
          accountManager.deleteAuthToken(name, owner, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10000 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10000 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10100
     * @tc.name       AppAccountParamCheckStatic_10100
     * @tc.desc       setAuthTokenVisibility with empty string name, authType and bundleName parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10100 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let bundleName: string = "";
        try {
          accountManager.setAuthTokenVisibility(name, authType, bundleName, true, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10100 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10100 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10200
     * @tc.name       AppAccountParamCheckStatic_10200
     * @tc.desc       checkAuthTokenVisibility with empty string name, authType and bundleName parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10200 start====");
        let name: string = "testName";
        let authType: string = "getSocialData";
        let bundleName: string = "";
        try {
          accountManager.checkAuthTokenVisibility(name, authType, bundleName, (err: BusinessError | null, isVisible: boolean | undefined): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10200 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10200 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10300
     * @tc.name       AppAccountParamCheckStatic_10300
     * @tc.desc       getAllAuthTokens with empty string name and owner parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10300 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        try {
          accountManager.getAllAuthTokens(name, owner, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10300 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10300 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10400
     * @tc.name       AppAccountParamCheckStatic_10400
     * @tc.desc       getAuthList with empty string name and authType parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10400 start====");
        let name: string = "";
        let authType: string = "getSocialData";
        try {
          accountManager.getAuthList(name, authType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10400 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10400 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10500
     * @tc.name       AppAccountParamCheckStatic_10500
     * @tc.desc       getAuthCallback with empty string sessionId parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10500 start====");
        let sessionId: string = "";
        try {
          accountManager.getAuthCallback(sessionId, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10500 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10500 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10600
     * @tc.name       AppAccountParamCheckStatic_10600
     * @tc.desc       queryAuthenticatorInfo with empty string owner parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10600 start====");
        let owner: string = "";
        try {
          accountManager.queryAuthenticatorInfo(owner, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10700
     * @tc.name       AppAccountParamCheckStatic_10700
     * @tc.desc       checkAccountLabels with empty string name and owner parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10700 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let labels: Array<string> = [];
        try {
          accountManager.checkAccountLabels(name, owner, labels, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10700 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10700 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10800
     * @tc.name       AppAccountParamCheckStatic_10800
     * @tc.desc       deleteCredential with empty string name and credentialType parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10800 start====");
        let name: string = "";
        let credentialType: string = "password";
        try {
          accountManager.deleteCredential(name, credentialType, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10800 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10800 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_10900
     * @tc.name       AppAccountParamCheckStatic_10900
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          allowedAccounts: []
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10900 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10900 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_10900 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11000
     * @tc.name       AppAccountParamCheckStatic_11000
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11000 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: []
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11000 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11000 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11100
     * @tc.name       AppAccountParamCheckStatic_11100
     * @tc.desc       verifyCredential with empty string name and owner parameters and options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11100 start====");
        let name: string = "";
        let owner: string = "com.example.app";
        let options: account.VerifyCredentialOptions = { credentialType: 'password', credential: 'test' };
        try {
          accountManager.verifyCredential(name, owner, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11100 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11100 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11100 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11200
     * @tc.name       AppAccountParamCheckStatic_11200
     * @tc.desc       setAuthenticatorProperties with empty string owner parameter and options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11200 start====");
        let owner: string = "";
        let properties: Record<string, RecordData> = { 'prop1': 'value1' }
        let options: account.SetPropertiesOptions = { properties };
        try {
          accountManager.setAuthenticatorProperties(owner, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11200 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11200 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11200 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11300
     * @tc.name       AppAccountParamCheckStatic_11300
     * @tc.desc       createAccountImplicitly with null options parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11300 start====");
        let owner: string = "testOwner";
        let options: appAccount.CreateAccountImplicitlyOptions = {
          authType: 'getSocialData',
          requiredLabels: ['']
        };
        try {
          accountManager.createAccountImplicitly(owner,options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11300 onResult code: " + code);
              expect(code).assertEqual(12300113);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11300 onRequestRedirected");
            }
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11300 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11400
     * @tc.name       AppAccountParamCheckStatic_11400
     * @tc.desc       createAccountImplicitly with null options parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11400 start====");
        let owner: string = ''
        let options: appAccount.CreateAccountImplicitlyOptions = {
          authType: 'getSocialData',
          requiredLabels: ['testRequired']
        };
        try {
          accountManager.createAccountImplicitly(owner,options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11400 onResult code: " + code);
              expect(code).assertEqual(12300002);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11400 onRequestRedirected");
            }
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11400 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11500
     * @tc.name       AppAccountParamCheckStatic_11500
     * @tc.desc       deleteAuthToken with empty string name, owner, authType and token parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11500 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "getSocialData";
        let token: string = "";
        try {
          accountManager.deleteAuthToken(name, owner, authType, token, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11500 err: " + err.code);
              expect(err.code).assertEqual(12300003);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11500 catch err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_11600
     * @tc.name       AppAccountParamCheckStatic_11600
     * @tc.desc       checkAccountLabels with empty string name and owner parameters callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11600 start====");
        let name: string = "testName";
        let owner: string = "";
        let labels: Array<string> = ["label1"];
        try {
          accountManager.checkAccountLabels(name, owner, labels, (err: BusinessError | null): void => {
            if (err) {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11600 err: " + err.code);
              expect(err.code).assertEqual(12300002);
            } else {
              expect().assertFail();
            }
            done();
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11600 catch err: " + err.code);
          expect(err.code).assertEqual(12300002);
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_11700
     * @tc.name       AppAccountParamCheckStatic_11700
     * @tc.desc       createAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11700 start====");
        let name: string = "";
        let customData: Record<string, string> = { 'age': '10' };
        let options: account.CreateAccountOptions = { customData };
        accountManager.createAccount(name, options, (err: BusinessError | null) => {
          if (err) {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11700 err: " + err.code);
            expect(err.code).assertEqual(12300002);
            done();
          } else {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11700 run err");
            expect().assertFail();
            done();
          }
        });
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_11800
     * @tc.name       AppAccountParamCheckStatic_11800
     * @tc.desc       createAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11800 start====");
        let name: string = "";
        accountManager.createAccount(name, (err: BusinessError | null) => {
          if (err) {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11800 err: " + err.code);
            expect(err.code).assertEqual(12300002);
            done();
          } else {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11800 run err");
            expect().assertFail();
            done();
          }
        });
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_11900
     * @tc.name       AppAccountParamCheckStatic_11900
     * @tc.desc       auth with empty string name, owner and authType parameters and options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11900 start====");
        let name: string = "testName";
        let owner: string = "com.example.app";
        let authType: string = "";
        let options: Record<string, RecordData> = {
          'password': 'xxxx',
        };
        try {
          accountManager.auth(name, owner, authType, options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11900 onResult code: " + code);
              expect(code).assertEqual(12300113);
              done();
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11900 onRequestRedirected");
            }
          });
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11900 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12000
     * @tc.name       AppAccountParamCheckStatic_12000
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{ owner: '', name: "testName" }]
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12000 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12000 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12000 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12100
     * @tc.name       AppAccountParamCheckStatic_12100
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          allowedOwners: []
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12100 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12100 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12100 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12200
     * @tc.name       AppAccountParamCheckStatic_12200
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          allowedOwners: ['']
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12200 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12200 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12200 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12300
     * @tc.name       AppAccountParamCheckStatic_12300
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          requiredLabels: []
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12300 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12300 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12300 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12400
     * @tc.name       AppAccountParamCheckStatic_12400
     * @tc.desc       selectAccountsByOptions with null options parameter callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let options: account.SelectAccountsOptions = {
          requiredLabels: ['']
        };
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12400 start====");
        try {
          accountManager.selectAccountsByOptions(options, (err: BusinessError<void>|null): void => {
            hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12400 run success");
            done();
          });
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12400 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_12500
     * @tc.name       AppAccountParamCheckStatic_12500
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12500 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{ owner: '', name: "testName" }]
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12500 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12500 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
    /**
     * @tc.number     AppAccountParamCheckStatic_12600
     * @tc.name       AppAccountParamCheckStatic_12600
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12600 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: []
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12600 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12600 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_12700
     * @tc.name       AppAccountParamCheckStatic_12700
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12700 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: ['']
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11000 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_11000 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_12800
     * @tc.name       AppAccountParamCheckStatic_12800
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12800 start====");
        let options: account.SelectAccountsOptions = {
          requiredLabels: []
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12800 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12800 err: " + err.code);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number     AppAccountParamCheckStatic_12900
     * @tc.name       AppAccountParamCheckStatic_12900
     * @tc.desc       selectAccountsByOptions with null options parameter promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('AppAccountParamCheckStatic_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12900 start====");
        let options: account.SelectAccountsOptions = {
          requiredLabels: ['']
        };
        try {
          await accountManager.selectAccountsByOptions(options);
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12900 run success");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>AppAccountParamCheckStatic_12900 err: " + err.code);
          expect().assertFail();
          done();
        }
      });
  });
}
