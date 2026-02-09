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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
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
     * @tc.name   testDeviceBrand01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_001
     * @tc.desc   Get the device brand represented by a string and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceBrand01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceBrand01 start');
        
        if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
            console.info('the value of the deviceinfo brand is :' + brandInfo);
            expect(brandInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Brand is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceBrand01 ：end');
    })

    /**
     * @tc.name   testDeviceManufacture01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_002
     * @tc.desc   Get the manufacture name represented by a string and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceManufacture01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceManufacture01 start');

        if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
            console.info('the value of the deviceinfo manufacture is :' + manufactureInfo);
            expect(manufactureInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Manufacture is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceManufacture01 ：end');
    })

    /**
     * @tc.name   testDeviceModel01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_003
     * @tc.desc   Get the internal software sub-model represented by a string and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceModel01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceModel01 start');

        if (deviceModelInfo != "" && deviceModelInfo != null && deviceModelInfo != undefined) {
            console.info('the value of the deviceinfo model is :' + deviceModelInfo);
            expect(deviceModelInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Model is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceModel01 : end');
    })

    /**
     * @tc.name   testDeviceProduct01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_004
     * @tc.desc   Get the product represented by a string and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceProduct01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceProduct01 start');
        
        if (deviceProductInfo != "" && deviceProductInfo != null && deviceProductInfo != undefined) {
            console.info('the value of the deviceinfo product is :' + deviceProductInfo);
            expect(deviceProductInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Product is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceProduct01 ：end');
    })

    /**
     * @tc.name   testDeviceApiVersion01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_005
     * @tc.desc   Get the API version number, which return value type is number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceApiVersion01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceApiVersion01 start');
        console.info('the value of the deviceinfo sdkApiVersion is :' + apiVersionInfo);

        expect(apiVersionInfo).assertInstanceOf('Number');
        expect(apiVersionInfo >= 0).assertTrue();
        done();

        console.info('testDeviceApiVersion01 ：end');
    })

    /**
     * @tc.name   testDeviceType01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_006
     * @tc.desc   Get a string representing the device type and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceType01 start');
        
        if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
            console.info('the value of the deviceinfo deviceType is :' + deviceTypeInfo);
            expect(deviceTypeInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Type is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceType01 : end');
    })

    /**
     * @tc.name   testDeviceLanguage01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_007
     * @tc.desc   Get a string representing the device language and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceLanguage01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceLanguage01 start');

        if (languageInfo != "" && languageInfo != null && languageInfo != undefined) {
            console.info('the value of the deviceinfo language is :' + languageInfo);
            expect(languageInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Language is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceLanguage01 : end');
    })

    /**
     * @tc.name   testDeviceRegion01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_008
     * @tc.desc   Get a string representing the device region and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceRegion01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceRegion01 start');
        
        if (regionInfo != "" && regionInfo != null && regionInfo != undefined) {
            console.info('the value of the deviceinfo region is :' + regionInfo);
            expect(regionInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value Region is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceRegion01 : end');
    })

    /**
     * @tc.name   testDeviceWindowWidth01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_009
     * @tc.desc   Get a number representing the device window width and return value is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceWindowWidth01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceWindowWidth01 start');
        console.info('the value of the deviceinfo window width is :' + windowWidthInfo);

        expect(windowWidthInfo).assertInstanceOf('Number');
        expect(windowWidthInfo >= 0).assertTrue();
        done();

        console.info('testDeviceWindowWidth01 : end');
    })

    /**
     * @tc.name   testDeviceWindowHeight01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_010
     * @tc.desc   Get a number representing the device window height and return value is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceWindowHeight01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceWindowHeight01 start');
        console.info('the value of the deviceinfo window height is :' + windowHeightInfo);

        expect(windowHeightInfo).assertInstanceOf('Number');
        expect(windowHeightInfo >= 0).assertTrue();
        done();

        console.info('testDeviceWindowHeight01 : end');
    })

    /**
     * @tc.name   testDeviceScreenDensity01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_011
     * @tc.desc   Get a number representing the screen density and return value is greater than 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceScreenDensity01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceScreenDensity01 start');
        console.info('the value of the deviceinfo screen density is :' + screenDensityInfo);

        expect(screenDensityInfo).assertInstanceOf('Number');
        expect(screenDensityInfo >= 0).assertTrue();
        done();

        console.info('testDeviceScreenDensity01 : end');
    })

    /**
     * @tc.name   testDeviceScreenShape01
     * @tc.number SUB_STARTUP_SYSTEM_DEVICE_012
     * @tc.desc   Get a string representing the device screen shape and the return value is not null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeviceScreenShape01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testDeviceScreenShape01 start');
       
        if (screenShapeInfo != "" && screenShapeInfo != null && screenShapeInfo != undefined) {
            console.info('the value of the deviceinfo screenShape is :' + screenShapeInfo);
            expect(screenShapeInfo).assertInstanceOf('String');
			done();
        }else {
            console.info('the return value ScreenShape is null or incorrect.');
            expect().assertFail();
			done();
        }
        console.info('testDeviceScreenShape01 : end');
    })
})


}
