/**
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount';
import dAccount from '@ohos.account.distributedAccount';
import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import {describe, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { CreateAccount, RemoveAccount } from './AccountFunc.test';

let tag: string = 'testTag';

export default function ActsOsAccountThirdPartyTest_third_4_Static() {
  describe('ActsOsAccountThirdPartyTest_third_4_Static', () => {
    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    hilog.info(0x0000, tag, "====>get os AccountManager finish====");

    afterEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>afterEach start====");
      let accounts: Array<osAccount.OsAccountInfo> = await accountManager.queryAllCreatedOsAccounts();
      for (let i: int = 0; i < accounts.length; i++) {
        let localId: int = accounts[i].localId;
        if (localId != 100) {
          await RemoveAccount(localId);
        }
      }
      done();
    });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0100
     * @tc.number ActsOsAccountQueryIdFormUid_0100
     * @tc.desc   Verify that the user localId is obtained by uid getOsAccountLocalIdForUid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0100 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>testLocalId: "+ testLocalId);
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        accountManager.getOsAccountLocalIdForUid(uid, (err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (localId) {
                expect(localId).assertEqual(testLocalId);
                hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0200
     * @tc.number ActsOsAccountQueryIdFormUid_0200
     * @tc.desc   Verify that the user localId is obtained by uid getOsAccountLocalIdForUid promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0200 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        let localId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
        expect(localId).assertEqual(testLocalId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0200 end====");
        done();
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0300
     * @tc.number ActsOsAccountQueryIdFormUid_0300
     * @tc.desc   Authentication failed to query user by uid -1 getOsAccountLocalIdForUid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0300 start====");
        let incorrectUid: int = -1;
        accountManager.getOsAccountLocalIdForUid(incorrectUid, (err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by uid: "+ localId);
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0300 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUid_0400
     * @tc.number ActsOsAccountQueryIdFormUid_0400
     * @tc.desc   Authentication failed to query user by uid -1  getOsAccountLocalIdForUid promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUid_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0400 start====");
        let incorrectUid: int = -1;
        try {
          await accountManager.getOsAccountLocalIdForUid(incorrectUid);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>get localId by uid err: "+ JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUid_0400 end====");
          done();
        }
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0100
     * @tc.number ActsOsAccountQueryIdFormUidSync_0100
     * @tc.desc   Verify that the user localId is obtained by uid getOsAccountLocalIdForUidSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>testLocalId: "+ testLocalId);
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        hilog.info(0x0000, tag, "====>obtained uid: "+ uid);
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(uid);
          console.log('getOsAccountLocalIdForUidSync successfully, localId: ' + localId);
          expect(localId).assertEqual(testLocalId);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0100 end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormUidSync_0200
     * @tc.number ActsOsAccountQueryIdFormUidSync_0200
     * @tc.desc   Authentication failed to query user by uid -1  getOsAccountLocalIdForUidSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountQueryIdFormUidSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 start====");
        let incorrectUid: int = -1;
        try {
          let localId: int = accountManager.getOsAccountLocalIdForUidSync(incorrectUid);
          hilog.info(0x0000, tag, "====>get localId: " + localId);
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormUidSync_0200 end====");
          done();
        }
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormProcess_0100
     * @tc.number ActsOsAccountQueryIdFormProcess_0100
     * @tc.desc   Verify that the user localId obtained from the current process uid getOsAccountLocalId callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountQueryIdFormProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0100 start====");
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        let testLocalId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        accountManager.getOsAccountLocalId((err: BusinessError<void> | null, localId: int | undefined): void => {
          hilog.info(0x0000, tag, "====>get localId err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>localId obtained by process: "+ localId);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (localId) {
                expect(localId).assertEqual(testLocalId);
                hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.name   ActsOsAccountQueryIdFormProcess_0200
     * @tc.number ActsOsAccountQueryIdFormProcess_0200
     * @tc.desc   Verify that the user localId obtained from the current process uid getOsAccountType callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountQueryIdFormProcess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0200 start====");
        let bundleInfo: bundle.BundleInfo = bundle.getBundleInfoForSelfSync(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        let uid: int = 3058;
        let appInfo: bundle.ApplicationInfo | null = bundleInfo.appInfo;
        if (appInfo !== null) {
          uid = appInfo.uid;
        }
        let testLocalId: int = await accountManager.getOsAccountLocalIdForUid(uid);
        hilog.info(0x0000, tag, "====>testLocalId obtained by process: "+ testLocalId);
        let localId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>localId obtained by process: "+ localId);
        expect(localId).assertEqual(testLocalId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryIdFormProcess_0200 end====");
        done();
      });

    /**
     * @tc.name   ActsOsAccountgetType_0100
     * @tc.number ActsOsAccountgetType_0100
     * @tc.desc   Verify that the user type obtained from the current process uid getOsAccountType callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountgetType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0100 start====");
        accountManager.getOsAccountType((err: BusinessError<void> | null, accountType: osAccount.OsAccountType | undefined): void => {
          hilog.info(0x0000, tag, "====>get type err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>type obtained by process: "+ accountType);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              let a: osAccount.OsAccountType = osAccount.OsAccountType.ADMIN;
              expect(accountType).assertEqual(a);
              hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0100 end====");
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.name   ActsOsAccountgetType_0200
     * @tc.number ActsOsAccountgetType_0200
     * @tc.desc   Verify that the user type obtained from the current process uid getOsAccountType promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountgetType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0200 start====");
        try {
          let accountType: osAccount.OsAccountType = await accountManager.getOsAccountType();
          hilog.info(0x0000, tag, "====>type obtained by process: "+ accountType);
          expect(accountType).assertEqual(osAccount.OsAccountType.ADMIN);
          hilog.info(0x0000, tag, "====>ActsOsAccountgetType_0200 end====");
        } catch (err) {
          hilog.info(0x0000, tag, '====>getOsAccountType err: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0100
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0100
     * @tc.desc     Verify query serialNumber by 100 user and query 100 user by serialNumber
     *               getSerialNumberForOsAccountLocalId callback
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('ActsOsAccountQueryLocalIdSerial_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0100 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>getOsAccountLocalId: "+ testLocalId);
        accountManager.getSerialNumberForOsAccountLocalId(testLocalId, (err: BusinessError<void> | null, serialNumber: long | undefined): void => {
          hilog.info(0x0000, tag, "====>ger serialNumber err: "+ JSON.stringify(err));
          hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: 100");
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (serialNumber) {
                let serialNumberStr: string = serialNumber.toString();
                let serialIntercept: string = serialNumberStr.substring(8);
                hilog.info(0x0000, tag, "====>truncate the last eight characters: " + serialIntercept);
                accountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err: BusinessError<void> | null, localId: int | undefined): void => {
                  hilog.info(0x0000, tag, "====>get localId err: "+ JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>get localId: "+ localId + " by serialNumber: " + serialNumber);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (localId) {
                        expect(localId).assertEqual(testLocalId);
                        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0100 end====");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                  }
                  done();
                });
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0200
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0200
     * @tc.desc     Verify query serialNumber by 100 user and query 100 user by serialNumber
     *               getSerialNumberForOsAccountLocalId promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0200 start====");
        let testLocalId: int = await accountManager.getOsAccountLocalId();
        hilog.info(0x0000, tag, "====>getOsAccountLocalId: "+ testLocalId);
        let serialNumber: long = await accountManager.getSerialNumberForOsAccountLocalId(testLocalId);
        hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: 100");
        let serialNumberStr: string = serialNumber.toString();
        let serialIntercept: string = serialNumberStr.substring(8);
        hilog.info(0x0000, tag, "====>truncate the last eight characters: " + serialIntercept);
        let localId: int = await accountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
        hilog.info(0x0000, tag, "====>get localId: "+ localId + " by serialNumber: " + serialNumber);
        expect(localId).assertEqual(testLocalId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0200 end====");
        done();
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0300
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0300
     * @tc.desc     Verify query serialNumber by 0 user and query 0 user by serialNumber
     *               getOsAccountLocalIdForSerialNumber callback
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0300 start====");
        accountManager.getSerialNumberForOsAccountLocalId(0, (err: BusinessError<void> | null, serialNumber: long | undefined): void => {
          hilog.info(0x0000, tag, "====>ger serialNumber err: "+ JSON.stringify(err));
          hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: 0");
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (serialNumber) {
                let serialNumberStr: string = serialNumber.toString();
                let serialIntercept: string = serialNumberStr.substring(8);
                hilog.info(0x0000, tag, "====>truncate the last eight characters: " + serialIntercept);
                expect(serialIntercept).assertEqual("00000000");
                accountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err: BusinessError<void> | null, localId: int | undefined): void => {
                  hilog.info(0x0000, tag, "====>get localId err: "+ JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>get localId: "+ localId + " by serialNumber: " + serialNumber);
                  let tempId: int = 0;
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      expect(localId).assertEqual(tempId);
                      hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0300 end====");
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                  }
                  done();
                });
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0400
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0400
     * @tc.desc     Verify query serialNumber by 0 user and query 0 user by serialNumber
     *               getOsAccountLocalIdForSerialNumber promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0400 start====");
        let serialNumber: long = await accountManager.getSerialNumberForOsAccountLocalId(0);
        hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: 0");
        let serialNumberStr: string = serialNumber.toString();
        let serialIntercept: string = serialNumberStr.substring(8);
        hilog.info(0x0000, tag, "====>truncate the last eight characters: " + serialIntercept);
        expect(serialIntercept).assertEqual("00000000");
        let localId: int = await accountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
        hilog.info(0x0000, tag, "====>get localId: "+ localId + " by serialNumber: " + serialNumber);
        let tempId: int = 0;
        expect(localId).assertEqual(tempId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0400 end====");
        done();
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0500
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0500
     * @tc.desc     Verify the query for the newly created user serialNumber and query the owning user through the
     *               serialNumber getSerialNumberForOsAccountLocalId callback
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0500 start====");
        let localId: int = 100;
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0500 not support multiple osaccouts====");
          accountManager.getSerialNumberForOsAccountLocalId(localId, (err: BusinessError<void> | null, serialNumber: long | undefined): void => {
            hilog.info(0x0000, tag, "====>queryOsAccountById err: "+ JSON.stringify(err));
            hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: " + localId);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (serialNumber) {
                  accountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err: BusinessError<void> | null, getlocalId: int | undefined): void => {
                    hilog.info(0x0000, tag, "====>get localId err: "+ JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>get localId: "+ getlocalId + " by serialNumber: " + serialNumber);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        if (getlocalId) {
                          expect(getlocalId).assertEqual(localId);
                          hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0500 end====");
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                    }
                    done();
                  });
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
              done();
            }
          });
          return new Promise<void>(() => {});
        }
        accountManager.createOsAccount("osAccountNameIdSerialA", osAccount.OsAccountType.NORMAL,
          (err: BusinessError<void> | null, data: osAccount.OsAccountInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>create os account err: " + JSON.stringify(err));
            if (err && err.code === 204) {
              hilog.info(0x0000, tag, "====>Current device need token to use API: createOsAccount");
              done();
              return;
            }
            hilog.info(0x0000, tag, "====>create os account OsAccountInfo: " + JSON.stringify(data));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  if (data.localId != undefined) {
                    localId = data.localId;
                  }
                  expect(data?.localName).assertEqual("osAccountNameIdSerialA");
                  expect(data?.type).assertEqual(osAccount.OsAccountType.NORMAL);
                  expect(data?.constraints.length).assertLarger(0);
                  expect(data?.isUnlocked).assertEqual(false);
                  expect(data?.photo == "").assertEqual(true);
                  expect(data?.createTime).assertLarger(0);
                  expect(data?.lastLoginTime).assertLargerOrEqual(0);
                  expect(data?.serialNumber.toString().length).assertEqual(16);
                  expect(data?.isActivated).assertEqual(false);
                  expect(data?.isCreateCompleted).assertEqual(true);
                  expect(data?.distributedInfo.name != null).assertEqual(true);
                  expect(data?.distributedInfo.id != null).assertEqual(true);
                  expect(data?.distributedInfo.event == "").assertEqual(true);
                  expect(data?.distributedInfo.nickname == "").assertEqual(true);
                  expect(data?.distributedInfo.avatar == "").assertEqual(true);
                  expect(data?.distributedInfo.status).assertEqual(dAccount.DistributedAccountStatus.NOT_LOGGED_IN);
                  expect(data?.distributedInfo.scalableData != null).assertEqual(true);
                  expect(data?.domainInfo.domain == "").assertEqual(true);
                  expect(data?.domainInfo.accountName == "").assertEqual(true);
                  expect(data?.domainInfo.serverConfigId == "").assertEqual(true);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
            }
            accountManager.getSerialNumberForOsAccountLocalId(localId, (err: BusinessError<void> | null, serialNumber: long | undefined): void => {
              hilog.info(0x0000, tag, "====>queryOsAccountById err: "+ JSON.stringify(err));
              hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: " + localId);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (serialNumber) {
                    accountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err: BusinessError<void> | null, getlocalId: int | undefined): void => {
                      hilog.info(0x0000, tag, "====>get localId err: "+ JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>get localId: "+ getlocalId + " by serialNumber: " + serialNumber);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (getlocalId) {
                            expect(getlocalId).assertEqual(localId);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                      }
                      accountManager.removeOsAccount(localId, (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>remove localId: " + localId + " err: "+ JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0500 end====");
                        done();
                      });
                    });
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                done();
              }
            });
          });
      });

    /**
     * @tc.number   ActsOsAccountQueryLocalIdSerial_0600
     * @tc.name     ActsOsAccountQueryLocalIdSerial_0600
     * @tc.desc     Verify the query for the newly created user serialNumber and query the owning user through the
     *               serialNumber getOsAccountLocalIdForSerialNumber promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryLocalIdSerial_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0600 start====");
        let localId: int = 100;
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0600 not support multiple osaccouts====");
          let serialNumber: long = await accountManager.getSerialNumberForOsAccountLocalId(localId);
          hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: " + localId);
          let getlocalId: int = await accountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
          hilog.info(0x0000, tag, "====>get localId: "+ getlocalId + " by serialNumber: " + serialNumber);
          expect(getlocalId).assertEqual(localId);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0600 end====");
          done();
          return new Promise<void>(() => {});
        }
        let options: osAccount.CreateOsAccountOptions = {
          shortName: "nameIdSerialB",
          disallowedPreinstalledBundles: [],
          allowedPreinstalledBundles: []
        }
        let OsAccountInfo = await CreateAccount("accountIdSerialB", osAccount.OsAccountType.GUEST, options);
        OsAccountInfo = OsAccountInfo as osAccount.OsAccountInfo;
        hilog.info(0x0000, tag, "====>create os account OsAccountInfo: " + JSON.stringify(OsAccountInfo));
        expect(OsAccountInfo.localName).assertEqual("accountIdSerialB");
        localId = OsAccountInfo.localId;
        let serialNumber: long = await accountManager.getSerialNumberForOsAccountLocalId(localId);
        hilog.info(0x0000, tag, "====>get serialNumber: "+ serialNumber + " by localId: " + localId);
        let getlocalId: int = await accountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
        hilog.info(0x0000, tag, "====>get localId: "+ getlocalId + " by serialNumber: " + serialNumber);
        expect(getlocalId).assertEqual(localId);
        await RemoveAccount(localId);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryLocalIdSerial_0600 end====");
        done();
      });

    /**
     * @tc.number   ActsOsAccountQueryCounts_0100
     * @tc.name     ActsOsAccountQueryCounts_0100
     * @tc.desc     Verify to obtain the number os all os accounts created getOsAccountCount callback
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryCounts_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0100 start====");
        let obtainCount: int = 0;
        let localIdFir: int = 0;
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0100 not support multiple osaccouts====");
          accountManager.getOsAccountCount((err: BusinessError<void> | null, data: int | undefined): void => {
            hilog.info(0x0000, tag, "====>obtains the number of all os accounts created err: "+ JSON.stringify(err));
            hilog.info(0x0000, tag, "====>obtains the number of all os accounts created data: "+ data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  let tempNum: int = 1;
                  expect(data).assertEqual(tempNum);
                  hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0100 end====");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
            }
            done();
          });
          return new Promise<void>(() => {});
        }
        accountManager.getOsAccountCount((err: BusinessError<void> | null, data: int | undefined): void => {
          hilog.info(0x0000, tag, "====>obtains the number of all os accounts created err: "+ JSON.stringify(err));
          hilog.info(0x0000, tag, "====>obtains the number of all os accounts created data: "+ data);
          if (data) {
            obtainCount = data;
          }
          accountManager.createOsAccount("osAccountNameIdSerialE", osAccount.OsAccountType.NORMAL,
            (err: BusinessError<void> | null, data: osAccount.OsAccountInfo | undefined): void => {
              hilog.info(0x0000, tag, "====>create first os account err: " + JSON.stringify(err));
              if (err && err.code === 204) {
                hilog.info(0x0000, tag, "====>Current device need token to use API: createOsAccount");
                done();
                return;
              }
              hilog.info(0x0000, tag, "====>create first os account OsAccountInfo: " + JSON.stringify(data));
              if (data) {
                localIdFir = data.localId;
              }
              accountManager.getOsAccountCount((err: BusinessError<void> | null, count: int | undefined): void => {
                hilog.info(0x0000, tag, "====>obtains the number of all os accounts created err: "+ JSON.stringify(err));
                hilog.info(0x0000, tag, "====>obtains the number of all os accounts created count: "+ count);
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (count) {
                      let co: int = count - 1;
                      expect(co).assertEqual(obtainCount);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                }
                accountManager.removeOsAccount(localIdFir, (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>remove localId: " + localIdFir + " err: "+ JSON.stringify(err));
                  accountManager.getOsAccountCount((err: BusinessError<void> | null, data: int | undefined): void => {
                    hilog.info(0x0000, tag, "====>obtains the number accounts created err: "+ JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>obtains the number accounts created data: "+ data);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        if (data) {
                          expect(data).assertEqual(obtainCount);
                          hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0100 end====");
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
                    }
                    done();
                  });
                });
              });
            });
        });
      });

    /**
     * @tc.number   ActsOsAccountQueryCounts_0200
     * @tc.name     ActsOsAccountQueryCounts_0200
     * @tc.desc     Verify to obtain the number os all os accounts created getOsAccountCount promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryCounts_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0200 start====");
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0200 not support multiple osaccouts====");
          let obtainCount: int = await accountManager.getOsAccountCount();
          hilog.info(0x0000, tag, "====>obtains the number of all os accounts created: "+ obtainCount);
          expect(obtainCount).assertEqual(1);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0200 end====");
          done();
          return new Promise<void>(() => {});
        }
        let options: osAccount.CreateOsAccountOptions = {
          shortName: "nameIdSerialG",
          disallowedPreinstalledBundles: [],
          allowedPreinstalledBundles: []
        }
        let obtainCount: int = await accountManager.getOsAccountCount();
        hilog.info(0x0000, tag, "====>obtains the number of all os accounts created: "+ obtainCount);
        let osAccountFir = await CreateAccount("osAccountIdSerialG", osAccount.OsAccountType.NORMAL, options);
        osAccountFir = osAccountFir as osAccount.OsAccountInfo;
        hilog.info(0x0000, tag, "====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
        let localIdFir: int = osAccountFir.localId;
        expect(osAccountFir.localName).assertEqual("osAccountIdSerialG");
        let countFir: int = await accountManager.getOsAccountCount();
        hilog.info(0x0000, tag, "====>obtains the number of all os accounts created count: "+ countFir);
        countFir = countFir - 1;
        expect(countFir).assertEqual(obtainCount);
        await RemoveAccount(localIdFir);
        hilog.info(0x0000, tag, "====>remove localId: " + localIdFir);
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryCounts_0200 end====");
        done();
      });

    /**
     * @tc.name   ActsOsAccountGetActivedOsAccountIds_0100
     * @tc.number ActsOsAccountGetActivedOsAccountIds_0100
     * @tc.desc   query activated osAccount Ids getActivatedOsAccountLocalIds callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetActivedOsAccountIds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0100 start====");
        accountManager.getActivatedOsAccountLocalIds((err: BusinessError<void> | null, dataArray: Array<int> | undefined): void => {
          hilog.info(0x0000, tag, "====>ActsOsAccountGQueryActicedOsAccountIds_0100 err: "+ JSON.stringify(err));
          hilog.info(0x0000, tag, "====>ActsOsAccountGQueryActicedOsAccountIds_0100 dataArray: "+ dataArray);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (dataArray) {
                expect(dataArray?.length).assertLargerOrEqual(1);
                hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.name   ActsOsAccountGetActivedOsAccountIds_0200
     * @tc.number ActsOsAccountGetActivedOsAccountIds_0200
     * @tc.desc   query activated osAccount Ids getActivatedOsAccountLocalIds promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsOsAccountGetActivedOsAccountIds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 start====");
        try {
          let dataArray: Array<int> = await accountManager.getActivatedOsAccountLocalIds();
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 data" + dataArray);
          expect(dataArray.length).assertLargerOrEqual(1);
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>ActsOsAccountGetActivedOsAccountIds_0200 err " + JSON.stringify(err));
          expect().assertFail();
          done();
        };
      });

    /**
     * @tc.number   ActsOsAccountQueryDomainTest_0300
     * @tc.name     ActsOsAccountQueryDomainTest_0300
     * @tc.desc     Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality callback
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryDomainTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryDomainTest_0100 start====");
        accountManager.getOsAccountLocalIdForDomain({ domain: "", accountName: "" },
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>ActsOsAccountQueryDomainTest_0300 err: "+ JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
                hilog.info(0x0000, tag, "====>ActsOsAccountQueryDomainTest_0300 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number   ActsOsAccountQueryDomainTest_0400
     * @tc.name     ActsOsAccountQueryDomainTest_0400
     * @tc.desc     Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality pormise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('ActsOsAccountQueryDomainTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountQueryDomainTest_0400 start====");
        try {
          let accountID: int = await accountManager.getOsAccountLocalIdForDomain({ domain: "", accountName: "" });
          hilog.info(0x0000, tag, "ActsOsAccountQueryDomainTest_0400 accountID: "+ JSON.stringify(accountID));
          expect().assertFail();
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "ActsOsAccountQueryDomainTest_0400 err: "+ JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsOsAccountQueryDomainTest_0400 end====");
          done();
        };
      });

    /**
     * @tc.number   ActsOsAccountIsOsAccountConstraintEnabled_0100
     * @tc.name     ActsOsAccountIsOsAccountConstraintEnabled_0100
     * @tc.desc     Checks whether the given constraint is enabled IsOsAccountConstraintEnabled promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('ActsOsAccountIsOsAccountConstraintEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountConstraintEnabled_0100 start====");
        try {
          let isEnabled: boolean = await accountManager.isOsAccountConstraintEnabled("constraint.bluetooth");
          hilog.info(0x0000, tag, "====>isOsAccountConstraintEnabled data: "+ JSON.stringify(isEnabled));
          expect(isEnabled).assertEqual(true);
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountConstraintEnabled_0100 end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>isOsAccountConstraintEnabled err: "+ JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number   ActsOsAccountIsOsAccountConstraintEnabled_0200
     * @tc.name     ActsOsAccountIsOsAccountConstraintEnabled_0200
     * @tc.desc     Checks whether the given constraint is enabled IsOsAccountConstraintEnabled promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('ActsOsAccountIsOsAccountConstraintEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountConstraintEnabled_0200 start====");
        try {
          let isEnabled: boolean = await accountManager.isOsAccountConstraintEnabled("constraint.fun");
          hilog.info(0x0000, tag, "====>isOsAccountConstraintEnabled data: "+ JSON.stringify(isEnabled));
          expect(isEnabled).assertFalse();
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountConstraintEnabled_0200 end====");
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>isOsAccountConstraintEnabled err: "+ JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number   ActsOsAccountGetOsAccountName_0100
     * @tc.name     ActsOsAccountGetOsAccountName_0100
     * @tc.desc     Gets the name of the OS account to which the caller belongs GetOsAccountName promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('ActsOsAccountGetOsAccountName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetOsAccountName_0100 start====");
        try {
          let osAccountName: string = await accountManager.getOsAccountName();
          hilog.info(0x0000, tag, "====>GetOsAccountName_0100 osAccountName: "+ JSON.stringify(osAccountName));
          done();
        } catch (err) {
          hilog.info(0x0000, tag, "====>GetOsAccountName_0100 err: "+ JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   OsAccountPermissionCheck_0100
     * @tc.number OsAccountPermissionCheck_0100
     * @tc.desc   check updateAccountInfo interface meeting ohos.permission.MANAGE_LOCAL_ACCOUNTS permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountPermissionCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>start====");
      let key = '';
      let oldDomainInfo: osAccount.DomainAccountInfo = {
        domain: key,
        accountName: 'testAccount'
      };
      let newDomainInfo: osAccount.DomainAccountInfo = {
        domain: 'testDomain',
        accountName: 'newTestAccountName'
      };
      try {
        hilog.info(0x0000, tag, "====>start updateAccountInfo");
        await osAccount.DomainAccountManager.updateAccountInfo(oldDomainInfo, newDomainInfo);
        hilog.info(0x0000, tag, "====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
        if (err.code === 801) {
          hilog.info(0x0000, tag, "====>Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_OsAccount_GetLocalIds_0100
     * @tc.number SUB_Account_OsAccount_GetLocalIds_0100
     * @tc.desc   query all osAccount Ids getOsAccountLocalIds promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetLocalIds_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0100 start====");
        try {
          let dataArray: Array<int> = await accountManager.getOsAccountLocalIds();
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0100 data: " + dataArray);
          if (dataArray.length > 0) {
            expect(dataArray.length).assertEqual(1);
            expect(dataArray[0]).assertEqual(100);
          } else {
            expect(dataArray.length).assertEqual(0);
          }
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0100 end====");
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0100 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number   SUB_Account_OsAccount_GetLocalIds_0200
     * @tc.name     SUB_Account_OsAccount_GetLocalIds_0200
     * @tc.desc     Verify to obtain the local IDs of all os accounts created getOsAccountLocalIds promise
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_OsAccount_GetLocalIds_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0200 start====");
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0200 not support multiple osaccouts====");
          done();
          return;
        }
        let options: osAccount.CreateOsAccountOptions = {
          shortName: "Ids",
          disallowedPreinstalledBundles: [],
          allowedPreinstalledBundles: []
        }
        hilog.info(0x0000, tag, "====>start CreateAccount");
        let osAccountFir = await CreateAccount("osAccountIds", osAccount.OsAccountType.NORMAL, options);
        osAccountFir = osAccountFir as osAccount.OsAccountInfo;
        hilog.info(0x0000, tag, "====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
        let localIdFir: int = osAccountFir.localId;
        try {
          let dataArray: Array<int> = await accountManager.getOsAccountLocalIds();
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0200 data: " + dataArray);
          expect(dataArray.length >= 1).assertTrue();
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        await RemoveAccount(localIdFir);
        hilog.info(0x0000, tag, "====>remove localId: " + localIdFir);
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetLocalIds_0200 end====");
        done();
      });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameById_0300
     * @tc.number SUB_Account_OsAccount_GetNameById_0300
     * @tc.desc   Gets the name of target OS account by its local ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameById_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0300 start====");
        try {
          await accountManager.getOsAccountNameByLocalId(-1);
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0300 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameById_0400
     * @tc.number SUB_Account_OsAccount_GetNameById_0400
     * @tc.desc   Gets the name of target OS account by its local ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameById_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0400 start====");
        try {
          await accountManager.getOsAccountNameByLocalId(0);
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0400 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300008);
        }
        done();
      });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameById_0500
     * @tc.number SUB_Account_OsAccount_GetNameById_0500
     * @tc.desc   Gets the name of target OS account by its local ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_OsAccount_GetNameById_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0500 start====");
        try {
          await accountManager.getOsAccountNameByLocalId(110);
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0500 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0500 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.name   SUB_Account_OsAccount_GetNameById_0600
     * @tc.number SUB_Account_OsAccount_GetNameById_0600
     * @tc.desc   Gets the name of target OS account by its local ID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_OsAccount_GetNameById_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0600 start====");
        try {
          let data: string = await accountManager.getOsAccountNameByLocalId(100);
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0600 data: " + data);
          expect(data).not().assertUndefined();
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number   SUB_Account_OsAccount_GetNameById_0700
     * @tc.name     SUB_Account_OsAccount_GetNameById_0700
     * @tc.desc     Gets the name of target OS account by its local ID.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL2
     */
    it('SUB_Account_OsAccount_GetNameById_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0700 start====");
        let isEnable: boolean = await accountManager.checkMultiOsAccountEnabled();
        if (isEnable != true) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0700 not support multiple osaccouts====");
          done();
          return;
        }
        let options: osAccount.CreateOsAccountOptions = {
          shortName: "0700sName",
          disallowedPreinstalledBundles: [],
          allowedPreinstalledBundles: []
        }
        hilog.info(0x0000, tag, "====>start CreateAccount");
        let osAccountFir = await CreateAccount("accountName", osAccount.OsAccountType.NORMAL, options);
        osAccountFir = osAccountFir as osAccount.OsAccountInfo;
        hilog.info(0x0000, tag, "====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
        let localIdFir: int = osAccountFir.localId;
        try {
          let data: string = await accountManager.getOsAccountNameByLocalId(localIdFir);
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0700 data: " + data);
          expect(data).assertEqual("accountName");
        } catch (err) {
          hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0700 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        await RemoveAccount(localIdFir);
        hilog.info(0x0000, tag, "====>remove localId: " + localIdFir);
        hilog.info(0x0000, tag, "====>SUB_Account_OsAccount_GetNameById_0700 end====");
        done();
      });
  });
}