/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import resourceManager from '@ohos.resourceManager';
import { 
  imageExifMetadatakey,
  readAndWriteExifMetadata,
  imageMakerNoteHwMetadatakey,
  readAndWriteMakerNoteHwMetadata,
  exifReadWriteValidationRules,
  DNGExifReadWriteValidationRules,
  imageOnlyMakerNoteHwMetadata,
  readOnlyMakerNoteHwMetadata,
  exifReadOnlyValidationRules,
  testExifMetadata,
  testHuaweiMakerNoteMetadata,
  exifWriteExpectedValueRules,
} from './ImagePropertyByType.test'

interface ModifyRule1 {
  oldExpectValue: string | null | undefined;
  newExpectValue: string | number | Array<number> | ArrayBuffer | boolean | undefined;
}

interface ModifyRule {
  modifyValue: string;
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | boolean;
}

interface GenericError {
  code?: number;
  message?: string;
}

interface EnumValuePair<T> {
  enum: T;
  value: number;
}

let filesDir: string | undefined;
let cacheDir: string | undefined;
let isSupportHEIFDecode: boolean;
let isSupportHdr: Boolean;
const READ_FAILED = 7700202;
const UNSUPPORTED_IMAGE_FORMATS = 7700102;
const PROPERTY_NOT_EXIST = 7700204;
const INVALID_PARAMETER = 7600206;

function handleError(testTag: string, err: GenericError | Array<GenericError>, expectedErrorCode: number): boolean {
  if (Array.isArray(err)) {
    for (let error of err) {
      console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
      return error.code == expectedErrorCode;
    }
  } else {
    let error: GenericError = err;
    console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
    return error.code == expectedErrorCode;
  }
  return false;
}

export default function imageExifGetModifyByTypeTest() {
  describe("imageExifGetModifyByTypeTest", () => {

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });

    let filePath: string;
    let fdNumber: number
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fdNumber = file.fd
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber)
      }
      return imageSourceApi
    }

    const testModifyAndVerifyEnhanced = async (
      testNum: string,
      fileName: string,
      type: string,
      exifMetadata: string[]
    ): Promise<boolean> => {
      let ret: boolean = true;
      const modifyRecords: Record<string, string | null> = {} as Record<string, string | null>;
      for (let i = 0; i < exifMetadata.length; i++) {
        const rule = exifReadWriteValidationRules.get(exifMetadata[i]);
        if (rule && rule.modifyValue) {
          modifyRecords[exifMetadata[i]] = rule.modifyValue;
        } else {
          console.info(`${testNum} testModifyAndVerifyEnhanced exifMetadata skip: ${exifMetadata[i]}`);
        }
      }
      const imageSource = await getImageSource(fileName, type);
      try {
        await imageSource.modifyImageProperties(modifyRecords);
        console.info(`${testNum} modifyImagePropertiesEnhanced completed, modifyRecords: ${JSON.stringify(modifyRecords)}`);
        
        const propertyKeys: Array<image.PropertyKey> = exifMetadata.map(key => key as image.PropertyKey);
        const imageSourceApi = await getImageSource(fileName, type);
        const readProperties = await imageSourceApi.getImageProperties(propertyKeys);
        console.info(`${testNum} getImageProperties result: ${JSON.stringify(readProperties)}`);
        
        for (let i = 0; i < exifMetadata.length; i++) {
          const propertyName = exifMetadata[i];
          const rule = exifReadWriteValidationRules.get(propertyName);
          if (!rule) {
            continue;
          }
          
          const propertyKey = propertyName as image.PropertyKey;
          const actualValue = readProperties[propertyKey];
          const expectedValue = rule.oldExpectValue;
          
          if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} modifyImagePropertiesEnhanced verification failed for key: ${propertyName}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        }
        await imageSourceApi?.release();
      } catch (error) {
        console.error(`${testNum} modifyImagePropertiesEnhanced or getImageProperties error: ${error}`);
        ret = false;
      } finally {
        await imageSource?.release();
      }
      return ret;
    }

    const compareValues = (
      actual: string | number | object | number[] | undefined | null | boolean,
      expected: string | number | object | number[] | undefined | null | boolean
    ): boolean => {
      if (Array.isArray(actual) && Array.isArray(expected)) {
        if (actual.length !== expected.length) return false;
        return actual.every((val: number, index: number) => val == expected[index]);
      }
      return actual === expected;
    }

    const compareArrayBuffer = (
      actualBuffer: ArrayBuffer,
      expectedValue: string | number | object | number[] | undefined | null | ArrayBuffer | boolean
    ): boolean => {
      const actualArray = new Uint8Array(actualBuffer);
      const MAX_COMPARE_COUNT = 20;
      
      const logCount = Math.min(MAX_COMPARE_COUNT, actualArray.length);
      for (let i = 0; i < logCount; i++) {
        console.info(`ArrayBuffer[${i}]: ${actualArray[i]}`);
      }
      if (actualArray.length > MAX_COMPARE_COUNT) {
        console.info(`ArrayBuffer: ... (${actualArray.length - MAX_COMPARE_COUNT} elements omitted) ...`);
      }

      if (expectedValue instanceof ArrayBuffer) {
        const expectedArray = new Uint8Array(expectedValue);
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedArray.length);
        
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedArray[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedArray[i]}`);
            return false;
          }
        }
        return true;
      }
      
      if (Array.isArray(expectedValue)) {
        const compareCount = Math.min(MAX_COMPARE_COUNT, actualArray.length, expectedValue.length);
        for (let i = 0; i < compareCount; i++) {
          if (actualArray[i] !== expectedValue[i]) {
            console.info(`Mismatch at [${i}]: actual=${actualArray[i]}, expected=${expectedValue[i]}`);
            return false;
          }
        }
        return true;
      }
      return false;
    }

    const verifyMetadataProperties = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      imageMetadatakey: string[],
      rulesMap: Map<string, ModifyRule | ModifyRule1>
    ): Promise<boolean> => {
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource(fileName, type);
      const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata(exifMetadataKey);
      for (let i = 0; i < exifMetadataKey.length; i++) {
        const rule = rulesMap.get(exifMetadataKey[i]);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${exifMetadataKey[i]}`);
          continue;
        }
        try {
          let expectedValue = rule.newExpectValue;
          let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer;
          if (typeMetadata == "exifMetadata" && exifValue.exifMetadata != undefined) {
            actualValue = exifValue.exifMetadata![imageMetadatakey[i]];
          } else if (typeMetadata == "makerNoteHuaweiMetadata" && exifValue.makerNoteHuaweiMetadata != undefined) {
            actualValue = exifValue.makerNoteHuaweiMetadata![imageMetadatakey[i]];
          } else {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
          }

          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testNum} Error processing key ${exifMetadataKey[i]}: ${error}`);
          ret = false;
        } finally {
          await imageSourceApiGet?.release();
        }
      }
      return ret;
    }

    const verifyMetadataProperties2 = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      rulesMap: Map<string, ModifyRule | ModifyRule1>
    ): Promise<boolean> => {
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource(fileName, type);
      const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata(exifMetadataKey);
      const metadataKeys: Array<string> = exifMetadataKey as Array<string>;
      for (let i = 0; i < exifMetadataKey.length; i++) {
        const rule = rulesMap.get(exifMetadataKey[i]);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${exifMetadataKey[i]}`);
          continue;
        }
        try {
          const expectedValue = rule.oldExpectValue;

          let actualValue1: string | null;
          let actualValue2: string | null;
          if (typeMetadata == "exifMetadata" && exifValue.exifMetadata != undefined) {
            let exifRecord1: Record<string, string | null> = await exifValue.exifMetadata!.getProperties(metadataKeys);
            let exifRecord2: Record<string, string | null> = await exifValue.exifMetadata!.getAllProperties();
            actualValue1 = exifRecord1[metadataKeys[i]];
            actualValue2 = exifRecord2[metadataKeys[i]];
          } else if (typeMetadata == "makerNoteHuaweiMetadata" && exifValue.makerNoteHuaweiMetadata != undefined) {
            let exifRecord1: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata!.getProperties(metadataKeys);
            let exifRecord2: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata!.getAllProperties();
            actualValue1 = exifRecord1[metadataKeys[i]];
            actualValue2 = exifRecord2[metadataKeys[i]];
          } else {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
          }

          const verifyValue = (actualValue: string | null): boolean => {
            if (!compareValues(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
              return false;
            }
            return true;
          };

          ret = verifyValue(actualValue1) && ret;
          ret = verifyValue(actualValue2) && ret;
        } catch (error) {
          console.error(`${testNum} Error processing key ${exifMetadataKey[i]}: ${error}`);
          ret = false;
        } finally {
          await imageSourceApiGet?.release();
        }
      }
      return ret;
    }

    const testReadImageMetadata = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      imageMetadatakey: string[]
    ): Promise<boolean> => {
      let ret: boolean = true;
      ret = await testModifyAndVerifyEnhanced(testNum, fileName, type, exifMetadataKey);
      ret = ret && await verifyMetadataProperties(testNum, fileName, type, typeMetadata, exifMetadataKey, imageMetadatakey, exifReadWriteValidationRules);
      return ret;
    }

    const testGetReadOnlyByType = async (
      testNum: string,
      fileName: string,
      type: string,
      exifMetadataKey: string[],
      imageMetadatakey: string[],
      fileType: string,
      typeMetadata: string
    ): Promise<boolean> => {
      let ret: boolean = true;
      for (let i = 0; i < exifMetadataKey.length; i++) {
        const rule = exifReadOnlyValidationRules.get(exifMetadataKey[i]);
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${exifMetadataKey[i]}`);
          continue;
        }
        try {
          const imageSourceApi = await getImageSource(fileName, type);
          try {
            const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
            let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer;
            if (typeMetadata == "exifMetadata" && exifValue.exifMetadata != undefined) {
              actualValue = exifValue.exifMetadata![imageMetadatakey[i]];
            } else if (typeMetadata == "makerNoteHuaweiMetadata" && exifValue.makerNoteHuaweiMetadata != undefined) {
              actualValue = exifValue.makerNoteHuaweiMetadata![imageMetadatakey[i]];
            } else {
              await imageSourceApi?.release();
              console.info(`${testNum} Not meeting the conditions.`);
              return false;
            }

            let expectedValue: string | number | Array<number> | null | undefined | boolean;
            if (fileType == "expectValueJPG") {
              expectedValue = rule.expectValueJPG;
            } else if (fileType == "expectValuePNG") {
              expectedValue = rule.expectValuePNG;
            } else if (fileType == "expectValueHEIC") {
              expectedValue = rule.expectValueHEIC;
            } else if (fileType == "expectValueDNG") {
              expectedValue = rule.expectValueDNG;
            } else {
              expectedValue = rule.expectValueWEBP;
            }
            
            if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${exifMetadataKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
          } finally {
            await imageSourceApi?.release();
          }
        } catch (error) {
          console.error(`${testNum} Error processing key ${exifMetadataKey[i]}: ${error}`);
          ret = false;
        }
      }
      return ret;
    }

    const getMetadataFromPicture = async (
      imageSourceApi: image.ImageSource,
      index?: number | undefined
    ): Promise<image.Metadata> => {
      let picture: image.Picture;
      let metadata: image.Metadata;
      if (index !== undefined) {
        picture = await imageSourceApi.createPictureAtIndex(index);
        metadata = await picture.getMetadata(image.MetadataType.HEIFS_METADATA);
      } else {
        picture = await imageSourceApi.createPicture();
        metadata = await picture.getMetadata(image.MetadataType.EXIF_METADATA);
      }
      if (picture != undefined) {
        await picture?.release();
      }
      return metadata;
    }

    const testWriteImageMetadata = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      imageMetadatakey: string[],
      imageMetadata: image.ImageMetadata
    ): Promise<boolean> => {
      let ret: boolean = true;
      const imageSourceApi = await getImageSource(fileName, type);
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testNum} writeImageMetadata completed, imageMetadata: ${JSON.stringify(imageMetadata)}`);
      } catch (error) {
        console.error(`${testNum} writeImageMetadata error: ${error}`);
        console.info(`${testNum} writeImageMetadata completed, imageMetadata: ${JSON.stringify(imageMetadata)}`);
        ret = false;
        return ret;
      } finally {
        await imageSourceApi?.release();
      }

      ret = await verifyMetadataProperties(testNum, fileName, type, typeMetadata, exifMetadataKey, imageMetadatakey, exifWriteExpectedValueRules);
      return ret;
    }

    const testPackToFile = async (
      testTag: string,
      imageSourceApi: image.ImageSource,
      fdNumber: number,
      packingOption: image.PackingOption
    ) => {
      let imagePacker: image.ImagePacker | undefined = undefined;
      let pixelMap: image.PixelMap | undefined = undefined;
      try {
        imagePacker = image.createImagePacker();
        if (imagePacker == undefined) {
          console.info(testTag + " create image packer failed");
          expect().assertFail();
          return;
        }
        pixelMap = await imageSourceApi.createPixelMap();
        await imagePacker.packToFile(pixelMap, fdNumber, packingOption);
        console.info(testTag + " pack to file completed");
        await imagePacker.release();
      } catch (error) {
        console.info(testTag + " pack to file error: " + error);
        expect().assertFail();
        return;
      }
    }

    const testPackToFileAndWrite = async (
      testNum: string,
      propertyKeys: string[],
      imageMetadata: image.ImageMetadata,
      exifMetadata: image.ExifMetadata,
      compareKeys: string[],
      fileName: string,
      compareFileName: string,
      packingOption: image.PackingOption
    ): Promise<boolean> => {
      let result = true;
      let imageSourceApi: image.ImageSource | undefined = undefined;
      try {
        imageSourceApi = await getImageSource(fileName, "fd");
        await imageSourceApi.writeImageMetadata(imageMetadata);
        if (imageSourceApi != undefined) {
          await imageSourceApi.release();
        }

        let imageSourceApiPack = await getImageSource(fileName, "buffer");
        await getFd(compareFileName);
        await testPackToFile(testNum, imageSourceApiPack, fdNumber, packingOption);
        fs.closeSync(fdNumber);
        if (imageSourceApiPack != undefined) {
          await imageSourceApiPack.release();
        }

        const imageSourceApiVerify = await getImageSource(compareFileName, "fd");
        const exifValue: image.ImageMetadata = await imageSourceApiVerify.readImageMetadata(propertyKeys);
        let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer;
        let expectedValue: string | number | object | number[] | undefined | null | ArrayBuffer;
        compareKeys.forEach((key) => {
          actualValue = exifValue.exifMetadata![key];
          expectedValue = exifMetadata[key];
          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testNum} Verification failed for ArrayBuffer key: ${key}, expectedValue: ${JSON.stringify(expectedValue)}, actualValue ArrayBuffer length: ${actualValue.byteLength}`);
              result = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testNum} Verification failed for key: ${key}, expectedValue: ${JSON.stringify(expectedValue)}, actualValue: ${JSON.stringify(actualValue)}`);
            result = false;
          }
        });
        if (imageSourceApiVerify != undefined) {
          await imageSourceApiVerify.release();
        }
      } catch (error) {
        console.info(testNum + " test failed with error: " + error);
        result = false;
      }
      return result;
    }

    const testGetAndSetBlobArrayBuffer = async (
      testNum: string,
      sourceFileName: string,
      targetFileName: string,
      type: string,
      camelCaseMetadataKeys: Array<string>,
      index?: number | undefined
    ): Promise<boolean> => {
      let result = true;
      const imageSourceApi = await getImageSource(sourceFileName, type);
      let metadata: image.Metadata;
      if (index !== undefined) {
        metadata = await getMetadataFromPicture(imageSourceApi, index);
      } else {
        metadata = await getMetadataFromPicture(imageSourceApi);
      }
      try {
        let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
        console.info(`${testNum} getBlob successfully for exifArrayBuffer: ${exifArrayBuffer}`);

        let exifValue: Record<string, string | null> = await metadata.getProperties(camelCaseMetadataKeys);
        if (exifValue != undefined) {
          camelCaseMetadataKeys.forEach((key) => {
            console.info(`${testNum} getProperties read success for key: ${key}, exifValue: ${exifValue[key]}}`);
          });
        }
        
        const imageSourceApiModify = await getImageSource(targetFileName, type);
        let metadataModify: image.Metadata;
        if (index !== undefined) {
          metadataModify = await getMetadataFromPicture(imageSourceApiModify, index);
        } else {
          metadataModify = await getMetadataFromPicture(imageSourceApiModify);
        }
        try {
          await metadataModify.setBlob(exifArrayBuffer);
          let exifValueGet: Record<string, string | null> = await metadataModify.getProperties(camelCaseMetadataKeys);

          camelCaseMetadataKeys.forEach((camelCaseKey) => {
            if (exifValue && exifValueGet) {
              if (!compareValues(exifValue[camelCaseKey], exifValueGet[camelCaseKey])) {
                console.info(`${testNum} Verification failed for key: ${camelCaseKey}, exifValue: ${exifValue[camelCaseKey]}, exifValueGet: ${exifValueGet[camelCaseKey]}`);
                result = false;
              }
            }
          });
        } catch (error) {
          console.error(`${testNum} Error testGetAndSetBlobArrayBuffer err: ${error}`);
          result = false;
        } finally {
          await imageSourceApiModify?.release();
        }
      } catch (err) {
        console.error(`${testNum} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      return result;
    }

    const testPackToFilePicture = async (
      testTag: string,
      picture: image.Picture,
      fdNumber: number,
      packingOption: image.PackingOption
    ) => {
      let imagePacker: image.ImagePacker | undefined = undefined;
      try {
        imagePacker = image.createImagePacker();
        if (imagePacker == undefined) {
          console.info(testTag + " create image packer failed");
          expect().assertFail();
          return;
        }
        await imagePacker.packToFile(picture, fdNumber, packingOption);
        console.info(testTag + " pack to file completed");
        await imagePacker.release();
      } catch (error) {
        console.info(testTag + " pack to file error: " + error);
        expect().assertFail();
        return;
      }
    }

    const testPackToFileAndModifyArrayBuffer = async (
      testNum: string,
      targetFileName: string,
      compareFileName: string,
      type: string,
      camelCaseMetadataKeys: Array<string>,
      packingOption: image.PackingOption
    ): Promise<boolean> => {
      let result = true;
      const imageSourceApi = await getImageSource("food.jpg", type);
      let metadata = await getMetadataFromPicture(imageSourceApi);
      try {
        let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
        console.info(`${testNum} getBlob successfully for exifArrayBuffer: ${exifArrayBuffer}`);
      
        let exifValue: Record<string, string | null> = await metadata.getProperties(camelCaseMetadataKeys);
        if (exifValue != undefined) {
          camelCaseMetadataKeys.forEach((key) => {
            console.info(`${testNum} getProperties read success for key: ${key}, exifValue: ${exifValue[key]}}`);
          });
        }
        
        const imageSourceApiModify = await getImageSource(targetFileName, type);
        let picture: image.Picture = await imageSourceApiModify.createPicture();
        let metadataModify = await picture.getMetadata(image.MetadataType.EXIF_METADATA);
        try {
          await metadataModify.setBlob(exifArrayBuffer);
          await picture.setMetadata(image.MetadataType.EXIF_METADATA, metadata);
          await getFd(compareFileName);
          await testPackToFilePicture(testNum, picture, fdNumber, packingOption);
          fs.closeSync(fdNumber);

          const imageSourceApiGet = await getImageSource(compareFileName, type);
          let metadataGet = await getMetadataFromPicture(imageSourceApiGet);
          let exifValueGet: Record<string, string | null> = await metadataGet.getProperties(camelCaseMetadataKeys);
          if (imageSourceApiGet != undefined) {
            await imageSourceApiGet.release();
          }

          camelCaseMetadataKeys.forEach((camelCaseKey) => {
            if (exifValue && exifValueGet) {
              if (!compareValues(exifValue[camelCaseKey], exifValueGet[camelCaseKey])) {
                console.info(`${testNum} Verification failed for key: ${camelCaseKey}, exifValue: ${exifValue[camelCaseKey]}, exifValueGet: ${exifValueGet[camelCaseKey]}`);
                result = false;
              }
            }
          });
        } catch (error) {
          console.error(`${testNum} Error setBlob err: ${error}`);
          result = false;
        } finally {
          await imageSourceApiModify?.release();
          await picture?.release();
        }
      } catch (err) {
        console.error(`${testNum} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      return result;
    }

    const getMetadataObject = (
      typeMetadata: string,
      imageMetadata: image.ImageMetadata
    ) => {
      if (typeMetadata == "exifMetadata") return imageMetadata.exifMetadata;
      if (typeMetadata == "makerNoteHuaweiMetadata") return imageMetadata.makerNoteHuaweiMetadata;
      if (typeMetadata == "heifsMetadata") return imageMetadata.heifsMetadata;
      return undefined;
    };

    const testExifMetadataGetAndSetBlob = async (
      testNum: string,
      sourceFileName: string,
      targetFileName: string,
      type: string,
      typeMetadata: string,
      camelCaseMetadataKeys: Array<string>
    ): Promise<boolean> => {
      let result = true;
      const imageSourceApi = await getImageSource(sourceFileName, type);
      try {
        const exifValue = await imageSourceApi.readImageMetadata(camelCaseMetadataKeys, 0);
        const sourceMetadata = getMetadataObject(typeMetadata, exifValue);
        const sourceMetadataKeys = await sourceMetadata?.getProperties(camelCaseMetadataKeys);
        console.info(`${testNum} getMetadataObject successfully for sourceMetadata : ${JSON.stringify(sourceMetadataKeys)}` );

        if (!sourceMetadata) {
          console.info(`${testNum} Source metadata not found.`);
          return false;
        }
        const actualBlob: ArrayBuffer = await sourceMetadata.getBlob();
        console.info(`${testNum} getBlob successfully for exifArrayBuffer: ${actualBlob != undefined}`);

        const imageSourceApiModify = await getImageSource(targetFileName, type);
        try {
          
          const exifValueGet = await imageSourceApiModify.readImageMetadata(camelCaseMetadataKeys, 0);
          let targetMetadata = getMetadataObject(typeMetadata, exifValueGet);
          if (!targetMetadata) {
            console.info(`${testNum} Target metadata not found.`);
            return false;
          }
          await targetMetadata.setBlob(actualBlob);

          let getMetadata = await targetMetadata?.getProperties(camelCaseMetadataKeys);
          camelCaseMetadataKeys.forEach((key) => {
            const actualValue: string | number | object | number[] | undefined | null | ArrayBuffer = sourceMetadataKeys![key];
            const verifyValue: string | number | object | number[] | undefined | null | ArrayBuffer = getMetadata![key];
            if (!compareValues(actualValue, verifyValue)) {
              console.info(`${testNum} Verification failed for key: ${key}, verifyValue: ${JSON.stringify(verifyValue)}, actualValue: ${JSON.stringify(actualValue)}`);
              result = false;
            }
          });
        } catch (error) {
          console.error(`${testNum} Error setBlob: ${error}`);
          result = false;
        } finally {
          await imageSourceApiModify?.release();
        }
      } catch (err) {
        console.error(`${testNum} Error processing: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      return result;
    }

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0100
     * @tc.desc        Verify batch modify and read EXIF metadata properties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Batch modify writable EXIF properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0100"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0200
     * @tc.desc        Verify batch modify and read EXIF metadata properties for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Batch modify writable EXIF properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0200"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0300
     * @tc.desc        Verify batch modify and read EXIF metadata properties for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Batch modify writable EXIF properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0300"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0400
     * @tc.desc        Verify batch modify and read EXIF metadata properties for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Batch modify writable EXIF properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0400"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0500
     * @tc.desc        Verify batch read EXIF metadata using getProperties and getAllProperties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify getProperties and getAllProperties return consistent values
     *                 4.Compare retrieved properties with expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0500";
      let result = await verifyMetadataProperties2(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, exifReadWriteValidationRules);
      console.info(`${testTag} verifyMetadataProperties2 result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0600
     * @tc.desc        Verify batch read EXIF metadata using getProperties and getAllProperties for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify getProperties and getAllProperties return consistent values
     *                 4.Compare retrieved properties with expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0600";
      let result = await verifyMetadataProperties2(testTag, "test_exif_readWrite_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, exifReadWriteValidationRules);
      console.info(`${testTag} verifyMetadataProperties2 result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0700
     * @tc.desc        Verify batch read EXIF metadata using getProperties and getAllProperties for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify getProperties and getAllProperties return consistent values
     *                 4.Compare retrieved properties with expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0700";
      let result = await verifyMetadataProperties2(testTag, "test_exif_readWrite_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, exifReadWriteValidationRules);
      console.info(`${testTag} verifyMetadataProperties2 result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0800
     * @tc.desc        Verify batch read EXIF metadata using getProperties and getAllProperties for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify getProperties and getAllProperties return consistent values
     *                 4.Compare retrieved properties with expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0800";
      let result = await verifyMetadataProperties2(testTag, "test_exif_readWrite_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, exifReadWriteValidationRules);
      console.info(`${testTag} verifyMetadataProperties2 result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0900
     * @tc.desc        Verify read EXIF metadata without specifying property keys for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read all EXIF metadata using readImageMetadata without property keys
     *                 3.Verify all EXIF properties are retrieved correctly
     *                 4.Compare retrieved properties with expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_0900";
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      ret = await testModifyAndVerifyEnhanced(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", readAndWriteExifMetadata);
      const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata();
      for (let i = 0; i < readAndWriteExifMetadata.length; i++) {
        const rule = exifReadWriteValidationRules.get(readAndWriteExifMetadata[i]);
        if (!rule) {
          console.info(`${testTag} No rule found for key: ${readAndWriteExifMetadata[i]}`);
          continue;
        }
        try {
          let expectedValue = rule.newExpectValue;
          let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer;
          if (exifValue.exifMetadata != undefined) {
            actualValue = exifValue.exifMetadata![imageExifMetadatakey[i]];
          }

          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for ArrayBuffer key: ${imageExifMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${imageExifMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${imageExifMetadatakey[i]}: ${error}`);
          ret = false;
        } finally {
          await imageSourceApiGet?.release();
        }
      }
      console.info(`${testTag} testReadImageMetadata result is: ${ret}`);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_1000
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index parameter for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with property keys and invalid index 3
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid index parameter
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_1000", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_PROMISE_1000";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, 3);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0100
     * @tc.desc        Verify read read-only EXIF metadata properties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read read-only EXIF properties (JPEGInterchangeFormat, JPEGInterchangeFormatLength)
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0100";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["JPEGInterchangeFormat", "JPEGInterchangeFormatLength"];
      let imageMetadatakey: string[] = ["jpegInterchangeFormat", "jpegInterchangeFormatLength"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.jpegInterchangeFormat = 2798;
      exifMetadata1.jpegInterchangeFormatLength = 4;
      result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_jpg_v2.jpg", "fd", exifMetadataKey, imageMetadatakey, "expectValueJPG", "exifMetadata");
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0200
     * @tc.desc        Verify read read-only EXIF metadata properties for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Read read-only EXIF properties (JPEGInterchangeFormat, JPEGInterchangeFormatLength)
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0200";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["JPEGInterchangeFormat", "JPEGInterchangeFormatLength"];
      let imageMetadatakey: string[] = ["jpegInterchangeFormat", "jpegInterchangeFormatLength"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.jpegInterchangeFormat = 2798;
      exifMetadata1.jpegInterchangeFormatLength = 4;
      result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_png_v2.png", "fd", exifMetadataKey, imageMetadatakey, "expectValuePNG", "exifMetadata");
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0300
     * @tc.desc        Verify read read-only EXIF metadata properties for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Read read-only EXIF properties (JPEGInterchangeFormat, JPEGInterchangeFormatLength)
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0300";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["JPEGInterchangeFormat", "JPEGInterchangeFormatLength"];
      let imageMetadatakey: string[] = ["jpegInterchangeFormat", "jpegInterchangeFormatLength"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.jpegInterchangeFormat = 2798;
      exifMetadata1.jpegInterchangeFormatLength = 4;
      result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_heic_v2.heic", "fd", exifMetadataKey, imageMetadatakey, "expectValueJPG", "exifMetadata");
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0400
     * @tc.desc        Verify read EXIF metadata error handling for unsupported WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Attempt to read read-only EXIF properties for WEBP format
     *                 3.Verify API throws READ_FAILED error for unsupported operation
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_EXIFMETADATA_PROMISE_0400";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["JPEGInterchangeFormat", "JPEGInterchangeFormatLength"];

      const imageSourceApi = await getImageSource("test_exif_readOnly_webp_v2.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        console.info(`${testTag} readImageMetadata successfully for key: ${exifMetadataKey}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0100
     * @tc.desc        Verify batch modify and read MakerNote metadata properties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Batch modify writable MakerNote properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0100"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMakerNoteHwMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0200
     * @tc.desc        Verify batch modify and read MakerNote metadata properties for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Batch modify writable MakerNote properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0200"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_png_v2.png", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMakerNoteHwMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0300
     * @tc.desc        Verify batch modify and read MakerNote metadata properties for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Batch modify writable MakerNote properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0300"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_heic_v2.heic", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMakerNoteHwMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0400
     * @tc.desc        Verify batch modify and read MakerNote metadata properties for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Batch modify writable MakerNote properties using modifyImageProperties API
     *                 3.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_PROMISE_0400"
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_webp_v2.webp", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMakerNoteHwMetadatakey);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0100
     * @tc.desc        Verify read read-only MakerNote metadata properties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read read-only MakerNote properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0100"
      let result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_jpg_v2.jpg", "fd", readOnlyMakerNoteHwMetadata, imageOnlyMakerNoteHwMetadata, "expectValueJPG", "makerNoteHuaweiMetadata");
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0200
     * @tc.desc        Verify read read-only MakerNote metadata properties for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Read read-only MakerNote properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0200"
      let result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_png_v2.png", "fd", readOnlyMakerNoteHwMetadata, imageOnlyMakerNoteHwMetadata, "expectValuePNG", "makerNoteHuaweiMetadata");
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0300
     * @tc.desc        Verify read read-only MakerNote metadata properties for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Read read-only MakerNote properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0300"
      let result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_heic_v2.heic", "fd", readOnlyMakerNoteHwMetadata, imageOnlyMakerNoteHwMetadata, "expectValueHEIC", "makerNoteHuaweiMetadata");
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0400
     * @tc.desc        Verify read read-only MakerNote metadata properties for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Read read-only MakerNote properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0400"
      let result = await testGetReadOnlyByType(testTag, "test_exif_readOnly_webp_v2.webp", "fd", readOnlyMakerNoteHwMetadata, imageOnlyMakerNoteHwMetadata, "expectValueWEBP", "makerNoteHuaweiMetadata");
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0500
     * @tc.desc        Verify read read-only MakerNote metadata properties for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read read-only MakerNote properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_ONLY_HWMETADATA_PROMISE_0500"
      let result: boolean = true;
      let imageFaceKey: string[] = ["faceConfidences", "faceSmileScores"];
      let readFaceKey: string[] = ["HwMnoteFaceConf", "HwMnoteFaceSmileScore"];
      let exifMetadata1 = image.MakerNoteHuaweiMetadata.createInstance();
      exifMetadata1.faceConfidences = [100, 100, 100, 100];
      exifMetadata1.faceSmileScores = [0, 18, 69, 0];

      let imageSourceApi = await getImageSource("1206_1.jpg", "fd");
      try {
        let exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readFaceKey);
        console.info(`${testTag} readImageMetadata successfully exifValue is: ${exifValue}`);

        let expectedValue: number | undefined | number[];
        if (exifValue.makerNoteHuaweiMetadata != undefined) {
          let actualValue: number | undefined | number[];
          for (let i = 0; i < readFaceKey.length; i++) {
            actualValue = exifValue.makerNoteHuaweiMetadata![imageFaceKey[i]];
            expectedValue = exifMetadata1[imageFaceKey[i]];
            if (!compareValues(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for key: ${readFaceKey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
              result = false;
            }
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing : ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata successfully result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0100
     * @tc.desc        Verify read EXIF metadata from JPEG file with partial metadata
     *                 1.Create image source from JPEG file with partial EXIF data using fd
     *                 2.Read EXIF properties using readImageMetadata API
     *                 3.Verify API returns default/undefined values for missing properties
     *                 4.Verify existing properties are read correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0100"
      let result = true;
      let propertyKeys: string[] = ["NewSubfileType", "ImageWidth", "ImageLength", "BitsPerSample", "ImageDescription", "Make"];
      let imageMetadatakey: string[] = ["newSubfileType", "imageWidth", "imageLength", "bitsPerSample", "imageDescription", "make"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.newSubfileType = undefined;
      exifMetadata1.imageWidth = 4096;
      exifMetadata1.imageLength = 3072;
      exifMetadata1.bitsPerSample = [8,8,8];
      exifMetadata1.imageDescription = "_cuva";
      exifMetadata1.make = "unknown";
      
      let imageSourceApi = await getImageSource("test_exif_empty_jpg_v1.jpg", "fd");
      try {
        let exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        let expectedValue: number | undefined | string | number[];
        if (exifValue.exifMetadata != undefined) {
          let actualValue: number | undefined | string | number[];
          for (let i = 0; i < imageMetadatakey.length; i++) {
            actualValue = exifValue.exifMetadata![imageMetadatakey[i]];
            expectedValue = exifMetadata1[imageMetadatakey[i]];
            if (!compareValues(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for key: ${imageMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
              result = false;
            }
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing : ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata successfully result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0200
     * @tc.desc        Verify read EXIF metadata error handling for JPEG file without metadata
     *                 1.Create image source from JPEG file with no EXIF metadata using fd
     *                 2.Attempt to read EXIF properties using readImageMetadata API
     *                 3.Verify API throws READ_FAILED error when EXIF data is missing
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0200"
      let result = false;
      let propertyKeys: string[] = ["ImageWidth", "ImageLength"];
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        console.info(`${testTag} Read successfully for key: ${propertyKeys}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0300
     * @tc.desc        Verify read EXIF metadata error handling for released image source
     *                 1.Create image source from JPEG file using fd
     *                 2.Release the image source to invalidate the object
     *                 3.Attempt to read EXIF metadata from released image source
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid operation
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0300"
      let result = false;
      let propertyKeys: string[] = ["ImageWidth", "ImageLength"];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        await imageSourceApi.release();
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        console.info(`${testTag} Read successfully for key: ${propertyKeys}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      }
      console.info(`${testTag} readImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0400
     * @tc.desc        Verify read EXIF metadata error handling for unsupported image format
     *                 1.Create image source from unsupported image format (ICO file) using fd
     *                 2.Attempt to read EXIF properties using readImageMetadata API
     *                 3.Verify API throws UNSUPPORTED_IMAGE_FORMATS error for ICO format
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_ERROR_0400"
      let result = false;
      let propertyKeys: string[] = ["ImageWidth", "ImageLength"];
      const imageSourceApi = await getImageSource("test.ico", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        console.info(`${testTag} Read successfully for key: ${propertyKeys}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0100
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0100";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    }); 

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0200
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0200";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0300
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0300";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0400
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0400";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0500
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for empty JPEG file
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0500";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0600
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for empty PNG file
     *                 1.Create image source from empty PNG file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0600";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0700
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for empty HEIC file
     *                 1.Create image source from empty HEIC file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0700";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0800
     * @tc.desc        Verify batch write EXIF metadata using writeImageMetadata for empty WEBP file
     *                 1.Create image source from empty WEBP file using fd
     *                 2.Write EXIF metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0800";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, imageExifMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0900
     * @tc.desc        Verify read written EXIF metadata using getProperties and getAllProperties
     *                 1.Create image source from modified JPEG file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify getProperties and getAllProperties return consistent values
     *                 4.Compare retrieved properties with expected written values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_0900";
      let result = await verifyMetadataProperties2(testTag, "test_exif_modify_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, exifWriteExpectedValueRules);
      console.info(`${testTag} verifyMetadataProperties2 result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_1000
     * @tc.desc        Verify write empty metadata clears existing EXIF data
     *                 1.Create image source from JPEG file using fd
     *                 2.Write empty ImageMetadata object using writeImageMetadata API
     *                 3.Attempt to read metadata from cleared file
     *                 4.Verify API throws READ_FAILED error when metadata is cleared
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_1000", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_1000"
      const imageSourceApi = await getImageSource("test_exif_modify_jpg_v2.jpg", "fd");
      let result = false;
      let propertyKeys: string[] = ["ImageLength"];
      const imageMetadata: image.ImageMetadata = {};
      await imageSourceApi.writeImageMetadata(imageMetadata);
      console.info(`${testTag} writeImageMetadata successfully`);
      let imageSourceApiGet = await getImageSource("test_exif_modify_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata(propertyKeys);
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        console.error(`${testTag} Error processing : ${err}`);
      } finally {
        await imageSourceApi?.release();
        await imageSourceApiGet?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_HWMETADATA_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_HWMETADATA_1100
     * @tc.desc        Verify batch write MakerNote metadata using writeImageMetadata
     *                 1.Create image source from JPEG file using fd
     *                 2.Write MakerNote metadata using writeImageMetadata API
     *                 3.Read back metadata using readImageMetadata
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_HWMETADATA_1100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATA_HWMETADATA_1100"
      const imageMetadata: image.ImageMetadata = {
        makerNoteHuaweiMetadata: testHuaweiMakerNoteMetadata
      };
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_jpg_v2.jpg", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMakerNoteHwMetadatakey, imageMetadata);
      console.info(`${testTag} testWriteImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    }); 

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0100
     * @tc.desc        Verify write EXIF metadata error handling for read-only properties
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Attempt to write read-only properties (JPEGInterchangeFormat/Length) and MakerNote
     *                 3.Verify API throws READ_FAILED error when writing restricted properties
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0100"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.jpegInterchangeFormat = 1;
      exifMetadata1.jpegInterchangeFormatLength = 1;
      let exifMetadata2 = image.MakerNoteHuaweiMetadata.createInstance();
      exifMetadata2.sceneVersion = 2;
      exifMetadata2.sceneFoodConfidence = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1,
        makerNoteHuaweiMetadata: exifMetadata2
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0200
     * @tc.desc        Verify write EXIF metadata error handling for invalid property value
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Attempt to write invalid ImageWidth value (-100)
     *                 3.Verify API throws READ_FAILED error for invalid data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0200"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = -100;

      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0300
     * @tc.desc        Verify write EXIF metadata error handling for released image source
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Release the image source
     *                 3.Attempt to write EXIF metadata to released source
     *                 4.Verify API throws error for invalid operation
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0300"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let propertyKeys: string[] = ["ImageLength"];
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.bitsPerSample = [-65535,65535,65535];
      exifMetadata1.imageLength = 200;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        const imageSourceApiGet = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        let ret = false;
        if (exifValue.exifMetadata != undefined) {
          let actualValue: number | undefined = exifValue.exifMetadata!.imageLength;
          ret = actualValue == exifMetadata1.imageLength;
          console.info(`${testTag} readImageMetadata successfully for actualValue: ${actualValue}`);
        }
        result = ret && handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        await imageSourceApiGet?.release();
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0400
     * @tc.desc        Verify write metadata partial success with mixed valid and read-only properties
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Attempt to write mixed properties (valid ImageLength + read-only JPEGInterchangeFormat)
     *                 3.Verify valid property is written despite error
     *                 4.Verify API throws READ_FAILED error for read-only property
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0400"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let propertyKeys: string[] = ["ImageLength"];
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.jpegInterchangeFormat = 1;
      exifMetadata1.imageLength = 300;

      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };

      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        const imageSourceApiGet = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        let ret = false;
        if (exifValue.exifMetadata != undefined) {
          let actualValue: number | undefined = exifValue.exifMetadata!.imageLength;
          ret = actualValue == exifMetadata1.imageLength;
          console.info(`${testTag} readImageMetadata successfully for actualValue: ${actualValue}`);
        }
        result = ret && handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        await imageSourceApiGet?.release();
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0500
     * @tc.desc        Verify write metadata partial success with mixed valid and invalid values
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Attempt to write mixed values (invalid ImageWidth -100 + valid ImageLength)
     *                 3.Verify valid property is written despite error
     *                 4.Verify API throws READ_FAILED error for invalid value
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0500"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let propertyKeys: string[] = ["ImageLength"];
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = -100;
      exifMetadata1.imageLength = 400;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };

      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        const imageSourceApiGet = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        let ret = false;
        if (exifValue.exifMetadata != undefined) {
          let actualValue: number | undefined = exifValue.exifMetadata!.imageLength; 
          ret = actualValue == exifMetadata1.imageLength;
          console.info(`${testTag} readImageMetadata successfully for actualValue: ${actualValue}`);
        }
        result = ret && handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        await imageSourceApiGet?.release();
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0600
     * @tc.desc        Verify write EXIF metadata error handling for released image source
     *                 1.Create image source from empty JPEG file using fd
     *                 2.Release the image source
     *                 3.Attempt to write EXIF metadata to released source
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid operation
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0600"
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v2.jpg", "fd");
      let result = false;
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 100;
      exifMetadata1.imageLength = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      try {
        await imageSourceApi.release();
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0700
     * @tc.desc        Verify write EXIF metadata error handling for unsupported image format
     *                 1.Create image source from unsupported image format (ICO file) using fd
     *                 2.Attempt to write EXIF metadata to ICO format
     *                 3.Verify API throws UNSUPPORTED_IMAGE_FORMATS error
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0700"
      const imageSourceApi = await getImageSource("test.ico", "fd");
      let result = false;
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 100;
      exifMetadata1.imageLength = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully for imageMetadata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0800
     * @tc.desc        Verify write EXIF metadata error handling for rawfile image source
     *                 1.Create image source from JPEG rawfile resource
     *                 2.Attempt to write EXIF metadata to rawfile (read-only resource)
     *                 3.Verify API throws UNSUPPORTED_IMAGE_FORMATS error
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WEITEIMAGEMETADATA_ERROR_0800"
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "rawfile");
      let result = false;
      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 100;
      exifMetadata1.imageLength = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata successfully rawfile`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_PACKTOFILE_WRITEIMAGEMETADATA_PERSIST_0100
     * @tc.name        SUB_MULTIMEDIA_PACKTOFILE_WRITEIMAGEMETADATA_PERSIST_0100
     * @tc.desc        Verify EXIF metadata persistence after writeImageMetadata and packToFile for JPEG
     *                 1.Write EXIF metadata using writeImageMetadata API
     *                 2.Pack to JPEG file with needsPackProperties=true
     *                 3.Read back metadata from packed file
     *                 4.Verify properties persist correctly in packed file
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_PACKTOFILE_WRITEIMAGEMETADATA_PERSIST_0100', Level.LEVEL0, async (done:() => void)=>{
      const testTag = 'SUB_MULTIMEDIA_PACKTOFILE_WRITEIMAGEMETADATA_PERSIST_0100'
      let result = false;
      const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
      const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
      const propertyKeys: string[] = ["ImageWidth", "BitsPerSample", "ImageDescription", "OECF"];
      const compareKeys: string[] = ["imageWidth", "bitsPerSample", "imageDescription", "oecf"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 111;
      exifMetadata1.bitsPerSample = [111,111,111];
      exifMetadata1.imageDescription = "packToFile jpeg";
      exifMetadata1.oecf = testExifArrayBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      
      let packingOption: image.PackingOption = {
        format: "image/jpeg",
        quality: 99,
        needsPackProperties: true
      };
      result = await testPackToFileAndWrite(testTag, propertyKeys, imageMetadata, exifMetadata1, compareKeys,
        `test_packtofile_modify_empty_jpg_v2.jpg`, `test_exif_jpeg_v2.jpeg`, packingOption);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0200
     * @tc.name        SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0200
     * @tc.desc        Verify EXIF metadata persistence after writeImageMetadata and packToFile for PNG
     *                 1.Write EXIF metadata using writeImageMetadata API
     *                 2.Pack to PNG file with needsPackProperties=true
     *                 3.Read back metadata from packed file
     *                 4.Verify properties persist correctly in packed file
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0200', Level.LEVEL0, async (done:() => void)=>{
      const testTag = 'SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0200';
      let result = false;
      const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
      const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
      const propertyKeys: string[] = ["ImageWidth", "BitsPerSample", "ImageDescription", "OECF"];
      const compareKeys: string[] = ["imageWidth", "bitsPerSample", "imageDescription", "oecf"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 222;
      exifMetadata1.bitsPerSample = [222,222,222];
      exifMetadata1.imageDescription = "packToFile png";
      exifMetadata1.oecf = testExifArrayBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      
      let packingOption: image.PackingOption = {
        format: "image/png",
        quality: 99,
        needsPackProperties: true
      };
      result = await testPackToFileAndWrite(testTag, propertyKeys, imageMetadata, exifMetadata1, compareKeys,
        `test_packtofile_modify_empty_png_v2.png`, `test_exif_png_v2.png`, packingOption);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0300
     * @tc.name        SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0300
     * @tc.desc        Verify EXIF metadata persistence after writeImageMetadata and packToFile for HEIC
     *                 1.Write EXIF metadata using writeImageMetadata API
     *                 2.Pack to HEIC file with needsPackProperties=true
     *                 3.Read back metadata from packed file
     *                 4.Verify properties persist correctly in packed file
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0300', Level.LEVEL0, async (done:() => void)=>{
      const testTag = 'SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0300';
      let result = false;
      const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
      const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
      const propertyKeys: string[] = ["ImageWidth", "BitsPerSample", "ImageDescription", "OECF"];
      const compareKeys: string[] = ["imageWidth", "bitsPerSample", "imageDescription", "oecf"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 333;
      exifMetadata1.bitsPerSample = [333,333,333];
      exifMetadata1.imageDescription = "packToFile heic";
      exifMetadata1.oecf = testExifArrayBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      
      let packingOption: image.PackingOption = {
        format: "image/heic",
        quality: 99,
        needsPackProperties: true
      };

      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        result = await testPackToFileAndWrite(testTag, propertyKeys, imageMetadata, exifMetadata1, compareKeys,
          `test_packtofile_modify_empty_heic_v2.heic`, `test_exif_heic_v2.heic`, packingOption);
        expect(result).assertTrue();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0400
     * @tc.name        SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0400
     * @tc.desc        Verify EXIF metadata persistence after writeImageMetadata and packToFile for WEBP
     *                 1.Write EXIF metadata using writeImageMetadata API
     *                 2.Pack to WEBP file with needsPackProperties=true
     *                 3.Read back metadata from packed file
     *                 4.Verify properties persist correctly in packed file
     * @tc.size        MediumTest
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0400', Level.LEVEL0, async (done:() => void)=>{
      const testTag = 'SUB_MULTIMEDIA_PACKTOFILE_MODIFYIMAGEPROPERTIESBYTYPE_PERSIST_0400';
      let result = false;
      const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
      const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
      const propertyKeys: string[] = ["ImageWidth", "BitsPerSample", "ImageDescription", "OECF"];
      const compareKeys: string[] = ["imageWidth", "bitsPerSample", "imageDescription", "oecf"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.imageWidth = 444;
      exifMetadata1.bitsPerSample = [444,444,444];
      exifMetadata1.imageDescription = "packToFile webp";
      exifMetadata1.oecf = testExifArrayBuffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: exifMetadata1
      };
      
      let packingOption: image.PackingOption = {
        format: "image/webp",
        quality: 99,
        needsPackProperties: true
      };
      result = await testPackToFileAndWrite(testTag, propertyKeys, imageMetadata, exifMetadata1, compareKeys,
        `test_packtofile_modify_empty_webp_v2.webp`, `test_exif_webp_v2.webp`, packingOption);
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0100
     * @tc.desc        Verify EXIF metadata setProperties and getProperties for standard metadata
     *                 1.Read EXIF metadata using readImageMetadata
     *                 2.Get property value using getProperties
     *                 3.Modify property value using setProperties
     *                 4.Verify modified value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0100";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["ImageWidth"];
      let expectedValue: Record<string, string | null> = {"ImageWidth": "321"}
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        if (exifValue.exifMetadata != undefined) {
          let actualValue1: Record<string, string | null> = await exifValue.exifMetadata!.getProperties(["ImageWidth"]);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1["ImageWidth"]}`);

          await exifValue.exifMetadata!.setProperties(expectedValue);
          let actualValue2: Record<string, string | null> = await exifValue.exifMetadata!.getProperties(["ImageWidth"]);
          result = actualValue2["ImageWidth"] == expectedValue["ImageWidth"];
        }
      } catch (error) {
        console.error(`${testTag} Error setMetadata err: ${error}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata setMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0200
     * @tc.desc        Verify MakerNote metadata setProperties and getProperties
     *                 1.Read MakerNote metadata using readImageMetadata
     *                 2.Get property value using getProperties
     *                 3.Modify property value using setProperties
     *                 4.Verify modified value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_SETPROPERTIES_PROMISE_0200";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["HwMnoteXmageMode"];
      let expectedValue: Record<string, string | null> = {"HwMnoteXmageMode": "333"}
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        if (exifValue.makerNoteHuaweiMetadata != undefined) {
          let actualValue1: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1["HwMnoteXmageMode"]}`);

          await exifValue.makerNoteHuaweiMetadata!.setProperties(expectedValue);
          let actualValue2: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata!.getProperties(exifMetadataKey);
          result = actualValue2["HwMnoteXmageMode"] == expectedValue["HwMnoteXmageMode"];
        }
      } catch (error) {
        console.error(`${testTag} Error setMetadata err: ${error}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata setMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0100
     * @tc.desc        Verify EXIF metadata clone functionality
     *                 1.Read EXIF metadata using readImageMetadata
     *                 2.Clone metadata object using clone API
     *                 3.Get properties from both original and cloned objects
     *                 4.Verify cloned properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0100";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["ImageWidth", "ImageLength", "BitsPerSample", "XResolution"];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue1: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        if (exifValue1.exifMetadata != undefined) {
          let actualValue1: Record<string, string | null> = await exifValue1.exifMetadata!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1}`);

          let exifValue2: image.ExifMetadata = await exifValue1.exifMetadata!.clone();

          let actualValue2: Record<string, string | null> = await exifValue2!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue2}`);

          for (const key of exifMetadataKey) {
            if (actualValue1![key] !== actualValue2![key]) {
              result = false;
              console.info(`${testTag} readImageMetadata clone key: ${key}. actualValue1: ${actualValue1}. actualValue2: ${actualValue2}`);
            }
          }
        }
      } catch (error) {
        console.error(`${testTag} Error clone err: ${error}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata clone result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0200
     * @tc.desc        Verify MakerNote metadata clone functionality
     *                 1.Read MakerNote metadata using readImageMetadata
     *                 2.Clone metadata object using clone API
     *                 3.Get properties from both original and cloned objects
     *                 4.Verify cloned properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_PROMISE_0200";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["HwMnoteXmageMode", "HwMnoteXmageLeft", "HwMnoteXmageTop", "HwMnoteXmageRight"];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue1: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        if (exifValue1.makerNoteHuaweiMetadata != undefined) {
          let actualValue1: Record<string, string | null> = await exifValue1.makerNoteHuaweiMetadata!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1}`);

          let exifValue2: image.MakerNoteHuaweiMetadata = await exifValue1.makerNoteHuaweiMetadata!.clone();

          let actualValue2: Record<string, string | null> = await exifValue2!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue2}`);

          for (const key of exifMetadataKey) {
            if (actualValue1![key] !== actualValue2![key]) {
              result = false;
              console.info(`${testTag} readImageMetadata clone key: ${key}. actualValue1: ${actualValue1}. actualValue2: ${actualValue2}`);
            }
          }
        }
      } catch (error) {
        console.error(`${testTag} Error clone err: ${error}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata clone result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0100
     * @tc.desc        Verify read EXIF metadata properties for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read EXIF metadata using readImageMetadata API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0100";
      let result = await verifyMetadataProperties(testTag, "test.dng", "fd", "exifMetadata", readAndWriteExifMetadata,
        imageExifMetadatakey, DNGExifReadWriteValidationRules);
      console.info(`${testTag} testReadImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0200
     * @tc.desc        Verify read EXIF metadata without specifying property keys for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read all EXIF metadata using readImageMetadata without property keys
     *                 3.Verify all EXIF properties are retrieved correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_DNG_0200";
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource("test.dng", "fd");
      const exifValue: image.ImageMetadata = await imageSourceApiGet.readImageMetadata();
      for (let i = 0; i < readAndWriteExifMetadata.length; i++) {
        const rule = DNGExifReadWriteValidationRules.get(readAndWriteExifMetadata[i]);
        if (!rule) {
          console.info(`${testTag} No rule found for key: ${readAndWriteExifMetadata[i]}`);
          continue;
        }
        try {
          let expectedValue = rule.newExpectValue;
          let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer;
          if (exifValue.exifMetadata != undefined) {
            actualValue = exifValue.exifMetadata![imageExifMetadatakey[i]];
          }

          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for ArrayBuffer key: ${imageExifMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${imageExifMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${imageExifMetadatakey[i]}: ${error}`);
          ret = false;
        } finally {
          await imageSourceApiGet?.release();
        }
      }
      console.info(`${testTag} testReadImageMetadata result is: ${ret}`);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_DNG_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_DNG_0100
     * @tc.desc        Verify EXIF metadata clone functionality for DNG file
     *                 1.Read EXIF metadata from DNG file using readImageMetadata
     *                 2.Clone metadata object using clone API
     *                 3.Verify cloned properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_DNG_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_CLONE_DNG_0100";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["NewSubfileType", "ImageWidth", "ImageLength", "ImageDescription"];
      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue1: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        if (exifValue1.exifMetadata != undefined) {
          let actualValue1: Record<string, string | null> = await exifValue1.exifMetadata!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1}`);

          let exifValue2: image.ExifMetadata = await exifValue1.exifMetadata!.clone();

          let actualValue2: Record<string, string | null> = await exifValue2!.getProperties(exifMetadataKey);
          console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue2}`);

          for (const key of exifMetadataKey) {
            if (actualValue1![key] !== actualValue2![key]) {
              result = false;
              console.info(`${testTag} readImageMetadata clone key: ${key}. actualValue1: ${actualValue1}. actualValue2: ${actualValue2}`);
            }
          }
        }
      } catch (error) {
        console.error(`${testTag} Error clone err: ${error}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata clone result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_DNG_ERROR_0100
     * @tc.desc        Verify read EXIF metadata from DNG file with partial metadata
     *                 1.Create image source from DNG file with partial EXIF data using fd
     *                 2.Read EXIF properties using readImageMetadata API
     *                 3.Verify existing properties are read correctly and missing properties return default values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_DNG_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PROMISE_DNG_ERROR_0100"
      let result = true;
      let propertyKeys: string[] = ["NewSubfileType", "ImageWidth", "ImageLength", "ImageDescription", "Make"];
      let imageMetadatakey: string[] = ["newSubfileType", "imageWidth", "imageLength", "imageDescription", "make"];

      let exifMetadata1 = image.ExifMetadata.createInstance();
      exifMetadata1.newSubfileType = 0;
      exifMetadata1.imageWidth = 5984;
      exifMetadata1.imageLength = 4000;
      exifMetadata1.imageDescription = undefined;
      exifMetadata1.make = "Leica Camera AG";
      
      let imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        let exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys);
        let expectedValue: number | undefined | string | number[];
        if (exifValue.exifMetadata != undefined) {
          let actualValue: number | undefined | string | number[];
          for (let i = 0; i < imageMetadatakey.length; i++) {
            actualValue = exifValue.exifMetadata![imageMetadatakey[i]];
            expectedValue = exifMetadata1[imageMetadatakey[i]];
            if (!compareValues(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for key: ${imageMetadatakey[i]}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
              result = false;
            }
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing : ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_DNG_ERROR_0100
     * @tc.desc        Verify read MakerNote metadata properties for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read MakerNote metadata using readImageMetadata API
     *                 3.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_DNG_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_DNG_ERROR_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteMakerNoteHwMetadata);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteMakerNoteHwMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ONLY_DNG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ONLY_DNG_ERROR_0100
     * @tc.desc        Verify read read-only EXIF metadata properties for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read read-only EXIF properties (JPEGInterchangeFormat, JPEGInterchangeFormatLength)
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ONLY_DNG_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ONLY_DNG_ERROR_0100";
      let result: boolean = true;
      let exifMetadataKey: string[] = ["JPEGInterchangeFormat", "JPEGInterchangeFormatLength"];

      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(exifMetadataKey);
        console.info(`${testTag} readImageMetadata successfully for key: ${exifMetadataKey}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_ONLY_DNG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_ONLY_DNG_ERROR_0200
     * @tc.desc        Verify read read-only MakerNote metadata properties for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Read read-only MakerNote metadata properties
     *                 3.Verify retrieved values match expected read-only values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_ONLY_DNG_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_MAKERNOTEHUWEIMETADATA_ONLY_DNG_ERROR_0200";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readOnlyMakerNoteHwMetadata);
        console.info(`${testTag} readImageMetadata successfully for key: ${readOnlyMakerNoteHwMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTYSYNC_PROMISE_DNG_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTYSYNC_PROMISE_DNG_0100
     * @tc.desc   Verify synchronous read of ImageLength property for DNG file
     *            1.Create image source from DNG file using fd
     *            2.Read ImageLength property using getImagePropertySync API
     *            3.Verify returned value matches expected result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTYSYNC_PROMISE_DNG_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTYSYNC_PROMISE_DNG_0100'
      const key = image.PropertyKey.IMAGE_LENGTH
      const compareData: string = `120`;
      let checkResult = false;
      try {
        const imageSourceApi = await getImageSource("test.dng", 'fd')
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
        } else {
          const result = await imageSourceApi.getImagePropertySync(key)
          console.info(testTag + "getImagePropertySync result: " + result);
          console.info(testTag + "getImagePropertySync compareData: " + compareData);
          checkResult = compareData == result
          if(!checkResult){
            console.info(testTag + " getImagePropertySync failed. key:" + key + ", compareData: " + compareData +
              ", result: " + result);
          }
          imageSourceApi.release();
        }
        expect(checkResult).assertTrue()
        done()
      } catch (e) {
        console.info(testTag + "getImagePropertySync error IMAGE_LENGTH : " + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ORIENTATION_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ORIENTATION_0100
     * @tc.desc        Verify write and read EXIF Orientation property with all enum values
     *                 1.Create image source from JPEG file using fd
     *                 2.Iterate through all 8 Orientation enum values (TOP_LEFT to LEFT_BOTTOM)
     *                 3.Write each orientation value using writeImageMetadata API
     *                 4.Read back orientation using readImageMetadata API
     *                 5.Verify each orientation value matches the expected numeric value (1-8)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ORIENTATION_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_EXIFMETADATA_ORIENTATION_0100"
      let result = true;
      let orientationKey: Array<image.Orientation> = [image.Orientation.TOP_LEFT, image.Orientation.TOP_RIGHT,
        image.Orientation.BOTTOM_RIGHT, image.Orientation.BOTTOM_LEFT, image.Orientation.LEFT_TOP,
        image.Orientation.RIGHT_TOP, image.Orientation.RIGHT_BOTTOM, image.Orientation.LEFT_BOTTOM];
      let orientationValue: number[] = [1, 2, 3, 4, 5, 6, 7, 8];

      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      let exifMetadata1 = image.ExifMetadata.createInstance();
      try {
        for (let i = 0; i < orientationKey.length; i++) {
          exifMetadata1.orientation = orientationKey[i];
          const imageMetadata: image.ImageMetadata = {
            exifMetadata: exifMetadata1
          };
          await imageSourceApi.writeImageMetadata(imageMetadata);
          let value = await imageSourceApi.readImageMetadata(["Orientation"]);
          if (value.exifMetadata != undefined) {
            let actualValue = value.exifMetadata!.orientation;
            console.info(`${testTag} orientation actualValue is: ${actualValue}, expectedValue is: ${orientationKey[i]}`);
            if (actualValue !== orientationValue[i]) {
              result = false;
              console.info(`${testTag} orientation verification failed for key: orientation, Expected: ${orientationKey[i]}, Actual: ${actualValue}`);
              break;
            }
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ENUM_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ENUM_0100
     * @tc.desc        Verify Hw MakerNote metadata enum values consistency
     *                 1.Define FocusMode enum values (AF_A, AF_S, AF_C, MF) and verify against expected values (0-3)
     *                 2.Define XmageColorMode enum values (NORMAL, BRIGHT, SOFT, MONO) and verify against expected values (0-3)
     *                 3.Define capture mode constants (PROFESSIONAL, PANORAMA, PORTRAIT, etc.) and verify against expected values
     *                 4.Verify all enum values match their corresponding numeric constants
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ENUM_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ENUM_0100"
      let result = true;
      const focusModeEnums: Array<EnumValuePair<image.FocusMode>> = [
        { enum: image.FocusMode.AF_A, value: 0 },
        { enum: image.FocusMode.AF_S, value: 1 },
        { enum: image.FocusMode.AF_C, value: 2 },
        { enum: image.FocusMode.MF, value: 3 }
      ];
      const xmageColorModeEnums: Array<EnumValuePair<image.XmageColorMode>> = [
        { enum: image.XmageColorMode.NORMAL, value: 0 },
        { enum: image.XmageColorMode.BRIGHT, value: 1 },
        { enum: image.XmageColorMode.SOFT, value: 2 },
        { enum: image.XmageColorMode.MONO, value: 3 }
      ];
      const captureModeEnums: Array<EnumValuePair<number>> = [
        { enum: image.XMAGE_WATERMARK_MODE_AT_THE_BOTTOM, value: 9 },
        { enum: image.XMAGE_WATERMARK_MODE_BORDER, value: 10 },
        { enum: image.CAPTURE_MODE_PROFESSIONAL, value: 2 },
        { enum: image.CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW, value: 7 },
        { enum: image.CAPTURE_MODE_PANORAMA, value: 8 },
        { enum: image.CAPTURE_MODE_TAIL_LIGHT, value: 9 },
        { enum: image.CAPTURE_MODE_LIGHT_GRAFFITI, value: 10 },
        { enum: image.CAPTURE_MODE_SILKY_WATER, value: 11 },
        { enum: image.CAPTURE_MODE_STAR_TRACK, value: 12 },
        { enum: image.CAPTURE_MODE_WIDEAPERTURE, value: 19 },
        { enum: image.CAPTURE_MODE_MOVING_PHOTO, value: 20 },
        { enum: image.CAPTURE_MODE_PORTRAIT, value: 23 },
        { enum: image.CAPTURE_MODE_REAR_LENS_NIGHT_VIEW, value: 42 },
        { enum: image.CAPTURE_MODE_SUPER_MACRO, value: 47 },
        { enum: image.CAPTURE_MODE_SNAP_SHOT, value: 62 }
      ];
      try {
        result = focusModeEnums.every(item => item.enum === item.value) &&
                 xmageColorModeEnums.every(item => item.enum === item.value) &&
                 captureModeEnums.every(item => item.enum === item.value);
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ONLY_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ONLY_0100
     * @tc.desc        Verify read-only Hw MakerNote metadata properties
     *                 1.Create image source from JPEG file with read-only MakerNote data using fd
     *                 2.Read read-only MakerNote metadata using readImageMetadata API
     *                 3.Verify scene recognition confidence values (stage, blue sky, beach, snow, sunset, flowers, night, text)
     *                 4.Verify other read-only properties (faceCount, burstNumber, isFrontCamera, rollAngle, pitchAngle, physicalAperture, focusMode)
     *                 5.Verify undefined properties (xmageColorMode, isWindSnapshot, sceneGreenPlantConfidence) are not set
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ONLY_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HWMETADATA_ONLY_0100"
      let result = true;
      const imageSourceApi = await getImageSource("test_exif_readOnly_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readOnlyMakerNoteHwMetadata);
        const metadata = exifValue.makerNoteHuaweiMetadata;

        if (metadata != undefined) {
          result = metadata.xmageColorMode == undefined && 
            metadata.isWindSnapshot == undefined &&
            metadata.cloudLabel == undefined &&
            metadata.sceneStageConfidence == 3 && 
            metadata.sceneBlueSkyConfidence == 4 && 
            metadata.sceneGreenPlantConfidence == undefined &&
            metadata.sceneBeachConfidence == 6 && 
            metadata.sceneSnowConfidence == 7 && 
            metadata.sceneSunsetConfidence == 8 &&
            metadata.sceneFlowersConfidence == 9 && 
            metadata.sceneNightConfidence == 10 && 
            metadata.sceneTextConfidence == 11 &&
            metadata.faceCount == 2 && 
            metadata.burstNumber == 2 && 
            metadata.isFrontCamera == true && 
            metadata.rollAngle == 4 &&
            metadata.pitchAngle == 5 && 
            metadata.physicalAperture == 6 && 
            (metadata.focusMode as number) == 7;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0100
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0200
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0200";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_png_v2.png", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0300
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index parameter for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid index 3
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid index parameter
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0300";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_png_v2.png", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, 3);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0400
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0400";
      let result: boolean = true;
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource("test_exif_readWrite_heic_v2.heic", "fd");
        try {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
          console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
          result = false;
        } catch (err) {
          result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} readImageMetadata result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0500
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index parameter for HEIC file
     *                 1.Create image source from HEIC file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid index 3
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid index parameter
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0500";
      let result: boolean = true;
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource("test_exif_readWrite_heic_v2.heic", "fd");
        try {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, 3);
          console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
          result = false;
        } catch (err) {
          result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} readImageMetadata result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0600
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0600";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_webp_v2.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0700
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index parameter for WEBP file
     *                 1.Create image source from WEBP file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid index 3
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid index parameter
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0700";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_webp_v2.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, 3);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0800
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0800";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0900
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index parameter for DNG file
     *                 1.Create image source from DNG file using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid index 3
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid index parameter
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_0900";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test.dng", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, 3);
        console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1000
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index parameter for HEIF file
     *                 1.Create image source from HEIF file (heif.heic) using fd
     *                 2.Attempt to read EXIF metadata using readImageMetadata with invalid negative index -1
     *                 3.Verify API throws PROPERTY_NOT_EXIST error for invalid negative index
     *                 4.Confirm error is handled correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1000", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1000";
      let result: boolean = true;
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource("heif.heic", "fd");
        try {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, -1);
          console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
          result = false;
        } catch (err) {
          result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} readImageMetadata result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1100
     * @tc.desc        Verify error handling when reading EXIF metadata with out-of-bounds index parameter for HEIF file
     *                 1.Create image source from HEIF file (heif.heic) using fd
     *                 2.Get the frame count of the HEIF file
     *                 3.Attempt to read EXIF metadata using readImageMetadata with out-of-bounds index (frameCount)
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for out-of-bounds index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_INDEX_ERROR_1100";
      let result: boolean = true;
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource("heif.heic", "fd");
        let frameCount: number = await imageSourceApi.getFrameCount();
        try {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(readAndWriteExifMetadata, frameCount);
          console.info(`${testTag} readImageMetadata successfully for key: ${readAndWriteExifMetadata}, exifValue: ${exifValue}`);
          result = false;
        } catch (err) {
          result = handleError(testTag, err as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} readImageMetadata result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0100
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0100"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      let metadata = await getMetadataFromPicture(imageSourceApi);
      try {
        let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
        console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
        result = exifArrayBuffer != undefined;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} getImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0200
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0200"
      let result = false;
      let fileName = "test_exif_readWrite_heic_v2.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        let metadata = await getMetadataFromPicture(imageSourceApi);
        try {
          let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
          console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
          result = exifArrayBuffer != undefined;
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0300
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETBLOD_PROMISE_0300"
      let result = true;
      let fileName = "heif.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        let frameCount: number = await imageSourceApi.getFrameCount();
        console.info(`${testTag} get frameCount num is: ${frameCount}`);
        try {
          for (let index = 0; index < frameCount; index++) {
            let metadata = await getMetadataFromPicture(imageSourceApi, index);
            let exifArrayBuffer: ArrayBuffer = await metadata.getBlob();
            console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
            result = result && exifArrayBuffer != undefined;
          }
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0100"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        let exifArrayBuffer: ArrayBuffer = await exifValue.exifMetadata!.getBlob();
        console.info(`${testTag} readImageMetadata successfully for exifArrayBuffer: ${exifArrayBuffer}`);
        result = exifArrayBuffer != undefined;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0200"
      let result = false;
      let fileName = "test_exif_readWrite_heic_v2.heic";
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        try {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
          let exifArrayBuffer: ArrayBuffer = await exifValue.exifMetadata!.getBlob();
          console.info(`${testTag} readImageMetadata successfully for exifArrayBuffer: ${exifArrayBuffer}`);
          result = exifArrayBuffer != undefined;
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0300"
      let result = true;
      let fileName = "heif.heic";
      let camelCaseMetadataKeys: Array<string> = ["HeifsDelayTime"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource(fileName, "fd");
        let frameCount: number = await imageSourceApi.getFrameCount();
        console.info(`${testTag} get frameCount num is: ${frameCount}`);
        try {
          for (let index = 0; index < frameCount; index++) {
            const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(camelCaseMetadataKeys, index);
            let exifArrayBuffer: ArrayBuffer = await exifValue.heifsMetadata!.getBlob();
            console.info(`${testTag} Read successfully for exifArrayBuffer: ${exifArrayBuffer}`);
            result = result && exifArrayBuffer != undefined;
          }
        } catch (err) {
          console.error(`${testTag} Error processing err: ${err}`);
          result = false;
        } finally {
          await imageSourceApi?.release();
        }
        console.info(`${testTag} getBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0400
     * @tc.desc        Verify read EXIF metadata as ArrayBuffer using getBlob
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture using getMetadata
     *                 3.Read EXIF data as ArrayBuffer using getBlob API
     *                 4.Verify ArrayBuffer is retrieved successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETBLOB_PROMISE_0400"
      let result = false;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        let exifArrayBuffer: ArrayBuffer = await exifValue.makerNoteHuaweiMetadata!.getBlob();
        console.info(`${testTag} readImageMetadata successfully for exifArrayBuffer: ${exifArrayBuffer}`);
        result = exifArrayBuffer != undefined;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} readImageMetadata getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.desc        Verify transfer EXIF metadata between JPEG images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target JPEG using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0100";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make", "ExifVersion"];
      let result = await testGetAndSetBlobArrayBuffer(testTag, "food.jpg", "test_exif_readWrite_jpg_v2.jpg", "fd", camelCaseMetadataKeys);
      console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.desc        Verify transfer EXIF metadata between JPEG and HEIC images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0200";
      let fileName = "test_exif_readWrite_heic_v2.heic";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make", "ExifVersion"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testGetAndSetBlobArrayBuffer(testTag, "food.jpg", fileName, "fd", camelCaseMetadataKeys);
        console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.desc        Verify transfer EXIF metadata between JPEG and HEIC images using getBlob and setBlob
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Read properties from target using getProperties
     *                 4.Verify transferred properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_0300";
      let fileName = "heif.heic";
      let camelCaseMetadataKeys: Array<string> = ["HeifsDelayTime"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testGetAndSetBlobArrayBuffer(testTag, "C027.heic", fileName, "fd", camelCaseMetadataKeys, 0);
        console.info(`${testTag} testGetAndSetBlobArrayBuffer result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100
     * @tc.desc        Verify setBlob error handling for empty ArrayBuffer
     *                 1.Create image source from JPEG file using fd
     *                 2.Get metadata from picture
     *                 3.Attempt to write empty ArrayBuffer using setBlob
     *                 4.Verify API throws PROPERTY_NOT_EXIST error for invalid data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PROMISE_ERROR_0100";
      const emptyArrayBuffer: ArrayBuffer = new ArrayBuffer(0);
      console.info(`${testTag} Created empty ArrayBuffer with length: ${emptyArrayBuffer.byteLength}`);

      let result = false;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      let metadataModify = await getMetadataFromPicture(imageSourceApi);
      try {
        await metadataModify.setBlob(emptyArrayBuffer);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }

      console.info(`${testTag} setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0100
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for JPEG
     *                 1.Read EXIF metadata from source JPEG as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target using setBlob
     *                 3.Pack to JPEG file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0100";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make"];
      let packingOption: image.PackingOption = {
        format: "image/jpeg",
        quality: 99,
        needsPackProperties: true
      };
      let result = await testPackToFileAndModifyArrayBuffer(testTag, "test_exif_arraybuffer_jpg_v3.jpg",
        "test_exif_arraybuffer_jpg.jpeg", "fd", camelCaseMetadataKeys, packingOption);
      console.info(`${testTag} modifyImagePropertyArray result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0200
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_METADATA_GETANDSETBLOB_PACKTOFILE_PROMISE_0200";
      let targetFileName = "test_packtofile_modify_empty_heic_v2.heic";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make"];
      let packingOption: image.PackingOption = {
        format: "image/heic",
        quality: 99,
        needsPackProperties: true
      };
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testPackToFileAndModifyArrayBuffer(testTag, targetFileName,
          "test_exif_arraybuffer_heic.heic", "fd", camelCaseMetadataKeys, packingOption);
        console.info(`${testTag} modifyImagePropertyArray result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0100
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0100";
      let sourceFileName = "food.jpg";
      let targetFileName = "test_blob_v1.jpg";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "exifMetadata",
        camelCaseMetadataKeys);
      console.info(`${testTag} testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0200
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_0200";
      let sourceFileName = "food.jpg";
      let targetFileName = "test_blob_v1.jpg";
      let camelCaseMetadataKeys: Array<string> = ["HwMnoteCaptureMode"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd",
        "makerNoteHuaweiMetadata", camelCaseMetadataKeys);
      console.info(`${testTag} testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_0300
     * @tc.desc        Verify HEIFS metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read HEIFS metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_0300";
      let sourceFileName = "C027.heic";
      let targetFileName = "test_blob_v1.heic";
      let camelCaseMetadataKeys: Array<string> = ["HeifsDelayTime"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "heifsMetadata",
          camelCaseMetadataKeys);
        console.info(`${testTag} testExifMetadataGetAndSetBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });
    
  });
}
