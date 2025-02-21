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
import { describe,beforeAll, it, expect } from 'hypium/index';
import Utils from './Utils';
import Bundle from '@ohos.bundle';
import account from '@ohos.account.osAccount';

const TAG_TEST_0100_001 = ' bundle_getAllApplicationInfo_test_0100_001 ';
const TAG_TEST_0100_002 = ' bundle_getAllApplicationInfo_test_0100_002 ';
const TAG_TEST_0100_003 = ' bundle_getAllApplicationInfo_test_0100_003 ';
const TAG_TEST_0200_001 = ' bundle_getAllApplicationInfo_test_0200_004 ';
const TAG_TEST_0200_002 = ' bundle_getAllApplicationInfo_test_0200_005 ';
const TAG_TEST_0200_003 = ' bundle_getAllApplicationInfo_test_0200_006 ';
const TAG_TEST_0300_001 = ' bundle_getAllApplicationInfo_test_0300_007 ';
const TAG_TEST_0400_001 = ' bundle_getAllApplicationInfo_test_0400_008 ';
const TAG_TEST_0500_001 = ' bundle_getAllApplicationInfo_test_0500_009 ';
const TAG_TEST_0500_002 = ' bundle_getAllApplicationInfo_test_0500_0010 ';
const DEFAULT_FLAG = Bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const BUNDLE_OTHER = 'com.example.third1';
const PATH = "/data/app/el1/bundle/public";
let userId = 0;

export default function getAllApplicationBundleTest() {

    describe('appInfoTest_bms_1', function () {

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
         * @tc.number: bundle_getApplicationInfo_test_0100_001
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0100_001, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId).catch((error) => {
                    console.info(TAG_TEST_0100_001 + 'UserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0100_001, startTime, endTime);
            console.info(TAG_TEST_0100_001 + ' UserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0100_001, data)
            getApplicationInfoSuccess(TAG_TEST_0100_001, data);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0100_002
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0100_002, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_ALL_APPLICATION_INFO, userId).catch((error) => {
                    console.info(TAG_TEST_0100_002 + 'UserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0100_002, startTime, endTime);
            console.info(TAG_TEST_0100_002 + ' UserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0100_002, data)
            getApplicationInfoSuccess(TAG_TEST_0100_002, data);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0100_003
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0100_003, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE, userId).catch((error) => {
                    console.info(TAG_TEST_0100_003 + 'UserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0100_003, startTime, endTime);
            console.info(TAG_TEST_0100_003 + ' UserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0100_003, data)
            getApplicationInfoSuccess(TAG_TEST_0100_003, data);
            done();
        });


        /**
         * @tc.number: bundle_getApplicationInfo_test_0200_004
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0200_001, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION).catch((error) => {
                    console.info(TAG_TEST_0200_001 + 'onUserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0200_001, startTime, endTime);
            console.info(TAG_TEST_0200_001 + ' onUserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0200_001, data)
            getApplicationInfoSuccess(TAG_TEST_0200_001, data);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0200_005
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0200_002, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_ALL_APPLICATION_INFO).catch((error) => {
                    console.info(TAG_TEST_0200_002 + 'onUserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0200_002, startTime, endTime);
            console.info(TAG_TEST_0200_002 + ' onUserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0200_002, data)
            getApplicationInfoSuccess(TAG_TEST_0200_002, data);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0200_006
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by promise)
         * @tc.level   0
         */
        it(TAG_TEST_0200_003, 0, async function (done) {
            let startTime = await Utils.getNowTime();
            let data = await Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_DISABLE).catch((error) => {
                    console.info(TAG_TEST_0200_003 + 'onUserId promise error is: ' + error);
                    expect(error).assertFail();
                });
            let endTime = Utils.getNowTime();
            Utils.getDurationTime(TAG_TEST_0200_003, startTime, endTime);
            console.info(TAG_TEST_0200_003 + ' onUserId promise data is: ' + JSON.stringify(data));
            expectData(TAG_TEST_0200_003, data)
            getApplicationInfoSuccess(TAG_TEST_0200_003, data);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0300_007
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by callBack)
         * @tc.level   0
         */
        it(TAG_TEST_0300_001, 0, async function (done) {
            let datas;
            let startTime = await Utils.getNowTime();
            Bundle.getAllApplicationInfo(
                Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId, (error, data) => {
                    let endTime = Utils.getNowTime();
                    Utils.getDurationTime(TAG_TEST_0300_001, startTime, endTime);
                    if (error.code != 0) {
                        expect(error).assertFail();
                        console.info(TAG_TEST_0300_001 + 'UserId callBack error: ' + error);
                    }
                    console.info(TAG_TEST_0300_001 + 'UserId callBack error: ' + error);
                    console.info(TAG_TEST_0300_001 + 'UserId callBack data is:' + JSON.stringify(data));
                    datas = data;
                });
            await Utils.sleep(2000);
            console.info(TAG_TEST_0300_001 + 'UserId callBack datas is:' + JSON.stringify(datas));
            expectData(TAG_TEST_0300_001, datas)
            getApplicationInfoSuccess(TAG_TEST_0300_001, datas);
            done();
        });

        /**
         * @tc.number: bundle_getApplicationInfo_test_0400_008
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface (by callBack)
         * @tc.level   0
         */
        it(TAG_TEST_0400_001, 0, async function (done) {
            let datas;
            let startTime = await Utils.getNowTime();
            Bundle.getAllApplicationInfo(Bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, (error, data) => {
                let endTime = Utils.getNowTime();
                Utils.getDurationTime(TAG_TEST_0400_001, startTime, endTime);
                if (error.code != 0) {
                    expect(error).assertFail();
                    console.info(TAG_TEST_0400_001 + 'UserId callBack error: ' + error);
                }
                console.info(TAG_TEST_0400_001 + 'noUserId callBack error: ' + error);
                console.info(TAG_TEST_0400_001 + 'noUserId callBack data is:' + JSON.stringify(data));
                datas = data;
            });
            await Utils.sleep(2000);
            console.info(TAG_TEST_0400_001 + 'noUserId callBack datas is:' + JSON.stringify(datas));
            expectData(TAG_TEST_0400_001, datas)
            getApplicationInfoSuccess(TAG_TEST_0400_001, datas);
            done();
        });

        /**
         * @tc.number: getApplicationInfos_1000
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface
         */
        it('getApplicationInfos_1000', 0, async function (done) {
            await Bundle.getAllApplicationInfo(DEFAULT_FLAG).then((data) => {
                expect(data.length).assertLarger(10);
                let flag = 0;
                for(let i in data){
                    if (data[i].name == BUNDLE_OTHER){
                        flag = 1;
                        getApplicationInfoSuccessOther(data[i]);
                    }
                }
                expect(flag).assertEqual(1);
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.getAllApplicationInfo(DEFAULT_FLAG, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.length).assertLarger(10);
                let flag = 0;
                for(let i in data){
                    if (data[i].name == BUNDLE_OTHER){
                        flag = 1;
                        getApplicationInfoSuccessOther(data[i]);
                    }
                }
                expect(flag).assertEqual(1);
                done();
            });
        });

        /**
         * @tc.number: getApplicationInfos_1200
         * @tc.name: getApplicationInfo : Obtains based on a given bundle name.
         * @tc.desc: Check the return value of the interface
         */
        it('getApplicationInfos_1200', 0, async function (done) {
            await Bundle.getAllApplicationInfo(null).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
            });
            await Bundle.getAllApplicationInfo(undefined).then((data) => {
                expect(data).assertFail();
            }).catch((error) => {
                expect(error.code).assertEqual(1);
            });
            Bundle.getAllApplicationInfo(undefined, (err, data) => {
                expect(err.code).assertEqual(1);
                Bundle.getAllApplicationInfo(null, (err, data) => {
                    expect(err.code).assertEqual(1);
                    done();
                });
            });
        });

        /**
         * @tc.number: SUB_BMS_APPINFO_QUERY_0060
         * @tc.name: getAllApplicationInfoNoMetaData
         * @tc.desc: Check the return value of the interface
         */
        it('getAllApplicationInfoNoMetaData', 0, async function (done) {
            await Bundle.getAllApplicationInfo(DEFAULT_FLAG,userId).then((data) => {
                expect(data.length).assertLarger(10);
                let flag = 0;
                for(let i in data){
                    if (data[i].name == BUNDLE_OTHER){
                        flag = 1;
                        getAllApplicationInfoSuccessOther(data[i]);
                        expect(JSON.stringify(data[i].metaData)).assertEqual("{}");
                    }
                }
                expect(flag).assertEqual(1);
            }).catch((error) => {
                expect(error).assertFail();
            });
            Bundle.getAllApplicationInfo(DEFAULT_FLAG,userId, (err, data) => {
                expect(err.code).assertEqual(0);
                expect(data.length).assertLarger(10);
                let flag = 0;
                for(let i in data){
                    if (data[i].name == BUNDLE_OTHER){
                        flag = 1;
                        getAllApplicationInfoSuccessOther(data[i]);
                        expect(JSON.stringify(data[i].metaData)).assertEqual("{}");
                    }
                }
                expect(flag).assertEqual(1);
                done();
            });
        });

        function expectData(msg, data) {
            console.info(msg + 'commonTest data length [' + data.length + ']');
            for (let i = 0; i < data.length; i++) {
                expect(typeof (data)).assertEqual('object');
                expect(typeof (data[i].name)).assertEqual('string');
                expect(typeof (data[i].codePath)).assertEqual('string');
                expect(typeof (data[i].accessTokenId)).assertEqual('number');
                expect(typeof (data[i].description)).assertEqual('string');
                expect(typeof (data[i].descriptionId)).assertEqual('number');
                expect(typeof (data[i].icon)).assertEqual('string');
                expect(typeof (data[i].iconId)).assertEqual('number');
                expect(typeof (data[i].label)).assertEqual('string');
                expect(typeof (data[i].labelId)).assertEqual('number');
                expect(typeof (data[i].systemApp)).assertEqual('boolean')
                expect(typeof (data[i].supportedModes)).assertEqual('number');
                expect(typeof (data[i].process)).assertEqual('string');
                expect(typeof (data[i].metaData)).assertEqual('object');
                expect(typeof (data[i].enabled)).assertEqual('boolean');
                expect(typeof (data[i].uid)).assertEqual('number');
                expect(typeof (data[i].entityType)).assertEqual('string');
                expect(typeof (data[i].removable)).assertEqual('boolean');
                expect(Array.isArray(data[i].permissions)).assertEqual(true);
                expect(Array.isArray(data[i].moduleSourceDirs)).assertEqual(true);
                expect(Array.isArray(data[i].moduleInfos)).assertEqual(true);
            }
        }

        function getApplicationInfoSuccess(msg, data) {
            console.info(msg + 'getApplicationInfoSuccess data length [' + data.length + ']');
            for (let i = 0; i < data.length; i++) {
                if (data[i].name === 'com.open.harmony.packagemag' || i === 0 && data[i].name === '') {
                    console.info(msg + JSON.stringify(data[i]));
                    expect(data[i].name).assertEqual('com.open.harmony.packagemag');
                    expect(data[i].codePath).assertEqual('/data/app/el1/bundle/public/com.open.harmony.packagemag');
                    expect(data[i].description).assertEqual('$string:entry_description');
                    if (data[i].descriptionId !== 0) {
                        expect(data[i].descriptionId > 0).assertEqual(true);
                    }
                    expect(data[i].icon).assertEqual('$media:icon');
                    expect(data[i].iconId > 0).assertEqual(true);
                    expect(data[i].label).assertEqual('$string:entry_MainAbility');
                    expect(data[i].accessTokenId > 0).assertEqual(true);
                    if (data[i].label !== 0) {
                        expect(data[i].labelId > 0).assertEqual(true);
                    };
                    if (data[i].uid !== 0) {
                        expect(data[i].uid > 0).assertEqual(true);
                    };
                    expect(data[i].systemApp).assertEqual(false);
                    expect(data[i].supportedModes).assertEqual(0);
                    expect(data[i].process).assertEqual('com.open.harmony.packagemag');
                    expect(data[i].entryDir).assertEqual('/data/app/el1/bundle/public/com.open.harmony.packagemag' +
                        '/com.open.harmony.packagemag');
                    expect(data[i].enabled).assertEqual(true);
                    expect(data[i].entityType).assertEqual('unspecified');
                    expect(data[i].removable).assertEqual(true);
                    expect(data[i].moduleInfos[0].moduleName).assertEqual('entry');
                    expect(data[i].moduleInfos[0].moduleSourceDir).assertEqual('/data/app/el1/bundle/public/' +
                        'com.open.harmony.packagemag/com.open.harmony.packagemag');
                    expect(data[i].moduleSourceDirs[0]).assertEqual('/data/app/el1/bundle/public/' +
                        'com.open.harmony.packagemag/com.open.harmony.packagemag');
                }
            }
        }

        function getApplicationInfoSuccessOther(data) {
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
            expect(data.entryDir).assertEqual(PATH + '/' + BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(data.permissions.length).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(1);
            expect(data.moduleSourceDirs[0]).assertEqual(PATH + '/' + BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual(PATH + '/' +
            BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(JSON.stringify(data.metaData)).assertEqual("{}");
            expect(data.enabled).assertTrue();
            expect(data.uid).assertLarger(0);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertTrue();
            console.info('check end');
        }

        function getAllApplicationInfoSuccessOther(data) {
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
            expect(data.entryDir).assertEqual(PATH + '/' + BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(data.permissions.length).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(1);
            expect(data.moduleSourceDirs[0]).assertEqual(PATH + '/' + BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual('entry');
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual(PATH + '/' +
            BUNDLE_OTHER + '/' + BUNDLE_OTHER + '.entry');
            expect(data.enabled).assertTrue();
            expect(data.uid).assertLarger(0);
            expect(data.entityType).assertEqual('unspecified');
            expect(data.removable).assertTrue();
            console.info('check end');
        }

    });

}