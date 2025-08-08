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
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0100
     * @tc.name deviceinfo_test_static_0100
     * @tc.desc Get the deviceType
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0100 start');
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
      console.info('deviceinfo_test_static_0100 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0200
     * @tc.name deviceinfo_test_static_0200
     * @tc.desc Get the manufacture
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0200 start');
      let ret = false;
      let manufactureInfo = deviceinfo.manufacture;
      console.info('the value of the manufacture is :' + manufactureInfo);

      expect(manufactureInfo).assertInstanceOf('String');
      if (manufactureInfo != "" && manufactureInfo != null && manufactureInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value manufacture is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0200 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0300
     * @tc.name deviceinfo_test_static_0300
     * @tc.desc Get the brand
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0300 start');
      let ret = false;
      let brandInfo = deviceinfo.brand;
      console.info('the value of the brand is :' + brandInfo);

      expect(brandInfo).assertInstanceOf('String');
      if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value brand is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0300 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0400
     * @tc.name deviceinfo_test_static_0400
     * @tc.desc Get the marketName
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0400 start');
      let ret = false;
      let marketNameInfo = deviceinfo.marketName;
      console.info('the value of the marketName is :' + marketNameInfo);

      expect(marketNameInfo).assertInstanceOf('String');
      if (marketNameInfo != "" && marketNameInfo != null && marketNameInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value marketName is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0400 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0500
     * @tc.name deviceinfo_test_static_0500
     * @tc.desc Get the productSeries
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0500 start');
      let ret = false;
      let productSeriesInfo = deviceinfo.productSeries;
      console.info('the value of the productSeries is :' + productSeriesInfo);

      expect(productSeriesInfo).assertInstanceOf('String');
      if (productSeriesInfo != "" && productSeriesInfo != null && productSeriesInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value productSeries is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0500 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0600
     * @tc.name deviceinfo_test_static_0600
     * @tc.desc Get the productModel
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0600 start');
      let ret = false;
      let productModelInfo = deviceinfo.productModel;
      console.info('the value of the productModel is :' + productModelInfo);

      expect(productModelInfo).assertInstanceOf('String');
      if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value productModel is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0600 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0700
     * @tc.name deviceinfo_test_static_0700
     * @tc.desc Get the productModelAlias
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0700 start');
      let ret = false;
      let productModelAliasInfo = deviceinfo.productModelAlias;
      console.info('the value of the productModelAlias is :' + productModelAliasInfo);

      expect(productModelAliasInfo).assertInstanceOf('String');
      if (productModelAliasInfo != "" && productModelAliasInfo != null && productModelAliasInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value productModelAlias is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0700 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0800
     * @tc.name deviceinfo_test_static_0800
     * @tc.desc Get the softwareModel
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0800 start');
      let ret = false;
      let softwareModelInfo = deviceinfo.softwareModel;
      console.info('the value of the softwareModel is :' + softwareModelInfo);

      expect(softwareModelInfo).assertInstanceOf('String');
      if (softwareModelInfo != "" && softwareModelInfo != null && softwareModelInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value softwareModel is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0800 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_0900
     * @tc.name deviceinfo_test_static_0900
     * @tc.desc Get the hardwareModel
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_0900 start');
      let ret = false;
      let hardwareModelInfo = deviceinfo.hardwareModel;
      console.info('the value of the hardwareModel is :' + hardwareModelInfo);

      expect(hardwareModelInfo).assertInstanceOf('String');
      if (hardwareModelInfo != "" && hardwareModelInfo != null && hardwareModelInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value hardwareModel is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_0900 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1000
     * @tc.name deviceinfo_test_static_1000
     * @tc.desc Get the serial
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1000 start');
      let ret = false;
      let serialInfo = deviceinfo.serial;
      console.info('the value of the serial is :' + serialInfo);

      expect(serialInfo).assertInstanceOf('String');
      if (serialInfo != "" && serialInfo != null && serialInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value serial is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1000 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1100
     * @tc.name deviceinfo_test_static_1100
     * @tc.desc Get the bootloaderVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1100 start');
      let ret = false;
      let bootloaderVersionInfo = deviceinfo.bootloaderVersion;
      console.info('the value of the bootloaderVersion is :' + bootloaderVersionInfo);

      expect(bootloaderVersionInfo).assertInstanceOf('String');
      if (bootloaderVersionInfo != "" && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value bootloaderVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1100 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1200
     * @tc.name deviceinfo_test_static_1200
     * @tc.desc Get the abiList
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1200 start');
      let ret = false;
      let abiListInfo = deviceinfo.abiList;
      console.info('the value of the abiList is :' + abiListInfo);

      expect(abiListInfo).assertInstanceOf('String');
      if (abiListInfo != "" && abiListInfo != null && abiListInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value abiList is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1200 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1300
     * @tc.name deviceinfo_test_static_1300
     * @tc.desc Get the securityPatchTag
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1300 start');
      let ret = false;
      let securityPatchTagInfo = deviceinfo.securityPatchTag;
      console.info('the value of the securityPatchTag is :' + securityPatchTagInfo);

      expect(securityPatchTagInfo).assertInstanceOf('String');
      if (securityPatchTagInfo != "" && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value securityPatchTag is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1300 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1400
     * @tc.name deviceinfo_test_static_1400
     * @tc.desc Get the displayVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1400 start');
      let ret = false;
      let displayVersionInfo = deviceinfo.displayVersion;
      console.info('the value of the displayVersion is :' + displayVersionInfo);

      expect(displayVersionInfo).assertInstanceOf('String');
      if (displayVersionInfo != "" && displayVersionInfo != null && displayVersionInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value displayVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1400 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1500
     * @tc.name deviceinfo_test_static_1500
     * @tc.desc Get the incrementalVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1500 start');
      let ret = false;
      let incrementalVersionInfo = deviceinfo.incrementalVersion;
      console.info('the value of the incrementalVersion is :' + incrementalVersionInfo);

      expect(incrementalVersionInfo).assertInstanceOf('String');
      if (incrementalVersionInfo != "" && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value incrementalVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1500 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1600
     * @tc.name deviceinfo_test_static_1600
     * @tc.desc Get the osReleaseType
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1600 start');
      let ret = false;
      let osReleaseTypeInfo = deviceinfo.osReleaseType;
      console.info('the value of the osReleaseType is :' + osReleaseTypeInfo);

      expect(osReleaseTypeInfo).assertInstanceOf('String');
      if (osReleaseTypeInfo != "" && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value osReleaseType is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1600 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1700
     * @tc.name deviceinfo_test_static_1700
     * @tc.desc Get the osFullName
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1700 start');
      let ret = false;
      let osFullNameInfo = deviceinfo.osFullName;
      console.info('the value of the osFullName is :' + osFullNameInfo);

      expect(osFullNameInfo).assertInstanceOf('String');
      if (osFullNameInfo != "" && osFullNameInfo != null && osFullNameInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value osFullName is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1700 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1800
     * @tc.name deviceinfo_test_static_1800
     * @tc.desc Get the majorVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1800 start');
      let ret = false;
      let majorVersionInfo = deviceinfo.majorVersion;
      console.info('the value of the majorVersion is :' + majorVersionInfo);

      expect(majorVersionInfo).assertInstanceOf('Number');
      if (majorVersionInfo >= 1 && majorVersionInfo <= 99) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value majorVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1800 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_1900
     * @tc.name deviceinfo_test_static_1900
     * @tc.desc Get the seniorVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_1900 start');
      let ret = false;
      let seniorVersionInfo = deviceinfo.seniorVersion;
      console.info('the value of the seniorVersion is :' + seniorVersionInfo);

      expect(seniorVersionInfo).assertInstanceOf('Number');
      if (seniorVersionInfo >= 0 && seniorVersionInfo <= 99) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value seniorVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_1900 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2000
     * @tc.name deviceinfo_test_static_2000
     * @tc.desc Get the featureVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2000 start');
      let ret = false;
      let featureVersionInfo = deviceinfo.featureVersion;
      console.info('the value of the featureVersion is :' + featureVersionInfo);

      expect(featureVersionInfo).assertInstanceOf('Number');
      if ((featureVersionInfo >= 1 && featureVersionInfo <= 99) || featureVersionInfo == 0) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value featureVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2000 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2100
     * @tc.name deviceinfo_test_static_2100
     * @tc.desc Get the buildVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2100 start');
      let ret = false;
      let buildVersionInfo = deviceinfo.buildVersion;
      console.info('the value of the buildVersion is :' + buildVersionInfo);

      expect(buildVersionInfo).assertInstanceOf('Number');
      if (buildVersionInfo == 0 || (buildVersionInfo >= 1 && buildVersionInfo <= 999)) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2100 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2200
     * @tc.name deviceinfo_test_static_2200
     * @tc.desc Get the sdkApiVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2200 start');
      let ret = false;
      let sdkApiVersionInfo = deviceinfo.sdkApiVersion;
      console.info('the value of the sdkApiVersion is :' + sdkApiVersionInfo);

      expect(sdkApiVersionInfo).assertInstanceOf('Number');
      if (sdkApiVersionInfo >= 0) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value sdkApiVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2200 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2300
     * @tc.name deviceinfo_test_static_2300
     * @tc.desc Get the firstApiVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2300 start');
      let ret = false;
      let firstApiVersionInfo = deviceinfo.firstApiVersion;
      console.info('the value of the firstApiVersion is :' + firstApiVersionInfo);

      expect(firstApiVersionInfo).assertInstanceOf('Number');
      if (firstApiVersionInfo >= 0) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value firstApiVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2300 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2400
     * @tc.name deviceinfo_test_static_2400
     * @tc.desc Get the versionId
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2400 start');
      let ret = false;
      let versionIdInfo = deviceinfo.versionId;
      console.info('the value of the versionId is :' + versionIdInfo);

      expect(versionIdInfo).assertInstanceOf('String');
      if (versionIdInfo != "" && versionIdInfo != null && versionIdInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value versionId is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2400 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2500
     * @tc.name deviceinfo_test_static_2500
     * @tc.desc Get the buildType
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2500 start');
      let ret = false;
      let buildTypeInfo = deviceinfo.buildType;
      console.info('the value of the buildType is :' + buildTypeInfo);

      expect(buildTypeInfo).assertInstanceOf('String');
      if (buildTypeInfo != "" && buildTypeInfo != null && buildTypeInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildType is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2500 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2600
     * @tc.name deviceinfo_test_static_2600
     * @tc.desc Get the buildUser
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2600 start');
      let ret = false;
      let buildUserInfo = deviceinfo.buildUser;
      console.info('the value of the buildUser is :' + buildUserInfo);

      expect(buildUserInfo).assertInstanceOf('String');
      if (buildUserInfo != "" && buildUserInfo != null && buildUserInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildUser is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2600 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2700
     * @tc.name deviceinfo_test_static_2700
     * @tc.desc Get the buildHost
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2700 start');
      let ret = false;
      let buildHostInfo = deviceinfo.buildHost;
      console.info('the value of the buildHost is :' + buildHostInfo);

      expect(buildHostInfo).assertInstanceOf('String');
      if (buildHostInfo != "" && buildHostInfo != null && buildHostInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildHost is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2700 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2800
     * @tc.name deviceinfo_test_static_2800
     * @tc.desc Get the buildTime
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2800 start');
      let ret = false;
      let buildTimeInfo = deviceinfo.buildTime;
      console.info('the value of the buildTime is :' + buildTimeInfo);

      expect(buildTimeInfo).assertInstanceOf('String');
      if (buildTimeInfo != "" && buildTimeInfo != null && buildTimeInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildTime is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2800 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_2900
     * @tc.name deviceinfo_test_static_2900
     * @tc.desc Get the buildRootHash
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_2900 start');
      let ret = false;
      let buildRootHashInfo = deviceinfo.buildRootHash;
      console.info('the value of the buildRootHash is :' + buildRootHashInfo);

      expect(buildRootHashInfo).assertInstanceOf('String');
      if (buildRootHashInfo != "" && buildRootHashInfo != null && buildRootHashInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value buildRootHash is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_2900 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3000
     * @tc.name deviceinfo_test_static_3000
     * @tc.desc Get the udid
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3000 start');
      let ret = false;
      let udidInfo = deviceinfo.udid;
      console.info('the value of the udid is :' + udidInfo);

      expect(udidInfo).assertInstanceOf('String');
      if (udidInfo != "" && udidInfo != null && udidInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value udid is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3000 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3100
     * @tc.name deviceinfo_test_static_3100
     * @tc.desc Get the distributionOSName
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3200
     * @tc.name deviceinfo_test_static_3200
     * @tc.desc Get the distributionOSVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3200 start');
      let ret = false;
      let distributionOSVersionInfo = deviceinfo.distributionOSVersion;
      console.info('the value of the distributionOSVersion is :' + distributionOSVersionInfo);

      expect(distributionOSVersionInfo).assertInstanceOf('String');
      if (distributionOSVersionInfo != "" && distributionOSVersionInfo != null && distributionOSVersionInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value distributionOSVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3200 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3300
     * @tc.name deviceinfo_test_static_3300
     * @tc.desc Get the distributionOSApiVersion
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3300 start');
      let ret = false;
      let distributionOSApiVersionInfo = deviceinfo.distributionOSApiVersion;
      console.info('the value of the distributionOSApiVersion is :' + distributionOSApiVersionInfo);

      expect(distributionOSApiVersionInfo).assertInstanceOf('Number');
      if (distributionOSApiVersionInfo >= 0) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value distributionOSApiVersion is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3300 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3400
     * @tc.name deviceinfo_test_static_3400
     * @tc.desc Get the distributionOSApiName
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
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
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3500
     * @tc.name deviceinfo_test_static_3500
     * @tc.desc Get the distributionOSReleaseType
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3500 start');
      let ret = false;
      let distributionOSReleaseTypeInfo = deviceinfo.distributionOSReleaseType;
      console.info('the value of the distributionOSReleaseType is :' + distributionOSReleaseTypeInfo);

      expect(distributionOSReleaseTypeInfo).assertInstanceOf('String');
      if (distributionOSReleaseTypeInfo != "" && distributionOSReleaseTypeInfo != null && distributionOSReleaseTypeInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value distributionOSReleaseType is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3500 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3600
     * @tc.name deviceinfo_test_static_3600
     * @tc.desc Get the ODID
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3600 start');
      let ret = false;
      let ODIDInfo = deviceinfo.ODID;
      console.info('the value of the ODID is :' + ODIDInfo);

      expect(ODIDInfo).assertInstanceOf('String');
      if (ODIDInfo != "" && ODIDInfo != null && ODIDInfo != undefined) {
        ret = true;
        expect(ret).assertTrue();
        done();
      }
      else {
        console.info('the return value ODID is null or incorrect.');
        expect(false).assertTrue();
        done();
      }
      console.info('deviceinfo_test_static_3600 : end');
    })

    /**
     * @tc.number SUB_STARTUP_JS_DEVCEINFO_3700
     * @tc.name deviceinfo_test_static_3700
     * @tc.desc Get the diskSN
     * @tc.level: Level 0
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it('deviceinfo_test_static_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('deviceinfo_test_static_3700 start');
      let ret = false;
      let diskSNInfo = deviceinfo.diskSN;
      console.info('the value of the diskSN is :' + diskSNInfo);
      let deviceTypeInfo = deviceinfo.deviceType;
      expect(diskSNInfo).assertInstanceOf('String');
      if(deviceTypeInfo == '2in1'){
        if (diskSNInfo != "" && diskSNInfo != null && diskSNInfo != undefined) {
          ret = true;
          expect(ret).assertTrue();
          done();
        } else {
          console.info('the return value diskSN is null or incorrect.');
          expect(false).assertTrue();
          done();
        }
      }else{
        if (diskSNInfo == "") {
          ret = true;
          expect(ret).assertTrue();
          done();
        } else {
          console.info('the return value diskSN is not null or incorrect.');
          expect(false).assertTrue();
          done();
        }
      }
      console.info('deviceinfo_test_static_3700 : end');
    })
  })
}