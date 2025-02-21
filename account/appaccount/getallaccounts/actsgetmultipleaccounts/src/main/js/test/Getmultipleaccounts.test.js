/*
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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
import featureAbility from '@ohos.ability.featureAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const TIMEOUT = 5000;

export default function ActsGetMultipleAccounts() {
  describe('ActsGetMultipleAccounts', function () {
    beforeAll(async function (done) {
      console.info("====>startAbility first start====");
      await featureAbility.startAbility(
        {
          want:
          {
            deviceId: "",
            bundleName: "com.example.actsaccountaccessiblefirst",
            abilityName: "com.example.actsaccountaccessiblefirst.MainAbility",
            action: "action1",
            parameters:
            {},
          },
        },
      );
      sleep(TIMEOUT);
      done();
    });

    function sleep(delay) {
      var start = (new Date()).getTime();
      while ((new Date()).getTime() - start < delay) {
        continue;
      }
    }

    /*
    * @tc.number    : ActsgetAllAccounts_0100
    * @tc.name      : getAllAccounts promise
    * @tc.desc      : This application adds multiple account, other applications authorizes multiple accounts to this
    *                 application and this application obtains authorization
    */
    it('ActsgetAllAccounts_0100', 0, async function (done) {
      console.info("====>ActsGetMultipleAccounts_0100 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0100 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0100 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0100 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>getAllAccounts 0100 start====");
      try {
        var data = await appAccountManager.getAllAccounts();
      } catch (err) {
        console.info("====>getAllAccounts 0100 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccounts 0100 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("account_name_scene_first_first")).assertTrue();
      if (dataMap.has("account_name_scene_first_first")) {
        let data = dataMap.get("account_name_scene_first_first");
        console.info("====>first account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
      }
      expect(dataMap.has("account_name_scene_first_second")).assertTrue();
      if (dataMap.has("account_name_scene_first_second")) {
        let data = dataMap.get("account_name_scene_first_second");
        console.info("====>second account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
      }
      expect(dataMap.has("account_name_scene_second_first")).assertTrue();
      if (dataMap.has("account_name_scene_second_first")) {
        let data = dataMap.get("account_name_scene_second_first");
        console.info("====>third account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
      }
      expect(dataMap.has("account_name_scene_second_second")).assertTrue();
      if (dataMap.has("account_name_scene_second_second")) {
        let data = dataMap.get("account_name_scene_second_second");
        console.info("====>fourth account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_second")) {
        let data = dataMap.get("accessibleAccount_this_application_second");
        console.info("====>sixth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_third")) {
        let data = dataMap.get("accessibleAccount_this_application_third");
        console.info("====>seventh account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
      console.info("====>ActsgetAllAccounts_0100 end====");
      done();
    });

    /*
    * @tc.number    : ActsgetAllAccounts_0200
    * @tc.name      : getAllAccounts callback
    * @tc.desc      : This application adds multiple account, other applications authorizes multiple accounts to this
    *                 application and this application obtains authorization
    */
    it('ActsgetAllAccounts_0200', 0, async function (done) {
      console.info("====>ActsgetAllAccounts_0200 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0200 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0200 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0200 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>getAllAccounts 0200 start====");
      try {
        appAccountManager.getAllAccounts(async (err, data) => {
          console.info("====>getAllAccounts 0200 err:" + JSON.stringify(err));
          console.info("====>getAllAccounts 0200 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("account_name_scene_first_first")).assertTrue();
          if (dataMap.has("account_name_scene_first_first")) {
            let data = dataMap.get("account_name_scene_first_first");
            console.info("====>first account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
          }
          expect(dataMap.has("account_name_scene_first_second")).assertTrue();
          if (dataMap.has("account_name_scene_first_second")) {
            let data = dataMap.get("account_name_scene_first_second");
            console.info("====>second account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
          }
          expect(dataMap.has("account_name_scene_second_first")).assertTrue();
          if (dataMap.has("account_name_scene_second_first")) {
            let data = dataMap.get("account_name_scene_second_first");
            console.info("====>third account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
          }
          expect(dataMap.has("account_name_scene_second_second")).assertTrue();
          if (dataMap.has("account_name_scene_second_second")) {
            let data = dataMap.get("account_name_scene_second_second");
            console.info("====>fourth account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_second")) {
            let data = dataMap.get("accessibleAccount_this_application_second");
            console.info("====>sixth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_third")) {
            let data = dataMap.get("accessibleAccount_this_application_third");
            console.info("====>seventh account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          console.info("====>delete account start====");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
          console.info("====>ActsgetAllAccounts_0200 end====");
          done();
        });
      } catch (err) {
        console.info("====>getAllAccounts 0200 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0100
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : add null user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0100', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0100 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>getAllAccessibleAccounts 0100 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0100 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0100 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          console.info("====>ActsGetAllAccessibleAccounts_0100 end====");
          expect(err).assertEqual(null);
          done();
        });
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0100 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0200
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : add null user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0200', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0100 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>getAllAccessibleAccounts 0200 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0200 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccessibleAccounts 0200 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      expect(data != null).assertTrue();
      done()
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0300
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : add one user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0300', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0300 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0300 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>getAllAccessibleAccounts 0300 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0300 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0300 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          console.info("====>delete account start====");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
          console.info("====>ActsGetAllAccessibleAccounts_0300 end====");
          done();
        });
      } catch (err) {
        console.info("====>ActsGetAllAccessibleAccounts_0300 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0400
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : add one user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0400', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0400 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0400 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>getAllAccessibleAccounts 0400 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0400 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccessibleAccounts 0400 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      console.info("====>ActsGetAllAccessibleAccounts_0400 end====");
      done();
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0500
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : add three user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0500', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0500 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0500 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0500 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0500 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>getAllAccessibleAccounts 0500 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0500 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0500 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_second")) {
            let data = dataMap.get("accessibleAccount_this_application_second");
            console.info("====>sixth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_third")) {
            let data = dataMap.get("accessibleAccount_this_application_third");
            console.info("====>seventh account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          console.info("====>delete account start====");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
          console.info("====>ActsGetAllAccessibleAccounts_0500 end====");
          done();
        });
      } catch (err) {
        console.info("====>ActsGetAllAccessibleAccounts_0500 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0600
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : add three user in current app, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0600', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0600 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0600 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0600 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0600 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>getAllAccessibleAccounts 0600 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0600 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccessibleAccounts 0600 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_second")) {
        let data = dataMap.get("accessibleAccount_this_application_second");
        console.info("====>sixth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_third")) {
        let data = dataMap.get("accessibleAccount_this_application_third");
        console.info("====>seventh account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
      console.info("====>ActsGetAllAccessibleAccounts_0600 end====");
      done();
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0700
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : add three user in current app and delete second user, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0700', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0700 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0700 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0700 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0700 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>delete second account 0700 start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
      console.info("====>getAllAccessibleAccounts 0700 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0700 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0700 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_second")).assertFalse();
          expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_third")) {
            let data = dataMap.get("accessibleAccount_this_application_third");
            console.info("====>seventh account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          console.info("====>delete account start====");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
          console.info("====>ActsGetAllAccessibleAccounts_0700 end====");
          done();
        });
      } catch (err) {
        console.info("====>ActsGetAllAccessibleAccounts_0700 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0800
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : add three user in current app and delete second user, then getAllAccessibleAccounts
    */
    it('ActsGetAllAccessibleAccounts_0800', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0800 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0800 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0800 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>add third account 0800 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_third");
      console.info("====>delete second account 0800 start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
      console.info("====>getAllAccessibleAccounts 0800 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0800 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccessibleAccounts 0800 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_second")).assertFalse();
      expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_third")) {
        let data = dataMap.get("accessibleAccount_this_application_third");
        console.info("====>seventh account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_third");
      console.info("====>ActsGetAllAccessibleAccounts_0800 end====");
      done();
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_0900
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : twice getAllAccessibleAccounts with two user of current app
    */
    it('ActsGetAllAccessibleAccounts_0900', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0900 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 0900 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 0900 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>getAllAccessibleAccounts 0900 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0900 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0900 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_second")) {
            let data = dataMap.get("accessibleAccount_this_application_second");
            console.info("====>sixth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          appAccountManager.getAllAccessibleAccounts(async (err, data) => {
            console.info("====>twice getAllAccessibleAccounts 0900 err:" + JSON.stringify(err));
            console.info("====>twice getAllAccessibleAccounts 0900 data:" + JSON.stringify(data));
            console.info("====>data.length:" + data.length);
            for (let i = 0, len = data.length; i < len; i++) {
              dataMap.set(data[i].name, data[i].owner)
            }
            expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
            if (dataMap.has("accessibleAccount_this_application_first")) {
              let data = dataMap.get("accessibleAccount_this_application_first");
              console.info("====>fifth account owner is: " + data);
              expect(data).assertEqual("com.example.getmultipleaccountstest");
            }
            expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
            if (dataMap.has("accessibleAccount_this_application_second")) {
              let data = dataMap.get("accessibleAccount_this_application_second");
              console.info("====>sixth account owner is: " + data);
              expect(data).assertEqual("com.example.getmultipleaccountstest");
            }
            console.info("====>delete account start====");
            await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
            await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
            console.info("====>ActsGetAllAccessibleAccounts_0900 end====");
            done();
          })
        });
      } catch (err) {
        console.info("====>ActsGetAllAccessibleAccounts_0900 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_1000
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : twice getAllAccessibleAccounts with two user of current app
    */
    it('ActsGetAllAccessibleAccounts_1000', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_1000 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 1000 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>add second account 1000 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_second");
      console.info("====>getAllAccessibleAccounts 1000 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 1000 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_second")) {
        let data = dataMap.get("accessibleAccount_this_application_second");
        console.info("====>sixth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 1000 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_second")) {
        let data = dataMap.get("accessibleAccount_this_application_second");
        console.info("====>sixth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_second");
      console.info("====>ActsGetAllAccessibleAccounts_1000 end====");
      done();
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_1100
    * @tc.name      : getAllAccessibleAccounts callback
    * @tc.desc      : one user of current app and two users of other app
    */
    it('ActsGetAllAccessibleAccounts_1100', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_1100 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 1100 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>getAllAccessibleAccounts 1100 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 1100 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 1100 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          for (let i = 0, len = data.length; i < len; i++) {
            dataMap.set(data[i].name, data[i].owner)
          }
          expect(dataMap.has("account_name_scene_first_first")).assertTrue();
          if (dataMap.has("account_name_scene_first_first")) {
            let data = dataMap.get("account_name_scene_first_first");
            console.info("====>first account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
          }
          expect(dataMap.has("account_name_scene_first_second")).assertTrue();
          if (dataMap.has("account_name_scene_first_second")) {
            let data = dataMap.get("account_name_scene_first_second");
            console.info("====>second account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
          }
          expect(dataMap.has("account_name_scene_second_first")).assertTrue();
          if (dataMap.has("account_name_scene_second_first")) {
            let data = dataMap.get("account_name_scene_second_first");
            console.info("====>third account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
          }
          expect(dataMap.has("account_name_scene_second_second")).assertTrue();
          if (dataMap.has("account_name_scene_second_second")) {
            let data = dataMap.get("account_name_scene_second_second");
            console.info("====>fourth account owner is: " + data);
            expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
          }
          expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
          if (dataMap.has("accessibleAccount_this_application_first")) {
            let data = dataMap.get("accessibleAccount_this_application_first");
            console.info("====>fifth account owner is: " + data);
            expect(data).assertEqual("com.example.getmultipleaccountstest");
          }
          console.info("====>delete account start====");
          await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
          console.info("====>ActsGetAllAccessibleAccounts_1100 end====");
          done();
        });
      } catch (err) {
        console.info("====>ActsGetAllAccessibleAccounts_1100 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : ActsGetAllAccessibleAccounts_1200
    * @tc.name      : getAllAccessibleAccounts promise
    * @tc.desc      : one user of current app and two users of other app
    */
    it('ActsGetAllAccessibleAccounts_1200', 0, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_1200 start====");
      let dataMap = new Map();
      var appAccountManager = account.createAppAccountManager();
      console.info("====>accountmanager create finish====");
      console.info("====>add first account 1200 start====");
      await appAccountManager.addAccount("accessibleAccount_this_application_first");
      console.info("====>getAllAccessibleAccounts 1200 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 1200 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
        return
      }
      console.info("====>getAllAccessibleAccounts 1200 data:" + JSON.stringify(data));
      console.info("====>data.length:" + data.length);
      for (let i = 0, len = data.length; i < len; i++) {
        dataMap.set(data[i].name, data[i].owner)
      }
      expect(dataMap.has("account_name_scene_first_first")).assertTrue();
      if (dataMap.has("account_name_scene_first_first")) {
        let data = dataMap.get("account_name_scene_first_first");
        console.info("====>first account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
      }
      expect(dataMap.has("account_name_scene_first_second")).assertTrue();
      if (dataMap.has("account_name_scene_first_second")) {
        let data = dataMap.get("account_name_scene_first_second");
        console.info("====>second account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
      }
      expect(dataMap.has("account_name_scene_second_first")).assertTrue();
      if (dataMap.has("account_name_scene_second_first")) {
        let data = dataMap.get("account_name_scene_second_first");
        console.info("====>third account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
      }
      expect(dataMap.has("account_name_scene_second_second")).assertTrue();
      if (dataMap.has("account_name_scene_second_second")) {
        let data = dataMap.get("account_name_scene_second_second");
        console.info("====>fourth account owner is: " + data);
        expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
      }
      expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
      if (dataMap.has("accessibleAccount_this_application_first")) {
        let data = dataMap.get("accessibleAccount_this_application_first");
        console.info("====>fifth account owner is: " + data);
        expect(data).assertEqual("com.example.getmultipleaccountstest");
      }
      console.info("====>delete account start====");
      await appAccountManager.deleteAccount("accessibleAccount_this_application_first");
      console.info("====>ActsGetAllAccessibleAccounts_1200 end====");
      done();
    });
  })
}