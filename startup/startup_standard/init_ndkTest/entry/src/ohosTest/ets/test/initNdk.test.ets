/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium'
import initndk from 'libinitndk.so'

export default function initNdkTest() {
  describe('StartupInitTest', () => {
    const MAX_CHARACTERS_NUM_ONE = 33;
    const MAX_CHARACTERS_NUM_TWO = 65;
    const MAX_CHARACTERS_NUM = 0;
    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDEVICETYPE_0100
     * @tc.name       : testOHGetDeviceType001
     * @tc.desc       : test OH_GetDeviceType for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDeviceType001', 0, async (done: Function) => {
      let deviceTypeInfo: string = initndk.oHGetDeviceType();
      console.info('the value of the deviceType is :' + deviceTypeInfo);

      expect(deviceTypeInfo).assertInstanceOf('String');
      if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s\\:]","g");
        let arr = deviceTypeInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(deviceTypeInfo).assertEqual(bufferstr);
        }        
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDEVICETYPE_0200
     * @tc.name       : testOHGetDeviceType002
     * @tc.desc       : test OH_GetDeviceType has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDeviceType002', 0, async (done: Function) => {
      let deviceTypeInfo: string = initndk.oHGetDeviceType();
      console.info('the value of the deviceType is :' + deviceTypeInfo);
      let len = deviceTypeInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s\\:]","g");
      let arr = deviceTypeInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(deviceTypeInfo).assertEqual(bufferstr);
      }     
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETMANUFACTURE_0100
     * @tc.name       : testOHGetManufacture001
     * @tc.desc       : test OH_GetManufacture for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetManufacture001', 0, async (done: Function) => {
      let manufactureInfo: string = initndk.oHGetManufacture();

      let ret = false;
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
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETMANUFACTURE_0200
     * @tc.name       : testOHGetManufacture002
     * @tc.desc       : test OH_GetManufacture has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetManufacture002', 0, async (done: Function) => {
      let manufactureInfo: string = initndk.oHGetManufacture();
      let len = manufactureInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBRAND_0100
     * @tc.name       : testOHGetBrand001
     * @tc.desc       : test OH_GetBrand for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBrand001', 0, async (done: Function) => {
      let brandInfo: string = initndk.oHGetBrand();

      let ret = false;
      expect(brandInfo).assertInstanceOf('String');
      if (brandInfo != "" && brandInfo != null && brandInfo != undefined) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value Manufacture is null or incorrect.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBRAND_0200
     * @tc.name       : testOHGetBrand002
     * @tc.desc       : test OH_GetBrand has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBrand002', 0, async (done: Function) => {
      let brandInfo: string = initndk.oHGetBrand();
      let len = brandInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM); 
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETMARKETNAME_0100
     * @tc.name       : testOHGetMarketName001
     * @tc.desc       : test OH_GetMarketName for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetMarketName001', 0, async (done: Function) => {
      let ret = false;
      let marketNameInfo: string = initndk.oHGetMarketName();

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
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETPRODUCTSERIES_0100
     * @tc.name       : testOHGetProductSeries001
     * @tc.desc       : test OH_GetProductSeries for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetProductSeries001', 0, async (done: Function) => {
      let productSeriesInfo: string = initndk.oHGetProductSeries();
      console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);

      expect(productSeriesInfo).assertInstanceOf('String');
      if (productSeriesInfo != "" && productSeriesInfo != null && productSeriesInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
        let arr = productSeriesInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(productSeriesInfo).assertEqual(bufferstr);
        } 
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETPRODUCTSERIES_0200
     * @tc.name       : testOHGetProductSeries002
     * @tc.desc       : test OH_GetProductSeries has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetProductSeries002', 0, async (done: Function) => {
      let productSeriesInfo: string = initndk.oHGetProductSeries();
      console.info('the value of the deviceinfo productSeries is :' + productSeriesInfo);
      let len = productSeriesInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
      let arr = productSeriesInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(productSeriesInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETPRODUCTMODEL_0100
     * @tc.name       : testOHGetProductModel001
     * @tc.desc       : test OH_GetProductModel for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetProductModel001', 0, async (done: Function) => {
      let productModelInfo: string = initndk.oHGetProductModel();

      console.info('the value of the deviceinfo productModel is :' + productModelInfo);
      expect(productModelInfo).assertInstanceOf('String');
      if (productModelInfo != "" && productModelInfo != null && productModelInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
        let arr = productModelInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(productModelInfo).assertEqual(bufferstr);
        }       
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETPRODUCTMODEL_0200
     * @tc.name       : testOHGetProductModel002
     * @tc.desc       : test OH_GetProductModel has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetProductModel002', 0, async (done: Function) => {
      let productModelInfo: string = initndk.oHGetProductModel();

      console.info('the value of the deviceinfo productModel is :' + productModelInfo);
      let len = productModelInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
      let arr = productModelInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(productModelInfo).assertEqual(bufferstr);
      }      
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSOFTWAREMODEL_0100
     * @tc.name       : testOHGetSoftwareModel001
     * @tc.desc       : test OH_GetSoftwareModel for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSoftwareModel001', 0, async (done: Function) => {
      let softwareModelInfo: string = initndk.oHGetSoftwareModel();

      console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);
      expect(softwareModelInfo).assertInstanceOf('String');
      if (softwareModelInfo != "" && softwareModelInfo != null && softwareModelInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
        let arr = softwareModelInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(softwareModelInfo).assertEqual(bufferstr);
        }       
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSOFTWAREMODEL_0200
     * @tc.name       : testOHGetSoftwareModel002
     * @tc.desc       : test OH_GetSoftwareModel has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSoftwareModel002', 0, async (done: Function) => {
      let softwareModelInfo: string = initndk.oHGetSoftwareModel();

      console.info('the value of the deviceinfo softwareModel is :' + softwareModelInfo);
      let len = softwareModelInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
      let arr = softwareModelInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(softwareModelInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETHARDWAREMODEL_0100
     * @tc.name       : testOHGetHardwareModel001
     * @tc.desc       : test OH_GetHardwareModel for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetHardwareModel001', 0, async (done: Function) => {
      let hardwareModelInfo: string = initndk.oHGetHardwareModel();

      let ret = false;
      console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);
      expect(hardwareModelInfo).assertInstanceOf('String');
      if (hardwareModelInfo != "" && hardwareModelInfo != null && hardwareModelInfo != undefined) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value HardwareModel is null or incorrect.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETHARDWAREMODEL_0200
     * @tc.name       : testOHGetHardwareModel002
     * @tc.desc       : test OH_GetHardwareModel has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetHardwareModel002', 0, async (done: Function) => {
      let hardwareModelInfo: string = initndk.oHGetHardwareModel();

      console.info('the value of the deviceinfo hardwareModel is :' + hardwareModelInfo);
      let len = hardwareModelInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBOOTLOADERVERSION_0100
     * @tc.name       : testOHGetBootloaderVersion001
     * @tc.desc       : test OH_GetBootloaderVersion for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBootloaderVersion001', 0, async (done: Function) => {
      let bootloaderVersionInfo: string = initndk.oHGetBootloaderVersion();
      console.info('the value of the deviceinfo bootloaderVersion is :' + bootloaderVersionInfo);

      expect(bootloaderVersionInfo).assertInstanceOf('String');
      if (bootloaderVersionInfo != "" && bootloaderVersionInfo != null && bootloaderVersionInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = bootloaderVersionInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(bootloaderVersionInfo).assertEqual(bufferstr);
        }  
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBOOTLOADERVERSION_0200
     * @tc.name       : testOHGetBootloaderVersion002
     * @tc.desc       : test OH_GetBootloaderVersion has at least one character and at most 64 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBootloaderVersion002', 0, async (done: Function) => {
      let bootloaderVersionInfo: string = initndk.oHGetBootloaderVersion();
      console.info('the value of the deviceinfo bootloaderVersion is :' + bootloaderVersionInfo);

      let len = bootloaderVersionInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = bootloaderVersionInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(bootloaderVersionInfo).assertEqual(bufferstr);
      }    
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETABILIST_0100
     * @tc.name       : testOHGetAbiList001
     * @tc.desc       : test OH_GetAbiList for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetAbiList001', 0, async (done: Function) => {
      let abiListInfo: string = initndk.oHGetAbiList();

      console.info('the value of the deviceinfo abiList is :' + abiListInfo);
      expect(abiListInfo).assertInstanceOf('String');
      if (abiListInfo != "" && abiListInfo != null && abiListInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\,]","g");
        let arr = abiListInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(abiListInfo).assertEqual(bufferstr);
        }
        
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETABILIST_0200
     * @tc.name       : testOHGetAbiList002
     * @tc.desc       : test OH_GetAbiList has at least one character and at most 64 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetAbiList002', 0, async (done: Function) => {
      let abiListInfo: string = initndk.oHGetAbiList();

      console.info('the value of the deviceinfo abiList is :' + abiListInfo);
      let len = abiListInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\,]","g");
      let arr = abiListInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(abiListInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSECURITYPATCHTAG_0100
     * @tc.name       : testOHGetSecurityPatchTag001
     * @tc.desc       : test OH_GetSecurityPatchTag for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSecurityPatchTag001', 0, async (done: Function) => {
      let securityPatchTagInfo: string = initndk.oHGetSecurityPatchTag();
      let ret = false;
      console.info('the value of the deviceinfo securityPatchTag is :' + securityPatchTagInfo);
      let reFormat = new RegExp("^(\\d{4})/(\\d{2})/(\\d{2})$");
      let re = securityPatchTagInfo.match(reFormat);
      if (re != null) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return formate is not yy--mm--dd');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSECURITYPATCHTAG_0200
     * @tc.name       : testOHGetSecurityPatchTag002
     * @tc.desc       : test OH_GetSecurityPatchTag for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSecurityPatchTag002', 0, async (done: Function) => {
      let securityPatchTagInfo: string = initndk.oHGetSecurityPatchTag();
      let len = securityPatchTagInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      expect(securityPatchTagInfo).assertInstanceOf('String');
      if (securityPatchTagInfo != "" && securityPatchTagInfo != null && securityPatchTagInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\/\\.(\\)]","g");
        let arr = securityPatchTagInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(securityPatchTagInfo).assertEqual(bufferstr);
        }   
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISPLAYVERSION_0100
     * @tc.name       : testOHGetDisplayVersion001
     * @tc.desc       : test OH_GetDisplayVersion for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDisplayVersion001', 0, async (done: Function) => {
      let displayVersionInfo: string = initndk.oHGetDisplayVersion();
      console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);

      expect(displayVersionInfo).assertInstanceOf('String');
      if (displayVersionInfo != "" && displayVersionInfo != null && displayVersionInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
        let arr = displayVersionInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(displayVersionInfo).assertEqual(bufferstr);
        }  
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISPLAYVERSION_0200
     * @tc.name       : testOHGetDisplayVersion002
     * @tc.desc       : test OH_GetDisplayVersion has at least one character and at most 64 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDisplayVersion002', 0, async (done: Function) => {
      let displayVersionInfo: string = initndk.oHGetDisplayVersion();
      console.info('the value of the deviceinfo displayVersion is :' + displayVersionInfo);
      let len = displayVersionInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s]","g");
      let arr = displayVersionInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(displayVersionInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETINCREMENTALVERSION_0100
     * @tc.name       : testOHGetIncrementalVersion001
     * @tc.desc       : test OH_GetIncrementalVersion for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetIncrementalVersion001', 0, async (done: Function) => {
      let incrementalVersionInfo: string = initndk.oHGetIncrementalVersion();

      console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);
      expect(incrementalVersionInfo).assertInstanceOf('String');
      if (incrementalVersionInfo != "" && incrementalVersionInfo != null && incrementalVersionInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = incrementalVersionInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(incrementalVersionInfo).assertEqual(bufferstr);
        } 
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETINCREMENTALVERSION_0200
     * @tc.name       : testOHGetIncrementalVersion002
     * @tc.desc       : test OH_GetIncrementalVersion has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetIncrementalVersion002', 0, async (done: Function) => {
      let incrementalVersionInfo: string = initndk.oHGetIncrementalVersion();

      console.info('the value of the deviceinfo incrementalVersion is :' + incrementalVersionInfo);
      let len = incrementalVersionInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = incrementalVersionInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(incrementalVersionInfo).assertEqual(bufferstr);
      } 
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETOSRELEASETYPE_0100
     * @tc.name       : testOHGetOsReleaseType001
     * @tc.desc       : test OH_GetOsReleaseType for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetOsReleaseType001', 0, async (done: Function) => {
      let osReleaseTypeInfo: string = initndk.oHGetOsReleaseType();

      console.info('the value of the deviceinfo osReleaseType is :' + osReleaseTypeInfo);
      expect(osReleaseTypeInfo).assertInstanceOf('String');
      if (osReleaseTypeInfo != "" && osReleaseTypeInfo != null && osReleaseTypeInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = osReleaseTypeInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(osReleaseTypeInfo).assertEqual(bufferstr);
        }       
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETOSFULLNAME_0100
     * @tc.name       : testOHGetOSFullName001
     * @tc.desc       : test OH_GetOSFullName for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetOSFullName001', 0, async (done: Function) => {
      let osFullNameInfo: string = initndk.oHGetOSFullName();

      console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);
      expect(osFullNameInfo).assertInstanceOf('String');
      if (osFullNameInfo != "" && osFullNameInfo != null && osFullNameInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = osFullNameInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(osFullNameInfo).assertEqual(bufferstr);
        }       
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETOSFULLNAME_0200
     * @tc.name       : testOHGetOSFullName002
     * @tc.desc       : test OH_GetOSFullName has at least one character and at most 64 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetOSFullName002', 0, async (done: Function) => {
      let osFullNameInfo: string = initndk.oHGetOSFullName();

      console.info('the value of the deviceinfo osFullName is :' + osFullNameInfo);
      let len = osFullNameInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_TWO);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = osFullNameInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(osFullNameInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSDKAPIVERSION_0100
     * @tc.name       : testOHGetSdkApiVersion001
     * @tc.desc       : test OH_GetSdkApiVersion return value type is without special characters for numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSdkApiVersion001', 0, async (done: Function) => {
      let sdkApiVersionInfo: number = initndk.oHGetSdkApiVersion();
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = sdkApiVersionInfo.toString().match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        let numstr = parseInt(bufferstr);
        console.info('the value of the bufferstr is :' + numstr);
        expect(sdkApiVersionInfo).assertEqual(numstr);
      }
      
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETSDKAPIVERSION_0200
     * @tc.name       : testOHGetSdkApiVersion002
     * @tc.desc       : test OH_GetSdkApiVersion return value type is number, the return value is greater than or equal to 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetSdkApiVersion002', 0, async (done: Function) => {
      let sdkApiVersionInfo: number = initndk.oHGetSdkApiVersion();

      let ret = false;
      console.info('the value of the deviceinfo sdkApiVersion is :' + sdkApiVersionInfo);
      expect(sdkApiVersionInfo).assertInstanceOf('Number');
      if (sdkApiVersionInfo >= 0) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value SdkApiVersion is null or incorrect.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETFIRSTAPIVERSION_0100
     * @tc.name       : testOHGetFirstApiVersion001
     * @tc.desc       : test OH_GetFirstApiVersion return value type is without special characters for numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetFirstApiVersion001', 0, async (done: Function) => {
      let firstApiVersionInfo: number = initndk.oHGetFirstApiVersion();
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = firstApiVersionInfo.toString().match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        let numstr = parseInt(bufferstr);
        console.info('the value of the bufferstr is :' + numstr);
        expect(firstApiVersionInfo).assertEqual(numstr);
      }  
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETFIRSTAPIVERSION_0200
     * @tc.name       : testOHGetFirstApiVersion002
     * @tc.desc       : test OH_GetFirstApiVersion return value type is number, the return value is greater than or equal to 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetFirstApiVersion002', 0, async (done: Function) => {
      let firstApiVersionInfo: number = initndk.oHGetFirstApiVersion();

      let ret = false;
      console.info('the value of the deviceinfo firstApiVersion is :' + firstApiVersionInfo);
      expect(firstApiVersionInfo).assertInstanceOf('Number');
      if (firstApiVersionInfo >= 0) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value FirstApiVersion is null or incorrect.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETVERSIONID_0100
     * @tc.name       : testOHGetVersionId001
     * @tc.desc       : test OH_GetVersionId for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetVersionId001', 0, async (done: Function) => {
      let versionIdInfo: string = initndk.oHGetVersionId();

      let ret = false;
      console.info('the value of the deviceinfo versionId is :' + versionIdInfo);
      expect(versionIdInfo).assertInstanceOf('String');
      if (versionIdInfo != "" && versionIdInfo != null && versionIdInfo != undefined) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value VersionId is null or incorrect.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETVERSIONID_0200
     * @tc.name       : testOHGetVersionId002
     * @tc.desc       : test OH_GetVersionId has at least one character and at most 255 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetVersionId002', 0, async (done: Function) => {
      let versionIdInfo: string = initndk.oHGetVersionId();

      console.info('the value of the deviceinfo versionId is :' + versionIdInfo);
      let len = versionIdInfo.length;
      expect(len).assertLess(256);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDTYPE_0100
     * @tc.name       : testOHGetBuildType001
     * @tc.desc       : test OH_GetBuildType for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildType001', 0, async (done: Function) => {
      let buildTypeInfo: string = initndk.oHGetBuildType();

      console.info('the value of the deviceinfo buildType is :' + buildTypeInfo);

      expect(buildTypeInfo).assertInstanceOf('String');
      if (buildTypeInfo != "" && buildTypeInfo != null && buildTypeInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\:]","g");
        let arr = buildTypeInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(buildTypeInfo).assertEqual(bufferstr);
        }   
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDTYPE_0200
     * @tc.name       : testOHGetBuildType002
     * @tc.desc       : test OH_GetBuildType has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildType002', 0, async (done: Function) => {
      let buildTypeInfo: string = initndk.oHGetBuildType();

      console.info('the value of the deviceinfo buildType is :' + buildTypeInfo);

      let len = buildTypeInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\:]","g");
      let arr = buildTypeInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(buildTypeInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDUSER_0100
     * @tc.name       : testOHGetBuildUser001
     * @tc.desc       : test OH_GetBuildUser for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildUser001', 0, async (done: Function) => {
      let buildUserInfo: string = initndk.oHGetBuildUser();

      console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);
      expect(buildUserInfo).assertInstanceOf('String');
      if (buildUserInfo != "" && buildUserInfo != null && buildUserInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = buildUserInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(buildUserInfo).assertEqual(bufferstr);
        }        
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDUSER_0200
     * @tc.name       : testOHGetBuildUser002
     * @tc.desc       : test OH_GetBuildUser has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildUser002', 0, async (done: Function) => {
      let buildUserInfo: string = initndk.oHGetBuildUser();

      console.info('the value of the deviceinfo buildUser is :' + buildUserInfo);
      let len = buildUserInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = buildUserInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(buildUserInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDHOST_0100
     * @tc.name       : testOHGetBuildHost001
     * @tc.desc       : test OH_GetBuildHost for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildHost001', 0, async (done: Function) => {
      let buildHostInfo: string = initndk.oHGetBuildHost();

      console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);
      expect(buildHostInfo).assertInstanceOf('String');
      if (buildHostInfo != "" && buildHostInfo != null && buildHostInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s\\:]","g");
        let arr = buildHostInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(buildHostInfo).assertEqual(bufferstr);
        }  
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDHOST_0200
     * @tc.name       : testOHGetBuildHost002
     * @tc.desc       : test OH_GetBuildHost has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildHost002', 0, async (done: Function) => {
      let buildHostInfo: string = initndk.oHGetBuildHost();

      console.info('the value of the deviceinfo buildHost is :' + buildHostInfo);
      let len = buildHostInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\s\\:]","g");
      let arr = buildHostInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(buildHostInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDTIME_0100
     * @tc.name       : testOHGetBuildTime001
     * @tc.desc       : test OH_GetBuildTime has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildTime001', 0, async (done: Function) => {
      let buildTimeInfo: string = initndk.oHGetBuildTime();

      console.info('the value of the deviceinfo buildTime is :' + buildTimeInfo);
      expect(buildTimeInfo).assertInstanceOf('String');
      if (buildTimeInfo != "" && buildTimeInfo != null && buildTimeInfo != undefined) {
        let len = buildTimeInfo.length;
        expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
        expect(len).assertLarger(MAX_CHARACTERS_NUM);
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\:\\s]","g");
        let arr = buildTimeInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(buildTimeInfo).assertEqual(bufferstr);
        } 
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDTIME_0200
     * @tc.name       : testOHGetBuildTime002
     * @tc.desc       : test OH_GetBuildTime has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildTime002', 0, async (done: Function) => {
      let buildTimeInfo: string = initndk.oHGetBuildTime();

      console.info('the value of the deviceinfo buildTime is :' + buildTimeInfo);
      let len = buildTimeInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)\\:\\s]","g");
      let arr = buildTimeInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(buildTimeInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETBUILDROOTHASH_0100
     * @tc.name       : testOHGetBuildRootHash001
     * @tc.desc       : test OH_GetBuildRootHash for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetBuildRootHash001', 0, async (done: Function) => {
      let buildRootHashInfo: string = initndk.oHGetBuildRootHash();

      console.info('the value of the deviceinfo buildRootHash is :' + buildRootHashInfo);
      expect(buildRootHashInfo).assertInstanceOf('String');
      if (buildRootHashInfo != "" && buildRootHashInfo != null && buildRootHashInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = buildRootHashInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(buildRootHashInfo).assertEqual(bufferstr);
        }
      } else {
        console.info('the return value is null or incorrect.');
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSNAME_0100
     * @tc.name       : testOHGetDistributionOSName001
     * @tc.desc       : test OH_GetDistributionOSName for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSName001', 0, async (done: Function) => {
      let distributionOSNameInfo: string = initndk.oHGetDistributionOSName();

      console.info('the value of the distributionOSNameInfo is :' + distributionOSNameInfo);
      expect(distributionOSNameInfo).assertInstanceOf('String');
      if (distributionOSNameInfo != "" && distributionOSNameInfo != null && distributionOSNameInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = distributionOSNameInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(distributionOSNameInfo).assertEqual(bufferstr);
        }  
      } else {
        console.info('the return value is null and the type is :' + typeof (distributionOSNameInfo));
        expect(distributionOSNameInfo == "").assertTrue();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSVERSION_0100
     * @tc.name       : testOHGetDistributionOSVersion001
     * @tc.desc       : test OH_GetDistributionOSVersion for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSVersion001', 0, async (done: Function) => {
      let distributionOSVersionInfo: string = initndk.oHGetDistributionOSVersion();

      console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);
      expect(distributionOSVersionInfo).assertInstanceOf('String');
      if (distributionOSVersionInfo != "" && distributionOSVersionInfo != null && distributionOSVersionInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = distributionOSVersionInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(distributionOSVersionInfo).assertEqual(bufferstr);
        } 
      } else {
        console.info('the return value is null or incorrect.');
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSVERSION_0200
     * @tc.name       : testOHGetDistributionOSVersion002
     * @tc.desc       : test OH_GetDistributionOSVersion has at least one character and at most 32 characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSVersion002', 0, async (done: Function) => {
      let distributionOSVersionInfo: string = initndk.oHGetDistributionOSVersion();

      console.info('the value of the deviceinfo distributionOSVersion is :' + distributionOSVersionInfo);
      let len = distributionOSVersionInfo.length;
      expect(len).assertLess(MAX_CHARACTERS_NUM_ONE);
      expect(len).assertLarger(MAX_CHARACTERS_NUM);
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = distributionOSVersionInfo.match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        console.info('the value of the bufferstr is :' + bufferstr);
        expect(distributionOSVersionInfo).assertEqual(bufferstr);
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSAPIVERSION_0100
     * @tc.name       : testOHGetDistributionOSApiVersion001
     * @tc.desc       : test OH_GetDistributionOSApiVersion return value type is without special characters for numbers.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSApiVersion001', 0, async (done: Function) => {
      let distributionOSApiVersionInfo: number = initndk.oHGetDistributionOSApiVersion();
      let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
      let arr = distributionOSApiVersionInfo.toString().match(str);
      if(arr !== null){
        let bufferstr = arr.join('');
        let numstr = parseInt(bufferstr);
        console.info('the value of the bufferstr is :' + numstr);
        expect(distributionOSApiVersionInfo).assertEqual(numstr);
      }      
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSAPIVERSION_0200
     * @tc.name       : testOHGetDistributionOSApiVersion002
     * @tc.desc       : test OH_GetDistributionOSApiVersion return value type is number, the return value is greater than or equal to 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSApiVersion002', 0, async (done: Function) => {
      let distributionOSApiVersionInfo: number = initndk.oHGetDistributionOSApiVersion();

      let ret = false;
      console.info('the value of the deviceinfo distributionOSApiVersion is :' + distributionOSApiVersionInfo);
      expect(distributionOSApiVersionInfo).assertInstanceOf('Number');
      if (distributionOSApiVersionInfo >= 0) {
          ret = true;
          expect(ret).assertTrue();
          done();
      } else {
          console.info('the return value DistributionOSApiVersion is less than 0.');
          expect(false).assertTrue();
          done();
      }
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_DEVICEINFO_OH_GETDISTRIBUTIONOSRELEASETYPE_0100
     * @tc.name       : testOHGetDistributionOSReleaseType001
     * @tc.desc       : test OH_GetDistributionOSReleaseType for non-empty strings without special characters.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHGetDistributionOSReleaseType001', 0, async (done: Function) => {
      let distributionOSReleaseTypeInfo: string = initndk.oHGetDistributionOSReleaseType();

      console.info('the value of the deviceinfo distributiondistributionOSReleaseType is :' + distributionOSReleaseTypeInfo);
      expect(distributionOSReleaseTypeInfo).assertInstanceOf('String');
      if (distributionOSReleaseTypeInfo != "" && distributionOSReleaseTypeInfo != null && distributionOSReleaseTypeInfo != undefined) {
        let str: RegExp = new RegExp("[\\w\\-\\.(\\)]","g");
        let arr = distributionOSReleaseTypeInfo.match(str);
        if(arr !== null){
          let bufferstr = arr.join('');
          console.info('the value of the bufferstr is :' + bufferstr);
          expect(distributionOSReleaseTypeInfo).assertEqual(bufferstr);
        } 
      } else {
        console.info('the return value is null or incorrect.');
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_SYSCAPNDK_CANIUSE_0100
     * @tc.name       : testCanIUse001
     * @tc.desc       : test canIUse with using SystemCapability.Location.Location.Core
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCanIUse001', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = initndk.canIUse();
      expect(result).assertEqual(resultTrue);
      if (result == resultTrue) {
        console.info('the SystemCapability of SystemCapability.Location.Location.Core can use');
      }
      done();
    });

    /**
     * @tc.number     : SUB_STARTUP_INIT_SYSCAPNDK_CANIUSE_0200
     * @tc.name       : testCanIUse002
     * @tc.desc       : test canIUse with using SystemCapability.ArkUI.ArkUI.Full
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCanIUse002', 0, async (done: Function) => {
      let resultTrue = 0;
      let result: number = initndk.canIUseOther();
      expect(result).assertEqual(resultTrue);
      if (result == resultTrue) {
        console.info('the SystemCapability of SystemCapability.ArkUI.ArkUI.Full can use');
      }
      done();
    });
  })
}