/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { AccountErrCode } from './AccountErrCode.test.js'

const NAMELIMIT = 512;
const LENGTHLIMIT = 1024;
const ERR_PARAMETER_CHECK_FAILD = 401
const ERR_INVALID_PARAMETER = 12300002
const createAccountOptions = { customData: { age: '12' } } //k and v length 1024 ,k and v size 1024
const createAccountOptionsDiff = { customData: { sex: 'male' } }

export default function ActsAccountCreateAccount() {
  describe('ActsAccountCreateAccount', function () {

    /**
     * @tc.name   ActsAccountCreateAccount_0100
     * @tc.number ActsAccountCreateAccount_0100
     * @tc.desc   Add account in callback form without additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0100 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_first", (err) => {
        console.info("====>add account ActsAccountCreateAccount_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_first", (err) => {
          console.info("====>delete Account ActsAccountCreateAccount_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountCreateAccount_0100 end====");
          done();
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0200
     * @tc.number ActsAccountCreateAccount_0200
     * @tc.desc   Add account in promise form without additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0200 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>add account start====");
      try {
        await appAccountManager.createAccount("account_name_promise_first");
      } catch (err) {
        console.error("====>add account fail err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountCreateAccount_0200 start====");
        await appAccountManager.removeAccount("account_name_promise_first");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountCreateAccount_0200 end====");
      done();
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0300
     * @tc.number ActsAccountCreateAccount_0300
     * @tc.desc   Add account in callback form with additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0300 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.createAccount("account_name_callback_second", createAccountOptions, (err) => {
        console.info("====>add account ActsAccountCreateAccount_0300 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount("account_name_callback_second", (err) => {
          console.info("====>delete Account ActsAccountCreateAccount_0300 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountCreateAccount_0300 end====");
          done();
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0400
     * @tc.number ActsAccountCreateAccount_0400
     * @tc.desc   Add account in promise form with additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>add account start====");
      try {
        await appAccountManager.createAccount("account_name_promise_second", createAccountOptions);
      } catch (err) {
        console.error("====>add account fail err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountCreateAccount_0400 start====");
        await appAccountManager.removeAccount("account_name_promise_second");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountCreateAccount_0400 end====");
      done();
    });


    /**
     * @tc.name   ActsAccountCreateAccount_0500
     * @tc.number ActsAccountCreateAccount_0500
     * @tc.desc   Repeatedly add the same name account and the same additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0500 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount("account_name_callback_third", createAccountOptions, (err) => {
        console.info("====>add account first time ActsAccountCreateAccount_0500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.createAccount("account_name_callback_third", createAccountOptions, (err) => {
          console.info("====>add account second time ActsAccountCreateAccount_0500 err:" + JSON.stringify(err));
          console.info("====>ActsAccountCreateAccount_0500 AccountErrCode.JsErrCode:" + AccountErrCode.ERR_JS_ACCOUNT_ALREADY_EXIST);
          expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_ALREADY_EXIST);
          appAccountManager.removeAccount("account_name_callback_third", (err) => {
            console.info("====>delete Account ActsAccountCreateAccount_0500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
            console.info("====>ActsAccountCreateAccount_0500 end====");
            done();
          });
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0600
     * @tc.number ActsAccountCreateAccount_0600
     * @tc.desc   Repeatedly add the same name account and the same additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsAccountCreateAccount_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountCreateAccount_0600 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account for the first time ActsAccountCreateAccount_0600====");
      await appAccountManager.createAccount("account_name_promise_third", createAccountOptions);
      console.info("====>add account for the second time ActsAccountCreateAccount_0600 start====");
      try {
        await appAccountManager.createAccount("account_name_promise_third", createAccountOptions);
      } catch (err) {
        console.info("====>add account for the second time 0600 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_ALREADY_EXIST);
        await appAccountManager.removeAccount("account_name_promise_third");
        console.info("====>ActsAccountCreateAccount_0600 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0700
     * @tc.number ActsAccountCreateAccount_0700
     * @tc.desc   The account name exceeds the length limit of 512 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_0700 start====");
      var limitAccountName = '';
      for (var i = 0; i < NAMELIMIT + 1; i++) {
        limitAccountName += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount(limitAccountName, createAccountOptions, (err) => {
        console.info("====>add account ActsAccountCreateAccount_0700 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_0700 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0800
     * @tc.number ActsAccountCreateAccount_0800
     * @tc.desc   The account name exceeds the length limit of 512 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_0800 start====");
      var limitAccountName = '';
      for (var i = 0; i < NAMELIMIT + 1; i++) {
        limitAccountName += 'n';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount(limitAccountName, createAccountOptions);
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>add account ActsAccountCreateAccount_0800 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_0800 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_0900
     * @tc.number ActsAccountCreateAccount_0900
     * @tc.desc   Additional information exceeds the length limit of 1024 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_0900 start====");
      var limitAccountExtra = '';
      for (var i = 0; i < LENGTHLIMIT + 1; i++) {
        limitAccountExtra += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount("account_name_callback_fifth", {
        customData: {
          age: limitAccountExtra
        }
      }, (err) => {
        console.info("====>add account ActsAccountCreateAccount_0900 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_0900 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1000
     * @tc.number ActsAccountCreateAccount_1000
     * @tc.desc   Additional information exceeds the length limit of 1024 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1000 start====");
      var limitAccountExtra = '';
      for (var i = 0; i < LENGTHLIMIT + 1; i++) {
        limitAccountExtra += 'e';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount("account_name_promise_fifth", {
          customData: {
            [limitAccountExtra]: '12'
          }
        });
      } catch (err) {
        console.info("====>add account ActsAccountCreateAccount_1000 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_1000 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1100
     * @tc.number ActsAccountCreateAccount_1100
     * @tc.desc   The account name is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1100 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount("", createAccountOptions, (err) => {
        console.info("====>add account ActsAccountCreateAccount_1100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_1100 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1200
     * @tc.number ActsAccountCreateAccount_1200
     * @tc.desc   The account name is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1200 start====");
      console.info("====>ActsAccountCreateAccount_1200 add account start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount("", createAccountOptions);
      } catch (err) {
        console.info("====>add account ActsAccountCreateAccount_1200 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsAccountCreateAccount_1200 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1300
     * @tc.number ActsAccountCreateAccount_1300
     * @tc.desc   Additional information is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1300 start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.createAccount("account_name_callback_seventh", "", (err) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_1300 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1400
     * @tc.number ActsAccountCreateAccount_1400
     * @tc.desc   Additional information is an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account ActsAccountCreateAccount_1400 start====");
      try {
        await appAccountManager.createAccount("account_name_promise_seventh", "");
      } catch (err) {
        console.error("====>add account ActsAccountCreateAccount_1400 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1500
     * @tc.number ActsAccountCreateAccount_1500
     * @tc.desc   The account name is a special character such as a space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1500 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      try {
        appAccountManager.createAccount(specialStr, createAccountOptions, (err) => {
          console.error("====>createAccount ActsAccountCreateAccount_1500 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountCreateAccount_1500 end====");
          appAccountManager.removeAccount(" ", (err) => {
            console.error("====>removeAccount ActsAccountCreateAccount_1500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
            done();
          });
        });
      } catch (err) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1600
     * @tc.number ActsAccountCreateAccount_1600
     * @tc.desc   The account name is a special character such as a space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1600 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      try {
        await appAccountManager.createAccount(specialStr, createAccountOptions);
        await appAccountManager.removeAccount(specialStr);
        done();
      } catch (err) {
        console.info("====>createAccount ActsAccountCreateAccount_1600 err:" + JSON.stringify(err));
        expect().assertFail();
        console.info("====>ActsAccountCreateAccount_1600 end====");
        done();
      }
    });


    /**
     * @tc.name   ActsAccountCreateAccount_1700
     * @tc.number ActsAccountCreateAccount_1700
     * @tc.desc   The account name is a special string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1700 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      appAccountManager.createAccount(specialStr, createAccountOptions, (err) => {
        console.info("====>add account ActsAccountCreateAccount_1700 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(specialStr, (err) => {
          console.info("====>delete Account ActsAccountCreateAccount_1700 err" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountCreateAccount_1700 end====");
          done();
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1800
     * @tc.number ActsAccountCreateAccount_1800
     * @tc.desc   The account name is a special string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1800 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      console.info("====>add account ActsAccountCreateAccount_1800====");
      try {
        await appAccountManager.createAccount(specialStr, createAccountOptions);
      } catch (err) {
        console.error("====>add Account ActsAccountCreateAccount_1800 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountCreateAccount_1800====");
        await appAccountManager.removeAccount(specialStr);
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountCreateAccount_1800 end====");
      done();
    });

    /**
     * @tc.name   ActsAccountCreateAccount_1900
     * @tc.number ActsAccountCreateAccount_1900
     * @tc.desc   Additional information is a special character such as a space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_1900 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      try {
        appAccountManager.createAccount("account_name_callback_tenth", specialStr, (err) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_1900 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2000
     * @tc.number ActsAccountCreateAccount_2000
     * @tc.desc   Additional information is a special character such as a space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_2000 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      console.info("====>add account ActsAccountCreateAccount_2000====");
      try {
        await appAccountManager.createAccount("account_name_promise_tenth", specialStr);
      } catch (err) {
        console.error("====>add Account ActsAccountCreateAccount_2000 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_2000 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2100
     * @tc.number ActsAccountCreateAccount_2100
     * @tc.desc   Additional information is a special string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_2100 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      try {
        appAccountManager.createAccount("account_extraInfo_callback_eleventh", specialStr, (err) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_2100 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2200
     * @tc.number ActsAccountCreateAccount_2200
     * @tc.desc   Additional information is a special string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_2200 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      console.info("====>add account ActsAccountCreateAccount_2200====");
      try {
        await appAccountManager.createAccount("account_extraInfo_promise_eleventh", specialStr);
      } catch (err) {
        console.error("====>add Account ActsAccountCreateAccount_2200 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_2200 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2300
     * @tc.number ActsAccountCreateAccount_2300
     * @tc.desc   Repeatedly add accounts with the same name and different additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_2300 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount("account_name_callback_same", createAccountOptions, (err) => {
        console.info("====>add account first time ActsAccountCreateAccount_2300 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.createAccount("account_name_callback_same", createAccountOptionsDiff, (err) => {
          console.info("====>add account second time ActsAccountCreateAccount_2300 err:" + JSON.stringify(err));
          expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_ALREADY_EXIST);
          appAccountManager.removeAccount("account_name_callback_same", (err) => {
            console.info("====>delete Account ActsAccountCreateAccount_2300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
            console.info("====>ActsAccountCreateAccount_2300 end====");
            done();
          });
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2400
     * @tc.number ActsAccountCreateAccount_2400
     * @tc.desc   Repeatedly add accounts with the same name and different additional information
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsAccountCreateAccount_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountCreateAccount_2400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account for the first time ActsAccountCreateAccount_2400====");
      await appAccountManager.createAccount("account_name_promise_same", createAccountOptions);
      console.info("====>add account for the second time ActsAccountCreateAccount_2400====");
      try {
        await appAccountManager.createAccount("account_name_promise_same", createAccountOptionsDiff);
      } catch (err) {
        console.info("====>add account for the second time err:" + JSON.stringify(err));
        expect(err.code).assertEqual(AccountErrCode.ERR_JS_ACCOUNT_ALREADY_EXIST);
        await appAccountManager.removeAccount("account_name_promise_same");
        console.info("====>ActsAccountCreateAccount_2400 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2500
     * @tc.number ActsAccountCreateAccount_2500
     * @tc.desc   The account name reaches the limit of 512 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsAccountCreateAccount_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountCreateAccount_2500 start====");
      var limitName = '';
      for (var i = 0; i < NAMELIMIT; i++) {
        limitName += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccount(limitName, createAccountOptions, (err) => {
        console.info("====>add account ActsAccountCreateAccount_2500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.removeAccount(limitName, (err) => {
          console.info("====>delete Account ActsAccountCreateAccount_2500 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountCreateAccount_2500 end====");
          done();
        });
      });
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2600
     * @tc.number ActsAccountCreateAccount_2600
     * @tc.desc   The account name reaches the limit of 512 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsAccountCreateAccount_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountCreateAccount_2600 start====");
      var nameLimit = '';
      for (var i = 0; i < NAMELIMIT; i++) {
        nameLimit += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account ActsAccountCreateAccount_2600 start====");
      try {
        await appAccountManager.createAccount(nameLimit, createAccountOptions);
      } catch (err) {
        console.error("====>add account ActsAccountCreateAccount_2600 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountCreateAccount_2600 start====");
        await appAccountManager.removeAccount(nameLimit);
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountCreateAccount_2600 end====");
      done();
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2700
     * @tc.number ActsAccountCreateAccount_2700
     * @tc.desc   Additional information reaches the limit of 1024 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsAccountCreateAccount_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountCreateAccount_2700 start====");
      var limitExtra = '';
      for (var i = 0; i < LENGTHLIMIT; i++) {
        limitExtra += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.createAccount("account_extra_callback_limit", limitExtra, (err) => {
          expect().assertFail();
          done();
        });
      } catch (err) {
        expect(err.code).assertEqual(401);
        console.info("====>ActsAccountCreateAccount_2700 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsAccountCreateAccount_2800
     * @tc.number ActsAccountCreateAccount_2800
     * @tc.desc   Additional information reaches the limit of 1024 characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsAccountCreateAccount_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountCreateAccount_2800 start====");
      var extraLimit = '';
      for (var i = 0; i < LENGTHLIMIT; i++) {
        extraLimit += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount("account_extra_promise_limit", extraLimit);
      } catch (err) {
        console.error("====>add account ActsAccountCreateAccount_2800 err:" + JSON.stringify(err));
        console.info("====>ActsAccountCreateAccount_2800 end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });
  })
}
