/**
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
import { describe,beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import Bundle from '@ohos.bundle';
import account from '@ohos.account.osAccount';

const TAG_TEST_0100_001 = ' Sub_Bms_Framework_Query_AppInfo_3460 ';
const TAG_TEST_0100_002 = ' Sub_Bms_Framework_Query_AppInfo_3480 ';
const TAG_TEST_0100_003 = ' Sub_Bms_Framework_Query_AppInfo_3500 ';
const TAG_TEST_0200_001 = ' bundle_getApplicationInfo_test_0200_004 ';
const TAG_TEST_0200_002 = ' bundle_getApplicationInfo_test_0200_005 ';
const TAG_TEST_0200_003 = ' bundle_getApplicationInfo_test_0200_006 ';
const TAG_TEST_0300_001 = ' bundle_getApplicationInfo_test_0300_007 ';
const TAG_TEST_0400_001 = ' bundle_getApplicationInfo_test_0400_008 ';
const TAG_TEST_0500_001 = ' bundle_getApplicationInfo_test_0500_009 ';
const TAG_TEST_0500_002 = ' bundle_getApplicationInfo_test_0500_0010 ';
const TAG_TEST_0600_001 = ' bundle_getApplicationInfo_test_0600_0011 ';
const TAG_TEST_0600_002 = ' bundle_getApplicationInfo_test_0600_0012 ';
const TAG_TEST_0600_003 = ' bundle_getApplicationInfo_test_0600_0013 ';
const BUNDLE_NAME = 'com.open.harmony.packagemag';
const BUNDLE_OTHER = 'com.example.third1';
const BUNDLE_NOTEXIST = 'com.ohos.package';
const FLAG_DEFAULT = Bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const PATH = "/data/app/el1/bundle/public";
const TEST_DEMO = "8E93863FC32EE238060BF69A9B37E2608FFFB21F93C862DD511CBAC9F30024B5";
let userId = 0;

export default function applicationBundleJsunit() {

    describe('appInfoTest_bms_2', function () {

        beforeAll(async function (done) {
            await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
                console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
                userId = account;
                done();
              }).catch(err=>{
                console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
                done();
              })
        });

      
        /**
         * @tc.name   TAG_TEST_0100_002
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3480
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(TAG_TEST_0100_002, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getApplicationInfo(BUNDLE_NAME,
                Bundle.BundleFlag.GET_ALL_APPLICATION_INFO, userId).catch((error) => {
                    console.info(TAG_TEST_0100_002 + 'UserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0100_002, startTime, endTime);
            console.info(TAG_TEST_0100_002 + ' UserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0100_002, data);
            getApplicationInfoSuccess_plus(TAG_TEST_0100_002, data);
            done();
        });

        /**
         * @tc.name   TAG_TEST_0100_003
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3500
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it(TAG_TEST_0100_003, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getApplicationInfo(BUNDLE_NAME,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE, userId).catch((error) => {
                    console.info(TAG_TEST_0100_003 + 'UserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0100_003, startTime, endTime);
            console.info(TAG_TEST_0100_003 + ' UserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0100_003, data);
            getApplicationInfoSuccess_plus(TAG_TEST_0100_003, data);
            done();
        });



        /**
         * @tc.name   TAG_TEST_0200_002
         * @tc.number bundle_getApplicationInfo_test_0200_002
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it(TAG_TEST_0200_002, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getApplicationInfo(BUNDLE_NAME,
                Bundle.BundleFlag.GET_ALL_APPLICATION_INFO).catch((error) => {
                    console.info(TAG_TEST_0200_002 + 'onUserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0200_002, startTime, endTime);
            console.info(TAG_TEST_0200_002 + ' onUserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0200_002, data);
            getApplicationInfoSuccess_plus(TAG_TEST_0200_002, data);
            done();
        });

        /**
         * @tc.name   TAG_TEST_0200_003
         * @tc.number bundle_getApplicationInfo_test_0200_003
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it(TAG_TEST_0200_003, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getApplicationInfo(BUNDLE_NAME,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE).catch((error) => {
                    console.info(TAG_TEST_0200_003 + 'onUserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0200_003, startTime, endTime);
            console.info(TAG_TEST_0200_003 + ' onUserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0200_003, data);
            getApplicationInfoSuccess_plus(TAG_TEST_0200_003, data);
            done();
        });


        /**
         * @tc.name   TAG_TEST_0600_002
         * @tc.number bundle_getApplicationInfo_test_0600_002
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it(TAG_TEST_0600_002, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let startTime = await Utils.getNowTime();
            let errors
            await Bundle.getApplicationInfo(BUNDLE_NOTEXIST,
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId).then((data) => {
                    console.info(TAG_TEST_0600_002 + 'other bundleName UserId promise data is: ' + data);
                    expect(data).assertFail();
                }).catch((error) => {
                    console.info(TAG_TEST_0600_002 + 'other bundleName UserId promise error is: ' + error);
                    errors = error
                    expect(errors.code).assertEqual(1);
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0600_002, startTime, endTime);
            done();
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AppInfo_0440
         * @tc.number Sub_Bms_Framework_Query_AppInfo_0440
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Bms_Framework_Query_AppInfo_0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let startTime = await Utils.getNowTime();
            await Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT).then((data) => {
                let endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0600_003, startTime, endTime);
                expectData(TAG_TEST_0600_003, data);
                getApplicationInfoSuccess_plus(TAG_TEST_0600_003, data);
            }).catch((error) => {
                console.info(TAG_TEST_0600_003 + 'noUserId promise error is: ' + error);
                expect(error).assertFail();
            });
            startTime = await Utils.getNowTime();
            Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT, (err, data) => {
                let endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0600_003, startTime, endTime);
                console.info(TAG_TEST_0600_003 + 'noUserId promise data is: ' + data);
                expectData(TAG_TEST_0600_003, data);
                getApplicationInfoSuccess_plus(TAG_TEST_0600_003, data);
                expect(err.code).assertEqual(0);
                done();
            });
        });

        /**
         * @tc.name   bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE
         * @tc.number bundle_getApplicationInfo_test_0700_001
         * @tc.desc   getApplicationInfo with GET_ABILITY_INFO_WITH_DISABLE flag test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getApplicationInfo(BUNDLE_NAME,
                Bundle.BundleFlag.GET_ABILITY_INFO_WITH_DISABLE, userId).catch((error) => {
                    console.info('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE', startTime, endTime);
            console.info('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE promise data is: ' + JSON.stringify(data));
            expectData('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE', data);
            getApplicationInfoSuccess_plus('bundle_getApplicationInfo_test_GET_ABILITY_INFO_WITH_DISABLE', data);
            done();
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AppInfo_0460
         * @tc.number Sub_Bms_Framework_Query_AppInfo_0460
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Bms_Framework_Query_AppInfo_0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
          await Bundle.getApplicationInfo(BUNDLE_OTHER, FLAG_DEFAULT).then((data) => {
              console.info('noUserId promise data is: ' + data);
              getApplicationInfoSuccessOther(data);
          }).catch((error) => {
            expect(error).assertFail();
          });
          Bundle.getApplicationInfo(BUNDLE_OTHER, FLAG_DEFAULT, (err, data) => {
            console.info('noUserId promise data is: ' + data);
            expect(err.code).assertEqual(0);
            getApplicationInfoSuccessOther(data);
            done();
          });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AppInfo_0480
         * @tc.number Sub_Bms_Framework_Query_AppInfo_0480
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AppInfo_0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            let startTime = await Utils.getNowTime();
            await Bundle.getApplicationInfo(BUNDLE_NOTEXIST, FLAG_DEFAULT).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
                let endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0600_001, startTime, endTime);
            });
            startTime = await Utils.getNowTime();
            await Bundle.getApplicationInfo(BUNDLE_NOTEXIST, FLAG_DEFAULT, (err, data) => {
                let endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0600_001, startTime, endTime);
                expect(err.code).assertEqual(1);
                expect(JSON.stringify(data)).assertEqual(undefined);
                done();
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AppInfo_0520
         * @tc.number Sub_Bms_Framework_Query_AppInfo_0520
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AppInfo_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo('', FLAG_DEFAULT).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
            });
            await Bundle.getApplicationInfo(null, FLAG_DEFAULT).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
            });
            await Bundle.getApplicationInfo(BUNDLE_NAME, null).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
            });
            Bundle.getApplicationInfo('', FLAG_DEFAULT, (err, data) => {
                expect(err.code).assertEqual(1);
                expect(JSON.stringify(data)).assertEqual(undefined);
                Bundle.getApplicationInfo(null, FLAG_DEFAULT, (err, data) => {
                    expect(err.code).assertEqual(1);
                    Bundle.getApplicationInfo(BUNDLE_NAME, null, (err, data) => {
                        expect(err.code).assertEqual(1);
                        done();
                    });
                });
            });
        });

        /**
         * @tc.name   testGetApplicationInfoEmptyBundleNameWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3530
         * @tc.desc   Test getApplicationInfo with empty string bundleName and userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoEmptyBundleNameWithUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo("", FLAG_DEFAULT, userId, (err, data) => {
	         if (err) {
                    console.info('testGetApplicationInfoEmptyBundleNameWithUserIdCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoEmptyBundleNameWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullBundleNameWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3540
         * @tc.desc   Test getApplicationInfo with null bundleName and userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullBundleNameWithUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
           Bundle.getApplicationInfo(null, FLAG_DEFAULT, userId, (err, data) => {	        
	         if (err) {
                     console.info('testGetApplicationInfoNullBundleNameWithUserIdCallback err:' + JSON.stringify(err));
                     expect(err.code).assertEqual(1);
                     done();
                    return;
                }
                console.info('testGetApplicationInfoNullBundleNameWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
               
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedBundleNameWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3550
         * @tc.desc   Test getApplicationInfo with undefined bundleName and userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedBundleNameWithUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
             Bundle.getApplicationInfo(undefined, FLAG_DEFAULT, userId, (err, data) => {
	         if (err) {
                     console.info('testGetApplicationInfoUndefinedBundleNameWithUserIdCallback err:' + JSON.stringify(err));
                     expect(err.code).assertEqual(1);
                     done();
                     return;
                 }
                console.info('testGetApplicationInfoUndefinedBundleNameWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullFlagsWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3560
         * @tc.desc   Test getApplicationInfo with null bundleFlags and userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullFlagsWithUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
             Bundle.getApplicationInfo(BUNDLE_NAME, null, userId, (err, data) => {
	       
	         if (err) {
                       console.info('testGetApplicationInfoNullFlagsWithUserIdCallback err:' + JSON.stringify(err));
                       expect(err.code).assertEqual(1);
                       done();
                       return;
                 }
                console.info('testGetApplicationInfoNullFlagsWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedFlagsWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3570
         * @tc.desc   Test getApplicationInfo with undefined bundleFlags and userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedFlagsWithUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
             Bundle.getApplicationInfo(BUNDLE_NAME, undefined, userId, (err, data) => { 
	        if (err) {
                     console.info('testGetApplicationInfoNullFlagsWithUserIdCallback err:' + JSON.stringify(err));
                     expect(err.code).assertEqual(1);
                     done();
                     return;
                 }
                console.info('testGetApplicationInfoNullFlagsWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
            });
        });

        /**
         * @tc.name   testGetApplicationInfoWithNullUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3580
         * @tc.desc   Test getApplicationInfo with null userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoWithNullUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT, null, (err, data) => {
	         if (err) {
                      console.info('testGetApplicationInfoWithNullUserIdCallback err:' + JSON.stringify(err));
                      expect(err.code).assertEqual(1);
                      done();
                     return;
                 }
                console.info('testGetApplicationInfoWithNullUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()     
            });
        });

        /**
         * @tc.name   testGetApplicationInfoWithUndefinedUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3590
         * @tc.desc   Test getApplicationInfo with undefined userId. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoWithUndefinedUserIdCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
              Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT, undefined, (err, data) => {
	         if (err) {
                     console.info('testGetApplicationInfoWithUndefinedUserIdCallback err:' + JSON.stringify(err));
                     expect(err.code).assertEqual(1);
                     done();
                     return;
                 }
                console.info('testGetApplicationInfoWithUndefinedUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done()    
            });
        });

        /**
         * @tc.name   testGetApplicationInfoEmptyBundleNameCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3600
         * @tc.desc   Test getApplicationInfo with empty string bundleName. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoEmptyBundleNameCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo("", FLAG_DEFAULT, (err, data) => {
                if (err) {
                    console.info('testGetApplicationInfoEmptyBundleNameCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoEmptyBundleNameCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullBundleNameCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3610
         * @tc.desc   Test getApplicationInfo with null bundleName. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullBundleNameCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo(null, FLAG_DEFAULT, (err, data) => {
                if (err) {
                    console.info('testGetApplicationInfoNullBundleNameCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoNullBundleNameCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedBundleNameCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3620
         * @tc.desc   Test getApplicationInfo with undefined bundleName. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedBundleNameCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo(undefined, FLAG_DEFAULT, (err, data) => {
                if (err) {
                    console.info('testGetApplicationInfoUndefinedBundleNameCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoUndefinedBundleNameCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullFlagsCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3630
         * @tc.desc   Test getApplicationInfo with null bundleFlags. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullFlagsCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo(BUNDLE_NAME, null, (err, data) => {
                if (err) {
                    console.info('testGetApplicationInfoNullFlagsCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoNullFlagsCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedFlagsCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3640
         * @tc.desc   Test getApplicationInfo with undefined bundleFlags. (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedFlagsCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            Bundle.getApplicationInfo(BUNDLE_NAME, undefined, (err, data) => {
                if (err) {
                    console.info('testGetApplicationInfoUndefinedFlagsCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(1);
                    done();
                    return;
                }
                console.info('testGetApplicationInfoUndefinedFlagsCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoEmptyBundleNameWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3650
         * @tc.desc   Test getApplicationInfo with empty string bundleName and userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoEmptyBundleNameWithUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo("", FLAG_DEFAULT, userId).then((data) => {
                console.info('testGetApplicationInfoEmptyBundleNameWithUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoEmptyBundleNameWithUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullBundleNameWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3660
         * @tc.desc   Test getApplicationInfo with null bundleName and userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullBundleNameWithUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(null, FLAG_DEFAULT, userId).then((data) => {
                console.info('testGetApplicationInfoNullBundleNameWithUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoNullBundleNameWithUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedBundleNameWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3670
         * @tc.desc   Test getApplicationInfo with undefined bundleName and userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedBundleNameWithUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(undefined, FLAG_DEFAULT, userId).then((data) => {
                console.info('testGetApplicationInfoUndefinedBundleNameWithUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoUndefinedBundleNameWithUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoNullFlagsWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3680
         * @tc.desc   Test getApplicationInfo with null bundleFlags and userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoNullFlagsWithUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(BUNDLE_NAME, null, userId).then((data) => {
                console.info('testGetApplicationInfoNullFlagsWithUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoNullFlagsWithUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoUndefinedFlagsWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3690
         * @tc.desc   Test getApplicationInfo with undefined bundleFlags and userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoUndefinedFlagsWithUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(BUNDLE_NAME, undefined, userId).then((data) => {
                console.info('testGetApplicationInfoUndefinedFlagsWithUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoUndefinedFlagsWithUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoWithNullUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3700
         * @tc.desc   Test getApplicationInfo with null userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoWithNullUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT, null).then((data) => {
                console.info('testGetApplicationInfoWithNullUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoWithNullUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   testGetApplicationInfoWithUndefinedUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_3710
         * @tc.desc   Test getApplicationInfo with undefined userId. (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetApplicationInfoWithUndefinedUserIdPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            await Bundle.getApplicationInfo(BUNDLE_NAME, FLAG_DEFAULT, undefined).then((data) => {
                console.info('testGetApplicationInfoWithUndefinedUserIdPromise success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            }).catch((err) => {
                console.info('testGetApplicationInfoWithUndefinedUserIdPromise err:' + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.name   getApplicationInfoNoMetaData
         * @tc.number Sub_Bms_Framework_Query_AppInfo_8400
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('getApplicationInfoNoMetaData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await Bundle.getApplicationInfo(BUNDLE_OTHER, FLAG_DEFAULT ,userId).then((data) => {
                getApplicationInfoSuccessOther_METADATA(data);
                expect(JSON.stringify(data.metaData)).assertEqual("{}");
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.getApplicationInfo(BUNDLE_OTHER, FLAG_DEFAULT,userId, (err, data) => {
                expect(err.code).assertEqual(0);
                getApplicationInfoSuccessOther_METADATA(data);
                expect(JSON.stringify(data.metaData)).assertEqual("{}");
                done();
            });
        });

        /**
         * @tc.name   getApplicationInfoNotExistBundleName
         * @tc.number Sub_Bms_Framework_Query_AppInfo_8300
         * @tc.desc   Check the return value of the interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('getApplicationInfoNotExistBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
          await Bundle.getApplicationInfo(BUNDLE_NOTEXIST, FLAG_DEFAULT, userId).then((data) => {
            expect(data).assertFail();
          }).catch((error) => {
            expect(error.code).assertEqual(1);
          });
          await Bundle.getApplicationInfo(BUNDLE_NOTEXIST, FLAG_DEFAULT, userId, (err, data) => {
            expect(err.code).assertEqual(1);
            expect(JSON.stringify(data)).assertEqual(undefined);
            done();
          });
        });

        function expectData(msg, data) {
            expect(typeof (data)).assertEqual('object');
            expect(typeof (data.name)).assertEqual('string');
            expect(typeof (data.codePath)).assertEqual('string');
            expect(typeof (data.accessTokenId)).assertEqual('number');
            expect(typeof (data.description)).assertEqual('string');
            expect(typeof (data.descriptionId)).assertEqual('number');
            expect(typeof (data.icon)).assertEqual('string');
            expect(data.iconIndex).assertEqual(data.iconId);
            expect(typeof (data.label)).assertEqual('string');
            expect(typeof (data.labelId)).assertEqual('number');
            expect(typeof (data.systemApp)).assertEqual('boolean')
            expect(typeof (data.supportedModes)).assertEqual('number');
            expect(typeof (data.process)).assertEqual('string');
            expect(typeof (data.entryDir)).assertEqual('string');
            expect(typeof (data.metaData)).assertEqual('object');
            expect(typeof (data.enabled)).assertEqual('boolean');
            expect(typeof (data.uid)).assertEqual('number');
            expect(typeof (data.entityType)).assertEqual('string');
            expect(typeof (data.removable)).assertEqual('boolean');
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(Array.isArray(data.moduleSourceDirs)).assertEqual(true);
            expect(Array.isArray(data.moduleInfos)).assertEqual(true);
        }

        function getApplicationInfoSuccess(msg, data) {
            expect(data.name).assertEqual(BUNDLE_NAME);
            expect(data.codePath).assertEqual(PATH + '/' + BUNDLE_NAME);
            expect(data.accessTokenId > 0).assertEqual(true);
            expect(data.description).assertEqual('$string:entry_description');
            expect(data.descriptionId > 0).assertEqual(true);
            expect(data.icon).assertEqual('$media:icon');
            expect(data.iconId > 0).assertEqual(true);
            expect(data.iconIndex > 0).assertEqual(true);
            expect(data.iconIndex).assertEqual(data.iconId);
            expect(data.uid > 0).assertEqual(true);
            expect(data.label).assertEqual('$string:entry_MainAbility');
            expect(data.labelId > 0).assertEqual(true);
            expect(data.systemApp).assertEqual(false);
            expect(data.supportedModes).assertEqual(0);
            expect(data.process).assertEqual(BUNDLE_NAME);
            expect(data.entryDir).assertEqual('');
            expect(data.enabled).assertEqual(true);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertEqual(true);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual('');
            expect(data.moduleSourceDirs.length).assertEqual(0);
            expect(data.permissions[0]).assertEqual("ohos.permission.GET_BUNDLE_INFO");
            expect(data.permissions[1]).assertEqual("ohos.permission.GET_BUNDLE_INFO_PRIVILEGED");
            expect(data.permissions[2]).assertEqual("ohos.permission.USE_BLUETOOTH");
            console.log(msg + ' end  ' + JSON.stringify(data));
        }

        function getApplicationInfoSuccess_plus(msg, data) {
            expect(data.name).assertEqual(BUNDLE_NAME);
            expect(data.codePath).assertEqual(PATH + '/' + BUNDLE_NAME);
            expect(data.accessTokenId).assertLarger(0);
            expect(data.description).assertEqual('$string:entry_description');
            expect(data.descriptionId).assertLarger(0);
            expect(data.icon).assertEqual('$media:icon');
            expect(data.iconId).assertLarger(0);
            expect(data.label).assertEqual('$string:entry_MainAbility');
            expect(data.labelId).assertLarger(0);
            expect(data.systemApp).assertFalse();
            expect(data.supportedModes).assertEqual(0);
            expect(data.process).assertEqual(BUNDLE_NAME);
            expect(data.entryDir).assertEqual('');
            expect(data.permissions.length).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(0);
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual('');
            expect(JSON.stringify(data.metaData)).assertEqual("{}");
            expect(data.enabled).assertTrue();
            expect(data.uid).assertLarger(0);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertTrue();
            console.info(msg + ' end  ');
        }

        function getApplicationInfoSuccessOther(data) {
          expect(data.name).assertEqual(BUNDLE_OTHER);
          expect(data.codePath).assertEqual(PATH + '/' + BUNDLE_OTHER);
          expect(data.accessTokenId).assertLarger(0);
          expect(data.description).assertEqual('$string:entry_description');
          expect(data.descriptionId).assertLarger(0);
          expect(data.icon).assertEqual('$media:icon');
          expect(data.iconId).assertLarger(0);
          expect(data.iconIndex).assertLarger(0);
          expect(data.iconIndex).assertEqual(data.iconId);
          expect(data.label).assertEqual('$string:app_name');
          expect(data.labelId).assertLarger(0);
          expect(data.systemApp).assertFalse();
          expect(data.supportedModes).assertEqual(0);
          expect(data.process).assertEqual(BUNDLE_OTHER);
          expect(data.entryDir).assertEqual('');
          expect(data.permissions.length).assertEqual(0);
          expect(data.moduleSourceDirs.length).assertEqual(0);
          expect(data.moduleInfos.length).assertEqual(1);
          expect(data.moduleInfos[0].moduleName).assertEqual('entry');
          expect(data.moduleInfos[0].moduleSourceDir).assertEqual('');
          expect(JSON.stringify(data.metaData)).assertEqual("{}");
          expect(data.enabled).assertTrue();
          expect(data.uid).assertLarger(0);
          expect(data.entityType).assertEqual('unspecified');
          expect(data.removable).assertTrue();
          console.info('check end');
        }

        function getApplicationInfoSuccessOther_METADATA(data) {
            expect(data.name).assertEqual(BUNDLE_OTHER);
            expect(data.codePath).assertEqual(PATH + '/' + BUNDLE_OTHER);
            expect(data.accessTokenId).assertLarger(0);
            expect(data.description).assertEqual('$string:entry_description');
            expect(data.descriptionId).assertLarger(0);
            expect(data.icon).assertEqual('$media:icon');
            expect(data.iconId).assertLarger(0);
            expect(data.label).assertEqual('$string:app_name');
            expect(data.labelId).assertLarger(0);
            expect(data.systemApp).assertFalse();
            expect(data.supportedModes).assertEqual(0);
            expect(data.process).assertEqual(BUNDLE_OTHER);
            expect(data.entryDir).assertEqual('');
            expect(data.permissions.length).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(0);
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual('');
            expect(data.enabled).assertTrue();
            expect(data.uid).assertLarger(0);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertTrue();
            console.info('check end');
        }

      });
}