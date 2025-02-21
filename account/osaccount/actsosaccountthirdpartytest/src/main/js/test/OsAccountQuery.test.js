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
import osaccount from '@ohos.account.osAccount'
import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


const ERR_INVALID_PARAMETER = 12300002;
export default function ActsOsAccountThirdPartyTest_third_4() {
    describe('ActsOsAccountThirdPartyTest_third_4', function () {
        afterEach(async function (done) {
            console.debug("====>afterEach start====");
            var osAccountManager = osaccount.getAccountManager();
            var accounts = await osAccountManager.queryAllCreatedOsAccounts()
            for (i=0;i<accounts.length;i++){
                var localId = accounts[i].localId
                if(localId!=100){
                    await osAccountManager.removeOsAccount(localId)
                }
            }
            done();
        })
        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0100
        * @tc.name    : getOsAccountLocalIdForUid callback
        * @tc.desc    : Verify that the user localId is obtained by uid
        */
        it('ActsOsAccountQueryIdFormUid_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalId();
            console.debug("====>testLocalId:" + testLocalId)
            console.debug("====>get AccountManager finish====");
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            console.debug("====>obtained uid:" + uid);
            osAccountManager.getOsAccountLocalIdForUid(uid, (err, localId)=>{
                console.debug("====>get localId err: " + JSON.stringify(err));
                console.debug("====>localId obtained by uid:" + localId);
                expect(err).assertEqual(null);
                expect(localId).assertEqual(testLocalId);
                console.debug("====>ActsOsAccountQueryIdFormUid_0100 end====");
                done();
            });
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0200
        * @tc.name    : getOsAccountLocalIdForUid promise
        * @tc.desc    : Verify that the user localId is obtained by uid
        */
        it('ActsOsAccountQueryIdFormUid_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalId();
            console.debug("====>get AccountManager finish====");
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            console.debug("====>obtained uid:" + uid);
            var localId = await osAccountManager.getOsAccountLocalIdForUid(uid);
            console.debug("====>localId obtained by uid:" + localId);
            expect(localId).assertEqual(testLocalId);
            console.debug("====>ActsOsAccountQueryIdFormUid_0200 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0300
        * @tc.name    : getOsAccountLocalIdForUid callback
        * @tc.desc    : Authentication failed to query user by uid -1
        */
        it('ActsOsAccountQueryIdFormUid_0300', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0300 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var incorrectUid = -1;
            osAccountManager.getOsAccountLocalIdForUid(incorrectUid, (err, localId)=>{
                console.debug("====>get localId err: " + JSON.stringify(err));
                console.debug("====>localId obtained by uid:" + localId);
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                expect(localId).assertEqual(null);
                console.debug("====>ActsOsAccountQueryIdFormUid_0300 end====");
                done();
            });
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0400
        * @tc.name    : getOsAccountLocalIdForUid promise
        * @tc.desc    : Authentication failed to query user by uid -1
        */
        it('ActsOsAccountQueryIdFormUid_0400', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var incorrectUid = -1;
            try{
                await osAccountManager.getOsAccountLocalIdForUid(incorrectUid);
            }catch(err){
                console.debug("====>get localId by uid err:"  +JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsOsAccountQueryIdFormUid_0400 end====");
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0500
        * @tc.name    : getOsAccountLocalIdForUid callback
        * @tc.desc    : Authentication failed to query user by uid 2147483648
        */
        it('ActsOsAccountQueryIdFormUid_0500', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0500 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var incorrectUid = 2147483648;
            osAccountManager.getOsAccountLocalIdForUid(incorrectUid, (err, localId)=>{
                console.debug("====>get localId err: " + JSON.stringify(err));
                console.debug("====>localId obtained by uid:" + localId);
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                expect(localId).assertEqual(null);
                console.debug("====>ActsOsAccountQueryIdFormUid_0500 end====");
                done();
            });
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormUid_0600
        * @tc.name    : getOsAccountLocalIdForUid promise
        * @tc.desc    : Authentication failed to query user by uid 2147483648
        */
        it('ActsOsAccountQueryIdFormUid_0600', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormUid_0600 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var incorrectUid = 2147483648;
            try{
                await osAccountManager.getOsAccountLocalIdForUid(incorrectUid);
            }catch(err){
                console.debug("====>get localId by uid err:"  +JSON.stringify(err));
                expect(err.code).assertEqual(ERR_INVALID_PARAMETER);
                console.debug("====>ActsOsAccountQueryIdFormUid_0600 end====");
                done();
            }
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormProcess_0100
        * @tc.name    : getOsAccountLocalId callback
        * @tc.desc    : Verify that the user localId obtained from the current process uid
        */
        it('ActsOsAccountQueryIdFormProcess_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormProcess_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            var testLocalId = await osAccountManager.getOsAccountLocalIdForUid(uid)
            console.debug("====>get AccountManager finish====");
            osAccountManager.getOsAccountLocalId((err, localId)=>{
                console.debug("====>get localId err: " + JSON.stringify(err));
                console.debug("====>localId obtained by process:" + localId);
                expect(err).assertEqual(null);
                expect(localId).assertEqual(testLocalId);
                console.debug("====>ActsOsAccountQueryIdFormProcess_0100 end====");
                done();
            });
        });

        /*
        * @tc.number  : ActsOsAccountQueryIdFormProcess_0200
        * @tc.name    : getOsAccountLocalId promise
        * @tc.desc    : Verify that the user localId obtained from the current process uid
        */
        it('ActsOsAccountQueryIdFormProcess_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryIdFormProcess_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var bundleName = "com.example.actsosaccountthirdpartytest";
            var bundleInfo = await bundle.getBundleInfo(bundleName, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
            var uid = bundleInfo.uid;
            var testLocalId = await osAccountManager.getOsAccountLocalIdForUid(uid)
            console.debug("====>testLocalId obtained by process:" + testLocalId)
            console.debug("====>get AccountManager finish====");
            var localId = await osAccountManager.getOsAccountLocalId();
            console.debug("====>localId obtained by process:" + localId);
            expect(localId).assertEqual(testLocalId);
            console.debug("====>ActsOsAccountQueryIdFormProcess_0200 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountgetType_0100
        * @tc.name    : getOsAccountType callback
        * @tc.desc    : Verify that the user type obtained from the current process uid
        */
        it('ActsOsAccountgetType_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountgetType_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            osAccountManager.getOsAccountType((err, accountType)=>{
                console.debug("====>get type err: " + JSON.stringify(err));
                console.debug("====>type obtained by process:" + JSON.stringify(accountType));
                expect(err).assertEqual(null);
                expect(accountType).assertEqual(0);
                console.debug("====>ActsOsAccountgetType_0100 end====");
                done();
            });
        });

        /*
        * @tc.number  : ActsOsAccountgetType_0200
        * @tc.name    : getOsAccountType promise
        * @tc.desc    : Verify that the user type obtained from the current process uid
        */
        it('ActsOsAccountgetType_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountgetType_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var accountType = await osAccountManager.getOsAccountType();
            console.debug("====>type obtained by process:" + JSON.stringify(accountType));
            expect(accountType).assertEqual(0);
            console.debug("====>ActsOsAccountgetType_0200 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0100
        * @tc.name    : getSerialNumberForOsAccountLocalId callback
        * @tc.desc    : Verify query serialNumber by 100 user and query 100 user by serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalId();
            console.debug("====>get AccountManager finish====");
            osAccountManager.getSerialNumberForOsAccountLocalId(testLocalId, (err, serialNumber)=>{
                console.debug("====>ger serialNumber err:" + JSON.stringify(err));
                console.debug("====>get serialNumber:" + serialNumber + " by localId: 100" );
                expect(err).assertEqual(null);
                var serialNumberStr = serialNumber.toString();
                var serialIntercept = serialNumberStr.substring(8);
                console.debug("====>truncate the last eight characters: " + serialIntercept);
                expect(serialIntercept).assertEqual("00000001");
                osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, localId)=>{
                    console.debug("====>ger localId err:" + JSON.stringify(err));
                    console.debug("====>get localId:" + localId + " by serialNumber: " + serialNumber);
                    expect(err).assertEqual(null);
                    expect(localId).assertEqual(testLocalId);
                    console.debug("====>ActsOsAccountQueryLocalIdSerial_0100 end====");
                    done();
                })
            })
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0200
        * @tc.name    : getSerialNumberForOsAccountLocalId promise
        * @tc.desc    : Verify query serialNumber by 100 user and query 100 user by serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            var testLocalId = await osAccountManager.getOsAccountLocalId();
            console.debug("====>get AccountManager finish====");
            var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(testLocalId);
            console.debug("====>get serialNumber:" + serialNumber + " by localId: 100" );
            var serialNumberStr = serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.debug("====>truncate the last eight characters: " + serialIntercept);
            expect(serialIntercept).assertEqual("00000001");
            var localId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
            console.debug("====>get localId:" + localId + " by serialNumber: " + serialNumber);
            expect(localId).assertEqual(testLocalId);
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0200 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0300
        * @tc.name    : getOsAccountLocalIdForSerialNumber callback
        * @tc.desc    : Verify query serialNumber by 0 user and query 0 user by serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0300', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0300 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            osAccountManager.getSerialNumberForOsAccountLocalId(0, (err, serialNumber)=>{
                console.debug("====>ger serialNumber err:" + JSON.stringify(err));
                console.debug("====>get serialNumber:" + serialNumber + " by localId: 0" );
                expect(err).assertEqual(null);
                var serialNumberStr = serialNumber.toString();
                var serialIntercept = serialNumberStr.substring(8);
                console.debug("====>truncate the last eight characters: " + serialIntercept);
                expect(serialIntercept).assertEqual("00000000");
                osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, localId)=>{
                    console.debug("====>ger localId err:" + JSON.stringify(err));
                    console.debug("====>get localId:" + localId + " by serialNumber: " + serialNumber);
                    expect(err).assertEqual(null);
                    expect(localId).assertEqual(0);
                    console.debug("====>ActsOsAccountQueryLocalIdSerial_0300 end====");
                    done();
                })
            })
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0400
        * @tc.name    : getOsAccountLocalIdForSerialNumber promise
        * @tc.desc    : Verify query serialNumber by 0 user and query 0 user by serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0400', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(0);
            console.debug("====>get serialNumber:" + serialNumber + " by localId: 0" );
            var serialNumberStr = serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.debug("====>truncate the last eight characters: " + serialIntercept);
            expect(serialIntercept).assertEqual("00000000");
            var localId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
            console.debug("====>get localId:" + localId + " by serialNumber: " + serialNumber);
            expect(localId).assertEqual(0);
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0400 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0500
        * @tc.name    : getSerialNumberForOsAccountLocalId callback
        * @tc.desc    : Verify the query for the newly created user serialNumber and query the owning user through the
        *               serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0500', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0500 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var localId;
            osAccountManager.createOsAccount("osAccountNameIdSerialA", osaccount.OsAccountType.NORMAL, (err, data)=>{
                console.debug("====>create os account err: " + JSON.stringify(err));
                console.debug("====>create os account OsAccountInfo: " + JSON.stringify(data));
                expect(err).assertEqual(null);
                expect(data.localName).assertEqual("osAccountNameIdSerialA");
                expect(data.domainInfo.accountName == "").assertEqual(true)
                expect(data.type).assertEqual(1);
                expect(data.constraints.length > 0).assertEqual(true);
                expect(data.isVerified).assertEqual(false);
                expect(data.distributedInfo.name != null).assertEqual(true);
                expect(data.domainInfo.domain == "").assertEqual(true);
		        expect(data.photo == "").assertEqual(true);
            	expect(data.createTime != "").assertEqual(true);
            	expect(data.lastLoginTime>=0).assertEqual(true);
            	expect(data.serialNumber.toString().length == 16).assertEqual(true);
            	expect(data.isActived).assertEqual(false);
            	expect(data.isCreateCompleted).assertEqual(true)
                localId = data.localId;
                osAccountManager.getSerialNumberForOsAccountLocalId(localId, (err, serialNumber)=>{
                    console.debug("====>queryOsAccountById err:" + JSON.stringify(err));
                    console.debug("====>get serialNumber:" + serialNumber + " by localId: " + localId);
                    expect(err).assertEqual(null);
                    osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber, (err, getlocalId)=>{
                        console.debug("====>ger localId err:" + JSON.stringify(err));
                        console.debug("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
                        expect(err).assertEqual(null);
                        expect(getlocalId).assertEqual(localId);
                        osAccountManager.removeOsAccount(localId, (err)=>{
                            console.debug("====>remove localId: " + localId + " err:" + JSON.stringify(err));
                            expect(err).assertEqual(null);
                            console.debug("====>ActsOsAccountQueryLocalIdSerial_0500 end====");
                            done();
                        })
                    })
                })
            })
        });

        /*
        * @tc.number  : ActsOsAccountQueryLocalIdSerial_0600
        * @tc.name    : getOsAccountLocalIdForSerialNumber promise
        * @tc.desc    : Verify the query for the newly created user serialNumber and query the owning user through the
        *               serialNumber
        */
        it('ActsOsAccountQueryLocalIdSerial_0600', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0600 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var localId;
            var OsAccountInfo = await osAccountManager.createOsAccount("accountIdSerialB", osaccount.OsAccountType.GUEST);
            console.debug("====>create os account OsAccountInfo: " + JSON.stringify(OsAccountInfo));
            expect(OsAccountInfo.localName).assertEqual("accountIdSerialB");
            localId = OsAccountInfo.localId;
            var serialNumber = await osAccountManager.getSerialNumberForOsAccountLocalId(localId);
            console.debug("====>get serialNumber:" + serialNumber + " by localId: " + localId);
            var getlocalId = await osAccountManager.getOsAccountLocalIdForSerialNumber(serialNumber);
            console.debug("====>get localId:" + getlocalId + " by serialNumber: " + serialNumber);
            expect(getlocalId).assertEqual(localId);
            await osAccountManager.removeOsAccount(localId);
            console.debug("====>ActsOsAccountQueryLocalIdSerial_0600 end====");
            done();
        });

        /*
        * @tc.number  : ActsOsAccountQueryCounts_0100
        * @tc.name    : getOsAccountCount callback
        * @tc.desc    : Verify to obtain the number os all os accounts created
        */
          it('ActsOsAccountQueryCounts_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryCounts_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var obtainCount = 0;
            var localIdFir;
            var localIdSec;
            osAccountManager.getOsAccountCount((err, data)=>{
                console.debug("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
                console.debug("====>obtains the number of all os accounts created data:" + data);
                expect(err).assertEqual(null);
                obtainCount = data;
                osAccountManager.createOsAccount("osAccountNameIdSerialE", osaccount.OsAccountType.NORMAL, (err, data)=>{
                    console.debug("====>create first os account err: " + JSON.stringify(err));
                    console.debug("====>create first os account OsAccountInfo: " + JSON.stringify(data));
                    localIdFir = data.localId;
                    expect(err).assertEqual(null);
                    expect(data.localName).assertEqual("osAccountNameIdSerialE");
                 //   osAccountManager.createOsAccount("osAccountIdSerialF", osaccount.OsAccountType.NORMAL, (err, data)=>{
                  //      console.debug("====>create second os account err: " + JSON.stringify(err));
                   //     console.debug("====>create second os account OsAccountInfo: " + JSON.stringify(data));
                   //     localIdSec = data.localId;
                   //     expect(err).assertEqual(null);
                    //    expect(data.localName).assertEqual("osAccountIdSerialF");
                        osAccountManager.getOsAccountCount((err, count)=>{
                            console.debug("====>obtains the number of all os accounts created err:" + JSON.stringify(err));
                            console.debug("====>obtains the number of all os accounts created count:" + count);
                            expect(err).assertEqual(null);
                            count = count - 1;
                            expect(count).assertEqual(obtainCount);
                            osAccountManager.removeOsAccount(localIdFir, (err)=>{
                                console.debug("====>remove localId: " + localIdFir + " err:" + JSON.stringify(err));
                                expect(err).assertEqual(null);
                                osAccountManager.getOsAccountCount((err, data)=>{
                                  console.debug("====>obtains the number accounts created err:" + JSON.stringify(err));
                                    console.debug("====>obtains the number accounts created data:" + data);
                                  expect(err).assertEqual(null);
                                //    data = data - 1;
                                   expect(data).assertEqual(obtainCount);
                                 //   osAccountManager.removeOsAccount(localIdSec, (err)=>{
                                  //      console.debug("====>remove localId: " + localIdSec + " err:" + JSON.stringify(err));
                                  //      expect(err).assertEqual(null);
                                        console.debug("====>ActsOsAccountQueryCounts_0100 end====");
                                        done();
                                   // })
                               })
                            })
                        })
                   // })
                })
            })
        })

        /*
        * @tc.number  : ActsOsAccountQueryCounts_0200
        * @tc.name    : getOsAccountCount promise
        * @tc.desc    : Verify to obtain the number os all os accounts created
        */
        it('ActsOsAccountQueryCounts_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryCounts_0200 start====");
            var osAccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            var obtainCount = await osAccountManager.getOsAccountCount();
            console.debug("====>obtains the number of all os accounts created:" + obtainCount);
            var osAccountFir = await osAccountManager.createOsAccount("osAccountIdSerialG", osaccount.OsAccountType.NORMAL);
            console.debug("====>create first os account OsAccountInfo: " + JSON.stringify(osAccountFir));
            var localIdFir = osAccountFir.localId;
            expect(osAccountFir.localName).assertEqual("osAccountIdSerialG");
           // var osAccountSec = await osAccountManager.createOsAccount("osAccountIdSerialH", osaccount.OsAccountType.NORMAL);
           // console.debug("====>create second os account OsAccountInfo: " + JSON.stringify(osAccountSec));
          //  var localIdSec = osAccountSec.localId;
           // expect(osAccountSec.localName).assertEqual("osAccountIdSerialH");
            var countFir = await osAccountManager.getOsAccountCount();            
            console.debug("====>obtains the number of all os accounts created count:" + countFir);
            countFir = countFir - 1;
            expect(countFir).assertEqual(obtainCount);
            await osAccountManager.removeOsAccount(localIdFir);
            console.debug("====>remove localId: " + localIdFir);
          //  var countSec = await osAccountManager.getOsAccountCount();
          //  console.debug("====>obtains the number accounts created count:" + countSec);
          //  countSec = countSec - 1;
          //  expect(countSec).assertEqual(obtainCount);
           // await osAccountManager.removeOsAccount(localIdSec);
           // console.debug("====>remove localId: " + localIdSec);
            console.debug("====>ActsOsAccountQueryCounts_0200 end====");
            done();
        })


        /*
        * @tc.number  : ActsOsAccountGetActivedOsAccountIds_0100
        * @tc.name    : getActivatedOsAccountLocalIds callback
        * @tc.desc    : query activated osAccount Ids
        */
        it('ActsOsAccountGetActivedOsAccountIds_0100', 0, async function (done) {
            console.debug("====>ActsOsAccountGetActivedOsAccountIds_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            osAccountManager.getActivatedOsAccountLocalIds((err,dataArray)=>{
                console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 err :" + JSON.stringify(err));
                expect(err).assertEqual(null)
                console.info("====>ActsOsAccountGQueryActicedOsAccountIds_0100 dataArray:" + dataArray);
                expect(dataArray.length).assertEqual(1)
                done();
            })
        })
        
        /*
        * @tc.number  : ActsOsAccountGetActivedOsAccountIds_0200
        * @tc.name    : getActivatedOsAccountLocalIds promise
        * @tc.desc    : query activated osAccount Ids
        */
        it('ActsOsAccountGetActivedOsAccountIds_0200', 0, async function (done) {
            console.debug("====>ActsOsAccountGetActivedOsAccountIds_0200 start====");
            var osAccountManager = osaccount.getAccountManager(); 
            osAccountManager.getActivatedOsAccountLocalIds().then((dataArray)=>{
                console.debug("====>ActsOsAccountGetActivedOsAccountIds_0200 data" + JSON.stringify(dataArray))
                expect(dataArray.length).assertEqual(1)
                done();
            }).catch((err)=>{
                console.info("====>ActsOsAccountGetActivedOsAccountIds_0200 err " + JSON.stringify(err));
                expect(err).assertFalse(null)
                done();
            });
        })


        /*
        * @tc.number  : ActsOsAccountCheckConstraints_0300
        * @tc.name    : Constraints callback
        * @tc.desc    : get 0 local user all constraints
        */
        it('ActsOsAccountCheckConstraints_3100', 0, async function(done){
            console.debug("====>ActsOsAccountCheckConstraints_3100 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("====>get AccountManager finish====");
            AccountManager.getOsAccountConstraints(0, (err, constraints)=>{
                console.debug("====>getOsAccountConstraints err:" + JSON.stringify(err));
                console.debug("====>getOsAccountConstraints:" + JSON.stringify(constraints));
                expect(err).assertEqual(null);
                expect(constraints.length).assertEqual(0);
                console.debug("====>ActsOsAccountCheckConstraints_3100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountCheckConstraints_0400
        * @tc.name    : Constraints promise
        * @tc.desc    : get 0 local user all constraints
        */
        it('ActsOsAccountCheckConstraints_3200', 0, async function(done){
            console.debug("====>ActsOsAccountCheckConstraints_3200 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("get AccountManager finish====");
            AccountManager.getOsAccountConstraints(0).then((data)=>{
                console.debug("====>ActsOsAccountCheckConstraints_3200 getOsAccountConstraints data:" + data);
                done();
            }).catch((err)=>{
                console.debug("====>ActsOsAccountCheckConstraints_3200 getOsAccountConstraints err:" + JSON.stringify(err));
                expect().assertFalse()
                done();
            })
        })

        /**
        * @tc.number     ActsOsAccountQueryDomainTest_0300
        * @tc.name       Test createOsAccountForDomain getOsAccountLocalIdForDomain callback
        * @tc.desc       Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality
        */
        it('ActsOsAccountQueryDomainTest_0300', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryDomainTest_0100 start====");
            var osAccountManager = osaccount.getAccountManager();
            osAccountManager.getOsAccountLocalIdForDomain({domain: "", accountName: ""}, (err)=>{
                console.debug("====>ActsOsAccountQueryDomainTest_0300 err:" + JSON.stringify(err));
                expect(err.code != 0).assertEqual(true)
                console.debug("====>ActsOsAccountQueryDomainTest_0300 end====");
                done();
            })
        });

        /**
        * @tc.number     ActsOsAccountQueryDomainTest_0400
        * @tc.name       Test createOsAccountForDomain getOsAccountLocalIdForDomain pormise
        * @tc.desc       Test createOsAccountForDomain getOsAccountLocalIdForDomain API functionality
        */
         it('ActsOsAccountQueryDomainTest_0400', 0, async function (done) {
            console.debug("====>ActsOsAccountQueryDomainTest_0400 start====");
            var osAccountManager = osaccount.getAccountManager();
            osAccountManager.getOsAccountLocalIdForDomain({domain: "", accountName: ""}).then((accountID)=>{
                console.debug("ActsOsAccountQueryDomainTest_0400 accountID:" + JSON.stringify(accountID))
                done();
            }).catch((err)=>{
                console.debug("ActsOsAccountQueryDomainTest_0400 err:" + JSON.stringify(err))
                expect(err.code != 0).assertEqual(true)
                done();
            })
        });

        /*
        * @tc.number  : ActsOsAccountGetCurrent_2100
        * @tc.name    : getCurrentOsAccount callback
        * @tc.desc    : Get the os account information to which the application belongs
        */
        it('ActsOsAccountGetCurrent_2100', 0, async function(done){
            console.debug("====>ActsOsAccountGetCurrent_2100 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("====>get os AccountManager finish====");
            AccountManager.getCurrentOsAccount((err, data)=>{
                console.debug("====>getCurrentOsAccount err:" + JSON.stringify(err));
                console.debug("====>getCurrentOsAccount data:" + JSON.stringify(data));
                expect(err).assertEqual(null);
                console.debug("====>ActsOsAccountGetCurrent_2100 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountGetCurrent_1800
        * @tc.name    : getCurrentOsAccount promise
        * @tc.desc    : Get the os account information to which the application belongs
        */
        it('ActsOsAccountGetCurrent_2200', 0, async function(done){
            console.debug("====>ActsOsAccountGetCurrent_2200 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("====>get os AccountManager finish====");
            var data = await AccountManager.getCurrentOsAccount();
            console.debug("====>getCurrentOsAccount data:" + JSON.stringify(data));
            expect(data.localId).assertEqual(100);
             expect(data.type).assertEqual(0);
            var serialNumberStr = data.serialNumber.toString();
            var serialIntercept = serialNumberStr.substring(8);
            console.debug("====>truncate the last eight characters: " + serialIntercept);
            expect(serialIntercept).assertEqual("00000001");
            expect(data.isCreateCompleted).assertTrue();
            console.debug("====>ActsOsAccountGetCurrent_2200 end====");
            done();
        })


        /*
        * @tc.number  : ActsOsAccountCheckConstraints_3300
        * @tc.name    : checkOsAccountConstraintEnabled callback
        * @tc.desc    : the application call interface does not meet the permissions
        */
        it('ActsOsAccountCheckConstraints_3300', 0, async function(done){
            console.debug("====>ActsOsAccountCheckConstraints_3300 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("====>get os AccountManager finish====");
            AccountManager.checkOsAccountConstraintEnabled(100, "constraint.bluetooth", (err, result)=>{
                console.debug("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                expect(result).assertTrue();
                console.debug("====>ActsOsAccountCheckConstraints_3300 end====");
                done();
            })
        })

        /*
        * @tc.number  : ActsOsAccountPermission_3400
        * @tc.name    : checkOsAccountConstraintEnabled promise
        * @tc.desc    : the application call interface does not meet the permissions
        */
        it('ActsOsAccountCheckConstraints_3400', 0, async function(done){
            console.debug("====>ActsOsAccountCheckConstraints_3400 start====");
            var AccountManager = osaccount.getAccountManager();
            console.debug("====>get os AccountManager finish====");
            try{
                await AccountManager.checkOsAccountConstraintEnabled(100, "constraint.bluetooth");
                done();
            }
            catch(err){
                console.debug("====>checkOsAccountConstraintEnabled err:" + JSON.stringify(err));
                expect(err).assertEqual(null);
                console.debug("====>ActsOsAccountCheckConstraints_3400 end====");
                done();
            }
        })       
    })
}