/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import device from '@system.device';
import deviceInfo from '@ohos.deviceInfo';

export default function SystemDeviceTest() {
describe('SystemDeviceTest', function () {

    let brandInfo = '';
    let manufactureInfo = '';
    let deviceModelInfo = '';
    let deviceProductInfo = '';
    let deviceTypeInfo = '';
    let languageInfo = '';
    let regionInfo = '';
    let screenShapeInfo = '';
    let apiVersionInfo = 0;
    let windowWidthInfo = 0;
    let windowHeightInfo = 0;
    let screenDensityInfo = 0;

    beforeAll(function () {
        console.info('beforeAll: Prerequisites at the test suite level, \
        which are executed before the test suite is executed.');
        device.getInfo({
            success: function (data) {
                console.log('getInfo success:' + JSON.stringify(data));
                brandInfo = data.brand;
                manufactureInfo = data.manufacturer;
                deviceModelInfo = data.model;
                deviceProductInfo = data.product;
                apiVersionInfo = data.apiVersion;
                deviceTypeInfo = data.deviceType;
                languageInfo = data.language;
                regionInfo = data.region;
                windowWidthInfo = data.windowWidth;
                windowHeightInfo = data.windowHeight;
                screenDensityInfo = data.screenDensity;
                screenShapeInfo = data.screenShape;

            },
            fail: function (data, code) {
                console.log('getInfo failed.Error code:' + code + ';Error information: ' + JSON.stringify(data));
                brandInfo = data.brand;
                manufactureInfo = data.manufacturer;
                deviceModelInfo = data.model;
                deviceProductInfo = data.product;
                apiVersionInfo = data.apiVersion;
                deviceTypeInfo = data.deviceType;
                languageInfo = data.language;
                regionInfo = data.region;
                windowWidthInfo = data.windowWidth;
                windowHeightInfo = data.windowHeight;
                screenDensityInfo = data.screenDensity;
                screenShapeInfo = data.screenShape;
            },
            complete: function () {
                console.log('getInfo complete');
            }
        });
    })

    beforeEach(function () {
        console.info('beforeEach: Prerequisites at the test case level, \
        which are executed before each test case is executed.');

    })
    afterEach(function () {
        console.info('afterEach: Test case-level clearance conditions, \
        which are  executed after each test case is executed.');

    })
    afterAll(function () {
        console.info('afterAll: Test suite-level cleanup condition, \
        which is executed after the test suite is executed');

    })

    console.info('start################################start');

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_001
     * @tc.name     testDeviceBrand01
     * @tc.desc      Get the device brand represented by a string and the return value is not null.
     */
    it('testDeviceBrand01', 0, async function (done) {
        console.info('testDeviceBrand01 start');
        let ret = false;

        console.info('the value of the deviceinfo brand is :' + brandInfo);

        expect(brandInfo).assertInstanceOf('String');
        if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Brand is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceBrand01 ：end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_002
     * @tc.name     testDeviceManufacture01
     * @tc.desc      Get the manufacture name represented by a string and the return value is not null.
     */
    it('testDeviceManufacture01', 0, async function (done) {
        console.info('testDeviceManufacture01 start');
        let ret = false;

        console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);

        expect(manufactureInfo).assertInstanceOf('String');
        if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Manufacture is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceManufacture01 ：end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_003
     * @tc.name     testDeviceModel01
     * @tc.desc      Get the internal software sub-model represented by a string and the return value is not null.
     */
    it('testDeviceModel01', 0, async function (done) {
        console.info('testDeviceModel01 start');
        let ret = false;

        console.info('the value of the deviceinfo model is :' + deviceModelInfo);

        expect(deviceModelInfo).assertInstanceOf('String');
        if (deviceModelInfo != "" && deviceModelInfo != null && deviceModelInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Model is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceModel01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_004
     * @tc.name     testDeviceProduct01
     * @tc.desc      Get the product represented by a string and the return value is not null.
     */
    it('testDeviceProduct01', 0, async function (done) {
        console.info('testDeviceProduct01 start');
        let ret = false;

        console.info('the value of the deviceinfo product is :' + deviceProductInfo);

        expect(deviceProductInfo).assertInstanceOf('String');
        if (deviceProductInfo != "" && deviceProductInfo != null && deviceProductInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Product is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceProduct01 ：end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_005
     * @tc.name     testDeviceApiVersion01
     * @tc.desc    Get the API version number, which return value type is number.
     */
    it('testDeviceApiVersion01', 0, async function (done) {
        console.info('testDeviceApiVersion01 start');
        let ret = false;

        console.info('the value of the deviceinfo sdkApiVersion is :' + apiVersionInfo);

        expect(apiVersionInfo).assertInstanceOf('Number');
        if (apiVersionInfo >= 0) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value ApiVersion is not larger than 0.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceApiVersion01 ：end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_006
     * @tc.name      testDeviceType01
     * @tc.desc      Get a string representing the device type and the return value is not null.
     */
    it('testDeviceType01', 0, async function (done) {
        console.info('testDeviceType01 start');
        let ret = false;

        console.info('the value of the deviceinfo deviceType is :' + deviceTypeInfo);

        expect(deviceTypeInfo).assertInstanceOf('String');
        if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Type is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceType01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_007
     * @tc.name      testDeviceLanguage01
     * @tc.desc      Get a string representing the device language and the return value is not null.
     */
    it('testDeviceLanguage01', 0, async function (done) {
        console.info('testDeviceLanguage01 start');
        let ret = false;

        console.info('the value of the deviceinfo language is :' + languageInfo);

        expect(languageInfo).assertInstanceOf('String');
        if (languageInfo != "" && languageInfo != null && languageInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Language is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceLanguage01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_008
     * @tc.name      testDeviceRegion01
     * @tc.desc      Get a string representing the device region and the return value is not null.
     */
    it('testDeviceRegion01', 0, async function (done) {
        console.info('testDeviceRegion01 start');
        let ret = false;

        console.info('the value of the deviceinfo region is :' + regionInfo);

        expect(regionInfo).assertInstanceOf('String');
        if (regionInfo != "" && regionInfo != null && regionInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value Region is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceRegion01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_009
     * @tc.name      testDeviceWindowWidth01
     * @tc.desc      Get a number representing the device window width and return value is greater than 0.
     */
    it('testDeviceWindowWidth01', 0, async function (done) {
        console.info('testDeviceWindowWidth01 start');
        let ret = false;

        console.info('the value of the deviceinfo window width is :' + windowWidthInfo);

        expect(windowWidthInfo).assertInstanceOf('Number');
        if (windowWidthInfo >= 0) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value WindowWidth is not larger than 0.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceWindowWidth01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_010
     * @tc.name      testDeviceWindowHeight01
     * @tc.desc      Get a number representing the device window height and return value is greater than 0.
     */
    it('testDeviceWindowHeight01', 0, async function (done) {
        console.info('testDeviceWindowHeight01 start');
        let ret = false;

        console.info('the value of the deviceinfo window height is :' + windowHeightInfo);

        expect(windowHeightInfo).assertInstanceOf('Number');
        if (windowHeightInfo >= 0) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value WindowHeight is not larger than 0.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceWindowHeight01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_011
     * @tc.name      testDeviceScreenDensity01
     * @tc.desc      Get a number representing the screen density and return value is greater than 0.
     */
    it('testDeviceScreenDensity01', 0, async function (done) {
        console.info('testDeviceScreenDensity01 start');
        let ret = false;

        console.info('the value of the deviceinfo screen density is :' + screenDensityInfo);

        expect(screenDensityInfo).assertInstanceOf('Number');
        if (screenDensityInfo >= 0) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value ScreenDensity is not larger than 0.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceScreenDensity01 : end');
    })

    /**
     * @tc.number    SUB_STARTUP_SYSTEM_DEVICE_012
     * @tc.name      testDeviceScreenShape01
     * @tc.desc      Get a string representing the device screen shape and the return value is not null.
     */
    it('testDeviceScreenShape01', 0, async function (done) {
        console.info('testDeviceScreenShape01 start');
        let ret = false;

        console.info('the value of the deviceinfo screenShape is :' + screenShapeInfo);

        expect(screenShapeInfo).assertInstanceOf('String');
        if (screenShapeInfo != "" && screenShapeInfo != null && screenShapeInfo != undefined) {
            ret = true;
            expect(ret).assertTrue();
			done();
        }else {
            console.info('the return value ScreenShape is null or incorrect.');
            expect(false).assertTrue();
			done();
        }
        console.info('testDeviceScreenShape01 : end');
    })
})


}
