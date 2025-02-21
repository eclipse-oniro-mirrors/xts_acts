/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import account from '@ohos.account.appAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'

export default function ActsAppAccountOptionalParameterTest() {
  describe('ActsAppAccountOptionalParameterTest', () => {
    const name = 'zhangsan'
    const owner = 'com.example.accounttstest'

    beforeEach(async (done: Function) => {
      console.info("====>afterEach start====");
      let appAccountManager = account.createAppAccountManager();
      let accounts = await appAccountManager.getAccountsByOwner(owner)
      for (let i = 0; i < accounts.length; i++) {
        let localName = accounts[i].name
        if (localName == 'zhangsan') {
          await appAccountManager.removeAccount(localName)
        }
      }
      done();
    })

    /*
    * @tc.number    : ActsAccountOptionalParameter_0100
    * @tc.name      : test createAccount callback form
    * @tc.desc      : createAccount in callback form without optional information
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0100 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>create finish====");
      appAccountManager.createAccount(name, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_0100 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0200
    * @tc.name      : test createAccount promise form
    * @tc.desc      : createAccount in promise form without optional information
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0200 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.info("====>ActsAccountOptionalParameter_0200 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0300
    * @tc.name      : test createAccount promise form
    * @tc.desc      : undefined callback
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount(name, undefined, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_0300 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0400
    * @tc.name      : test createAccount promise form
    * @tc.desc      : undefined Promise
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0400 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, undefined);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.info("====>ActsAccountOptionalParameter_0400 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0500
    * @tc.name      : test createAccount promise form
    * @tc.desc      : null callback
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0500 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount(name, null, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_0500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(name, async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_0500 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_0500 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0600
    * @tc.name      : test createAccount promise form
    * @tc.desc      : null Promise
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0600 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, null);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("====>delete account start====");
      await appAccountManager.removeAccount(name);
      console.info("====>ActsAccountOptionalParameter_0600 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0700
    * @tc.name      : test createAccount callback form
    * @tc.desc      : no customData callback
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0700 start====");
      let createAccountOptions: account.CreateAccountOptions = {}
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_0700 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_0700 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_0700 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0800
    * @tc.name      : test createAccount promise form
    * @tc.desc      : no customData promise
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_0800 start====");
      let createAccountOptions: account.CreateAccountOptions = {}
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount("account_name_promise_second", createAccountOptions);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("====>delete account start====");
      await appAccountManager.removeAccount("account_name_promise_second");
      console.info("====>ActsAccountOptionalParameter_0800 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_0900
    * @tc.name      : test createAccount callback form
    * @tc.desc      : customData is undefined callback
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_0900', 0, async (done: Function) => {
      console.info("====>ActsAccountCreateAccount_0300 start====");
      let createAccountOptions: account.CreateAccountOptions = {
        customData: undefined
      };
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_0900 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_0900 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_0900 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1000
    * @tc.name      : test createAccount promise form
    * @tc.desc      : customData is undefined promise
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1000', 0, async (done: Function) => {
      console.info("====>ActsAccountCreateAccount_0400 start====");
      let createAccountOptions: account.CreateAccountOptions = {
        customData: undefined
      }
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount("account_name_promise_second", createAccountOptions);
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info("====>delete account start====");
      await appAccountManager.removeAccount("account_name_promise_second");
      console.info("====>ActsAccountOptionalParameter_1000 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1100
    * @tc.name      : test createAccount callback form
    * @tc.desc      : customData is null callback
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1100 start====");
      let createAccountOptions: account.CreateAccountOptions = {
        customData: null
      };
      let appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.info("====>createAccount ActsAccountOptionalParameter_1100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", async (err) => {
          console.info("====>delete Account ActsAccountOptionalParameter_1100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountOptionalParameter_1100 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1200
    * @tc.name      : test createAccount promise form
    * @tc.desc      : customData is null promise
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1200 start====");
      let createAccountOptions: account.CreateAccountOptions = {
        customData: null
      }
      let appAccountManager = account.createAppAccountManager();
      console.info("====>createAppAccountManager finish====");
      console.info("====>createAccount start====");
      try {
        await appAccountManager.createAccount(name, createAccountOptions);
        console.info("====>delete account start====");
        await appAccountManager.removeAccount(name);
        console.info("====>ActsAccountOptionalParameter_1200 end====");
        done();
      }
      catch (err) {
        console.error("====>createAccount fail err:" + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        expect().assertFail()
        done();
      }
      console.info("====>ActsAccountOptionalParameter_1200 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1300
    * @tc.name      : test createAccountImplicitly no options
    * @tc.desc      : no option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", {
          onResult: async (resultCode) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_1300 end====");
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1300 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1300 end====");
              done();
            }
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1300 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1300 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1400
    * @tc.name      : test createAccountImplicitly with options
    * @tc.desc      : with option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1400 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1400 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_1400 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1400 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1400 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1500
    * @tc.name      : test createAccountImplicitly undefined options
    * @tc.desc      : undefined option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1500 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", undefined, {
          onResult: async (resultCode, undefined) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1500 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1500 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: undefined
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1500 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1500 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1600
    * @tc.name      : test createAccountImplicitly null options
    * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1600 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", null, {
          onResult: async (resultCode) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1600 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1600 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: null
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1600 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1600 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1700
    * @tc.name      : test createAccountImplicitly with empty options
    * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {}
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1700 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1700 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_1700 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1700 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1700 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1800
    * @tc.name      : test createAccountImplicitly with undefined options
    * @tc.desc      : undefined options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: undefined, authType: undefined, parameters: undefined
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1800 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1800 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1800 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_1800 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1800 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1800 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_1900
    * @tc.name      : test createAccountImplicitly with null options
    * @tc.desc      : null options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_1900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_1900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: null, authType: null, parameters: null
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_1900 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_1900 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_1900 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_1900 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_1900 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_1900 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2000
    * @tc.name      : test createAccountImplicitly with authType options
    * @tc.desc      : authType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN"
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2000 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2000 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2000 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2000 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2000 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2000 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2100
    * @tc.name      : test createAccountImplicitly with authType options
    * @tc.desc      : authType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: undefined, authType: "PIN", parameters: undefined
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2100 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2100 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2100 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2100 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2100 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2100 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2200
    * @tc.name      : test createAccountImplicitly with authType options
    * @tc.desc      : authType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: null, authType: "PIN", parameters: null
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2200 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2200 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2200 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2200 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2200 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2200 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2300
    * @tc.name      : test createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40']
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2300 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2300 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2300 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2300 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2300 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2400
    * @tc.name      : test createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: undefined, parameters: undefined
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2400 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2400 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2400 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2400 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2400 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2500
    * @tc.name      : test createAccountImplicitly with requiredLabels options
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: null, parameters: null
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2500 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2500 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2500 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2500 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2500 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2600
    * @tc.name      : test createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2600 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2600 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2600 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2600 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2600 end====");
        expect(null).assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2700
    * @tc.name      : test createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: undefined, authType: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2700 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2700 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2700 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2700 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2700 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2800
    * @tc.name      : test createAccountImplicitly with parameters options
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: null, authType: null, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2800 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_2800 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2800 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2800 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2800 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2800 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2800 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_2900
    * @tc.name      : test createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_2900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_2900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: "PIN"
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_2900 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_2900 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_2900 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_2900 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_2900 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_2900 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_2900 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3000
    * @tc.name      : test createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: "PIN", parameters: undefined
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3000 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_3000 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3000 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3000 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3000 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3000 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3000 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3100
    * @tc.name      : test createAccountImplicitly with authType&requiredLabels options
    * @tc.desc      : authType&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: "PIN", parameters: null
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3100 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_3100 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3100 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3100 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3100 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3100 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3100 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3200
    * @tc.name      : test createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3200 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_3200 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3200 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3200 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3200 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3200 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3200 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3300
    * @tc.name      : test createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: undefined, authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3300 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_3300 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3300 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3300 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3300 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3300 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3300 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3400
    * @tc.name      : test createAccountImplicitly with authType&parameters options
    * @tc.desc      : authType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: null, authType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3400 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              console.info("====>ActsAccountOptionalParameter_3400 resultData:" + JSON.stringify(resultData));
              expect(resultData.account.name).assertEqual("createNewAccountName")
              expect(resultData.account.owner).assertEqual("com.example.accounttstest")
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3400 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3400 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3400 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3400 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3400 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3500
    * @tc.name      : test createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      : requiredLabels&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3500 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3500 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3500 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3500 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3500 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3500 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3600
    * @tc.name      : test createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      : requiredLabels&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3600 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3600 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3600 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3600 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3600 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3600 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3700
    * @tc.name      : test createAccountImplicitly with requiredLabels&parameters options
    * @tc.desc      : requiredLabels&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['male', '30-40'], authType: null, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      try {
        appAccountManager.createAccountImplicitly("com.example.accounttstest", options, {
          onResult: async (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3700 resultcode:" + JSON.stringify(resultCode));
              expect(resultCode).assertEqual(12300002)
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3700 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3700 end====");
              done();
            }
          },
          onRequestRedirected: null,
          onRequestContinued: () => {
            console.info("====>ActsAccountOptionalParameter_3700 onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3700 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3700 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3800
    * @tc.name      : test auth
    * @tc.desc      : no option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3800 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.acts.accountauthenticator", "authType", {
          onResult: (resultCode) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3800 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3800 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3800 end====");
              done();
            }
          },
          onRequestRedirected: () => {
            console.info("====>onRequestRedirected")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3800 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3800 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_3900
    * @tc.name      : test auth
    * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_3900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_3900 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.acts.accountauthenticator", "authType", {}, {
          onResult: (resultCode, resultData) => {
            try {
              console.info("====>ActsAccountOptionalParameter_3900 authenticate resultCode:" + JSON.stringify(resultCode));
              console.info("====>ActsAccountOptionalParameter_3900 authenticate resultData:" + JSON.stringify(resultData));
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_3900 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_3900 end====");
              done();
            }

          },
          onRequestRedirected: () => {
            console.info("====>onRequestRedirected")
          },
          onRequestContinued: () => {
            console.info("====>_onRequestContinued")
          }
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_3900 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_3900 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4000
    * @tc.name      : test auth
    * @tc.desc      : undefined option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4000 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.acts.accountauthenticator", "authType", undefined, {
          onResult: (resultCode, undefined) => {
            try {
              console.info("====>ActsAccountOptionalParameter_4000 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_4000 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_4000 end====");
              done();
            }
          },
          onRequestRedirected: () => {
            console.info("====>onRequestRedirected")
          },
          onRequestContinued: undefined
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_4000 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_4000 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4100
    * @tc.name      : test auth
    * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4100 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth("authenticate_test_account", "com.acts.accountauthenticator", "authType", null, {
          onResult: (resultCode) => {
            try {
              console.info("====>ActsAccountOptionalParameter_4100 authenticate resultCode:" + JSON.stringify(resultCode));
              done();
            } catch (err) {
              console.info("====>ActsAccountOptionalParameter_4100 err:" + JSON.stringify(err));
              console.info("====>ActsAccountOptionalParameter_4100 end====");
              done();
            }
          },
          onRequestRedirected: () => {
            console.info("====>onRequestRedirected")
          },
          onRequestContinued: null
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_4100 err:" + JSON.stringify(err));
        console.info("====>ActsAccountOptionalParameter_4100 end====");
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4200
    * @tc.name      : test verifyCredential
    * @tc.desc      : no option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4200 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start finish====");
      try {
        appAccountManager.createAccount(name, (err) => {
          console.info("====>ActsAccountOptionalParameter_4200 add_account_err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          appAccountManager.verifyCredential(name, owner, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4200 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        });
      } catch (err) {
        console.info("====>ActsAccountOptionalParameter_4200 err:" + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        expect().assertFail()
        done()
      }
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4300
    * @tc.name      : test verifyCredential
    * @tc.desc      : with full option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                console.info("====>ActsAccountOptionalParameter_4300 verifyCredential_resultData:" + JSON.stringify(resultData));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4300 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4400
    * @tc.name      : test verifyCredential
    * @tc.desc      : undefined option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', undefined, {
            onResult: async (resultCode, undefined) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4400 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: undefined
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4500
    * @tc.name      : test verifyCredential
    * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', null, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4500 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null,
            onRequestContinued: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4600
    * @tc.name      : test verifyCredential
    * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {}
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4600 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4700
    * @tc.name      : test verifyCredential
    * @tc.desc      : undefined options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: undefined, credential: undefined, parameters: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4700 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4800
    * @tc.name      : test verifyCredential
    * @tc.desc      : null options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: null, credential: null, parameters: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4800 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4800 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_4900
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_4900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_4900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN"
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_4900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_4900 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_4900 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_4900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_4900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5000
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: undefined, parameters: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5000 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5000 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5100
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: null, parameters: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5100 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5200
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credential: "123456"
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5200 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5300
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: undefined, credential: "123456", parameters: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5300 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5400
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: null, credential: "123456", parameters: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5400 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5500
    * @tc.name      : test verifyCredential
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5500 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5600
    * @tc.name      : test verifyCredential
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: undefined, credential: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5600 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5700
    * @tc.name      : test verifyCredential
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: null, credential: null, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5700 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5800
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456"
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5800 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5800 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_5900
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_5900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_5900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_5900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_5900 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_5900 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_5900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_5900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6000
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6000 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6000 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6100
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6100 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6100 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                expect().assertFail()
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6200
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6200 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6200 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6300
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: null, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6300 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6300 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                expect().assertFail()
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6400
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6400 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6400 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6500
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: undefined, credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6500 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6500 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6600
    * @tc.name      : test verifyCredential
    * @tc.desc      : credential&parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: null, credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6600 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6600 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6700
    * @tc.name      : test verifyCredential
    * @tc.desc      : credentialType&credential options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456", parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.verifyCredential(name, 'com.acts.accountauthenticator', options, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6700 verifyCredential_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(0)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6700 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done()
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done()
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6800
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : no option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6800 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6800 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6800 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_6900
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : with option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_6900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_6900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_6900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_6900 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_6900 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_6900 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_6900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_6900 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_6900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7000
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : undefined option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, undefined, {
            onResult: async (resultCode, undefined) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7000 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7000 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: undefined
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7100
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, null, {
            onResult: async (resultCode) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7100 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7100 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7100 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: null
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7200
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {}
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7200 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7200 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7200 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7200 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7200 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7200 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7300
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : undefined options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": undefined
        }, parameters: {
          'sex': undefined
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7300 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7300 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7300 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7300 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7300 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
            * @tc.number    : ActsAccountOptionalParameter_7400
            * @tc.name      : test setAuthenticatorProperties
            * @tc.desc      : null options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
            */
    it('ActsAccountOptionalParameter_7400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": null
        }, parameters: {
          'sex': null
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7400 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7400 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7400 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7400 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7400 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7400 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      })
    })

    /*
            * @tc.number    : ActsAccountOptionalParameter_7500
            * @tc.name      : test setAuthenticatorProperties
            * @tc.desc      : properties options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
            */
    it('ActsAccountOptionalParameter_7500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7500 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7500 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7500 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7500 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7500 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7600
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : properties options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }, parameters: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7600 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7600 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7600 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7600 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7600 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7600 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7700
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : properties options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: {
          "prop1": "value1"
        }, parameters: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7700 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7700 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7700 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7700 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7700 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7800
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7800 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7800 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7800 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7800 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7800 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7800 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_7900
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_7900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_7900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: undefined, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_7900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_7900 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_7900 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_7900 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_7900 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_7900 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_7900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8000
    * @tc.name      : test setAuthenticatorProperties
    * @tc.desc      : parameters options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_8000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: null, parameters: {
          'sex': 'male'
        }
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.setAuthenticatorProperties(owner, options, {
            onResult: async (resultCode, resultData) => {
              try {
                console.info("====>ActsAccountOptionalParameter_8000 setAuthenticatorProperties_resultcode:" + JSON.stringify(resultCode));
                expect(resultCode).assertEqual(12300113)
                console.info("====>ActsAccountOptionalParameter_8000 setAuthenticatorProperties_resultData:" + JSON.stringify(resultData));
                await appAccountManager.removeAccount(name);
                console.info("====>ActsAccountOptionalParameter_8000 success")
                done();
              } catch (err) {
                console.info("====>ActsAccountOptionalParameter_8000 err:" + JSON.stringify(err));
                await appAccountManager.removeAccount(name);
                done();
              }
            },
            onRequestRedirected: null,
            onRequestContinued: () => {
              console.info("====>ActsAccountOptionalParameter_8000 verifyCredential_onRequestContinued")
            }
          });
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8000 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8100
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_8100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {}
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        try {
          console.info("====>ActsAccountOptionalParameter_8100 add_account_err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_8100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8100 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8200
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : empty option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_8200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {}
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8200 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8300
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : with option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_8300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_8300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8300 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8400
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : with option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_8400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8400 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8500
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : undefined options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_8500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_8500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8500 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8600
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : undefined option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_8600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8600 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8700
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_8700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_8700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8700 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_8800
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : null option
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_8800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8800 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_8900
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_8900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_8900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_8900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_8900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_8900 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_8900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9000
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9000 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9100
    * @tc.name      : test selectAccountsByOptions callback
    * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_9100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9100 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_9100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9200
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9200 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9300
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_9300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_9300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9300 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_9300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9400
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9400 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9500
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_9500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ["com.example.accounttstest"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_9500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9500 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_9500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9600
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ["com.example.accounttstest"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9600 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9700
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_9700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_9700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9700 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_9700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_9800
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_9800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9800 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_9900
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_9900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_9900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_9900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_9900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_9900 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_9900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10000
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_10000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10000 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10100
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_10100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_10100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10100 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_10100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10200
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_10200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10200 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10300
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_10300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_10300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10300 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_10300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10400
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_10400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10400 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10500
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_10500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_10500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10500 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_10500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10600
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_10600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: null, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10600 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10700
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_10700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_10700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10700 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_10700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_10800
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_10800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10800 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_10900
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_10900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_10900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_10900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_10900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_10900 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_10900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11000
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_11000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: undefined
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11000 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11100
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_11100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_11100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11100 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_11100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11200
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&allowedOwners options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_11200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: ["com.example.accounttstest"], requiredLabels: null
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(1)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11200 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11300
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_11300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_11300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11300 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_11300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11400
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_11400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11400 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11500
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_11500', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11500 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11500 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_11500 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11500 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_11500 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11600
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_11600', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: undefined, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11600 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11600 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11700
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_11700', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11700 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11700 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_11700 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11700 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_11700 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_11800
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedAccounts&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_11800', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{
          "name": name, "owner": owner
        }], allowedOwners: null, requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11800 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11800 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_11900
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_11900', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_11900 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_11900 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_11900 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_11900 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_11900 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12000
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_12000', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_12000 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_12000 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_12000 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_12100
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_12100', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_12100 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_12100 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_12100 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_12100 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_12100 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12200
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_12200', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_12200 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: undefined, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_12200 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_12200 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
     * @tc.number    : ActsAccountOptionalParameter_12300
     * @tc.name      : test selectAccountsByOptions callback
     * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
     */
    it('ActsAccountOptionalParameter_12300', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_12300 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_12300 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          appAccountManager.selectAccountsByOptions(options, async (err, accountArr) => {
            console.info("====>ActsAccountOptionalParameter_12300 accountArr:" + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_12300 success")
            done();
          })
        } catch (err) {
          console.info("====>ActsAccountOptionalParameter_12300 err:" + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });

    /*
    * @tc.number    : ActsAccountOptionalParameter_12400
    * @tc.name      : test selectAccountsByOptions promise
    * @tc.desc      : allowedOwners&requiredLabels options
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('ActsAccountOptionalParameter_12400', 0, async (done: Function) => {
      console.info("====>ActsAccountOptionalParameter_12400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: null, allowedOwners: ["com.example.accounttstest"], requiredLabels: ["student"]
      }
      console.info("====>start finish====");
      appAccountManager.createAccount(name, async (err) => {
        console.info("====>ActsAccountOptionalParameter_12400 add_account_err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        try {
          await appAccountManager.selectAccountsByOptions(options).then(async (accountArr) => {
            console.info("====>selectAccountsByOptions successfully, accountArr: " + JSON.stringify(accountArr));
            expect(accountArr.length).assertEqual(0)
            await appAccountManager.removeAccount(name);
            console.info("====>ActsAccountOptionalParameter_12400 success")
            done()
          }).catch(async (err: BusinessError) => {
            console.info("====>selectAccountsByOptions failed, error: " + JSON.stringify(err));
            await appAccountManager.removeAccount(name);
            done()
          });
        } catch (err) {
          console.info("====>selectAccountsByOptions exception: " + JSON.stringify(err));
          await appAccountManager.removeAccount(name);
          expect().assertFail()
          done();
        }
      });
    });
  })
}
