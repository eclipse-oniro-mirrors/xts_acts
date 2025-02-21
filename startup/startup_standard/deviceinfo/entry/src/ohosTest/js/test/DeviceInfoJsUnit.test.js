/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import deviceinfo from '@ohos.deviceInfo'

export default function DeviceInfoTest() {
    describe('DeviceInfoTest', function () {

        const MAX_CHARACTERS_NUM_ONE = 33;
        const MAX_CHARACTERS_NUM_TWO = 65;
        const MAX_CHARACTERS_NUM = 0;
        const CHARACTERS_NUM_ODID = 36;

        beforeAll(function () {
            console.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');

        })

        beforeEach(function () {
            console.info('beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');

        })
        afterEach(function () {
            console.info('afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');

        })
        afterAll(function () {
            console.info('afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');

        })

        console.info('start################################start');

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0100
         * @tc.name      testGetDeviceType01
         * @tc.desc      Get a string representing the device type.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_001', 0, async function (done) {
            console.info('device_info_test_001 start');
            let ret = false;
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceType is :' + deviceTypeInfo);

            expect(deviceTypeInfo).assertInstanceOf('String');
            if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            }
            else {
                console.info('the return value DeviceType is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('device_info_test_001 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0200
         * @tc.name     testGetManufacture01
         * @tc.desc      Get the manufacture name represented by a string.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_002', 0, async function (done) {
            console.info('device_info_test_002 start');
            let ret = false;
            let manufactureInfo = deviceinfo.manufacture;
            console.info('the value of the manufactureInfo is :' + manufactureInfo);

            expect(manufactureInfo).assertInstanceOf('String');
            if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value Manufacture is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('device_info_test_002 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0300
         * @tc.name     testGetBrand01
         * @tc.desc      Get the device brand represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_003', 0, async function (done) {
            console.info('testGetDeviceBrand01 start');
            let ret = false;
            let brandInfo = deviceinfo.brand;
            console.info('the value of the device brand is :' + brandInfo);

            expect(brandInfo).assertInstanceOf('String');
            if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value brand is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetDeviceBrand01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0400
         * @tc.name     testGetMarketName01
         * @tc.desc      Get the external product family name represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_004', 0, async function (done) {
            console.info('testGetMarketName01 start')
            let ret = false;
            let marketNameInfo = deviceinfo.marketName;
            console.info('the value of the deviceinfo marketName is :' + marketNameInfo);

            expect(marketNameInfo).assertInstanceOf('String');
            if (marketNameInfo != "" && marketNameInfo != null && marketNameInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value marketName is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetMarketName01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0500
         * @tc.name     testGetProductSeries01
         * @tc.desc      Get the product series represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_005', 0, function () {
            console.info('testGetProductSeries01 start');

            let productSeriesInfo = deviceinfo.productSeries;
            console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);

            expect(productSeriesInfo).assertInstanceOf('String');
            if (productSeriesInfo != "" && productSeriesInfo != null && productSeriesInfo != undefined) {
                let str = /[\w-\.\(\)\s]/g;
                let arr = productSeriesInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(productSeriesInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetProductSeries01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0600
         * @tc.name     testGetProductModel01
         * @tc.desc      Get the internal software sub-model represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_006', 0, async function (done) {
            console.info('testGetProductModel01 start');
            let ret = false;
            let productModelInfo = deviceinfo.productModel;
            console.info('the value of the deviceinfo productModel is :' + productModelInfo);

            expect(productModelInfo).assertInstanceOf('String');
            if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value ProductModel is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetProductModel01 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0700
         * @tc.name     testGetSoftwareModel01
         * @tc.desc      Get the internal software sub-model represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_007', 0, function () {
            console.info('testGetSoftwareModel01 start');

            let softwareModelInfo = deviceinfo.softwareModel;
            console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);

            expect(softwareModelInfo).assertInstanceOf('String');
            if (softwareModelInfo != "" && softwareModelInfo != null && softwareModelInfo != undefined) {
                let str = /[\w-\.\(\)\s]/g;
                let arr = softwareModelInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(softwareModelInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetSoftwareModel01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0800
         * @tc.name     testGetHardWareModel01
         * @tc.desc      Get the hardware version represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_008', 0, async function (done) {
            console.info('testGetHardWareModel01 start');
            let ret = false;
            let hardwareModelInfo = deviceinfo.hardwareModel;
            console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);

            expect(hardwareModelInfo).assertInstanceOf('String');
            if (hardwareModelInfo != "" && hardwareModelInfo != null && hardwareModelInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value HardWareModel is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetHardWareModel01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0900
         * @tc.name     testGetHardWareProfile01
         * @tc.desc      Get the hardware profile represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_009', 0, function () {
            console.info('testGetHardWareProfile01 start');

            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);

            expect(hardwareProfileInfo).assertInstanceOf('String');
            if (hardwareProfileInfo != "" && hardwareProfileInfo != null && hardwareProfileInfo != undefined) {
                let str = /[\w-\.\(\)\,\:\;]/g;
                let arr = hardwareProfileInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(hardwareProfileInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetHardWareProfile01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0110
         * @tc.name     testGetSerial01
         * @tc.desc      Get the device serial number represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_010', 0, function () {
            console.info('testGetSerial01 start');

            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            expect(serialInfo).assertInstanceOf('String');
            if (serialInfo != "" && serialInfo != null && serialInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = serialInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(serialInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetSerial01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0120
         * @tc.name     testGetBootLoaderVersion01
         * @tc.desc      Get the bootloader version number represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_011', 0, function () {
            console.info('testGetBootLoaderVersion01 start');

            let bootloaderVersionInfo = deviceinfo.bootloaderVersion;
            console.info('the value of the deviceinfo bootloaderVersion is :' + bootloaderVersionInfo);

            expect(bootloaderVersionInfo).assertInstanceOf('String');
            if (bootloaderVersionInfo != "" && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = bootloaderVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(bootloaderVersionInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetBootLoaderVersion01 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0130
         * @tc.name     testGetabiList01
         * @tc.desc      Get the instruction set supported by the system and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_012', 0, function () {
            console.info('testGetabiList01 start');

            let abiListInfo = deviceinfo.abiList;
            console.info('the value of the deviceinfo abiList is :' + abiListInfo);

            expect(abiListInfo).assertInstanceOf('String');
            if (abiListInfo != "" && abiListInfo != null && abiListInfo != undefined) {
                let str = /[\w-\.\(\)\,]/g;
                let arr = abiListInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(abiListInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetabiList01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0140
         * @tc.name     testGetSecurityPatchTag01
         * @tc.desc      Get the security patch level represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_013', 0, function () {
            console.info('testGetSecurityPatchTag01 start');

            let securityPatchTagInfo = deviceinfo.securityPatchTag;
            console.info('the value of the deviceinfo securityPatchTag is :' + securityPatchTagInfo);

            expect(securityPatchTagInfo).assertInstanceOf('String');
            if (securityPatchTagInfo != "" && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
                let str = /[\w\/\.\(\)]/g;
                let arr = securityPatchTagInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(securityPatchTagInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetSecurityPatchTag01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0150
         * @tc.name     testGetDisplayVersion01
         * @tc.desc      Get the product version represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_014', 0, async function (done) {
            console.info('testGetDisplayVersion01 start');
            let ret = false;
            let displayVersionInfo = deviceinfo.displayVersion;
            console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

            expect(displayVersionInfo).assertInstanceOf('String');
            if (displayVersionInfo != "" && displayVersionInfo != null && displayVersionInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value DisplayVersion is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetDisplayVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0160
         * @tc.name     testGetIncrementalVersion01
         * @tc.desc      Get the incremental version represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_015', 0, function () {
            console.info('testGetIncrementalVersion01 start');

            let incrementalVersionInfo = deviceinfo.incrementalVersion;
            console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);

            expect(incrementalVersionInfo).assertInstanceOf('String');
            if (incrementalVersionInfo != "" && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = incrementalVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(incrementalVersionInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetIncrementalVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0170
         * @tc.name     testGetOSReleaserType01
         * @tc.desc      Get the OS release type represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_016', 0, function () {
            console.info('testGetOSReleaserType01 start');

            let osReleaseTypeInfo = deviceinfo.osReleaseType;
            console.info('the value of the deviceinfo osReleaseType is :' + osReleaseTypeInfo);

            expect(osReleaseTypeInfo).assertInstanceOf('String');
            if (osReleaseTypeInfo != "" && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = osReleaseTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(osReleaseTypeInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetOSReleaserType01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0180
         * @tc.name     testGetOSFullName01
         * @tc.desc      Get the operating system full name and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_017', 0, function () {
            console.info('testGetOSFullName01 start');

            let osFullNameInfo = deviceinfo.osFullName;
            console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);

            expect(osFullNameInfo).assertInstanceOf('String');
            if (osFullNameInfo != "" && osFullNameInfo != null && osFullNameInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = osFullNameInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(osFullNameInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetOSFullName01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0190
         * @tc.name     testGetMajorVersion01
         * @tc.desc      Get the major (M) version number which the return value is greater than 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_018', 0, function () {
            console.info('testGetMajorVersion01 start');

            let majorVersionInfo = deviceinfo.majorVersion;
            console.info('the value of the deviceinfo majorVersion is :' + majorVersionInfo);

            expect(majorVersionInfo).assertInstanceOf('Number');
            if (majorVersionInfo >= 1 && majorVersionInfo <= 99) {
                let str = /[\w-\.\(\)]/g;
                let arr = majorVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(majorVersionInfo).assertEqual(numstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetMajorVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0210
         * @tc.name     testGetSeniorVersion01
         * @tc.desc      Get the senior version number and the return value is greater than 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_019', 0, function () {
            console.info('testGetSeniorVersion01 start');

            let seniorVersionInfo = deviceinfo.seniorVersion;
            console.info('the value of the deviceinfo seniorVersion is :' + seniorVersionInfo);

            expect(seniorVersionInfo).assertInstanceOf('Number');
            if (seniorVersionInfo >= 0 && seniorVersionInfo <= 99) {
                let str = /[\w-\.\(\)]/g;
                let arr = seniorVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(seniorVersionInfo).assertEqual(numstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetSeniorVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0220
         * @tc.name     testGetFeatureVersion01
         * @tc.desc      Get the feature (F) version number which the return value is greater than 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_020', 0, function () {
            console.info('testGetFeatureVersion01 start');

            let featureVersionInfo = deviceinfo.featureVersion;
            console.info('the value of the deviceinfo featureVersion is :' + featureVersionInfo);

            expect(featureVersionInfo).assertInstanceOf('Number');
            if ((featureVersionInfo >= 1 && featureVersionInfo <= 99) || featureVersionInfo == 0) {
                let str = /[\w-\.\(\)]/g;
                let arr = featureVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(featureVersionInfo).assertEqual(numstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetFeatureVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0230
         * @tc.name     testGetBuildVersion01
         * @tc.desc      Get the build (B) version number which the return value is greater than 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_021', 0, function () {
            console.info('testGetBuildVersion01 start');

            let buildVersionInfo = deviceinfo.buildVersion;
            console.info('the value of the deviceinfo buildVersion is :' + buildVersionInfo);

            expect(buildVersionInfo).assertInstanceOf('Number');
            if (buildVersionInfo == 0 || (buildVersionInfo >= 1 && buildVersionInfo <= 999)) {
                let str = /[\w-\.\(\)]/g;
                let arr = buildVersionInfo.toString().match(str);
                let substr = arr.join('');
                let numstr = parseInt(substr);
                console.info('the value of the bufferstr is :' + numstr);
                expect(buildVersionInfo).assertEqual(numstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetBuildVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0240
         * @tc.name     testGetSdkApiVersion01
         * @tc.desc    Get the API version number, which return value type is number and return value is greater than 0.
         * @tc.size    : MediumTest
         * @tc.type    : Function
         * @tc.level   : Level 0
         */
        it('device_info_test_022', 0, async function (done) {
            console.info('testGetSdkApiVersion01 start');
            let ret = false;
            let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
            console.info('the value of the deviceinfo sdkApiVersion is :' + sdkApiVersionInfo);

            expect(sdkApiVersionInfo).assertInstanceOf('Number');
            if (sdkApiVersionInfo >= 0) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value sdkApiVersion is not greater than 0.');
                expect(false).assertTrue();
				done();
            }

            let str = /[\w-\.\(\)]/g;
            let arr = sdkApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(sdkApiVersionInfo).assertEqual(numstr);

            console.info('testGetSdkApiVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0250
         * @tc.name     testGetFirstApiVersion01
         * @tc.desc      Get the first API version number which the return value is greater than 0.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_023', 0, async function (done) {
            console.info('testGetFirstApiVersion01 start');
            let ret = true;
            let firstApiVersionInfo = deviceinfo.firstApiVersion;
            console.info('the value of the deviceinfo firstApiVersion is :' + firstApiVersionInfo);

            expect(firstApiVersionInfo).assertInstanceOf('Number');
            if (firstApiVersionInfo >= 0) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value firstApiVersion is not greater than 0.');
                expect(false).assertTrue();
				done();
            }

            let str = /[\w-\.\(\)]/g;
            let arr = firstApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(firstApiVersionInfo).assertEqual(numstr);

            console.info('testGetFirstApiVersion01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0260
         * @tc.name     testGetVersionId01
         * @tc.desc      Get the version ID number by a string which the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_024', 0, async function (done) {
            console.info('testGetVersionId01 start');
            let ret = false;
            let versionIdInfo = deviceinfo.versionId;
            console.info('the value of the deviceinfo versionId is :' + versionIdInfo);

            expect(versionIdInfo).assertInstanceOf('String');
            if (versionIdInfo != "" && versionIdInfo != null && versionIdInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value versionId is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetVersionId01 end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0270
         * @tc.name     testGetBuildType01
         * @tc.desc      Get the different build types of the same baseline code which the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_025', 0, function () {
            console.info('testGetBuildType01 start');

            let buildTypeInfo = deviceinfo.buildType;
            console.info('the value of the deviceinfo buildType is :' + buildTypeInfo);

            expect(buildTypeInfo).assertInstanceOf('String');
            if (buildTypeInfo != "" && buildTypeInfo != null && buildTypeInfo != undefined) {
                let str = /[\w-\.\(\)\:]/g;
                let arr = buildTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(buildTypeInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetBuildType01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0280
         * @tc.name     testGetBuildUser01
         * @tc.desc      Get the different build user by a string which the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_026', 0, async function (done) {
            console.info('testGetBuildUser01 start');
            let ret = true;
            let buildUserInfo = deviceinfo.buildUser;
            console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);

            expect(buildUserInfo).assertInstanceOf('String');
            if (buildUserInfo != "" && buildUserInfo != null && buildUserInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value buildUser is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetBuildUser01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0290
         * @tc.name    testGetBuildHost01
         * @tc.desc    Get the build host of the same baseline code by a string and the return value is not null.
         * @tc.size    : MediumTest
         * @tc.type    : Function
         * @tc.level   : Level 0
         */
        it('device_info_test_027', 0, async function (done) {
            console.info('testGetBuildHost01 start');
            let ret = false;
            let buildHostInfo = deviceinfo.buildHost;
            console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);

            expect(buildHostInfo).assertInstanceOf('String');
            if (buildHostInfo != "" && buildHostInfo != null && buildHostInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value BuildHost is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetBuildHost01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0310
         * @tc.name     testGetBuildTime01
         * @tc.desc      Get the version build time by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_028', 0, async function (done) {
            console.info('testGetBuildTime01 start');
            let ret = false;
            let buildTimeInfo = deviceinfo.buildTime;
            console.info('the value of the deviceinfo buildTime is :' + buildTimeInfo);

            expect(buildTimeInfo).assertInstanceOf('String');
            if (buildTimeInfo != "" && buildTimeInfo != null && buildTimeInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value BuildTime is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetBuildTime01 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0320
         * @tc.name     testGetBuildRootHash01
         * @tc.desc      Get the version hash by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_029', 0, function () {
            console.info('testGetBuildRootHash01 start');

            let buildRootHashInfo = deviceinfo.buildRootHash;
            console.info('the value of the deviceinfo buildRootHash is :' + buildRootHashInfo);

            expect(buildRootHashInfo).assertInstanceOf('String');
            if (buildRootHashInfo != "" && buildRootHashInfo != null && buildRootHashInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = buildRootHashInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(buildRootHashInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect(false).assertTrue();
            }

            console.info('testGetBuildRootHash01 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0330
         * @tc.name      testGetDeviceType02
         * @tc.desc      Get a string representing the device type which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_030', 0, function () {
            console.info('device_info_test_030 start');
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceinfo deviceType is:' + deviceTypeInfo);

            let len = deviceTypeInfo.length

            console.info('the value of the device type characters:' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE)
            console.info('device_info_test_030 : end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0340
         * @tc.name      testGetManufacture02
         * @tc.desc      Get a string representing the manufacture which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_031', 0, function () {
            console.info('device_info_test_031 start');
            let manufactureInfo = deviceinfo.manufacture;
            console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);

            let len = manufactureInfo.length
            console.info('the value of the manufacture characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = manufactureInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(manufactureInfo).assertEqual(bufferstr);

            console.info('device_info_test_031 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0350
         * @tc.name      testGetDeviceBrand02
         * @tc.desc      Get a string representing the external product family name which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_032', 0, function () {
            console.info('device_info_test_032 start');
            let brandInfo = deviceinfo.brand;
            console.info('the value of the deviceinfo brand is :' + brandInfo);

            let len = brandInfo.length
            console.info('the value of the external product family name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = brandInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(brandInfo).assertEqual(bufferstr);

            console.info('device_info_test_032 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0370
         * @tc.name      testGetProductSeries02
         * @tc.desc      Get a string representing the product series which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_034', 0, function () {
            console.info('device_info_test_034 start');
            let productSeriesInfo = deviceinfo.productSeries;
            console.info('the value of the deviceinfo  productSeries is :' + productSeriesInfo);

            let str = /[\w-\.\(\)\s]/g;
            let len = productSeriesInfo.length
            console.info('the value of the product series characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let arr = productSeriesInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(productSeriesInfo).assertEqual(bufferstr);

            console.info('device_info_test_034 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0380
         * @tc.name      testGetProductModel02
         * @tc.desc      Get a string representing the certified model which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_035', 0, function () {
            console.info('device_info_test_035 start');
            let productModelInfo = deviceinfo.productModel;
            console.info('the value of the deviceinfo productModel is :' + productModelInfo);

            let len = productModelInfo.length
            console.info('the value of the certified model characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE)
            console.info('device_info_test_035 : end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0390
         * @tc.name      testGetSoftwareModel02
         * @tc.desc      Get a string representing the internal software sub-model which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_036', 0, function () {
            console.info('device_info_test_036 start');
            let softwareModelInfo = deviceinfo.softwareModel;
            console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);

            let len = softwareModelInfo.length
            console.info('the value of the internal software sub-model characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)\s]/g;
            let arr = softwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(softwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_036 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0410
         * @tc.name      testGetHardwareModel02
         * @tc.desc      Get a string representing the hardware version which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_037', 0, function () {
            console.info('device_info_test_037 start');
            let hardwareModelInfo = deviceinfo.hardwareModel;
            console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);

            let len = hardwareModelInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = hardwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(hardwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_037 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0420
         * @tc.name      testGetHardwareProfile02
         * @tc.desc      Get a string representing the hardware version which has a maximum of 1000 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_038', 0, function () {
            console.info('device_info_test_038 start');
            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);

            let str = /[\w-\.\(\)\,\:\;]/g;
            let len = hardwareProfileInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLess(1001);

            let arr = hardwareProfileInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(hardwareProfileInfo).assertEqual(bufferstr);

            console.info('device_info_test_038 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0430
         * @tc.name      testGetSerial02
         * @tc.desc      Get a string representing the device serial number which has a maximum of 64 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_039', 0, function () {
            console.info('device_info_test_039 start');
            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            let len = serialInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);

            let str = /[\w-\.\(\)]/g;
            let arr = serialInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(serialInfo).assertEqual(bufferstr);

            console.info('device_info_test_039 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0440
         * @tc.name      testGetDisplayVersion02
         * @tc.desc      Get a string representing the version number visible to users which has a maximum of 64 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_040', 0, function () {
            console.info('device_info_test_040 start');
            let displayVersionInfo = deviceinfo.displayVersion;
            console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

            let len = displayVersionInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
            console.info('device_info_test_040 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0450
         * @tc.name      testGetOsFullName02
         * @tc.desc      Get a string representing the operating system full name which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_041', 0, function () {
            console.info('device_info_test_041 start');
            let osFullNameInfo = deviceinfo.osFullName;
            console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);

            let len = osFullNameInfo.length;
            console.info('the value of the operating system full name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = osFullNameInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(osFullNameInfo).assertEqual(bufferstr);

            console.info('device_info_test_041 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0460
         * @tc.name      testGetVersionId02
         * @tc.desc      Get a string representing the operating system full name which has a maximum of 255 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_042', 0, function () {
            console.info('device_info_test_042 start');
            let versionIdInfo = deviceinfo.versionId;
            console.info('the value of the deviceinfo versionId is :' + versionIdInfo);

            let len = versionIdInfo.length;
            console.info('the value of the operating system full name characters is :' + len)
            expect(len).assertLess(256);
            console.info('device_info_test_042 : end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0470
         * @tc.name      testGetBuildUser02
         * @tc.desc      Get a string representing the different build user of the same baseline code which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_043', 0, function () {
            console.info('device_info_test_043 start');
            let buildUserInfo = deviceinfo.buildUser;
            console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);

            console.info('the value of the different build user of the same baseline code characters is :' + buildUserInfo.length);
            expect(buildUserInfo.length).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = buildUserInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(buildUserInfo).assertEqual(bufferstr);

            console.info('device_info_test_043 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0480
         * @tc.name      testGetBuildHost02
         * @tc.desc      Get a string representing the different build host of the same baseline code which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_044', 0, function () {
            console.info('device_info_test_044 start');
            let buildHostInfo = deviceinfo.buildHost;
            console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);

            let len = buildHostInfo.length
            console.info('the value of the different build host of the same baseline code characters is :' + len)
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = buildHostInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(buildHostInfo).assertEqual(bufferstr);

            console.info('device_info_test_044 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0490
         * @tc.name      testGetDeviceType03
         * @tc.desc      Get a string representing the device type which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_045', 0, function () {
            console.info('device_info_test_045 start');
            let deviceTypeInfo = deviceinfo.deviceType;
            console.info('the value of the deviceinfo deviceType is :' + deviceTypeInfo);

            let len = deviceTypeInfo.length;
            console.info('the value of the device type characters:' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_045 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0510
         * @tc.name      testGetManufacture03
         * @tc.desc      Get a string representing the manufacture which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_046', 0, function () {
            console.info('device_info_test_046 start');
            let manufactureInfo = deviceinfo.manufacture;
            console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);

            let len = manufactureInfo.length
            console.info('the value of the manufacture characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = manufactureInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(manufactureInfo).assertEqual(bufferstr);

            console.info('device_info_test_046 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0520
         * @tc.name      testGetProductBrand03
         * @tc.desc      Get a string representing the external product family name which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_047', 0, function () {
            console.info('device_info_test_047 start');
            let brandInfo = deviceinfo.brand;
            console.info('the value of the deviceinfo brand is :' + brandInfo);

            let len = brandInfo.length;
            console.info('the value of the external product family name characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = brandInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(brandInfo).assertEqual(bufferstr);

            console.info('device_info_test_047 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0530
         * @tc.name      testGetMarketName03
         * @tc.desc      Get a string representing the product series which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_048', 0, function () {
            console.info('device_info_test_048 start');
            let marketNameInfo = deviceinfo.marketName;
            console.info('the value of the deviceinfo marketName is :' + marketNameInfo);

            let len = marketNameInfo.length;
            console.info('the value of the product series characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_048 ：end');
        })


        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0540
         * @tc.name      testGetProductSeries03
         * @tc.desc      Get a string representing the product series which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_049', 0, function () {
            console.info('device_info_test_049 start');
            let productSeriesInfo = deviceinfo.productSeries;
            console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);

            let len = productSeriesInfo.length;
            console.info('the value of the product series characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)\s]/g;
            let arr = productSeriesInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(productSeriesInfo).assertEqual(bufferstr);

            console.info('device_info_test_049 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0550
         * @tc.name      testGetProductModel03
         * @tc.desc      Get a string representing the certified model which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_050', 0, function () {
            console.info('device_info_test_050 start');
            let productModelInfo = deviceinfo.productModel;
            console.info('the value of the deviceinfo productModel is :' + productModelInfo);

            let len = productModelInfo.length
            console.info('the value of the certified model characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM)
            console.info('device_info_test_050 : end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0560
         * @tc.name      testGetSoftwareModel03
         * @tc.desc      Get a string representing the internal software sub-model which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_051', 0, function () {
            console.info('device_info_test_051 start');
            let softwareModelInfo = deviceinfo.softwareModel;
            console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);

            let len = softwareModelInfo.length
            console.info('the value of the internal software sub-model characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)\s]/g;
            let arr = softwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(softwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_051 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0570
         * @tc.name      testGetHardwareModel03
         * @tc.desc      Get a string representing the hardware version which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_052', 0, function () {
            console.info('device_info_test_052 start');
            let hardwareModelInfo = deviceinfo.hardwareModel;
            console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);

            let len = hardwareModelInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = hardwareModelInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(hardwareModelInfo).assertEqual(bufferstr);

            console.info('device_info_test_052 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0580
         * @tc.name      testGetHardwareProfile03
         * @tc.desc      Get a string representing the hardware version which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_053', 0, function () {
            console.info('device_info_test_053 start');
            let hardwareProfileInfo = deviceinfo.hardwareProfile;
            console.info('the value of the deviceinfo hardwareProfile is :' + hardwareProfileInfo);

            let len = hardwareProfileInfo.length;
            console.info('the value of the hardware version characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)\,\:\;]/g;
            let arr = hardwareProfileInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(hardwareProfileInfo).assertEqual(bufferstr);

            console.info('device_info_test_053 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0590
         * @tc.name      testGetSerial03
         * @tc.desc      Get a string representing the device serial number which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_054', 0, function () {
            console.info('device_info_test_054 start');
            let serialInfo = deviceinfo.serial;
            console.info('the value of the deviceinfo serial is :' + serialInfo);

            let len = serialInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = serialInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(serialInfo).assertEqual(bufferstr);

            console.info('device_info_test_054 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0610
         * @tc.name      testGetDisplayVersion03
         * @tc.desc      Get a string representing the version number visible to users which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_055', 0, function () {
            console.info('device_info_test_055 start');
            let displayVersionInfo = deviceinfo.displayVersion;
            console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

            let len = displayVersionInfo.length;
            console.info('the value of the device serial number characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            console.info('device_info_test_055 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0620
         * @tc.name      testGetIncrementalVersionInfo02
         * @tc.desc      Get a string representing the version number visible to users which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_056', 0, function () {
            console.info('device_info_test_056 start');
            let incrementalVersionInfo = deviceinfo.incrementalVersion;
            console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);

            let len = incrementalVersionInfo.length
            console.info('the value of the device serial number characters is :' + len)
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = incrementalVersionInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(incrementalVersionInfo).assertEqual(bufferstr);

            console.info('device_info_test_056 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0630
         * @tc.name      testGetIncrementalVersionInfo03
         * @tc.desc      Get a string representing the version number visible to users which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_057', 0, function () {
            console.info('device_info_test_057 start');
            let incrementalVersionInfo = deviceinfo.incrementalVersion;
            console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);

            let len = incrementalVersionInfo.length
            console.info('the value of the device serial number characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM);

            let str = /[\w-\.\(\)]/g;
            let arr = incrementalVersionInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(incrementalVersionInfo).assertEqual(bufferstr);

            console.info('device_info_test_057 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0640
         * @tc.name      testGetVersionId03
         * @tc.desc      Get a string representing the operating system full name which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_058', 0, function () {
            console.info('device_info_test_058 start');
            let versionIdInfo = deviceinfo.versionId;
            console.info('the value of the deviceinfo versionId is :' + versionIdInfo);

            let len = versionIdInfo.length
            console.info('the value of the operating system full name characters is :' + len)
            expect(len).assertLarger(MAX_CHARACTERS_NUM)
            console.info('device_info_test_058 : end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0650
         * @tc.name      testGetBuildUser03
         * @tc.desc      Get a string representing the different build user of the same baseline code which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_059', 0, function () {
            console.info('device_info_test_043 start');
            let buildUserInfo = deviceinfo.buildUser;
            console.info('the value of thebuildUser is :' + buildUserInfo);

            console.info('the value of the different build user of the same baseline code characters is :' + buildUserInfo.length);
            expect(buildUserInfo.length).assertLarger(MAX_CHARACTERS_NUM);

            console.info('device_info_test_059 ：end')
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0660
         * @tc.name      testGetBuildHost03
         * @tc.desc      Get a string representing the different build host of the same baseline code which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_060', 0, function () {
            console.info('device_info_test_060 start');
            let buildHostInfo = deviceinfo.buildHost;
            console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);

            let len = buildHostInfo.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_060 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0670
         * @tc.name     testGetSecurityPatchTag02
         * @tc.desc      Get security pactch tag which format is yy/mm/dd test.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_061', 0, async function (done) {
            console.info('testGetSecurityPatchTag02 start');
            let ret = false;
            let securityPatchTagInfo = deviceinfo.securityPatchTag;
            console.info('the value of the deviceinfo securityPatchTag is :' + securityPatchTagInfo);

            let reFormat = /^(\d{4})\/(\d{2})\/(\d{2})$/;
            let re = securityPatchTagInfo.match(reFormat);

            if (re != null) {
                ret = true;
                expect(ret).assertTrue();
                done();
            } else {
                console.info('the return formate is not yy/mm/dd');
                expect(false).assertTrue();
				done();
            }

            console.info('testGetSecurityPatchTag02 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0662
         * @tc.name      testGetUdid
         * @tc.desc      Get udid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_062', 0, function () {
            console.info('device_info_test_062 start');
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            let len = udid.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLarger(MAX_CHARACTERS_NUM);
            console.info('device_info_test_060 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0663
         * @tc.name      testGetUuid
         * @tc.desc      Get uuid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_063', 0, async function (done) {
            console.info('device_info_test_063 start');
            let ret = false;
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            expect(udid).assertInstanceOf('String');
            if (udid != "" && udid != null && udid != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value GetManufacture01 is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('device_info_test_063 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0664
         * @tc.name      testGetUdid
         * @tc.desc      Get udid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_064', 0, function () {
            console.info('device_info_test_064 start');
            let udid = deviceinfo.udid;
            console.info('the value of the deviceinfo udid is :' + udid);

            let len = udid.length
            console.info('the value of the different build host of the same baseline code characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_TWO)
            console.info('device_info_test_064 : end');
        })
        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0665
         * @tc.name     testGetdistributionOSName01
         * @tc.desc      Get the distributionOSName name represented by an empty string.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_0665', 0, function () {
            console.info('device_info_test_0665 start');

            let distributionOSNameInfo = deviceinfo.distributionOSName;
            console.info('the value of the distributionOSNameInfo is :' + distributionOSNameInfo);
            expect(distributionOSNameInfo).assertInstanceOf('String');
            if (distributionOSNameInfo != "" && distributionOSNameInfo != null && distributionOSNameInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSNameInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSNameInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null and the type is :' + typeof (distributionOSNameInfo));
                expect(distributionOSNameInfo == "").assertTrue();
            }
            console.info('device_info_test_0665 ：end');
        })
        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0666
         * @tc.name     testGetdistributionOSVersion01
         * @tc.desc      Get the operating system full name and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_0666', 0, function () {
            console.info('device_info_test_0666 start');

            let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
            console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);

            expect(distributionOSVersionInfo).assertInstanceOf('String');
            if (distributionOSVersionInfo != "" && distributionOSVersionInfo != null && distributionOSVersionInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSVersionInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSVersionInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
            }

            console.info('device_info_test_0666 ：end');
        })
        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0667
         * @tc.name      testGetdistributionOSVersion02
         * @tc.desc      Get a string representing the operating system full name which has a maximum of 32 characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_0667', 0, function () {
            console.info('device_info_test_0667 start');
            let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
            console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);

            let len = distributionOSVersionInfo.length;
            console.info('the value of the operating system full name characters is :' + len);
            expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);

            let str = /[\w-\.\(\)]/g;
            let arr = distributionOSVersionInfo.match(str);
            let bufferstr = arr.join('');
            console.info('the value of the bufferstr is :' + bufferstr);
            expect(distributionOSVersionInfo).assertEqual(bufferstr);

            console.info('device_info_test_0667 ：end');
        })
        /**
       * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0668
       * @tc.name     testGetdistributionOSApiVersion01
       * @tc.desc    Get the API version number, which return value type is number and return value is greater than 0.
       * @tc.size    : MediumTest
       * @tc.type    : Function
       * @tc.level   : Level 0
       */
        it('device_info_test_0668', 0, async function (done) {
            console.info('device_info_test_0668 start');
            let ret = false;
            let distributionOSApiVersionInfo = deviceinfo.distributionOSApiVersion;
            console.info('the value of the deviceinfo distributionOSApiVersion is :' + distributionOSApiVersionInfo);

            expect(distributionOSApiVersionInfo).assertInstanceOf('Number');
            if (distributionOSApiVersionInfo >= 0) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value distributionOSApiVersion is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            let str = /[\w-\.\(\)]/g;
            let arr = distributionOSApiVersionInfo.toString().match(str);
            let substr = arr.join('');
            let numstr = parseInt(substr);
            console.info('the value of the bufferstr is :' + numstr);
            expect(distributionOSApiVersionInfo).assertEqual(numstr);

            console.info('device_info_test_0668 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0669
         * @tc.name     testGetOSReleaserType01
         * @tc.desc      Get the OS release type represented by a string and the return value is not null.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_0669', 0, function () {
            console.info('device_info_test_0669 start');

            let distributionOSReleaseTypeInfo = deviceinfo.distributionOSReleaseType;
            console.info('the value of the deviceinfo distributiondistributionOSReleaseType is :' + distributionOSReleaseTypeInfo);

            expect(distributionOSReleaseTypeInfo).assertInstanceOf('String');
            if (distributionOSReleaseTypeInfo != "" && distributionOSReleaseTypeInfo != null && distributionOSReleaseTypeInfo != undefined) {
                let str = /[\w-\.\(\)]/g;
                let arr = distributionOSReleaseTypeInfo.match(str);
                let bufferstr = arr.join('');
                console.info('the value of the bufferstr is :' + bufferstr);
                expect(distributionOSReleaseTypeInfo).assertEqual(bufferstr);
            } else {
                console.info('the return value is null or incorrect.');
                expect().assertFail();
            }

            console.info('device_info_test_0669 ：end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_070
         * @tc.name      testGetOdid
         * @tc.desc      Get odid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_070', 0, function () {
            console.info('device_info_test_070 start');
            let odid = deviceinfo.ODID;
            console.info('the value of the deviceinfo odid is :' + odid);

            let len = odid.length
            console.info('the length of odid is:' + len);
            expect(len).assertEqual(CHARACTERS_NUM_ODID);
            console.info('device_info_test_070 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_071
         * @tc.name      testGetOdid
         * @tc.desc      Get odid
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_071', 0, function () {
            console.info('device_info_test_071 start');
            let ret = false;
            let odid1 = deviceinfo.ODID;
            console.info('the value of the deviceinfo odid1 is :' + odid1);

            expect(odid1).assertInstanceOf('String');
            if (odid1 != "" && odid1 != null && odid1 != undefined) {
                ret = true;
            }
            expect(ret).assertTrue();

            ret = false;
            let odid2 = deviceinfo.ODID;
            if (odid2 != "" && odid2 != null && odid2 != undefined) {
                ret = true;
            }
            expect(ret).assertTrue();
            console.info('the value of the deviceinfo odid2 is :' + odid2);

            ret = (odid1 == odid2);
            expect(ret).assertTrue();
            
            console.info('device_info_test_071 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_072
         * @tc.name      testGetOsApiName
         * @tc.desc      Independent Software Vendor (ISV) may distribute OHOS with their own OS api name.
         *               will return the ISV OS api name
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_072', 0, function () {
            console.info('device_info_test_072 start');
            let distributionOSApiName = deviceinfo.distributionOSApiName;
            if (distributionOSApiName != "" && distributionOSApiName != null && distributionOSApiName != undefined) {
                console.info('the value of the deviceinfo distributionOSApiName is :' + distributionOSApiName);
                expect(distributionOSApiName).assertInstanceOf('String');
            }
            console.info('device_info_test_072 : end');
        })

        /**
         * @tc.number    SUB_STARTUP_JS_DEVCEINFO_073
         * @tc.name      testGetProductModeAlias
         * @tc.desc      Get a string representing the certified model which has at least one characters.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('device_info_test_073', 0, async function (done) {
            console.info('device_info_test_073 start');
            let ret = false;
            let productModelInfo = deviceinfo.productModelAlias;
            console.info('the value of the deviceinfo productModelAlias is :' + productModelInfo);

            expect(productModelInfo).assertInstanceOf('String');
            if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
                ret = true;
                expect(ret).assertTrue();
				done();
            } else {
                console.info('the return value ProductModeAlias is null or incorrect.');
                expect(false).assertTrue();
				done();
            }

            console.info('device_info_test_073 : end');
        })
    })
}