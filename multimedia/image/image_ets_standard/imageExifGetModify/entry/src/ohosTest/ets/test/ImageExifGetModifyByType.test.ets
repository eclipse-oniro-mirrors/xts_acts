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
  readAndWriteExifMetadata,
  readAndWriteMakerNoteHwMetadata,
  exifReadWriteValidationRules,
  DNGExifReadWriteValidationRules,
  imageOnlyMakerNoteHwMetadata,
  readOnlyMakerNoteHwMetadata,
  exifReadOnlyValidationRules,
  testExifMetadata,
  testHuaweiMakerNoteMetadata,
  exifWriteExpectedValueRules,
  ReadOnlyMetaDataRule,
  dngMetadataMap,
  webpMetadataMap,
  gifMetadataMap,
  heifsMetadataMap,
  pngMetadataMap,
  jfifMetadataMap,
  tiffMetadataMap,
  avisMetadataMap
} from './ImagePropertyByType.test'

interface ModifyRule1 {
  key?: string;
  oldExpectValue: string | null | undefined;
  newExpectValue: string | number | Array<number> | ArrayBuffer | boolean | undefined;
}

interface ModifyRule {
  key?: string;
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

let cacheDir: string | undefined;
let isSupportHEIFDecode: boolean;
let isSupportHdr: Boolean;
const READ_FAILED = 7700202;
const UNSUPPORTED_IMAGE_FORMATS = 7700102;
const PROPERTY_NOT_EXIST = 7700204;
const INVALID_PARAMETER = 7600206;
type MetadataScalar = string | number | number[] | object | undefined | null | boolean;

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
      cacheDir = AppStorage.get('cacheDir')
      let filePath = AppStorage.get('pathDir') + '/' + "test.jpg";
      let imageSource: image.ImageSource = image.createImageSource(filePath);
      console.info('imageSource is ' + imageSource);
      isSupportHEIFDecode = imageSource.supportedFormats.includes('image/heic');
      console.info('isSupportHEIFDecode is ' + isSupportHEIFDecode);
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
      console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
      if (Array.isArray(actual) && Array.isArray(expected)) {
        console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
        if (actual.length !== expected.length) return false;
        console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
        return actual.every((val: number, index: number) => val == expected[index]);
      }
      console.info(`dsh 1 compareValues actual is ${actual} , expected is ${expected}, actual type ${typeof actual}, expected type ${typeof expected}`);
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
      rulesMap: Map<string, ModifyRule | ModifyRule1 | ReadOnlyMetaDataRule>
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
          if (exifValue[typeMetadata] == undefined) {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
          }
          let actualValue: string | number | object | number[] | undefined | null | ArrayBuffer = exifValue[typeMetadata]![rule.key!];
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

          if (exifValue[typeMetadata] == undefined) {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
          }
          let exifRecord1: Record<string, string | null> = await exifValue[typeMetadata]!.getProperties(metadataKeys);
          let exifRecord2: Record<string, string | null> = await exifValue[typeMetadata]!.getAllProperties();
          let actualValue1: string | null = exifRecord1[metadataKeys[i]];
          let actualValue2: string | null = exifRecord2[metadataKeys[i]];

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

    const verifyreadMetadataByType = <k>(
      testTag: string,
      exifValue: image.ImageMetadata,
      keys: k[],
      expectedIndex: number,
      rulesMap: Map<k, ReadOnlyMetaDataRule>,
      metadataType: string
    ): boolean => {
      let result: boolean = true;
      if (exifValue[metadataType] == undefined) {
        console.info(`${testTag} Not meeting the conditions.`);
        return false;
      }
      for (let i = 0; i < keys.length; i++) {
        const key = keys[i];
        const rule = rulesMap.get(key);
        if (!rule) {
          console.info(`${result} No rule found for key: ${key}`);
          continue;
        }
        try {
          let ruleExpectedValue = rule.newExpectValue;
          let expectedValue: MetadataScalar = Array.isArray(ruleExpectedValue) ? ruleExpectedValue : ruleExpectedValue;
          let actualValue: MetadataScalar = exifValue[metadataType]![rule.key!];
          if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            result = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${key}: ${error}`);
          result = false;
        }
      }
      return result;
    }

    const verifyMultipleFramesMetadata = <k>(
      testTag: string,
      exifValue: image.ImageMetadata,
      keys: k[],
      expectedIndex: number,
      rulesMap: Map<k, ReadOnlyMetaDataRule>,
      metadataType: string
    ): boolean => {
      let result: boolean = true;
      if (exifValue[metadataType] == undefined) {
        console.info(`${testTag} Not meeting the conditions.`);
        return false;
      }
      for (let i = 0; i < keys.length; i++) {
        const key = keys[i];
        const rule = rulesMap.get(key);
        if (!rule) {
          console.info(`${result} No rule found for key: ${key}`);
          continue;
        }
        try {
          let ruleExpectedValue = rule.newExpectValue;
          let expectedValue: MetadataScalar = Array.isArray(ruleExpectedValue) ? ruleExpectedValue[expectedIndex] : ruleExpectedValue;
          let actualValue: MetadataScalar = exifValue[metadataType]![rule.key!];
          if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            result = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${key}: ${error}`);
          result = false;
        }
      }
      return result;
    }

    const testReadImageMetadata = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[]
    ): Promise<boolean> => {
      let ret: boolean = true;
      ret = await testModifyAndVerifyEnhanced(testNum, fileName, type, exifMetadataKey);
      ret = ret && await verifyMetadataProperties(testNum, fileName, type, typeMetadata, exifMetadataKey, exifReadWriteValidationRules);
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

      ret = await verifyMetadataProperties(testNum, fileName, type, typeMetadata, exifMetadataKey, exifWriteExpectedValueRules);
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
            console.info(`${testNum} getProperties read success for key: ${key}, exifValue: ${exifValue[key]}`);
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
            console.info(`${testNum} getProperties read success for key: ${key}, exifValue: ${exifValue[key]}`);
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

    const testReadImageMetadataByType = async (
      testNum: string,
      fileName: string,
      type: string,
      metadataTypes?: Array<image.MetadataType> | undefined,
      inde?: number | undefined
    ): Promise<image.ImageMetadata | undefined> => {
      const imageSourceApi = await getImageSource(fileName, type);
      let imageValue: image.ImageMetadata | undefined = undefined;
      try {
        if (metadataTypes === undefined && inde === undefined) {
          imageValue = await imageSourceApi.readImageMetadataByType();
        } else if (inde === undefined) {
          imageValue = await imageSourceApi.readImageMetadataByType(metadataTypes);
        } else {
          imageValue = await imageSourceApi.readImageMetadataByType(metadataTypes, inde);
        }
        console.info(`${testNum} readImageMetadataByType successfully for imageValue : ${JSON.stringify(imageValue)}` );
      } catch (error) {
        console.error(`${testNum} Error readImageMetadataByType: ${error}`);
        return undefined;
      } finally {
        await imageSourceApi?.release();
      }
      return imageValue;
    }

    let sleep = async (delay: number): Promise<void> => {
      return new Promise((resolve, _) => {
        setTimeout(async () => {
          resolve();
        }, delay);
      });
    };

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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata);
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
      await sleep(20);
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
            actualValue = exifValue.exifMetadata![rule.key!];
          }

          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for ArrayBuffer key: ${rule.key}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${rule.key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${rule.key}: ${error}`);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_jpg_v2.jpg", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_png_v2.png", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_heic_v2.heic", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata);
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
      let result = await testReadImageMetadata(testTag, "test_exif_readWrite_webp_v2.webp", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_jpg_v2.jpg", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_png_v2.png", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_heic_v2.heic", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_empty_webp_v2.webp", "fd", "exifMetadata", readAndWriteExifMetadata, imageMetadata);
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
      let result = await testWriteImageMetadata(testTag, "test_exif_modify_jpg_v2.jpg", "fd", "makerNoteHuaweiMetadata", readAndWriteMakerNoteHwMetadata, imageMetadata);
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
        DNGExifReadWriteValidationRules);
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
            actualValue = exifValue.exifMetadata![rule.key!];
          }

          if (actualValue instanceof ArrayBuffer) {
            if (!compareArrayBuffer(actualValue, expectedValue)) {
              console.info(`${testTag} Verification failed for ArrayBuffer key: ${rule.key}, Expected: ${JSON.stringify(expectedValue)}, Actual ArrayBuffer length: ${actualValue.byteLength}`);
              ret = false;
            }
          } else if (!compareValues(actualValue, expectedValue)) {
            console.info(`${testTag} Verification failed for key: ${rule.key}, Expected: ${JSON.stringify(expectedValue)}, Actual: ${JSON.stringify(actualValue)}`);
            ret = false;
          }
        } catch (error) {
          console.error(`${testTag} Error processing key ${rule.key}: ${error}`);
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

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0100
     * @tc.desc        Verify reading EXIF_METADATA from JPEG file
     *                 1.Create image source from test_exif_arraybuffer_jpg_v3.jpg using fd
     *                 2.Call readImageMetadataByType with specified metadata types
     *                 3.Verify metadata types are supported and returned correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0100";
      let result = true;
      let fileName = "test_exif_arraybuffer_jpg_v3.jpg";
      const imageValue = await testReadImageMetadataByType(testTag, fileName, "fd");
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
        if (imageValue.makerNoteHuaweiMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.makerNoteHuaweiMetadata)}`);
          result = result && compareValues(imageValue.makerNoteHuaweiMetadata["captureMode"], 1);
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0200
     * @tc.desc        Verify reading EXIF_METADATA from JPEG file
     *                 1.Create image source from test_exif_arraybuffer_jpg_v3.jpg using fd
     *                 2.Call readImageMetadataByType with specified metadata types
     *                 3.Verify metadata types are supported and returned correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0200";
      let result = true;
      let fileName = "test_exif_arraybuffer_jpg_v3.jpg";
      let metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, fileName, "fd", metadataTypes);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0300
     * @tc.desc        Verify reading EXIF_METADATA from JPEG file
     *                 1.Create image source from test_exif_readOnly_heic_v2.heic using fd
     *                 2.Call readImageMetadataByType with specified metadata types
     *                 3.Verify metadata types are supported and returned correctly
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0300";
      let result = true;
      let fileName = "test_exif_readOnly_heic_v2.heic";
      let metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(testTag + "device is not support heif encode");
        done();
      } else {
        const imageValue = await testReadImageMetadataByType(testTag, fileName, "fd", metadataTypes);
        if (!imageValue) {
          console.error(`${testTag} imageValue is null or undefined`);
          result = false;
        } else {
          if (imageValue.exifMetadata) {
            console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
          }
        }
        console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0400
     * @tc.desc        Verify reading EXIF_METADATA from PNG file
     *                 1.Create image source from test_exif_readOnly_png_v2.png using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 3.Verify exifMetadata values (imageWidth=0, bitsPerSample=[1,1,1], make='华为')
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0400";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "test_exif_readOnly_png_v2.png", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0500
     * @tc.desc        Verify reading EXIF_METADATA from WEBP file
     *                 1.Create image source from test_exif_matedata_webp.webp using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 3.Verify exifMetadata values (imageWidth=3456, bitsPerSample=[8,8,8], make='华为')
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0500";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "test_exif_matedata_webp.webp", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 3456);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [8,8,8]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0600
     * @tc.desc        Verify reading EXIF_METADATA from DNG file
     *                 1.Create image source from HW_CAMERA.dng using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 3.Verify that the EXIF metadata values are consistent with the expected values.
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0600";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "HW_CAMERA.dng", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 4096);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [16]);
          result = result && compareValues(imageValue.exifMetadata["make"], 'HUAWEI');
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0700
     * @tc.desc        Verify reading duplicate metadata types from JPEG file with index parameter
     *                 1.Create image source from test_exif_arraybuffer_jpg_v3.jpg using fd
     *                 2.Call readImageMetadataByType with duplicate EXIF_METADATA and EXIF_METADATA types and index 0
     *                 3.Verify metadata is returned correctly despite duplicate types in the request
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0700";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA,
        image.MetadataType.EXIF_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "test_exif_arraybuffer_jpg_v3.jpg", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        console.info(`${testTag} imageValue: ${JSON.stringify(imageValue)}`);
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0800
     * @tc.desc        Verify reading EXIF_METADATA and HEIFS_METADATA from HEIC file with index parameter
     *                 1.Check if device supports HEIC format decoding
     *                 2.Create image source from test_exif_arraybuffer_jpg_v3.jpg using fd
     *                 3.Call readImageMetadataByType with EXIF_METADATA and HEIFS_METADATA types and index 0
     *                 4.Verify that the EXIF metadata values are consistent with the expected values.
     *                 5.Verify HEIFS_METADATA is undefined (not supported for HEIC)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0800";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA,
        image.MetadataType.HEIFS_METADATA
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "test_exif_arraybuffer_jpg_v3.jpg", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
        if (imageValue.exifMetadata) {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata["make"], '华为');
        }
        console.info(`${testTag} imageValue.heifsMetadata: ${JSON.stringify(imageValue.heifsMetadata)}`);
        result = result && (imageValue.heifsMetadata === undefined);
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0900
     * @tc.desc        Verify reading metadata with invalid metadata type included in the array
     *                 1.Create image source from test_exif_arraybuffer_jpg_v3.jpg using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA and invalid type (20) and index 0
     *                 3.Verify valid EXIF metadata is still returned correctly
     *                 4.Verify that the EXIF metadata values are consistent with the expected values.
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_0900";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA,
        20 as image.MetadataType
      ];
      const imageValue = await testReadImageMetadataByType(testTag, "test_exif_arraybuffer_jpg_v3.jpg", "fd", metadataTypes, 0);
      if (!imageValue) {
        console.error(`${testTag} imageValue is null or undefined`);
        result = false;
      } else {
          console.info(`${testTag} imageValue.exifMetadata: ${JSON.stringify(imageValue.exifMetadata)}`);
          result = result && compareValues(imageValue.exifMetadata!["imageWidth"], 0);
          result = result && compareValues(imageValue.exifMetadata!["bitsPerSample"], [1,1,1]);
          result = result && compareValues(imageValue.exifMetadata!["make"], '华为');
      }
      console.info(`${testTag} testReadImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_1000
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_1000
     * @tc.desc        Verify reading HEIFS_METADATA from multi-frame HEIC file
     *                 1.Check if device supports HEIC format decoding
     *                 2.Create image source from test_exif_by_type_heifs.heic using fd
     *                 3.Get frame count and iterate through all frames
     *                 4.Call readImageMetadataByType with HEIFS_METADATA type for each frame
     *                 5.Verify heifsMetadata is returned correctly for all frames (heifsDelayTime=40)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_1000", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_1000";
      let result = true;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.HEIFS_METADATA
      ];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        const imageSourceApi = await getImageSource("heif.heic", "fd");
        let frameCount = await imageSourceApi.getFrameCount();
        console.info(`${testTag} image frame count: ${frameCount}`);
        for (let i = 0; i < frameCount; i++) {
          const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, i);
          if (!imageValue) {
            console.error(`${testTag} imageValue is null or undefined`);
            result = false;
          } else {
            if (imageValue.heifsMetadata !== undefined) {
              console.info(`${testTag} imageValue.heifsMetadata: ${JSON.stringify(imageValue.heifsMetadata)}`);
              result = result && imageValue.heifsMetadata!["heifsDelayTime"] === 40;
            }
          }
        }
        await imageSourceApi?.release();
        console.info(`${testTag} readImageMetadataByType result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0100
     * @tc.desc        Verify error handling when reading EXIF metadata with negative index from JPEG
     *                 1.Create image source from test_exif_readWrite_jpg_v2.jpg using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and invalid index -1
     *                 3.Verify PROPERTY_NOT_EXIST error is thrown
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0100";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, -1);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${JSON.stringify(imageValue)}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0200
     * @tc.desc        Verify error handling when reading EXIF metadata with invalid index from JPEG
     *                 1.Create image source from test_exif_readWrite_jpg_v2.jpg using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and invalid index 3
     *                 3.Verify PROPERTY_NOT_EXIST error is thrown for out-of-bounds index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0200";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 3);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${JSON.stringify(imageValue)}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0300
     * @tc.desc        Verify error handling when reading with only invalid metadata type
     *                 1.Create image source from test_exif_readWrite_jpg_v2.jpg using fd
     *                 2.Call readImageMetadataByType with only invalid type (20) and index 0
     *                 3.Verify READ_FAILED error is thrown when no valid metadata types provided
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0300";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        2000 as image.MetadataType
      ];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 0);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${imageValue}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0400
     * @tc.desc        Verify error handling when reading mismatched metadata type from image
     *                 1.Create image source from test_exif_readWrite_jpg_v2.jpg using fd
     *                 2.Call readImageMetadataByType with HEIFS_METADATA type (not supported by JPEG) and index 0
     *                 3.Verify UNSUPPORTED_IMAGE_FORMATS error is thrown for mismatched metadata type
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0400";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.HEIFS_METADATA
      ];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 0);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${imageValue}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0500
     * @tc.desc        Verify error handling when reading metadata after releasing image source
     *                 1.Create image source from test_exif_readWrite_jpg_v2.jpg using fd
     *                 2.Release the image source
     *                 3.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 4.Verify PROPERTY_NOT_EXIST error is thrown for released source
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0500";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        await imageSourceApi.release();
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 0);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${imageValue}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, PROPERTY_NOT_EXIST);
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0600
     * @tc.desc        Verify error handling when reading metadata from image file without EXIF data
     *                 1.Create image source from test_exif_empty_jpg_v4.jpg using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 3.Verify READ_FAILED error is thrown for image without EXIF metadata
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0600";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageSourceApi = await getImageSource("test_exif_empty_jpg_v4.jpg", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 0);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${imageValue}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, READ_FAILED);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0700
     * @tc.desc        Verify error handling when reading metadata from unsupported image format
     *                 1.Create image source from test.ico using fd
     *                 2.Call readImageMetadataByType with EXIF_METADATA type and index 0
     *                 3.Verify UNSUPPORTED_IMAGE_FORMATS error is thrown for ICO format
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PROMISE_ERROR_0700";
      let result: boolean = false;
      const metadataTypes: Array<image.MetadataType> = [
        image.MetadataType.EXIF_METADATA
      ];
      const imageSourceApi = await getImageSource("test.ico", "fd");
      try {
        const imageValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType(metadataTypes, 0);
        console.info(`${testTag} readImageMetadataByType successfully for key: ${metadataTypes}, imageValue: ${imageValue}`);
      } catch (error) {
        result = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadataByType error result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100
     * @tc.desc        Verify create image raw data from DNG file and create pixel map from raw data
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Create image raw data using createImageRawData
     *                 3.Create new image source from raw data buffer
     *                 4.Create pixel map from new image source
     *                 5.Verify pixel map is created successfully with valid dimensions
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_0100";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for DNG file, dngMetadata: ${JSON.stringify(dngMetadata)}`
                      + ` buffer length = ${dngMetadata.buffer.byteLength},`
                      + ` bitsPerPixel = ${dngMetadata.bitsPerPixel}`);
        let dngMetadataArray = new Uint16Array(dngMetadata.buffer);
        console.info(`${testTag} dngMetadataArray length = ${dngMetadataArray.length}`);
        const actualNumberArray = Array.from(dngMetadataArray).slice(0, 10);
        let exceptNumberArray = [0, 0, 32, 512, 4, 64, 0, 6150, 0, 512];
        let ret = compareValues(actualNumberArray, exceptNumberArray);
        expect(ret).assertTrue();
        console.info(`${testTag} dngMetadataArray data match expected values.`);
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100
     * @tc.desc        Verify create image raw data from DNG file and create pixel map from raw data
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Create image raw data using createImageRawData
     *                 3.Create new image source from raw data buffer
     *                 4.Create pixel map from new image source
     *                 5.Verify pixel map is created successfully with valid dimensions
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100";
      try {
        const imageSourceApi = await getImageSource("fake.dng", "uri");
        console.info(`${testTag} Created image source for fake.dng file.`);
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for fake.dng file, expected to fail.`);
        expect().assertFail();
      } catch (err) {
        console.error(`${testTag} Error: code: ${err.code}, message: ${err.message}`);
        expect(err.code == 7700101).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200
     * @tc.desc        Verify create image raw data from ico file
     *                 1.Create image source from ico file (test.ico) using uri
     *                 2.Create image raw data using createImageRawData
     *                 3.Verify createImageRawData fails with expected error
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200";
      try {
        const imageSourceApi = await getImageSource("test.ico", "uri");
        console.info(`${testTag} Created image source for ico file.`);
        const dngMetadata = await imageSourceApi.createImageRawData();
        console.info(`${testTag} Created image raw data for ico file, expected to fail.`);
        expect().assertFail();
      } catch (err) {
        console.error(`${testTag} Error: code: ${err.code}, message: ${err.message}`);
        expect(err.code == UNSUPPORTED_IMAGE_FORMATS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100";
      try {
        let keys: string[] = Object.values(image.DngPropertyKey);
        console.info(`${testTag} DNG metadata keys to read: ${keys}`);
        const ret = await verifyMetadataProperties(testTag, "test_fake.dng", "uri", "dngMetadata", keys, dngMetadataMap);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0200";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadata();
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file using uri
     *                 2.Read DNG metadata using readImageMetadata
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_ERROR_0100";
      try {
        const imageSourceApi = await getImageSource("HW_CAMERA.dng", "uri");
        const keys: string[] = ["LocalizedCameraModel", "BlackLevelDeltaH"];
        const imageMetadata = await imageSourceApi.readImageMetadata(keys);
        console.info(`${testTag} Read DNG image metadata: ${JSON.stringify(imageMetadata)}`);
        expect().assertFail();
      } catch (err) {
        let ret = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
        expect(ret).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadataByType
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.DNG_METADATA]);
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200
     * @tc.desc        Verify create image raw data from DNG file
     *                 1.Create image source from DNG file (test_fake.dng) using uri
     *                 2.Read DNG metadata using readImageMetadataByType with specific keys
     *                 3.Verify DNG raw data properties are read successfully
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi.readImageMetadataByType();
        console.info(`${testTag} Read DNG image metadataObj: ${imageMetadata.dngMetadata != undefined}`);
        console.info(`${testTag} DNG image rawDataUniqueID: ${imageMetadata.dngMetadata?.rawDataUniqueID}`);
        expect(imageMetadata.dngMetadata?.rawDataUniqueID == "CE70B9D6BAA1207B3ABBA6C9FFF84924").assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100
      * @tc.desc        Verify WEBP metadata reading with default parameters
      *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0100";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        result = verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, webpMetadataMap, "webPMetadata");
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200
      * @tc.desc        Verify WEBP metadata reading at a specified frame index
     *                 1.Create image source from WEBP file (loop_count_9.webp) using uri
      *                 2.Read metadata using readImageMetadata([], 2)
      *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0200";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata([], 2);
        result = verifyMultipleFramesMetadata(testTag, exifValue, keys, 2, webpMetadataMap, "webPMetadata");
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300
      * @tc.desc        Verify WEBP metadata reading across all frames
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Get frame count and read metadata for each frame using readImageMetadata(keys, i)
      *                 3.Verify WEBP metadata values against webpMetadataMap for each frame index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0300";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        for (let i = 0; i < frameCount; i++) {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, i);
          if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, i, webpMetadataMap, "webPMetadata")) {
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400
      * @tc.desc        Verify WEBP canvas size metadata with selected keys
      *                 1.Create image source from WEBP file (1.webp) using uri
      *                 2.Read metadata using readImageMetadata([CANVAS_WIDTH, CANVAS_HEIGHT], 0)
      *                 3.Verify canvasWidth equals 550 and canvasHeight equals 368
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0400";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.CANVAS_WIDTH, image.WebPPropertyKey.CANVAS_HEIGHT];
      const imageSourceApi = await getImageSource("1.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 0);
        let canvasWidth: number | undefined = exifValue.webPMetadata!.canvasWidth;
        let canvasHeight: number | undefined = exifValue.webPMetadata!.canvasHeight;
        console.info(`${testTag} canvasWidth is: ${canvasWidth}, canvasHeight is: ${canvasHeight}`);
        if (canvasWidth == undefined || canvasHeight == undefined) {
          console.error(`${testTag} canvasWidth or canvasHeight is undefined`);
          result = false;
        } else {
          result = result && canvasWidth == 550 && canvasHeight == 368;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500
      * @tc.desc        Verify WEBP delay metadata relationship at a specified frame
      *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Read metadata using readImageMetadata([DELAY_TIME, UNCLAMPED_DELAY_TIME], 1)
      *                 3.Verify delayTime equals unclampedDelayTime multiplied by 100
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_0500";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.DELAY_TIME, image.WebPPropertyKey.UNCLAMPED_DELAY_TIME];
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 1);
        let delayTime: number | undefined = exifValue.webPMetadata!.delayTime;
        let unclampedDelayTime: number | undefined = exifValue.webPMetadata!.unclampedDelayTime;
        console.info(`${testTag} delayTime is: ${delayTime}, unclampedDelayTime is: ${unclampedDelayTime}`);
        if (delayTime == undefined || unclampedDelayTime == undefined) {
          console.error(`${testTag} delayTime or unclampedDelayTime is undefined`);
          result = false;
        } else {
          result = result && delayTime == unclampedDelayTime * 100;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600
      * @tc.desc        Verify readImageMetadata returns expected error for unsupported WEBP metadata keys
      *                 1.Create image source from WEBP file (1.webp) using uri
      *                 2.Read metadata using readImageMetadata([DELAY_TIME, UNCLAMPED_DELAY_TIME, LOOP_COUNT], 0)
      *                 3.Verify API throws READ_FAILED
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_WEBP_METADATA_ERROR_0600";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = [image.WebPPropertyKey.DELAY_TIME, image.WebPPropertyKey.UNCLAMPED_DELAY_TIME, image.WebPPropertyKey.LOOP_COUNT];
      const imageSourceApi = await getImageSource("1.webp", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(keys, 0);
        console.error(`${testTag} Unsupported metadata exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100
      * @tc.desc        Verify WEBP metadata reading by type with default parameters
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, webpMetadataMap, "webPMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200
      * @tc.desc        Verify WEBP metadata reading by type at a specified frame index
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Read metadata using readImageMetadataByType([], 2)
      *                 3.Verify WEBP metadata values against webpMetadataMap at frame index 2
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([], 2);
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 2, webpMetadataMap, "webPMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300
      * @tc.desc        Verify WEBP metadata-by-type reading across all frames
     *                 1.Create image source from WEBP file (loop_count_9.webp) using fd
      *                 2.Get frame count and read metadata by type for each frame
      *                 3.Verify WEBP metadata values against webpMetadataMap for each frame index
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        for (let i = 0; i < frameCount; i++) {
          const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], i);
          if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, i, webpMetadataMap, "webPMetadata")) {
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400
      * @tc.desc        Verify WEBP canvas size metadata by type
     *                 1.Create image source from WEBP file (1.webp) using fd
      *                 2.Read metadata using readImageMetadataByType([WEBP_METADATA], 0)
      *                 3.Verify canvasWidth equals 550 and canvasHeight equals 368
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("1.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        let canvasWidth: number | undefined = exifValue.webPMetadata!.canvasWidth;
        let canvasHeight: number | undefined = exifValue.webPMetadata!.canvasHeight;
        console.info(`${testTag} canvasWidth is: ${canvasWidth}, canvasHeight is: ${canvasHeight}`);
        result = result && canvasWidth == 550 && canvasHeight == 368;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500
      * @tc.desc        Verify readImageMetadataByType returns expected error on non-WEBP source
      *                 1.Create image source from JPEG file (test_exif_v2.jpg) using uri
      *                 2.Read metadata using readImageMetadataByType([WEBP_METADATA], 0)
      *                 3.Verify API throws UNSUPPORTED_IMAGE_FORMATS
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        console.error(`${testTag} Unsupported metadata exifValue: ${exifValue}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100
      * @tc.desc        Verify WEBP frame delay list retrieval
      *                 1.Create image source from WEBP file (random_lossless.webp) using fd
      *                 2.Call getDelayTimeList()
      *                 3.Verify each frame delay equals 100
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_GETDELAYTIMELIST_WEBP_METADATA_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("random_lossless.webp", "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        let delayTimes: Array<number> = await imageSourceApi.getDelayTimeList();
        for (let i = 0; i < frameCount; i++) {
          let exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata([], i);
          if (exifValue.webPMetadata != undefined && delayTimes[i] != undefined) {
            let delayTime: number | undefined = exifValue.webPMetadata!.delayTime;
            console.info(`${testTag} delayTime is: ${delayTime}`);
            result = result && delayTime == delayTimes[i];
          } else {
            console.error(`${testTag} getDelayTimeList get delayTime failed at frame index: ${i}`);
            result = false;
          }
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      }
      console.info(`${testTag} webp metadata getDelayTimePromise result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100
      * @tc.desc        Verify writeImageMetadata returns expected error for WEBP metadata writing
      *                 1.Create image source from WEBP file (random_lossless.webp) using uri
      *                 2.Build ImageMetadata with webPMetadata and call writeImageMetadata()
      *                 3.Verify API throws READ_FAILED
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_WRITEIMAGEMETADATABYTYPE_WEBPMETADATA_ERROR_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("random_lossless.webp", "uri");
      let webpMetdata: image.WebPMetadata = {
        canvasWidth: 100,
        canvasHeight: 100,
        loopCount: 0,
        delayTime: 100,
        unclampedDelayTime: 100
      }
      const imageMetadata: image.ImageMetadata = {
        webPMetadata: webpMetdata
      };
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.error(`${testTag} Unsupported metadata webpMetdata: ${imageMetadata}`);
        result = false;
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = handleError(testTag, err as GenericError | Array<GenericError>, READ_FAILED);
      }  finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} webp metadata writeImageMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100
     * @tc.desc        Verify EXIF and MakerNote metadata retrieval using getAllProperties
     *                 1.Create image source from JPEG file (test_exif_readWrite_jpg_v2.jpg) using fd
     *                 2.Read image metadata using readImageMetadata()
     *                 3.Call getAllProperties() for exifMetadata and makerNoteHuaweiMetadata
     *                 4.Verify ImageWidth and HwMnoteXmageMode match expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GETALLPROPERTIES_0100";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("test_exif_readWrite_jpg_v2.jpg", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.exifMetadata != undefined && exifValue.makerNoteHuaweiMetadata != undefined) {
          let exifRecord: Record<string, string | null> = await exifValue.exifMetadata.getAllProperties();
          let makerNoteRecord: Record<string, string | null> = await exifValue.makerNoteHuaweiMetadata.getAllProperties();
          result = result && exifRecord["ImageWidth"] == "2000" && makerNoteRecord["HwMnoteXmageMode"] == "2";
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata getAllProperties result is: ${result}`);
      expect(result).assertTrue();
      done();
    });


    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GIF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GIF_METADATA_0100
      * @tc.desc        Verify Gif metadata reading with default parameters
      *                 1.Create image source from Gif file (test6.gif) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify Gif metadata values against gifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GIF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_GIF_METADATA_0100";
      let result: boolean = true;
      let keys: image.GifPropertyKey[] = Array.from(gifMetadataMap.keys());
      const imageSourceApi = await getImageSource("test6.gif", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, gifMetadataMap, "gifMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} gif metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFS_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFS_METADATA_0100
      * @tc.desc        Verify HEIFS metadata reading with default parameters
      *                 1.Create image source from HEIFS file (C027.heic) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify HEIFS metadata values against heifspMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFS_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFS_METADATA_0100";
      let result: boolean = true;
      let isSupportHEIFDecode: boolean = image.createImageSource(AppStorage.get('pathDir') + '/' + "test.jpg").supportedFormats.includes("image/heic");
      let keys: image.HeifsPropertyKey[] = Array.from(heifsMetadataMap.keys());
      if (!isSupportHEIFDecode) {
        console.info(`${testTag} device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      }
      const imageSourceApi = await getImageSource("C027.heic", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, heifsMetadataMap, "heifsMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} heifs metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
  
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_AVIS_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_AVIS_METADATA_0100
      * @tc.desc        Verify HEIFS metadata reading with default parameters
      *                 1.Create image source from AVIS file (bird_8bit_I420_599x359_fps10.avif) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify AVIS metadata values against avisMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_AVIS_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_AVIS_METADATA_0100";
      let result: boolean = true;
      let keys: image.AvisPropertyKey[] = Array.from(avisMetadataMap.keys());
      const imageSourceApi = await getImageSource("bird_8bit_I420_599x359_fps10.avif", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, avisMetadataMap, "avisMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} avis metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PNG_METADATA_0100
      * @tc.desc        Verify PNG metadata reading with default parameters
      *                 1.Create image source from PNG file (test_reladeMetadata.png) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify PNG metadata values against pngMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PNG_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_PNG_METADATA_0100";
      try {
        let keys: image.PngPropertyKey[] = Array.from(pngMetadataMap.keys());
        console.info(`${testTag} PNG metadata keys to read: ${keys}`);
        const ret = await verifyMetadataProperties(testTag, "test_reladeMetadata.png", "fd", "pngMetadata", keys, pngMetadataMap);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_0100
      * @tc.desc        Verify JFIF metadata reading with default parameters
      *                 1.Create image source from JFIF file (sample2.jfif) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify JFIF metadata values against jfifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_JFIF_METADATA_0100";
      try {
        let keys: image.JfifPropertyKey[] = Array.from(jfifMetadataMap.keys());
        console.info(`${testTag} JFIF metadata keys to read: ${keys}`);
        const ret = await verifyMetadataProperties(testTag, "sample2.jfif", "fd", "jfifMetadata", keys, jfifMetadataMap);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_0100
      * @tc.desc        Verify TIFF metadata reading with default parameters
      *                 1.Create image source from TIFF file (test.tiff) using fd
      *                 2.Read metadata using readImageMetadata()
      *                 3.Verify TIFF metadata values against tiffMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_TIFF_METADATA_0100";
      try {
        let keys: image.TiffPropertyKey[] = Array.from(tiffMetadataMap.keys());
        console.info(`${testTag} TIFF metadata keys to read: ${keys}`);
        const ret = await verifyMetadataProperties(testTag, "tiff_xmp.tiff", "fd", "tiffMetadata", keys, tiffMetadataMap);
        expect(ret).assertTrue();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_0100
      * @tc.desc        Verify Gif metadata reading by type with default parameters
     *                 1.Create image source from Gif file (test6.gif) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify Gif metadata values against gifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_GIF_METADATA_0100";
      let result: boolean = true;
      let keys: image.GifPropertyKey[] = Array.from(gifMetadataMap.keys());
      const imageSourceApi = await getImageSource("test6.gif", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, gifMetadataMap, "gifMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} gif metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_0100
      * @tc.desc        Verify HEIFS metadata reading by type with default parameters
     *                 1.Create image source from HEIFS file (C027.heic) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify HEIFS metadata values against heifsMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_HEIFS_METADATA_0100";
      let result: boolean = true;
      let isSupportHEIFDecode: boolean = image.createImageSource(AppStorage.get('pathDir') + '/' + "test.jpg").supportedFormats.includes("image/heic");
      let keys: image.HeifsPropertyKey[] = Array.from(heifsMetadataMap.keys());
      if (!isSupportHEIFDecode) {
        console.info(`${testTag} device is not support decode heif!`);
        expect(result).assertTrue();
        done();
        return;
      } 
      const imageSourceApi = await getImageSource("C027.heic", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, heifsMetadataMap, "heifsMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} heifs metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_0100
      * @tc.desc        Verify AVIS metadata reading by type with default parameters
     *                 1.Create image source from AVIS file (bird_8bit_I420_599x359_fps10.avif) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify AVIS metadata values against avisMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_AVIS_METADATA_0100";
      let result: boolean = true;
      console.info(`${testTag} result is: ${result}`);
      let keys: image.AvisPropertyKey[] = Array.from(avisMetadataMap.keys());
      console.info(`${testTag} keys is: ${keys}`);
      const imageSourceApi = await getImageSource("bird_8bit_I420_599x359_fps10.avif", "fd");
      console.info(`${testTag} imageSourceApi is: ${imageSourceApi}`);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyMultipleFramesMetadata(testTag, exifValue, keys, 0, avisMetadataMap, "avisMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} heifs metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_0100
      * @tc.desc        Verify PNG metadata reading by type with default parameters
     *                 1.Create image source from PNG file (test_reladeMetadata.png) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify PNG metadata values against pngMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_PNG_METADATA_0100";
      let result: boolean = true;
      let keys: image.PngPropertyKey[] = Array.from(pngMetadataMap.keys());
      const imageSourceApi = await getImageSource("test_reladeMetadata.png", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        console.info(`${testTag} exifValue is: ${exifValue}`);
        if (!verifyreadMetadataByType(testTag, exifValue, keys, 0, pngMetadataMap, "pngMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} png metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_0100
      * @tc.desc        Verify JFIF metadata reading by type with default parameters
     *                 1.Create image source from JFIF file (sample2.jfif) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify JFIF metadata values against jfifMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_JFIF_METADATA_0100";
      let result: boolean = true;
      let keys: image.JfifPropertyKey[] = Array.from(jfifMetadataMap.keys());
      const imageSourceApi = await getImageSource("sample2.jfif", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyreadMetadataByType(testTag, exifValue, keys, 0, jfifMetadataMap, "jfifMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} jfif metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_0100
      * @tc.desc        Verify TIFF metadata reading by type with default parameters
     *                 1.Create image source from TIFF file (test.tiff) using fd
      *                 2.Read metadata using readImageMetadataByType()
      *                 3.Verify TIFF metadata values against tiffMetadataMap at frame index 0
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_TIFF_METADATA_0100";
      let result: boolean = true;
      let keys: image.TiffPropertyKey[] = Array.from(tiffMetadataMap.keys());
      const imageSourceApi = await getImageSource("tiff_xmp.tiff", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadataByType();
        if (!verifyreadMetadataByType(testTag, exifValue, keys, 0, tiffMetadataMap, "tiffMetadata")) {
          result = false;
        }
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} tiff metadata readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

  });
}