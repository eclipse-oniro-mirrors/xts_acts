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
import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'


const ERR_INVALID_PARAMETER = 12300002;

export default function ActsOsAccountThirdPartyTest_third_4() {
  describe('ActsOsAccountThirdPartyTest_third_4', function () {
    afterEach(async function (done) {
      console.info("====>afterEach start====");
      var osAccountManager = osaccount.getAccountManager();
      var accounts = await osAccountManager.queryAllCreatedOsAccounts()
      for (let i = 0; i < accounts.length; i++) {
        var localId = accounts[i].localId
        if (localId != 100) {
          await osAccountManager.removeOsAccount(localId)
        }
      }
      done();
    })
    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0100
     * @tc.number ActsOsAccountQueryIdFormUid_0100
     * @tc.desc   Verify that the user localId is obtained by uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      var testLocalId = await osAccountManager.getOsAccountLocalId();
      console.info("====>testLocalId:" + testLocalId)
      console.info("====>get AccountManager finish====");
      var bundleName = "com.example.actsosaccountthirdpartytest";
      var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
      var uid = bundleInfo.uid;
      console.info("====>obtained uid:" + uid);
      osAccountManager.getOsAccountLocalIdForUid(uid, (err, localId) => {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err).assertEqual(null);
        expect(localId).assertEqual(testLocalId);
        console.info("====>ActsOsAccountQueryIdFormUid_0100 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0200
     * @tc.number ActsOsAccountQueryIdFormUid_0200
     * @tc.desc   Verify that the user localId is obtained by uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0200 start====");
      var osAccountManager = osaccount.getAccountManager();
      var testLocalId = await osAccountManager.getOsAccountLocalId();
      console.info("====>get AccountManager finish====");
      var bundleName = "com.example.actsosaccountthirdpartytest";
      var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
      var uid = bundleInfo.uid;
      console.info("====>obtained uid:" + uid);
      var localId = await osAccountManager.getOsAccountLocalIdForUid(uid);
      console.info("====>localId obtained by uid:" + localId);
      expect(localId).assertEqual(testLocalId);
      console.info("====>ActsOsAccountQueryIdFormUid_0200 end====");
      done();
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0300
     * @tc.number ActsOsAccountQueryIdFormUid_0300
     * @tc.desc   Authentication failed to query user by uid -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0300 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = -1;
      osAccountManager.getOsAccountLocalIdForUid(incorrectUid, (err, localId) => {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        expect(localId).assertEqual(null);
        console.info("====>ActsOsAccountQueryIdFormUid_0300 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0400
     * @tc.number ActsOsAccountQueryIdFormUid_0400
     * @tc.desc   Authentication failed to query user by uid -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0400 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = -1;
      try {
        await osAccountManager.getOsAccountLocalIdForUid(incorrectUid);
      } catch (err) {
        console.info("====>get localId by uid err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsOsAccountQueryIdFormUid_0400 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0500
     * @tc.number ActsOsAccountQueryIdFormUid_0500
     * @tc.desc   Authentication failed to query user by uid 2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0500 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = 2147483648;
      osAccountManager.getOsAccountLocalIdForUid(incorrectUid, (err, localId) => {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        expect(localId).assertEqual(null);
        console.info("====>ActsOsAccountQueryIdFormUid_0500 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0600
     * @tc.number ActsOsAccountQueryIdFormUid_0600
     * @tc.desc   Authentication failed to query user by uid 2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUid_0600 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = 2147483648;
      try {
        await osAccountManager.getOsAccountLocalIdForUid(incorrectUid);
      } catch (err) {
        console.info("====>get localId by uid err:" + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        console.info("====>ActsOsAccountQueryIdFormUid_0600 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0100
     * @tc.number ActsOsAccountQueryIdFormUidSync_0100
     * @tc.desc   Verify that the user localId is obtained by uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUidSync_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      var testLocalId = await osAccountManager.getOsAccountLocalId();
      console.info("====>testLocalId:" + testLocalId)
      console.info("====>get AccountManager finish====");
      var bundleName = "com.example.actsosaccountthirdpartytest";
      var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
      var uid = bundleInfo.uid;
      console.info("====>obtained uid:" + uid);
      try {
        let localId = osAccountManager.getOsAccountLocalIdForUidSync(uid);
        console.log('getOsAccountLocalIdForUidSync successfully, localId: ' + localId);
        expect(localId).assertEqual(testLocalId);
        console.info("====>ActsOsAccountQueryIdFormUidSync_0100 end====");
        done();
      } catch (err) {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>ActsOsAccountQueryIdFormUidSync_0100 end====");
        expect().assertFalse()
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0200
     * @tc.number ActsOsAccountQueryIdFormUidSync_0200
     * @tc.desc   Authentication failed to query user by uid -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUidSync_0200 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = -1;
      try {
        var localId = osAccountManager.getOsAccountLocalIdForUidSync(incorrectUid);
      } catch (err) {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        expect(localId).assertEqual(undefined);
        console.info("====>ActsOsAccountQueryIdFormUidSync_0200 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0300
     * @tc.number ActsOsAccountQueryIdFormUidSync_0300
     * @tc.desc   Authentication failed to query user by uid 2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUidSync_0300 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var incorrectUid = 2147483648;
      try {
        var localId = osAccountManager.getOsAccountLocalIdForUidSync(incorrectUid);
      } catch (err) {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
        expect(localId).assertEqual(undefined);
        console.info("====>ActsOsAccountQueryIdFormUidSync_0300 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0400
     * @tc.number ActsOsAccountQueryIdFormUidSync_0400
     * @tc.desc   Authentication failed to query user by null uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormUidSync_0400 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      try {
        var localId = osAccountManager.getOsAccountLocalIdForUidSync(null);
      } catch (err) {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by uid:" + localId);
        expect(err.code).assertEqual(401);
        expect(localId).assertEqual(undefined);
        console.info("====>ActsOsAccountQueryIdFormUidSync_0400 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormProcess_0100
     * @tc.number ActsOsAccountQueryIdFormProcess_0100
     * @tc.desc   Verify that the user localId obtained from the current process uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountQueryIdFormProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormProcess_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      var bundleName = "com.example.actsosaccountthirdpartytest";
      var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
      var uid = bundleInfo.uid;
      var testLocalId = await osAccountManager.getOsAccountLocalIdForUid(uid)
      console.info("====>get AccountManager finish====");
      osAccountManager.getOsAccountLocalId((err, localId) => {
        console.info("====>get localId err: " + JSON.stringify(err));
        console.info("====>localId obtained by process:" + localId);
        expect(err).assertEqual(null);
        expect(localId).assertEqual(testLocalId);
        console.info("====>ActsOsAccountQueryIdFormProcess_0100 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormProcess_0200
     * @tc.number ActsOsAccountQueryIdFormProcess_0200
     * @tc.desc   Verify that the user localId obtained from the current process uid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountQueryIdFormProcess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountQueryIdFormProcess_0200 start====");
      var osAccountManager = osaccount.getAccountManager();
      var bundleName = "com.example.actsosaccountthirdpartytest";
      var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
      var uid = bundleInfo.uid;
      var testLocalId = await osAccountManager.getOsAccountLocalIdForUid(uid)
      console.info("====>testLocalId obtained by process:" + testLocalId)
      console.info("====>get AccountManager finish====");
      var localId = await osAccountManager.getOsAccountLocalId();
      console.info("====>localId obtained by process:" + localId);
      expect(localId).assertEqual(testLocalId);
      console.info("====>ActsOsAccountQueryIdFormProcess_0200 end====");
      done();
    });

    /**
     * @tc.name   ActsOsAccountgetType_0100
     * @tc.number ActsOsAccountgetType_0100
     * @tc.desc   Verify that the user type obtained from the current process uid, getOsAccountType callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountgetType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountgetType_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      osAccountManager.getOsAccountType((err, accountType) => {
        console.info("====>get type err: " + JSON.stringify(err));
        console.info("====>type obtained by process:" + JSON.stringify(accountType));
        expect(err).assertEqual(null);
        expect(accountType).assertEqual(osaccount.OsAccountType.ADMIN);
        console.info("====>ActsOsAccountgetType_0100 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountgetType_0200
     * @tc.number ActsOsAccountgetType_0200
     * @tc.desc   Verify that the user type obtained from the current process uid, getOsAccountType promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountgetType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountgetType_0200 start====");
      let osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      try {
        let accountType = await osAccountManager.getOsAccountType();
        console.info("====>type obtained by process:" + JSON.stringify(accountType));
        expect(accountType).assertEqual(osaccount.OsAccountType.ADMIN);
        console.info("====>ActsOsAccountgetType_0200 end====");
        done();
      } catch (err) {
        console.info("====>get type err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0100
     * @tc.number ActsOsAccountQueryLocalIdSerial_0100
     * @tc.desc   Verify query serialNumber by 100 user and query 100 user by serialNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsOsAccountQueryLocalIdSerial_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      var testLocalId = await osAccountManager.getOsAccountLocalId();
      console.info("====>get AccountManager finish====");
      osAccountManager.getSerialNumberForOsAccountLocalId(testLocalId, (err, serialNumber) => {
        console.info("====>ger serialNumber err:" + JSON.stringify(err));
        console.info("====>get serialNumber:" + serialNumber + " by localId: 100");
        expect(err).assertEqual(null);
        var serialNumberStr = serialNumber.toString();
        var serialIntercept = serialNumberStr.substring(8);
        console.info("====>truncate the last eight characters: " + serialIntercept);
        osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, localId) => {
          console.info("====>ger localId err:" + JSON.stringify(err));
          console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
          expect(err).assertEqual(null);
          expect(localId).assertEqual(testLocalId);
          console.info("====>ActsOsAccountQueryLocalIdSerial_0100 end====");
          done();
        })
      })
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0200
     * @tc.number ActsOsAccountQueryLocalIdSerial_0200
     * @tc.desc   Verify query serialNumber by 100 user and query 100 user by serialNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsOsAccountQueryLocalIdSerial_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0200 start====");
      var osAccountManager = osaccount.getAccountManager();
      var testLocalId = await osAccountManager.getOsAccountLocalId();
      console.info("====>get AccountManager finish====");
      var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(testLocalId);
      console.info("====>get serialNumber:" + serialNumber + " by localId: 100");
      var serialNumberStr = serialNumber.toString();
      var serialIntercept = serialNumberStr.substring(8);
      console.info("====>truncate the last eight characters: " + serialIntercept);
      var localId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
      console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
      expect(localId).assertEqual(testLocalId);
      console.info("====>ActsOsAccountQueryLocalIdSerial_0200 end====");
      done();
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0300
     * @tc.number ActsOsAccountQueryLocalIdSerial_0300
     * @tc.desc   Verify query serialNumber by 0 user and query 0 user by serialNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsOsAccountQueryLocalIdSerial_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0300 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      osAccountManager.getSerialNumberForOsAccountLocalId(0, (err, serialNumber) => {
        console.info("====>ger serialNumber err:" + JSON.stringify(err));
        console.info("====>get serialNumber:" + serialNumber + " by localId: 0");
        expect(err).assertEqual(null);
        var serialNumberStr = serialNumber.toString();
        var serialIntercept = serialNumberStr.substring(8);
        console.info("====>truncate the last eight characters: " + serialIntercept);
        expect(serialIntercept).assertEqual("00000000");
        osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, localId) => {
          console.info("====>ger localId err:" + JSON.stringify(err));
          console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
          expect(err).assertEqual(null);
          expect(localId).assertEqual(0);
          console.info("====>ActsOsAccountQueryLocalIdSerial_0300 end====");
          done();
        })
      })
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0400
     * @tc.number ActsOsAccountQueryLocalIdSerial_0400
     * @tc.desc   Verify query serialNumber by 0 user and query 0 user by serialNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ActsOsAccountQueryLocalIdSerial_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0400 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(0);
      console.info("====>get serialNumber:" + serialNumber + " by localId: 0");
      var serialNumberStr = serialNumber.toString();
      var serialIntercept = serialNumberStr.substring(8);
      console.info("====>truncate the last eight characters: " + serialIntercept);
      expect(serialIntercept).assertEqual("00000000");
      var localId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
      console.info("====>get localId:" + localId + " by serialNumber: " + serialNumber);
      expect(localId).assertEqual(0);
      console.info("====>ActsOsAccountQueryLocalIdSerial_0400 end====");
      done();
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0500
     * @tc.number ActsOsAccountQueryLocalIdSerial_0500
     * @tc.desc   Verify the query for the newly created user serialNumber and query the owning user through the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0500 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var localId = 100;
      let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
      if (isEnable != true) {
        console.info("====>ActsOsAccountQueryLocalIdSerial_0500 not support multiple osaccouts====");
        osAccountManager.getSerialNumberForOsAccountLocalId(localId, (err, serialNumber) => {
          console.info("====>queryOsAccountById err:" + JSON.stringify(err));
          console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
          expect(err).assertEqual(null);
          osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, getlocalId) => {
            console.info("====>ger localId err:" + JSON.stringify(err));
            console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
            expect(err).assertEqual(null);
            expect(getlocalId).assertEqual(localId);
            console.info("====>ActsOsAccountQueryLocalIdSerial_0500 end====");
            done();
          })
        })
        return;
      }
      osAccountManager.createOsAccount("osAccountNameIdSerialA", osaccount.OsAccountType.NORMAL, (err, data) => {
        console.info("====>create os account err: " + JSON.stringify(err));
        console.info("====>create os account OsAccountInfo: " + JSON.stringify(data));
        expect(err).assertEqual(null);
        expect(data.localName).assertEqual("osAccountNameIdSerialA");
        expect(data.domainInfo.accountName == "").assertEqual(true)
        expect(data.type).assertEqual(1);
        expect(data.constraints.length > 0).assertEqual(true);
        expect(data.isVerified).assertEqual(false);
        expect(data.isUnlocked).assertEqual(false);
        expect(data.distributedInfo.name != null).assertEqual(true);
        expect(data.domainInfo.domain == "").assertEqual(true);
        expect(data.photo == "").assertEqual(true);
        expect(data.lastLoginTime >= 0).assertEqual(true);
        expect(data.serialNumber.toString().length == 16).assertEqual(true);
        expect(data.isActived).assertEqual(false);
        expect(data.isActivated).assertEqual(false);
        expect(data.isCreateCompleted).assertEqual(true)
        localId = data.localId;
        osAccountManager.getSerialNumberForOsAccountLocalId(localId, (err, serialNumber) => {
          console.info("====>queryOsAccountById err:" + JSON.stringify(err));
          console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
          expect(err).assertEqual(null);
          osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, getlocalId) => {
            console.info("====>ger localId err:" + JSON.stringify(err));
            console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
            expect(err).assertEqual(null);
            expect(getlocalId).assertEqual(localId);
            osAccountManager.removeOsAccount(localId, (err) => {
              console.info("====>remove localId: " + localId + " err:" + JSON.stringify(err));
              expect(err).assertEqual(null);
              console.info("====>ActsOsAccountQueryLocalIdSerial_0500 end====");
              done();
            })
          })
        })
      })
    });

    /**
     * @tc.name   ActsOsAccountQueryLocalIdSerial_0600
     * @tc.number ActsOsAccountQueryLocalIdSerial_0600
     * @tc.desc   Verify the query for the newly created user serialNumber and query the owning user through the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryLocalIdSerial_0600 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var localId = 100;
      let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
      if (isEnable != true) {
        console.info("====>ActsOsAccountQueryLocalIdSerial_0600 not support multiple osaccouts====");
        var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(localId);
        console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
        var getlocalId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
        console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
        expect(getlocalId).assertEqual(localId);
        console.info("====>ActsOsAccountQueryLocalIdSerial_0600 end====");
        done();
        return;
      }
      var OsAccountInfo = await osAccountManager.createOsAccount("accountIdSerialB", osaccount.OsAccountType.GUEST);
      console.info("====>create os account OsAccountInfo: " + JSON.stringify(OsAccountInfo));
      expect(OsAccountInfo.localName).assertEqual("accountIdSerialB");
      localId = OsAccountInfo.localId;
      var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(localId);
      console.info("====>get serialNumber:" + serialNumber + " by localId: " + localId);
      var getlocalId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
      console.info("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
      expect(getlocalId).assertEqual(localId);
      await osAccountManager.removeOsAccount(localId);
      console.info("====>ActsOsAccountQueryLocalIdSerial_0600 end====");
      done();
    });

    /**
     * @tc.name   ActsOsAccountQueryCounts_0100
     * @tc.number ActsOsAccountQueryCounts_0100
     * @tc.desc   Verify to obtain the number os all os accounts created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryCounts_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryCounts_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      var obtainCount = 0;
      var localIdFir;
      let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
      if (isEnable != true) {
        console.info("====>ActsOsAccountQueryCounts_0100 not support multiple osaccouts====");
        osAccountManager.getOsAccountCount((err, data) => {
          console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
          console.info("====>obtains the number of all os accounts created data:" + data);
          expect(err).assertEqual(null);
          expect(data).assertEqual(1);
          console.info("====>ActsOsAccountQueryCounts_0100 end====");
          done();
        })
        return;
      }
      osAccountManager.getOsAccountCount((err, data) => {
        console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
        console.info("====>obtains the number of all os accounts created data:" + data);
        expect(err).assertEqual(null);
        obtainCount = data;
        osAccountManager.createOsAccount("osAccountNameIdSerialE", osaccount.OsAccountType.NORMAL, (err, data) => {
          console.info("====>create first os account err: " + JSON.stringify(err));
          console.info("====>create first os account OsAccountInfo: " + JSON.stringify(data));
          localIdFir = data.localId;
          expect(err).assertEqual(null);
          expect(data.localName).assertEqual("osAccountNameIdSerialE");
          osAccountManager.getOsAccountCount((err, count) => {
            console.info("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
            console.info("====>obtains the number of all os accounts created count:" + count);
            expect(err).assertEqual(null);
            count = count - 1;
            expect(count).assertEqual(obtainCount);
            osAccountManager.removeOsAccount(localIdFir, (err) => {
              console.info("====>remove localId: " + localIdFir + " err:" + JSON.stringify(err));
              expect(err).assertEqual(null);
              osAccountManager.getOsAccountCount((err, data) => {
                console.info("====>obtains the number accounts created err:" + JSON.stringify(err));
                console.info("====>obtains the number accounts created data:" + data);
                expect(err).assertEqual(null);
                expect(data).assertEqual(obtainCount);
                console.info("====>ActsOsAccountQueryCounts_0100 end====");
                done();
              })
            })
          })
        })
      })
    })

    /**
     * @tc.name   ActsOsAccountQueryCounts_0200
     * @tc.number ActsOsAccountQueryCounts_0200
     * @tc.desc   Verify to obtain the number os all os accounts created
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryCounts_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryCounts_0200 start====");
      var osAccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      let isEnable = await osAccountManager.checkMultiOsAccountEnabled();
      if (isEnable != true) {
        console.info("====>ActsOsAccountQueryCounts_0200 not support multiple osaccouts====");
        var obtainCount = await osAccountManager.getOsAccountCount();
        console.info("====>obtains the number of all os accounts created:" + obtainCount);
        expect(obtainCount).assertEqual(1);
        console.info("====>ActsOsAccountQueryCounts_0200 end====");
        done();
        return;
      }
      var obtainCount = await osAccountManager.getOsAccountCount();
      console.info("====>obtains the number of all os accounts created:" + obtainCount);
      var osAccountFir = await osAccountManager.createOsAccount("osAccountIdSerialG", osaccount.OsAccountType.NORMAL);
      console.info("====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
      var localIdFir = osAccountFir.localId;
      expect(osAccountFir.localName).assertEqual("osAccountIdSerialG");
      var countFir = await osAccountManager.getOsAccountCount();
      console.info("====>obtains the number of all os accounts created count:" + countFir);
      countFir = countFir - 1;
      expect(countFir).assertEqual(obtainCount);
      await osAccountManager.removeOsAccount(localIdFir);
      console.info("====>remove localId: " + localIdFir);
      console.info("====>ActsOsAccountQueryCounts_0200 end====");
      done();
    })


    /**
     * @tc.name   ActsOsAccountGetActivedOsAccountIds_0100
     * @tc.number ActsOsAccountGetActivedOsAccountIds_0100
     * @tc.desc   query activated osAccount Ids, getActivatedOsAccountLocalIds callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetActivedOsAccountIds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountGetActivedOsAccountIds_0100 start====");
      let osAccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      osAccountManager.getActivatedOsAccountLocalIds((err, dataArray) => {
        console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 err :" + JSON.stringify(err));
        console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 dataArray:" + dataArray);
        expect(err).assertEqual(null)
        expect(dataArray.length > 0).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountGetActivedOsAccountIds_0200
     * @tc.number ActsOsAccountGetActivedOsAccountIds_0200
     * @tc.desc   query activated osAccount Ids, getActivatedOsAccountLocalIds promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetActivedOsAccountIds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountGetActivedOsAccountIds_0200 start====");
      let osAccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let dataArray = await osAccountManager.getActivatedOsAccountLocalIds();
        console.info("====>ActsOsAccountGetActivedOsAccountIds_0200 data: " + dataArray);
        expect(dataArray.length > 0).assertTrue();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetActivedOsAccountIds_0200 err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   ActsOsAccountCheckConstraints_3100
     * @tc.number ActsOsAccountCheckConstraints_0300
     * @tc.desc   get 0 local user all constraints
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountCheckConstraints_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3100 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      AccountManager.getOsAccountConstraints(0, (err, constraints) => {
        console.info("====>getOsAccountConstraints err:" + JSON.stringify(err));
        console.info("====>getOsAccountConstraints:" + JSON.stringify(constraints));
        expect(err).assertEqual(null);
        expect(constraints.length).assertEqual(0);
        console.info("====>ActsOsAccountCheckConstraints_3100 end====");
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3200
     * @tc.number ActsOsAccountCheckConstraints_3200
     * @tc.desc   get 0 local user all constraints, Constraints promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountCheckConstraints_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3200 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("get AccountManager finish====");
      try {
        let constraints = await AccountManager.getOsAccountConstraints(0);
        console.info("====>ActsOsAccountCheckConstraints_3200 getOsAccountConstraints data:" + constraints);
        expect(constraints.length).assertEqual(0);
        done();
      } catch (err) {
        console.info("====>ActsOsAccountCheckConstraints_3200 getOsAccountConstraints err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountQueryDomainTest_0300
     * @tc.number ActsOsAccountQueryDomainTest_0300
     * @tc.desc   Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryDomainTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryDomainTest_0100 start====");
      var osAccountManager = osaccount.getAccountManager();
      osAccountManager.getOsAccountLocalIdForDomain({ domain: "", accountName: "" }, (err) => {
        console.info("====>ActsOsAccountQueryDomainTest_0300 err:" + JSON.stringify(err));
        expect(err.code != 0).assertEqual(true)
        console.info("====>ActsOsAccountQueryDomainTest_0300 end====");
        done();
      })
    });

    /**
     * @tc.name   ActsOsAccountQueryDomainTest_0400
     * @tc.number ActsOsAccountQueryDomainTest_0400
     * @tc.desc   Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryDomainTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountQueryDomainTest_0400 start====");
      var osAccountManager = osaccount.getAccountManager();
      osAccountManager.getOsAccountLocalIdForDomain({ domain: "", accountName: "" }).then((accountID) => {
        console.info("ActsOsAccountQueryDomainTest_0400 accountID:" + JSON.stringify(accountID))
        done();
      }).catch((err) => {
        console.info("ActsOsAccountQueryDomainTest_0400 err:" + JSON.stringify(err))
        expect(err.code != 0).assertEqual(true)
        done();
      })
    });

    /**
     * @tc.name   ActsOsAccountGetCurrent_2100
     * @tc.number ActsOsAccountGetCurrent_2100
     * @tc.desc   Get the os account information to which the application belongs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetCurrent_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountGetCurrent_2100 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      AccountManager.getCurrentOsAccount((err, data) => {
        console.info("====>getCurrentOsAccount err:" + JSON.stringify(err));
        console.info("====>getCurrentOsAccount data:" + JSON.stringify(data));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountGetCurrent_2100 end====");
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountGetCurrent_2200
     * @tc.number ActsOsAccountGetCurrent_1800
     * @tc.desc   Get the os account information to which the application belongs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetCurrent_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountGetCurrent_2200 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      var data = await AccountManager.getCurrentOsAccount();
      console.info("====>getCurrentOsAccount data:" + JSON.stringify(data));
      expect(data.localId).assertEqual(100);
      expect(data.type).assertEqual(0);
      var serialNumberStr = data.serialNumber.toString();
      var serialIntercept = serialNumberStr.substring(8);
      console.info("====>truncate the last eight characters: " + serialIntercept);
      expect(data.isCreateCompleted).assertTrue();
      console.info("====>ActsOsAccountGetCurrent_2200 end====");
      done();
    })


    /**
     * @tc.name   ActsOsAccountCheckConstraints_3300
     * @tc.number ActsOsAccountCheckConstraints_3300
     * @tc.desc   Checks whether the given constraint is enabled for the specified OS account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountCheckConstraints_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3300 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      AccountManager.checkOsAccountConstraintEnabled(100, "constraint.bluetooth", (err, result) => {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        console.info("====>checkOsAccountConstraintEnabled result:" + JSON.stringify(result));
        expect(err).assertEqual(null);
        expect(result).assertTrue();
        console.info("====>ActsOsAccountCheckConstraints_3300 end====");
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3400
     * @tc.number ActsOsAccountCheckConstraints_3400
     * @tc.desc   Checks whether the given constraint is enabled for the specified OS account, promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountCheckConstraints_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3400 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let data = await AccountManager.checkOsAccountConstraintEnabled(100, "constraint.bluetooth");
        console.info("====>checkOsAccountConstraintEnabled data:" + JSON.stringify(data));
        expect(data).assertTrue();
        done();
      } catch (err) {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountCheckConstraints_3400 end====");
        done();
      }
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3500
     * @tc.number ActsOsAccountCheckConstraints_3500
     * @tc.desc   check checkOsAccountConstraintEnabled interface for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3500 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      AccountManager.checkOsAccountConstraintEnabled(100, "constraint.fun", (err, result) => {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        expect(result).assertFalse();
        console.info("====>ActsOsAccountCheckConstraints_3500 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3600
     * @tc.number ActsOsAccountCheckConstraints_3600
     * @tc.desc   check checkOsAccountConstraintEnabled interface for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3600 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let data = await AccountManager.checkOsAccountConstraintEnabled(100, "constraint.fun");
        console.info("====>checkOsAccountConstraintEnabled data:" + JSON.stringify(data));
        expect(data).assertFalse();
        done();
      } catch (err) {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountCheckConstraints_3600 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountIsOsAccountConstraintEnabled_0100
     * @tc.number ActsOsAccountIsOsAccountConstraintEnabled_0100
     * @tc.desc   Checks whether the given constraint is enabled for the current OS account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountIsOsAccountConstraintEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0100 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let IsOsAccountConstraintEnabled = await AccountManager.isOsAccountConstraintEnabled("constraint.bluetooth");
        console.info("====>isOsAccountConstraintEnabled data:" + JSON.stringify(IsOsAccountConstraintEnabled));
        expect(IsOsAccountConstraintEnabled).assertEqual(true);
        done();
      } catch (err) {
        console.info("====>isOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0100 end====");
        done();
      }
    })

    /**
     * @tc.name   ActsOsAccountIsOsAccountConstraintEnabled_0200
     * @tc.number ActsOsAccountIsOsAccountConstraintEnabled_0200
     * @tc.desc   Checks whether the given constraint is enabled for the current OS account,IsOsAccountConstraintEnabled promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountIsOsAccountConstraintEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0200 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let IsOsAccountConstraintEnabled = await AccountManager.isOsAccountConstraintEnabled("constraint.fun");
        console.info("====>isOsAccountConstraintEnabled data:" + JSON.stringify(IsOsAccountConstraintEnabled));
        expect(IsOsAccountConstraintEnabled).assertFalse();
        done();
      } catch (err) {
        console.info("====>isOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountIsOsAccountConstraintEnabled_0200 end====");
        done();
      }
    })

    /**
     * @tc.name   ActsOsAccountGetOsAccountName_0100
     * @tc.number ActsOsAccountGetOsAccountName_0100
     * @tc.desc   Gets the name of the OS account to which the caller belongs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountGetOsAccountName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      console.info("====>ActsOsAccountGetOsAccountName_0100 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let osAccountName = await AccountManager.getOsAccountName();
        console.info("====>ActsOsAccountGetOsAccountName_0100 osAccountName: " + osAccountName);
        done();
      } catch (err) {
        console.info("====>ActsOsAccountGetOsAccountName_0100 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        console.info("====>ActsOsAccountGetOsAccountName_0100 end====");
        done();
      }
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3700
     * @tc.number ActsOsAccountCheckConstraints_3700
     * @tc.desc   get 100 local user all constraints, Constraints callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3700 start====");
      var AccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      AccountManager.getOsAccountConstraints(100, (err, constraints) => {
        console.info("====>getOsAccountConstraints err:" + JSON.stringify(err));
        console.info("====>getOsAccountConstraints:" + JSON.stringify(constraints));
        expect(err).assertEqual(null);
        expect(constraints.length > 0).assertTrue();
        console.info("====>ActsOsAccountCheckConstraints_3700 end====");
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3800
     * @tc.number ActsOsAccountCheckConstraints_3800
     * @tc.desc   get 100 local user all constraints, Constraints promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3800 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("get AccountManager finish====");
      try {
        let constraints = await AccountManager.getOsAccountConstraints(100);
        console.info("====>ActsOsAccountCheckConstraints_3800 getOsAccountConstraints data:" + constraints);
        expect(constraints.length > 0).assertTrue();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountCheckConstraints_3800 getOsAccountConstraints err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountCheckConstraints_3900
     * @tc.number ActsOsAccountCheckConstraints_3900
     * @tc.desc   check checkOsAccountConstraintEnabled interface for callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_3900 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      AccountManager.checkOsAccountConstraintEnabled(999, "constraint.fun", (err, result) => {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info("====>ActsOsAccountCheckConstraints_3900 end====");
        done();
      });
    });

    /**
     * @tc.name   ActsOsAccountCheckConstraints_4000
     * @tc.number ActsOsAccountCheckConstraints_4000
     * @tc.desc   check checkOsAccountConstraintEnabled interface for promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_4000 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get os AccountManager finish====");
      try {
        let data = await AccountManager.checkOsAccountConstraintEnabled(999, "constraint.fun");
        console.info("====>checkOsAccountConstraintEnabled data:" + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info("====>ActsOsAccountCheckConstraints_4000 end====");
        done();
      }
    });

    /**
     * @tc.name   ActsOsAccountCheckConstraints_4100
     * @tc.number ActsOsAccountCheckConstraints_4100
     * @tc.desc   get 100 local user all constraints, Constraints callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_4100 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("====>get AccountManager finish====");
      AccountManager.getOsAccountConstraints(-1, (err, constraints) => {
        console.info("====>getOsAccountConstraints err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info("====>ActsOsAccountCheckConstraints_4100 end====");
        done();
      })
    })

    /**
     * @tc.name   ActsOsAccountCheckConstraints_4200
     * @tc.number ActsOsAccountCheckConstraints_4200
     * @tc.desc   get 100 local user all constraints, Constraints promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ActsOsAccountCheckConstraints_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async function (done) {
      console.info("====>ActsOsAccountCheckConstraints_4200 start====");
      let AccountManager = osaccount.getAccountManager();
      console.info("get AccountManager finish====");
      try {
        await AccountManager.getOsAccountConstraints(9999);
        console.info("====>ActsOsAccountCheckConstraints_4200 run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info("====>ActsOsAccountCheckConstraints_4200 getOsAccountConstraints err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      }
    });
  })
}
