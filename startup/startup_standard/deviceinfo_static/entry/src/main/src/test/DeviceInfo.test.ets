/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import deviceinfo from '@ohos.deviceInfo'

export default function DeviceInfoTest() {
  describe("DeviceInfoTest", (): void => {
    /**
     * @tc.name   deviceinfo_test_static_0100
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0100
     * @tc.desc   Get the deviceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0100 start');
      let deviceTypeInfo = deviceinfo.deviceType;
      
      if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
        console.info('the value of the deviceType is :' + deviceTypeInfo);
        expect(deviceTypeInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value DeviceType is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0100 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0200
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0200
     * @tc.desc   Get the manufacture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0200 start');
      let manufactureInfo = deviceinfo.manufacture;
      
      if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
        console.info('the value of the manufacture is :' + manufactureInfo);
        expect(manufactureInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value manufacture is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0200 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0300
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0300
     * @tc.desc   Get the brand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0300 start');
      let brandInfo = deviceinfo.brand;
      
      if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
        console.info('the value of the brand is :' + brandInfo);
        expect(brandInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value brand is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0300 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0400
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0400
     * @tc.desc   Get the marketName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0400 start');
      let marketNameInfo = deviceinfo.marketName;
      
      if (marketNameInfo != "" && marketNameInfo != null && marketNameInfo != undefined) {
        console.info('the value of the marketName is :' + marketNameInfo);
        expect(marketNameInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value marketName is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0400 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0500
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0500
     * @tc.desc   Get the productSeries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0500 start');
      let productSeriesInfo = deviceinfo.productSeries;
      
      if (productSeriesInfo != "" && productSeriesInfo != null && productSeriesInfo != undefined) {
        console.info('the value of the productSeries is :' + productSeriesInfo);
        expect(productSeriesInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value productSeries is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0500 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0600
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0600
     * @tc.desc   Get the productModel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0600 start');
      let productModelInfo = deviceinfo.productModel;
      
      if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
        console.info('the value of the productModel is :' + productModelInfo);
        expect(productModelInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value productModel is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0600 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0700
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0700
     * @tc.desc   Get the productModelAlias
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0700 start');
      let productModelAliasInfo = deviceinfo.productModelAlias;
      
      if (productModelAliasInfo != "" && productModelAliasInfo != null && productModelAliasInfo != undefined) {
        console.info('the value of the productModelAlias is :' + productModelAliasInfo);
        expect(productModelAliasInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value productModelAlias is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0700 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0800
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0800
     * @tc.desc   Get the softwareModel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0800 start');
      let softwareModelInfo = deviceinfo.softwareModel;
      
      if (softwareModelInfo != "" && softwareModelInfo != null && softwareModelInfo != undefined) {
        console.info('the value of the softwareModel is :' + softwareModelInfo);
        expect(softwareModelInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value softwareModel is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0800 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_0900
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0900
     * @tc.desc   Get the hardwareModel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0900 start');
      let hardwareModelInfo = deviceinfo.hardwareModel;
      
      if (hardwareModelInfo != "" && hardwareModelInfo != null && hardwareModelInfo != undefined) {
        console.info('the value of the hardwareModel is :' + hardwareModelInfo);
        expect(hardwareModelInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value hardwareModel is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_0900 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1000
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1000
     * @tc.desc   Get the serial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1000 start');
      let serialInfo = deviceinfo.serial;
      
      if (serialInfo != "" && serialInfo != null && serialInfo != undefined) {
        console.info('the value of the serial is :' + serialInfo);
        expect(serialInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value serial is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1000 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1100
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1100
     * @tc.desc   Get the bootloaderVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1100 start');
      let bootloaderVersionInfo = deviceinfo.bootloaderVersion;
      console.info('the value of the bootloaderVersion is :' + bootloaderVersionInfo);

      expect(bootloaderVersionInfo).assertInstanceOf('String');
      if (bootloaderVersionInfo != "" && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
        console.info('the value of the bootloaderVersion is :' + bootloaderVersionInfo);
        expect(bootloaderVersionInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value bootloaderVersion is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1100 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1200
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1200
     * @tc.desc   Get the abiList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1200 start');
      let abiListInfo = deviceinfo.abiList;
      
      if (abiListInfo != "" && abiListInfo != null && abiListInfo != undefined) {
        console.info('the value of the abiList is :' + abiListInfo);
        expect(abiListInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value abiList is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1200 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1300
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1300
     * @tc.desc   Get the securityPatchTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1300 start');
      let securityPatchTagInfo = deviceinfo.securityPatchTag;
      
      if (securityPatchTagInfo != "" && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
        console.info('the value of the securityPatchTag is :' + securityPatchTagInfo);
        expect(securityPatchTagInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value securityPatchTag is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1300 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1400
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1400
     * @tc.desc   Get the displayVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1400 start');
      let displayVersionInfo = deviceinfo.displayVersion;
      
      if (displayVersionInfo != "" && displayVersionInfo != null && displayVersionInfo != undefined) {
        console.info('the value of the displayVersion is :' + displayVersionInfo);
        expect(displayVersionInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value displayVersion is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1400 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1500
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1500
     * @tc.desc   Get the incrementalVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1500 start');
      let incrementalVersionInfo = deviceinfo.incrementalVersion;
      
      if (incrementalVersionInfo != "" && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
        console.info('the value of the incrementalVersion is :' + incrementalVersionInfo);
        expect(incrementalVersionInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value incrementalVersion is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1500 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1600
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1600
     * @tc.desc   Get the osReleaseType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1600 start');
      let osReleaseTypeInfo = deviceinfo.osReleaseType;
      console.info('the value of the osReleaseType is :' + osReleaseTypeInfo);

      expect(osReleaseTypeInfo).assertInstanceOf('String');
      if (osReleaseTypeInfo != "" && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
        console.info('the value of the osReleaseType is :' + osReleaseTypeInfo);
        expect(osReleaseTypeInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value osReleaseType is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1600 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1700
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1700
     * @tc.desc   Get the osFullName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1700 start');
      let osFullNameInfo = deviceinfo.osFullName;
      
      if (osFullNameInfo != "" && osFullNameInfo != null && osFullNameInfo != undefined) {
        console.info('the value of the osFullName is :' + osFullNameInfo);
        expect(osFullNameInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value osFullName is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_1700 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1800
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1800
     * @tc.desc   Get the majorVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1800 start');
      let majorVersionInfo = deviceinfo.majorVersion;
      console.info('the value of the majorVersion is :' + majorVersionInfo);

      expect(majorVersionInfo).assertInstanceOf('int');
      expect(majorVersionInfo >= 1 && majorVersionInfo <= 99).assertTrue();
      done();

      console.info('deviceinfo_test_static_1800 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_1900
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1900
     * @tc.desc   Get the seniorVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1900 start');
      let seniorVersionInfo = deviceinfo.seniorVersion;
      console.info('the value of the seniorVersion is :' + seniorVersionInfo);

      expect(seniorVersionInfo).assertInstanceOf('int');
      expect(seniorVersionInfo >= 0 && seniorVersionInfo <= 99).assertTrue();
      done();

      console.info('deviceinfo_test_static_1900 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2000
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2000
     * @tc.desc   Get the featureVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2000 start');;
      let featureVersionInfo = deviceinfo.featureVersion;
      console.info('the value of the featureVersion is :' + featureVersionInfo);

      expect(featureVersionInfo).assertInstanceOf('int');
      expect((featureVersionInfo >= 1 && featureVersionInfo <= 99) || featureVersionInfo == 0).assertTrue();
      done();

      console.info('deviceinfo_test_static_2000 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2100
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2100
     * @tc.desc   Get the buildVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2100 start');
      let buildVersionInfo = deviceinfo.buildVersion;
      console.info('the value of the buildVersion is :' + buildVersionInfo);

      expect(buildVersionInfo).assertInstanceOf('int');
      expect(buildVersionInfo == 0 || (buildVersionInfo >= 1 && buildVersionInfo <= 999)).assertTrue();
      done();

      console.info('deviceinfo_test_static_2100 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2200
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2200
     * @tc.desc   Get the sdkApiVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2200 start');
      let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
      console.info('the value of the sdkApiVersion is :' + sdkApiVersionInfo);

      expect(sdkApiVersionInfo).assertInstanceOf('int');
      expect(sdkApiVersionInfo >= 0).assertTrue();
      done();

      console.info('deviceinfo_test_static_2200 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2300
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2300
     * @tc.desc   Get the firstApiVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2300 start');
      let firstApiVersionInfo = deviceinfo.firstApiVersion;
      console.info('the value of the firstApiVersion is :' + firstApiVersionInfo);

      expect(firstApiVersionInfo).assertInstanceOf('int');
      expect(firstApiVersionInfo >= 0).assertTrue();
      done();

      console.info('deviceinfo_test_static_2300 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2400
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2400
     * @tc.desc   Get the versionId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2400 start');
      let versionIdInfo = deviceinfo.versionId;
      
      if (versionIdInfo != "" && versionIdInfo != null && versionIdInfo != undefined) {
        console.info('the value of the versionId is :' + versionIdInfo);
        expect(versionIdInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value versionId is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2400 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2500
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2500
     * @tc.desc   Get the buildType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2500 start');
      let buildTypeInfo = deviceinfo.buildType;
      
      if (buildTypeInfo != "" && buildTypeInfo != null && buildTypeInfo != undefined) {
        console.info('the value of the buildType is :' + buildTypeInfo);
        expect(buildTypeInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value buildType is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2500 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2600
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2600
     * @tc.desc   Get the buildUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2600 start');
      let buildUserInfo = deviceinfo.buildUser;
      
      if (buildUserInfo != "" && buildUserInfo != null && buildUserInfo != undefined) {
        console.info('the value of the buildUser is :' + buildUserInfo);
        expect(buildUserInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value buildUser is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2600 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2700
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2700
     * @tc.desc   Get the buildHost
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2700 start');
      let buildHostInfo = deviceinfo.buildHost;
      
      if (buildHostInfo != "" && buildHostInfo != null && buildHostInfo != undefined) {
        console.info('the value of the buildHost is :' + buildHostInfo);
        expect(buildHostInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value buildHost is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2700 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2800
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2800
     * @tc.desc   Get the buildTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2800 start');
      let buildTimeInfo = deviceinfo.buildTime;
      
      if (buildTimeInfo != "" && buildTimeInfo != null && buildTimeInfo != undefined) {
        console.info('the value of the buildTime is :' + buildTimeInfo);
        expect(buildTimeInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value buildTime is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2800 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_2900
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2900
     * @tc.desc   Get the buildRootHash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2900 start');
      let buildRootHashInfo = deviceinfo.buildRootHash;

      if (buildRootHashInfo != "" && buildRootHashInfo != null && buildRootHashInfo != undefined) {
        console.info('the value of the buildRootHash is :' + buildRootHashInfo);
        expect(buildRootHashInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value buildRootHash is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_2900 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3000
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3000
     * @tc.desc   Get the udid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3000 start');
      let udidInfo = deviceinfo.udid;
      
      if (udidInfo != "" && udidInfo != null && udidInfo != undefined) {
        console.info('the value of the udid is :' + udidInfo);
        expect(udidInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value udid is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_3000 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3100
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3100
     * @tc.desc   Get the distributionOSName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3100 start');
      let distributionOSNameInfo = deviceinfo.distributionOSName;
      if (distributionOSNameInfo != "" && distributionOSNameInfo != null && distributionOSNameInfo != undefined) {
        console.info('the value of the distributionOSName is :' + distributionOSNameInfo);
        expect(distributionOSNameInfo).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value is null and the type is :' + typeof (distributionOSNameInfo));
        expect(distributionOSNameInfo == "").assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3100 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3200
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3200
     * @tc.desc   Get the distributionOSVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3200 start');
      let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
      
      if (distributionOSVersionInfo != "" && distributionOSVersionInfo != null && distributionOSVersionInfo != undefined) {
        console.info('the value of the distributionOSVersion is :' + distributionOSVersionInfo);
        expect(distributionOSVersionInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value distributionOSVersion is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_3200 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3300
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3300
     * @tc.desc   Get the distributionOSApiVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3300 start');
      let distributionOSApiVersionInfo = deviceinfo.distributionOSApiVersion;
      console.info('the value of the distributionOSApiVersion is :' + distributionOSApiVersionInfo);

      expect(distributionOSApiVersionInfo).assertInstanceOf('int');
      expect(distributionOSApiVersionInfo >= 0).assertTrue();
      done();

      console.info('deviceinfo_test_static_3300 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3400
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3400
     * @tc.desc   Get the distributionOSApiName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3400 start');
      let distributionOSApiNameInfo = deviceinfo.distributionOSApiName;
      if (distributionOSApiNameInfo != "" && distributionOSApiNameInfo != null && distributionOSApiNameInfo != undefined) {
        console.info('the value of the distributionOSApiName is :' + distributionOSApiNameInfo);
        expect(distributionOSApiNameInfo).assertInstanceOf('String');
        done();
      } else {
        console.info('the return value is null and the type is :' + typeof (distributionOSApiNameInfo));
        expect(distributionOSApiNameInfo == "").assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3400 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3500
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3500
     * @tc.desc   Get the distributionOSReleaseType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3500 start');
      let distributionOSReleaseTypeInfo = deviceinfo.distributionOSReleaseType;
      
      if (distributionOSReleaseTypeInfo != "" && distributionOSReleaseTypeInfo != null && distributionOSReleaseTypeInfo != undefined) {
        console.info('the value of the distributionOSReleaseType is :' + distributionOSReleaseTypeInfo);
        expect(distributionOSReleaseTypeInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value distributionOSReleaseType is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_3500 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3600
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3600
     * @tc.desc   Get the ODID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3600 start');
      let ODIDInfo = deviceinfo.ODID;
      
      if (ODIDInfo != "" && ODIDInfo != null && ODIDInfo != undefined) {
        console.info('the value of the ODID is :' + ODIDInfo);
        expect(ODIDInfo).assertInstanceOf('String');
        done();
      }
      else {
        console.info('the return value ODID is null or incorrect.');
        expect().assertFail();
        done();
      }
      console.info('deviceinfo_test_static_3600 : end');
    })

    /**
     * @tc.name   deviceinfo_test_static_3700
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3700
     * @tc.desc   Get the diskSN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deviceinfo_test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3700 start');
      let diskSNInfo = deviceinfo.diskSN;
      console.info('the value of the diskSN is :' + diskSNInfo);
      let deviceTypeInfo = deviceinfo.deviceType;
      expect(diskSNInfo).assertInstanceOf('String');
      if(deviceTypeInfo == '2in1'){ 
        if (diskSNInfo != "" && diskSNInfo != null && diskSNInfo != undefined) {
          console.info('the value of the deviceinfo diskSN is :' + diskSNInfo);
          expect(diskSNInfo).assertInstanceOf('String');
          done();
        } else {
          console.info('the return value diskSN is null or incorrect.');
          expect().assertFail();
          done();
        }     
      }else{
        expect(diskSNInfo == "").assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3700 : end');
    })
  })
}