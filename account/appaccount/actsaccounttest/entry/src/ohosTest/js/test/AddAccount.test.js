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

const NAMELIMIT = 512;
const LENGTHLIMIT = 1024;

export default function ActsAccountAddAccount() {
  describe('ActsAccountAddAccount', function () {

    /*
    * @tc.number    : ActsAccountAddAccount_0100
    * @tc.name      : Add account callback form
    * @tc.desc      : Add account in callback form without additional information
    */
    it('ActsAccountAddAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountAddAccount_0100 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.addAccount("account_name_callback_first", (err) => {
        console.info("====>add account ActsAccountAddAccount_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_name_callback_first", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_0100 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_0100 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0200
    * @tc.name      : Add account promise form
    * @tc.desc      : Add account in promise form without additional information
    */
    it('ActsAccountAddAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountAddAccount_0200 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>add account start====");
      try {
        await appAccountManager.addAccount("account_name_promise_first");
      } catch (err) {
        console.error("====>add account fail err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_0200 start====");
        await appAccountManager.deleteAccount("account_name_promise_first");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_0200 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0300
    * @tc.name      : Add account callback form
    * @tc.desc      : Add account in callback form with additional information
    */
    it('ActsAccountAddAccount_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountAddAccount_0300 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      appAccountManager.addAccount("account_name_callback_second", "account_extraInfo_callback_second", (err) => {
        console.info("====>add account ActsAccountAddAccount_0300 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_name_callback_second", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_0300 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_0300 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0400
    * @tc.name      : Add account promise form
    * @tc.desc      : Add account in promise form with additional information
    */
    it('ActsAccountAddAccount_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsAccountAddAccount_0400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>creat finish====");
      console.info("====>add account start====");
      try {
        await appAccountManager.addAccount("account_name_promise_second", "account_extraInfo_promise_second");
      } catch (err) {
        console.error("====>add account fail err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_0400 start====");
        await appAccountManager.deleteAccount("account_name_promise_second");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_0400 end====");
      done();
    });


    /*
    * @tc.number    : ActsAccountAddAccount_0500
    * @tc.name      : Add account callback form
    * @tc.desc      : Repeatedly add the same name account and the same additional information
    */
    it('ActsAccountAddAccount_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_0500 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("account_name_callback_third", "account_extraInfo_callback_third", (err) => {
        console.info("====>add account first time ActsAccountAddAccount_0500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.addAccount("account_name_callback_third", "account_extraInfo_callback_third", (err) => {
          console.info("====>add account second time ActsAccountAddAccount_0500 err:" + JSON.stringify(err));
          expect(err.code != 0).assertEqual(true);
          appAccountManager.deleteAccount("account_name_callback_third", (err) => {
            console.info("====>delete Account ActsAccountAddAccount_0500 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
            console.info("====>ActsAccountAddAccount_0500 end====");
            done();
          });
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0600
    * @tc.name      : Add account promise form
    * @tc.desc      : Repeatedly add the same name account and the same additional information
    */
    it('ActsAccountAddAccount_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_0600 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account for the first time ActsAccountAddAccount_0600====");
      await appAccountManager.addAccount("account_name_promise_third", "account_extraInfo_promise_third");
      console.info("====>add account for the second time ActsAccountAddAccount_0600 start====");
      try {
        await appAccountManager.addAccount("account_name_promise_third", "account_extraInfo_promise_third");
      } catch (err) {
        console.info("====>add account for the second time 0600 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        await appAccountManager.deleteAccount("account_name_promise_third");
        console.info("====>ActsAccountAddAccount_0600 end====");
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0700
    * @tc.name      : Add account callback form
    * @tc.desc      : The account name exceeds the length limit of 512 characters
    */
    it('ActsAccountAddAccount_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_0700 start====");
      var limitAccountName = '';
      for (var i = 0; i < NAMELIMIT + 1; i++) {
        limitAccountName += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount(limitAccountName, "account_extraInfo_callback_fourth", (err) => {
        console.info("====>add account ActsAccountAddAccount_0700 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_0700 end====");
        done();
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0800
    * @tc.name      : Add account promise form
    * @tc.desc      : The account name exceeds the length limit of 512 characters
    */
    it('ActsAccountAddAccount_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_0800 start====");
      var limitAccountName = '';
      for (var i = 0; i < NAMELIMIT + 1; i++) {
        limitAccountName += 'n';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.addAccount(limitAccountName, "account_extraInfo_promise_fourth");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>add account ActsAccountAddAccount_0800 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_0800 end====");
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountAddAccount_0900
    * @tc.name      : Add account callback form
    * @tc.desc      : Additional information exceeds the length limit of 1024 characters
    */
    it('ActsAccountAddAccount_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_0900 start====");
      var limitAccountExtra = '';
      for (var i = 0; i < LENGTHLIMIT + 1; i++) {
        limitAccountExtra += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("account_name_callback_fifth", limitAccountExtra, (err) => {
        console.info("====>add account ActsAccountAddAccount_0900 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_0900 end====");
        done();
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1000
    * @tc.name      : Add account promise form
    * @tc.desc      : Additional information exceeds the length limit of 1024 characters
    */
    it('ActsAccountAddAccount_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1000 start====");
      var limitAccountExtra = '';
      for (var i = 0; i < LENGTHLIMIT + 1; i++) {
        limitAccountExtra += 'e';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.addAccount("account_name_promise_fifth", limitAccountExtra);
      } catch (err) {
        console.info("====>add account ActsAccountAddAccount_1000 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_1000 end====");
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1100
    * @tc.name      : Add account callback form
    * @tc.desc      : The account name is an empty string
    */
    it('ActsAccountAddAccount_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1100 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("", "account_name_callback_sixth", (err) => {
        console.info("====>add account ActsAccountAddAccount_1100 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_1100 end====");
        done();
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1200
    * @tc.name      : Add account promise form
    * @tc.desc      : The account name is an empty string
    */
    it('ActsAccountAddAccount_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1200 start====");
      console.info("====>ActsAccountAddAccount_1200 add account start====");
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.addAccount("", "account_name_promise_sixth");
      } catch (err) {
        console.info("====>add account ActsAccountAddAccount_1200 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_1200 end====");
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1300
    * @tc.name      : Add account callback form
    * @tc.desc      : Additional information is an empty string
    */
    it('ActsAccountAddAccount_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1300 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("account_name_callback_seventh", "", (err) => {
        console.info("====>add account ActsAccountAddAccount_1300 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_name_callback_seventh", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_1300 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_1300 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1400
    * @tc.name      : Add account promise form
    * @tc.desc      : Additional information is an empty string
    */
    it('ActsAccountAddAccount_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account ActsAccountAddAccount_1400 start====");
      try {
        await appAccountManager.addAccount("account_name_promise_seventh", "");
      } catch (err) {
        console.error("====>add account ActsAccountAddAccount_1400 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_1400 start====");
        await appAccountManager.deleteAccount("account_name_promise_seventh");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1500
    * @tc.name      : Add account callback form
    * @tc.desc      : The account name is a special character such as a space
    */
    it('ActsAccountAddAccount_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1500 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      appAccountManager.addAccount(specialStr, "account_extraInfo_callback_eight", (err) => {
        console.info("====>add account ActsAccountAddAccount_1500 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        console.info("====>ActsAccountAddAccount_1500 end====");
        done();
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1600
    * @tc.name      : Add account promise form
    * @tc.desc      : The account name is a special character such as a space
    */
    it('ActsAccountAddAccount_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1600 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      try {
        await appAccountManager.addAccount(specialStr, "account_extraInfo_promise_eighth");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>add Account ActsAccountAddAccount_1600 throw_err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        done();
      }
    });


    /*
    * @tc.number    : ActsAccountAddAccount_1700
    * @tc.name      : Add account callback form
    * @tc.desc      : The account name is a special string
    */
    it('ActsAccountAddAccount_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1700 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      appAccountManager.addAccount(specialStr, "account_extraInfo_callback_ninth", (err) => {
        console.info("====>add account ActsAccountAddAccount_1700 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount(specialStr, (err) => {
          console.info("====>delete Account ActsAccountAddAccount_1700 err" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_1700 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1800
    * @tc.name      : Add account promise form
    * @tc.desc      : The account name is a special string
    */
    it('ActsAccountAddAccount_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1800 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      console.info("====>add account ActsAccountAddAccount_1800====");
      try {
        await appAccountManager.addAccount(specialStr, "account_extraInfo_promise_ninth");
      } catch (err) {
        console.error("====>add Account ActsAccountAddAccount_1800 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_1800====");
        await appAccountManager.deleteAccount(specialStr);
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_1800 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_1900
    * @tc.name      : Add account callback form
    * @tc.desc      : Additional information is a special character such as a space
    */
    it('ActsAccountAddAccount_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_1900 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      appAccountManager.addAccount("account_name_callback_tenth", specialStr, (err) => {
        console.info("====>add account ActsAccountAddAccount_1900 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_name_callback_tenth", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_1900 err" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_1900 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2000
    * @tc.name      : Add account promise form
    * @tc.desc      : Additional information is a special character such as a space
    */
    it('ActsAccountAddAccount_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_2000 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = " ";
      console.info("====>add account ActsAccountAddAccount_2000====");
      try {
        await appAccountManager.addAccount("account_name_promise_tenth", specialStr);
      } catch (err) {
        console.error("====>add Account ActsAccountAddAccount_2000 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_2000====");
        await appAccountManager.deleteAccount("account_name_promise_tenth");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_2000 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2100
    * @tc.name      : Add account callback form
    * @tc.desc      : Additional information is a special string
    */
    it('ActsAccountAddAccount_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_2100 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      appAccountManager.addAccount("account_extraInfo_callback_eleventh", specialStr, (err) => {
        console.info("====>add account ActsAccountAddAccount_2100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_extraInfo_callback_eleventh", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_2100 err" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_2100 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2200
    * @tc.name      : Add account promise form
    * @tc.desc      : Additional information is a special string
    */
    it('ActsAccountAddAccount_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_2200 start====");
      var appAccountManager = account.createAppAccountManager();
      var specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
      console.info("====>add account ActsAccountAddAccount_2200====");
      try {
        await appAccountManager.addAccount("account_extraInfo_promise_eleventh", specialStr);
      } catch (err) {
        console.error("====>add Account ActsAccountAddAccount_2200 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_2200====");
        await appAccountManager.deleteAccount("account_extraInfo_promise_eleventh");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_2200 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2300
    * @tc.name      : Add account callback form
    * @tc.desc      : Repeatedly add accounts with the same name and different additional information
    */
    it('ActsAccountAddAccount_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_2300 start====");
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("account_name_callback_same", "account_extraInfo_callback", (err) => {
        console.info("====>add account first time ActsAccountAddAccount_2300 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.addAccount("account_name_callback_same", "account_extraInfo_callback_different", (err) => {
          console.info("====>add account second time ActsAccountAddAccount_2300 err:" + JSON.stringify(err));
          expect(err.code != 0).assertEqual(true);
          appAccountManager.deleteAccount("account_name_callback_same", (err) => {
            console.info("====>delete Account ActsAccountAddAccount_2300 err:" + JSON.stringify(err));
            expect(err).assertEqual(null);
            console.info("====>ActsAccountAddAccount_2300 end====");
            done();
          });
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2400
    * @tc.name      : Add account promise form
    * @tc.desc      : Repeatedly add accounts with the same name and different additional information
    */
    it('ActsAccountAddAccount_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsAccountAddAccount_2400 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account for the first time ActsAccountAddAccount_2400====");
      await appAccountManager.addAccount("account_name_promise_same", "account_extraInfo_promise");
      console.info("====>add account for the second time ActsAccountAddAccount_2400====");
      try {
        await appAccountManager.addAccount("account_name_promise_same", "account_extraInfo_promise_different");
      } catch (err) {
        console.info("====>add account for the second time err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true);
        await appAccountManager.deleteAccount("account_name_promise_same");
        console.info("====>ActsAccountAddAccount_2400 end====");
        done();
      }
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2500
    * @tc.name      : Add account callback form
    * @tc.desc      : The account name reaches the limit of 512 characters
    */
    it('ActsAccountAddAccount_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountAddAccount_2500 start====");
      var limitName = '';
      for (var i = 0; i < NAMELIMIT; i++) {
        limitName += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount(limitName, "account_extraInfo_callback", (err) => {
        console.info("====>add account ActsAccountAddAccount_2500 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount(limitName, (err) => {
          console.info("====>delete Account ActsAccountAddAccount_2500 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_2500 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2600
    * @tc.name      : Add account promise form
    * @tc.desc      : The account name reaches the limit of 512 characters
    */
    it('ActsAccountAddAccount_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountAddAccount_2600 start====");
      var nameLimit = '';
      for (var i = 0; i < NAMELIMIT; i++) {
        nameLimit += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      console.info("====>add account ActsAccountAddAccount_2600 start====");
      try {
        await appAccountManager.addAccount(nameLimit, "account_extraInfo_promise");
      } catch (err) {
        console.error("====>add account ActsAccountAddAccount_2600 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_2600 start====");
        await appAccountManager.deleteAccount(nameLimit);
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_2600 end====");
      done();
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2700
    * @tc.name      : Add account callback form
    * @tc.desc      : Additional information reaches the limit of 1024 characters
    */
    it('ActsAccountAddAccount_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountAddAccount_2700 start====");
      var limitExtra = '';
      for (var i = 0; i < LENGTHLIMIT; i++) {
        limitExtra += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      appAccountManager.addAccount("account_extra_callback_limit", limitExtra, (err) => {
        console.info("====>add account ActsAccountAddAccount_2700 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        appAccountManager.deleteAccount("account_extra_callback_limit", (err) => {
          console.info("====>delete Account ActsAccountAddAccount_2700 err:" + JSON.stringify(err));
          expect(err).assertEqual(null);
          console.info("====>ActsAccountAddAccount_2700 end====");
          done();
        });
      });
    });

    /*
    * @tc.number    : ActsAccountAddAccount_2800
    * @tc.name      : Add account promise form
    * @tc.desc      : Additional information reaches the limit of 1024 characters
    */
    it('ActsAccountAddAccount_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsAccountAddAccount_2800 start====");
      var extraLimit = '';
      for (var i = 0; i < LENGTHLIMIT; i++) {
        extraLimit += 't';
      }
      var appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.addAccount("account_extra_promise_limit", extraLimit);
      } catch (err) {
        console.error("====>add account ActsAccountAddAccount_2800 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        console.info("====>delete account ActsAccountAddAccount_2800 start====");
        await appAccountManager.deleteAccount("account_extra_promise_limit");
      } catch (err) {
        console.info("====>delete account err:" + JSON.stringify(err));
      }
      console.info("====>ActsAccountAddAccount_2800 end====");
      done();
    });
  })
}