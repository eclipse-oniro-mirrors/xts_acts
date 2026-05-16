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
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

interface GenericError {
  code?: number;
  message?: string;
}

interface metadataConfig {
  path: string;          // XMP路径，如 "xmp:title[1]"
  type: image.XMPTagType; // XMP标签类型
  value?: string        // 可选的值，部分类型可能不需要值
}

const READ_FAILED = 7700202;
const UNSUPPORTED_IMAGE_FORMATS = 7700102;
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

export default function imageXMPMetadata() {
  describe("imageXMPMetadata", () => {

    beforeAll(async () => {
      console.info("beforeAll case");
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
    
    const checkTagValue = (
      testNum: string,
      path: string,
      tagValueSet: image.XMPTag | null,
      xmpValue: string | null | number | undefined
    ): boolean => {
      if (tagValueSet != null && xmpValue != null) {
        console.info(`${testNum} getTag ${path}, value is: ${tagValueSet.value}`);
        return tagValueSet.value === xmpValue;
      } else if (tagValueSet == null && xmpValue == null) {
        console.info(`${testNum} getTag ${path} returned null as expected`);
        return true;
      }
      console.info(`${testNum} getTag ${path} returned null`);
      return false;
    }

    const verifyGetTag = async (
      testNum: string,
      fileName: string,
      type: string,
      path: string,
      xmpValue: string | null | number | undefined,
      index?: number
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type);
      try {
        const exifValue = index != null
          ? await imageSourceApi.readImageMetadata([], index)
          : await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          const tagValueSet = await exifValue.xmpMetadata!.getTag(path);
          console.info(`${testNum} getTag ${path}, value is: ${tagValueSet?.value}`);
          return checkTagValue(testNum, path, tagValueSet, xmpValue);
        }
        return true;
      } catch (error) {
        console.info(`${testNum} readImageMetadata getTag failed with errorCode: ${JSON.stringify(error)}`);
        return handleError(testNum, error as GenericError | Array<GenericError>, xmpValue as number);
      } finally {
        await imageSourceApi?.release();
      }
    }

    const verifyByTypeGetTag = async (
      testNum: string,
      fileName: string,
      type: string,
      path: string,
      xmpValue: string | null | number,
      index?: number
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type);
      try {
        const exifValue = index != null
          ? await imageSourceApi.readImageMetadataByType([image.MetadataType.XMP_METADATA], index)
          : await imageSourceApi.readImageMetadataByType([image.MetadataType.XMP_METADATA]);
        if (exifValue.xmpMetadata != null) {
          const tagValueSet = await exifValue.xmpMetadata!.getTag(path);
          return checkTagValue(testNum, path, tagValueSet, xmpValue);
        }
        return true;
      } catch (error) {
        console.info(`${testNum} readImageMetadata getTag failed with errorCode: ${JSON.stringify(error)}`);
        return handleError(testNum, error as GenericError | Array<GenericError>, xmpValue as number);
      } finally {
        await imageSourceApi?.release();
      }
    }

    const verifyWriteSetTag = async (
      testNum: string,
      fileName: string,
      type: string,
      path: string,
      xmpValue: string | null,
      index?: number
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type);
      try {
        const exifValue = index != null
          ? await imageSourceApi.readImageMetadata([], index)
          : await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          const tagValue = await exifValue.xmpMetadata!.getTag(path);
          console.info(`${testNum} before setValue getTag value is: ${tagValue?.value}`);
          await exifValue.xmpMetadata!.setValue(path, image.XMPTagType.STRING, xmpValue);
          console.info(`${testNum} setValue succeeded`);
        }
        const imageMetadata: image.ImageMetadata = {
          xmpMetadata: exifValue.xmpMetadata as image.XMPMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testNum} writeImageMetadata succeeded`);
        return true;
      } catch (error) {
        console.info(`${testNum} writeImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        return false;
      } finally {
        await imageSourceApi?.release();
      }
    }

    const verifySetValue = async (
      testNum: string,
      fileName: string,
      type: string,
      path: string,
      xmpType: image.XMPTagType,
      xmpValue: string | null
    ): Promise<boolean> => {
      const imageSourceApi = await getImageSource(fileName, type);
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          await exifValue.xmpMetadata!.setValue(path, xmpType, xmpValue);
          console.info(`${testNum} setValue ${path} to ${xmpValue} as expected, xmpType is ${xmpType}`);
          const tagValueSet = await exifValue.xmpMetadata!.getTag(path);
          return checkTagValue(testNum, path, tagValueSet, xmpValue);
        }
        return true;
      } catch (error) {
        console.info(`${testNum} readImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        return false;
      } finally {
        await imageSourceApi?.release();
      }
    }

    const createXmpMetadata = async (
      testNum: string,
      metadataConfigs: Array<metadataConfig>
    ): Promise<image.XMPMetadata | null> => {
      const xmpMetadata = new image.XMPMetadata();
      try {
        for (const config of metadataConfigs) {
          await xmpMetadata.setValue(config.path, config.type, config.value != null ? config.value : undefined);
        }
        console.info(`${testNum} setValue succeeded`);
        return xmpMetadata;
      } catch (error) {
        console.info(`${testNum} setValue failed with errorCode: ${JSON.stringify(error)}`);
        return null;
      }
    }

    const validateXmpMetadata = async (
      testNum: string,
      xmpMetadata: image.XMPMetadata | null,
      metadataConfigs: Array<metadataConfig>
    ): Promise<boolean> => {
      let ret = true;
      if (!xmpMetadata) {
        console.info(`${testNum} validateXmpMetadata failed: XMPMetadata is null`);
        ret = false;
      }
      for (const config of metadataConfigs) {
        try {
          const tagValue = await xmpMetadata!.getTag(config.path);
          if (tagValue === null) {
            ret = false;
            console.info(`${testNum} validateXmpMetadata failed: path=${config.path} getTag returned null (expected value: ${config.value}, expected type: ${config.type})`);
            continue;
          }
          const typeMatch = tagValue.type === config.type;
          const valueMatch = config.value === undefined ? tagValue.value === undefined : tagValue.value === config.value;
          if (typeMatch && valueMatch) {
            console.info(`${testNum} validateXmpMetadata success: path=${config.path}, value=${tagValue.value}, type=${tagValue.type}`);
          } else {
            ret = false;
            console.info(`${testNum} validateXmpMetadata failed: path=${config.path}`);
            console.info(`  expected - type: ${config.type}, value: ${config.value}`);
            console.info(`  actual   - type: ${tagValue.type}, value: ${tagValue.value}`);
          }
        } catch (error) {
          console.info(`${testNum} validateXmpMetadata getTag ${config.path} failed error : ${JSON.stringify(error)}`);
          ret = false;
        }
      }
      return ret;
    };

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0100
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "xmp:ModifyDate"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:ModifyDate";
      const xmpValue = "2018-10-27T16:20:29-05:00";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0200
     * @tc.desc        Verify setValue then getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata and set path "xmpRights:bool" to "12345"
     *                 3.Call getTag with path "xmpRights:bool"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0200";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmpRights:bool";
      const xmpValue = "12345";
      result = result && await verifySetValue(testTag, fileName, "fd", path, image.XMPTagType.STRING, xmpValue)
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0300
     * @tc.desc        Verify getTag returns expected XMP value for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "exif:ColorSpace"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0300";
      let result: boolean = true;
      const fileName = "png_xmp.png";
      const path = "exif:ColorSpace";
      const xmpValue = "65535";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0400
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "dc:format"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0400";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "dc:format";
      const xmpValue = "image/jpeg";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0500
     * @tc.desc        Verify getTag returns expected XMP value for PNG file
     *                 1.Create image source from PNG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "tiff:XResolution"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0500";
      let result: boolean = true;
      const fileName = "png_xmp.png";
      const path = "tiff:XResolution";
      const xmpValue = "300/1";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0600
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "crs:RawFileName"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0600";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:RawFileName";
      const xmpValue = "IMG_0918.CR2";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0700
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "crs:ToneCurve[1]"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0700";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:ToneCurve[1]";
      const xmpValue = "0, 0";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0800
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "xmpMM:History[1]/stEvt:action"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0800";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmpMM:History[1]/stEvt:action";
      const xmpValue = "derived";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0900
     * @tc.desc        Verify getTag returns expected XMP value for JPEG file
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "crs:Look/crs:Group[1]/?xml:lang"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_0900";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:Look/crs:Group[1]/?xml:lang";
      const xmpValue = "x-default";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0100
     * @tc.desc        Verify getTag returns null for a non-existing XMP path
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with non-existing path "crs:abc123abc"
     *                 4.Verify getTag returns null
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:abc123abc";
      const xmpValue = null;
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0200
     * @tc.desc        Verify getTag with invalid namespace prefix fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "abc123abc:ModifyDate"
     *                 4.Verify the returned error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0200";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "abc123abc:ModifyDate";
      const xmpValue = INVALID_PARAMETER;
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0300
     * @tc.desc        Verify getTag with invalid path format fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with invalid path "abc123def"
     *                 4.Verify the returned error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAG_PROMISE_ERROR_0300";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "abc123def";
      const xmpValue = INVALID_PARAMETER;
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // setValue test cases
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0100
     * @tc.desc        Verify creating XMP metadata with one STRING tag succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set path "xmp:name" with STRING value "lihua"
     *                 3.Get tag using getTag for configured path
     *                 4.Verify tag type and value match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0100";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:name", type: image.XMPTagType.STRING, value: "lihua" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0200
     * @tc.desc        Verify setting UNORDERED_ARRAY tags succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set root path as UNORDERED_ARRAY and set element values
     *                 3.Get tags for configured paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0200";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:UNORDERED_ARRAY", type: image.XMPTagType.UNORDERED_ARRAY },
        { path: "xmp:UNORDERED_ARRAY[1]", type: image.XMPTagType.STRING, value: "UNORDERED_ARRAY[1]" },
        { path: "xmp:UNORDERED_ARRAY[2]", type: image.XMPTagType.STRING, value: "UNORDERED_ARRAY[2]" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0300
     * @tc.desc        Verify setting nested ORDERED_ARRAY and UNORDERED_ARRAY tags succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set nested array paths with corresponding types and values
     *                 3.Get tags for configured nested paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0300";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:ORDERED_ARRAY", type: image.XMPTagType.ORDERED_ARRAY },
        { path: "xmp:ORDERED_ARRAY[1]", type: image.XMPTagType.ORDERED_ARRAY },
        { path: "xmp:ORDERED_ARRAY[1][1]", type: image.XMPTagType.STRING, value: "ORDERED_ARRAY[1][1]" },
        { path: "xmp:ORDERED_ARRAY[1][2]", type: image.XMPTagType.UNORDERED_ARRAY},
        { path: "xmp:ORDERED_ARRAY[1][2][1]", type: image.XMPTagType.STRING, value: "ORDERED_ARRAY[1][2][1]" },
        { path: "xmp:ORDERED_ARRAY[2]", type: image.XMPTagType.STRING, value: "ORDERED_ARRAY[2]" },
        { path: "xmp:ORDERED_ARRAY[3]", type: image.XMPTagType.STRING, value: "ORDERED_ARRAY[3]" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0400
     * @tc.desc        Verify setting ALTERNATE_ARRAY tags succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set root path as ALTERNATE_ARRAY and set element values
     *                 3.Get tags for configured paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0400";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:ALTERNATE_ARRAY", type: image.XMPTagType.ALTERNATE_ARRAY },
        { path: "xmp:ALTERNATE_ARRAY[1]", type: image.XMPTagType.STRING, value: "ALTERNATE_ARRAY[1]" },
        { path: "xmp:ALTERNATE_ARRAY[2]", type: image.XMPTagType.STRING, value: "ALTERNATE_ARRAY[2]" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0500
     * @tc.desc        Verify setting ALTERNATE_TEXT tags succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set root path as ALTERNATE_TEXT and set element values
     *                 3.Get tags for configured paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0500";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:ALTERNATE_TEXT", type: image.XMPTagType.ALTERNATE_TEXT },
        { path: "xmp:ALTERNATE_TEXT[1]", type: image.XMPTagType.STRING, value: "ALTERNATE_TEXT[1]" },
        { path: "xmp:ALTERNATE_TEXT[2]", type: image.XMPTagType.STRING, value: "ALTERNATE_TEXT[2]" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0600
     * @tc.desc        Verify setting STRUCTURE tags with child fields succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set structure root and child paths with corresponding types and values
     *                 3.Get tags for configured structure paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0600";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:STRUCTURE", type: image.XMPTagType.STRUCTURE },
        { path: "xmp:STRUCTURE/dc:coverage", type: image.XMPTagType.ORDERED_ARRAY },
        { path: "xmp:STRUCTURE/dc:coverage[1]", type: image.XMPTagType.STRING, value: "STRUCTURE coverage[1]" },
        { path: "xmp:STRUCTURE/dc:creator", type: image.XMPTagType.STRING, value: "STRUCTURE creator" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0700
     * @tc.desc        Verify setting tags with qualifier path succeeds
     *                 1.Create XMPMetadata object
     *                 2.Set base path and qualifier path values
     *                 3.Get tags for configured paths
     *                 4.Verify tag types and values match expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0700";
      let result: boolean = true;
      let configs: Array<metadataConfig> = [
        { path: "xmp:book", type: image.XMPTagType.STRING, value: "Illustrated Magazine"},
        { path: "xmp:book/?dc:author", type: image.XMPTagType.STRING, value: "Lihua" },
      ]

      const xmpMetadata = await createXmpMetadata(testTag, configs)
      result = result && await validateXmpMetadata(testTag, xmpMetadata, configs);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0800
     * @tc.desc        Verify modifying existing STRING tag value succeeds
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata and get current value of "xmp:ModifyDate"
     *                 3.Set "xmp:ModifyDate" to new STRING value "12345"
     *                 4.Verify the updated value can be read by getTag
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_0800";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:ModifyDate";
      const existingValue = "2018-10-27T16:20:29-05:00";
      const modifiedValue = "12345";
      const imageSourceApi = await getImageSource(fileName, "fd");
      const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
      if (exifValue.xmpMetadata != null) {
        let tagValueSet: image.XMPTag | null = await exifValue.xmpMetadata!.getTag(path);
        console.info(`${testTag} readImageMetadata getTag tagValueSet is: ${tagValueSet}`);
        result = result && tagValueSet!.value === existingValue;
        try {
          await exifValue.xmpMetadata!.setValue(path, image.XMPTagType.STRING, modifiedValue);
          console.info(`${testTag} readImageMetadata setValue modifiedValue is: ${modifiedValue}`);
          let tagValue: image.XMPTag | null = await exifValue.xmpMetadata!.getTag(path);
          result = result && tagValue!.value === modifiedValue;
        } catch (error) {
          console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
          result = false;
        }
      }
      console.info(`${testTag} readImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0100
     * @tc.desc        Verify setValue with invalid namespace prefix fails
     *                 1.Create XMPMetadata object
     *                 2.Call setValue with path "abc123abc:book1"
     *                 3.Catch the thrown error
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0100";
      let result: boolean = true;
      const path = "abc123abc:book1";
      const value = "testValue1";
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata.setValue(path, image.XMPTagType.STRING, value);
        console.info(`${testTag} setValue succeeded with invalid namespace prefix`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0200
     * @tc.desc        Verify setValue with invalid XMPTagType fails
     *                 1.Create XMPMetadata object
     *                 2.Call setValue with invalid type value 1000
     *                 3.Catch the thrown error
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0200";
      let result: boolean = true;
      const path = "xmp:book2";
      const value = "testValue2";
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata.setValue(path, 1000 as image.XMPTagType, value);
        console.info(`${testTag} setValue succeeded with invalid tag type.`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0300
     * @tc.desc        Verify setValue with invalid array index path fails
     *                 1.Create XMPMetadata object and set "xmp:book3" as ALTERNATE_ARRAY
     *                 2.Call setValue with path "xmp:book3[0]"
     *                 3.Catch the thrown error
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0300";
      let result: boolean = true;
      const path = "xmp:book3[0]";
      const value = "testValue3";
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      await xmpMetadata.setValue("xmp:book3", image.XMPTagType.ALTERNATE_ARRAY);
      try {
        await xmpMetadata.setValue(path, image.XMPTagType.STRING, value);
        console.info(`${testTag} setValue succeeded with invalid tag type`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0400
     * @tc.desc        Verify setting ALTERNATE_ARRAY with scalar value fails
     *                 1.Create XMPMetadata object
     *                 2.Call setValue with path "xmp:book4" and type ALTERNATE_ARRAY plus value
     *                 3.Catch the thrown error
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0400";
      let result: boolean = true;
      const path = "xmp:book4";
      const value = "testValue4";
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata.setValue(path, image.XMPTagType.ALTERNATE_ARRAY, value);
        console.info(`${testTag} setValue succeeded with invalid tag type`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0500
     * @tc.desc        Verify setting STRUCTURE with scalar value fails
     *                 1.Create XMPMetadata object
     *                 2.Call setValue with path "xmp:book5" and type STRUCTURE plus value
     *                 3.Catch the thrown error
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0500";
      let result: boolean = true;
      const path = "xmp:book5";
      const value = "testValue5";
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata.setValue(path, image.XMPTagType.STRUCTURE, value);
        console.info(`${testTag} setValue succeeded with invalid tag type`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0600
     * @tc.desc        Verify changing existing basic node to UNORDERED_ARRAY fails
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata and get path "xmp:ModifyDate"
     *                 3.Call setValue with type UNORDERED_ARRAY on the existing basic node
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0600";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:ModifyDate";
      const imageSourceApi = await getImageSource(fileName, "fd");
      const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
      if (exifValue.xmpMetadata != null) {
        try {
          await exifValue.xmpMetadata!.setValue(path, image.XMPTagType.UNORDERED_ARRAY);
          console.info(`${testTag} readImageMetadata setValue failed with invalid tag type`);
          result = false;
        } catch (error) {
          console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
          result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
        }
      }
      await imageSourceApi?.release();
      console.info(`${testTag} readImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0700
     * @tc.desc        Verify changing existing STRING field to STRUCTURE fails
     *                 1.Create image source from JPEG file using fd
     *                 2.Read image metadata and locate path "xmp:ModifyDate"
     *                 3.Call setValue with type STRUCTURE on existing STRING field
     *                 4.Verify the error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETVALUE_PROMISE_ERROR_0700";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:ModifyDate"; // 基础节点
      const imageSourceApi = await getImageSource(fileName, "fd");
      const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
      if (exifValue.xmpMetadata != null) {
        try {
          await exifValue.xmpMetadata!.setValue(path, image.XMPTagType.STRUCTURE);
          console.info(`${testTag} readImageMetadata setValue failed with invalid tag type`);
          result = false;
        } catch (error) {
          console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
          result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
        }
      }
      await imageSourceApi?.release();
      console.info(`${testTag} readImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // 下面的用例主要验证通过readImageMetadata接口读取XMP元数据后，调用getTag接口获取指定路径的标签值是否正确，覆盖JPEG、PNG、DNG、tiff和gif不同格式的图片。
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0100
     * @tc.desc        Verify readImageMetadata then getTag returns expected value for JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "crs:RetouchAreas[1]/crs:Masks[1]/crs:X"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:RetouchAreas[1]/crs:Masks[1]/crs:X";
      const xmpValue = "0.462732";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0200
     * @tc.desc        Verify readImageMetadata then getTag returns expected value for PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "crs:RetouchAreas[2]/crs:Masks[1]/crs:Y"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0200";
      let result: boolean = true;
      const fileName = "png_xmp.png";
      const path = "crs:RetouchAreas[2]/crs:Masks[1]/crs:Y";
      const xmpValue = "0.638788";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0300
     * @tc.desc        Verify readImageMetadata then getTag returns expected value for DNG
     *                 1.Create image source from DNG file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "xmpMM:History[2]/stEvt:when"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0300";
      let result: boolean = true;
      const fileName = "dng_xmp.dng";
      const path = "xmpMM:History[2]/stEvt:when";
      const xmpValue = "2018-10-27T16:20:29-05:00";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0400
     * @tc.desc        Verify readImageMetadata then getTag returns expected value for TIFF
     *                 1.Create image source from TIFF file using fd
     *                 2.Read XMP metadata using readImageMetadata API
     *                 3.Call getTag with path "xmpMM:History[2]/stEvt:instanceID"
     *                 4.Verify the returned value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0400";
      let result: boolean = true;
      const fileName = "tiff_xmp.tiff";
      const path = "xmpMM:History[2]/stEvt:instanceID";
      const xmpValue = "xmp.iid:abc418a3-fabe-459c-b377-19a400f19296";
      result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0500
     * @tc.desc        Verify readImageMetadata then getTag returns expected value for each GIF frame
     *                 1.Create image source from GIF file using fd and get frame count
     *                 2.Read XMP metadata for each frame using readImageMetadata API with index
     *                 3.Call getTag with path "xmpMM:History[1]/stEvt:action"
     *                 4.Verify each frame result matches expected value
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_GETTAG_PROMISE_0500";
      let result: boolean = true;
      const fileName = "3gif_xmp.gif";
      const path = "xmpMM:History[1]/stEvt:action";
      const xmpValue = "derived";
      const imageSourceApi = await getImageSource(fileName, "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      for (let i = 0; i < frameCount; i++) {
        result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue, i);
        console.info(`${testTag} readImageMetadata getTag result for frame ${i} is: ${result}`);
      }
      await imageSourceApi?.release();
      console.info(`${testTag} readImageMetadata getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // 下面的用例主要验证通过readImageMetadataByType接口读取XMP元数据后，调用getTag接口获取指定路径的标签值是否正确，覆盖JPEG、PNG、DNG、tiff和gif不同格式的图片。
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0100
     * @tc.desc        Verify readImageMetadataByType with index 0 then getTag returns expected value for JPEG
     *                 1.Create image source from JPEG file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA and index 0
     *                 3.Get target tag from xmpMetadata using getTag
     *                 4.Verify tag value equals expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:RetouchAreas[1]/crs:Masks[1]/crs:X";
      const xmpValue = "0.462732";
      result = result && await verifyByTypeGetTag(testTag, fileName, "fd", path, xmpValue, 0);
      console.info(`${testTag} readImageMetadataByType getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0200
     * @tc.desc        Verify readImageMetadataByType with index 0 then getTag returns expected value for PNG
     *                 1.Create image source from PNG file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA and index 0
     *                 3.Get target tag from xmpMetadata using getTag
     *                 4.Verify tag value equals expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0200";
      let result: boolean = true;
      const fileName = "png_xmp.png";
      const path = "crs:RetouchAreas[2]/crs:Masks[1]/crs:Y";
      const xmpValue = "0.638788";
      result = result && await verifyByTypeGetTag(testTag, fileName, "fd", path, xmpValue, 0);
      console.info(`${testTag} readImageMetadataByType getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0300
     * @tc.desc        Verify readImageMetadataByType then getTag returns expected value for DNG
     *                 1.Create image source from DNG file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA
     *                 3.Get target tag from xmpMetadata using getTag
     *                 4.Verify tag value equals expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0300";
      let result: boolean = true;
      const fileName = "dng_xmp.dng";
      const path = "xmpMM:History[2]/stEvt:when";
      const xmpValue = "2018-10-27T16:20:29-05:00";
      result = result && await verifyByTypeGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadataByType getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0400
     * @tc.desc        Verify readImageMetadataByType then getTag returns expected value for TIFF
     *                 1.Create image source from TIFF file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA
     *                 3.Get target tag from xmpMetadata using getTag
     *                 4.Verify tag value equals expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0400";
      let result: boolean = true;
      const fileName = "tiff_xmp.tiff";
      const path = "xmpMM:History[2]/stEvt:instanceID";
      const xmpValue = "xmp.iid:abc418a3-fabe-459c-b377-19a400f19296";
      result = result && await verifyByTypeGetTag(testTag, fileName, "fd", path, xmpValue);
      console.info(`${testTag} readImageMetadataByType getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0500
     * @tc.desc        Verify readImageMetadataByType then getTag returns expected value for each GIF frame
     *                 1.Create image source from GIF file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA for each frame index
     *                 3.Get target tag from xmpMetadata using getTag for each frame
     *                 4.Verify each frame value equals expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_0500";
      let result: boolean = true;
      const fileName = "3gif_xmp.gif";
      const path = "xmpMM:History[1]/stEvt:action";
      const xmpValue = "derived";
      const imageSourceApi = await getImageSource(fileName, "fd");
      let frameCount: number = await imageSourceApi.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      for (let i = 0; i < frameCount; i++) {
        result = result && await verifyByTypeGetTag(testTag, fileName, "fd", path, xmpValue, i);
        console.info(`${testTag} readImageMetadataByType getTag result for frame ${i} is: ${result}`);
      }
      await imageSourceApi?.release();
      console.info(`${testTag} readImageMetadataByType getTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_ERROR_0100
     * @tc.desc        Verify readImageMetadataByType fails for JPEG EXIF v2 file
     *                 1.Create image source from JPEG file using fd
     *                 2.Call readImageMetadataByType with XMP_METADATA
     *                 3.Catch the thrown error
     *                 4.Verify the error code is READ_FAILED
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATABYTYPE_GETTAG_PROMISE_ERROR_0100";
      let result: boolean = true;
      const fileName = "test_exif_v2.jpg";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        let exifValue = await imageSourceApi.readImageMetadataByType([image.MetadataType.XMP_METADATA]);
        console.info(`${testTag} readImageMetadataByType succeeded exifValue is: ${exifValue}`);
      } catch (error) {
        console.info(`${testTag} setValue exception: errorCode=${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, READ_FAILED);
      }
      await imageSourceApi?.release();
      console.info(`${testTag} readImageMetadataByType result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    
    // 下面的测试用例主要验证writeImageMetadata接口修改XMP元数据
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0100
     * @tc.desc        Verify writeImageMetadata modifies xmp:CreatorTool in JPEG metadata
     *                 1.Write xmp:CreatorTool="2" to jpeg_xmp.jpg through verifyWriteSetTag
     *                 2.Read metadata from the same file in fd mode
     *                 3.Get xmp:CreatorTool via verifyGetTag
     *                 4.Verify the returned value equals "2"
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:CreatorTool";
      const xmpValue = "2";
      try {
        result = result && await verifyWriteSetTag(testTag, fileName, "fd", path, xmpValue);
        result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      } catch (error) {
        console.info(`${testTag} writeImageMetadata failed with error: ${error}`);
        result = false;
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0200
     * @tc.desc        Verify writeImageMetadata modifies aux:LensInfo in PNG metadata
     *                 1.Write aux:LensInfo="123" to png_xmp.png through verifyWriteSetTag
     *                 2.Read metadata from the same file in fd mode
     *                 3.Get aux:LensInfo via verifyGetTag
     *                 4.Verify the returned value equals "123"
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0200";
      let result: boolean = true;
      const fileName = "png_xmp.png";
      const path = "aux:LensInfo";
      const xmpValue = "123";
      try {
        result = result && await verifyWriteSetTag(testTag, fileName, "fd", path, xmpValue);
        result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue);
      } catch (error) {
        console.info(`${testTag} writeImageMetadata failed with error: ${error}`);
        result = false;
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0300
     * @tc.desc        Verify writeImageMetadata modifies aux:LensID in GIF metadata with frame-aware write
     *                 1.Write aux:LensID="456" to 3gif_xmp.gif using write index 2
     *                 2.Read metadata from frame index 0 in fd mode
     *                 3.Get aux:LensID via verifyGetTag
     *                 4.Verify the returned value equals "456"
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0300";
      let result: boolean = true;
      const fileName = "3gif_xmp.gif";
      const path = "aux:LensID";
      const xmpValue = "456";
      try {
        result = result && await verifyWriteSetTag(testTag, fileName, "fd", path, xmpValue, 2);
        result = result && await verifyGetTag(testTag, fileName, "fd", path, xmpValue, 0);
      } catch (error) {
        console.info(`${testTag} writeImageMetadata failed with error: ${error}`);
        result = false;
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0400
     * @tc.desc        Verify writeImageMetadata writes ALTERNATE_ARRAY structure and keeps existing tags readable
     *                 1.Create XMP metadata containing xmp:ALTERNATE_ARRAY and two array items
     *                 2.Write the metadata to jpeg_xmp_v2.jpg through writeImageMetadata
     *                 3.Read metadata again and validate the configured paths and values
     *                 4.Verify xmp:ModifyDate can still be queried after writing
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0400";
      let result: boolean = true;
      const fileName = "jpeg_xmp_v2.jpg";
      let configs: Array<metadataConfig> = [
        { path: "xmp:ALTERNATE_ARRAY", type: image.XMPTagType.ALTERNATE_ARRAY },
        { path: "xmp:ALTERNATE_ARRAY[1]", type: image.XMPTagType.STRING, value: "ALTERNATE_ARRAY[1]" },
        { path: "xmp:ALTERNATE_ARRAY[2]", type: image.XMPTagType.STRING, value: "ALTERNATE_ARRAY[2]" },
      ]
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.XMPMetadata | null = await createXmpMetadata(testTag, configs);
        const imageMetadata: image.ImageMetadata = {
          xmpMetadata: xmpMetadata as image.XMPMetadata
        };        
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata succeeded`);

        const imageSourceApiGet = await getImageSource(fileName, "fd");
        let exifValue = await imageSourceApiGet.readImageMetadata();
        result = result && await validateXmpMetadata(testTag, exifValue.xmpMetadata!, configs);
        console.info(`${testTag} validateXmpMetadata result for ALTERNATE_ARRAY is: ${result}`);
        result = result && await verifyGetTag(testTag, fileName, "fd", "xmp:ModifyDate", undefined);
        console.info(`${testTag} verifyGetTag result for ModifyDate is: ${result}`);
        await imageSourceApiGet?.release();
      } catch (error) {
        console.info(`${testTag} writeImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0500
     * @tc.desc        Verify writeImageMetadata writes qualifier path data on test_exif_v2.jpg
     *                 1.Create XMP metadata containing xmp:bool_101 and xmp:bool_101/?dc:author101
     *                 2.Write metadata to test_exif_v2.jpg via writeImageMetadata
     *                 3.Read metadata from the same file in fd mode
     *                 4.Verify both configured paths match expected values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_0500";
      let result: boolean = true;
      const fileName = "test_exif_v2.jpg";
      let configs: Array<metadataConfig> = [
        { path: "xmp:bool_101", type: image.XMPTagType.STRING, value: "101" },
        { path: "xmp:bool_101/?dc:author101", type: image.XMPTagType.STRING, value: "author101" },
      ]
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.XMPMetadata | null = await createXmpMetadata(testTag, configs);
        const imageMetadata: image.ImageMetadata = {
          xmpMetadata: xmpMetadata!
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata succeeded`);

        const imageSourceApiGet = await getImageSource(fileName, "fd");
        let exifValue = await imageSourceApiGet.readImageMetadata();
        result = result && await validateXmpMetadata(testTag, exifValue.xmpMetadata!, configs);
        await imageSourceApiGet?.release();
      } catch (error) {
        console.info(`${testTag} writeImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0100
     * @tc.desc        Verify writeImageMetadata fails for DNG with unsupported image format
     *                 1.Create XMP metadata with xmp:bool_dng on dng_xmp.dng
     *                 2.Call writeImageMetadata with the new metadata
     *                 3.Catch thrown exception
     *                 4.Verify error code is UNSUPPORTED_IMAGE_FORMATS
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0100";
      let result: boolean = true;
      const fileName = "dng_xmp.dng";
      let configs: Array<metadataConfig> = [
        { path: "xmp:bool_dng", type: image.XMPTagType.STRING, value: "dng" },
      ]
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.XMPMetadata | null = await createXmpMetadata(testTag, configs);
        const imageMetadata: image.ImageMetadata = {
          xmpMetadata: xmpMetadata as image.XMPMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata succeeded`);
        result = false;
      } catch (error) {
        console.info(`${testTag} dng writeImageMetadata failed with errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0200
     * @tc.desc        Verify writeImageMetadata fails for TIFF with unsupported image format
     *                 1.Create XMP metadata with xmp:bool_tiff on tiff_xmp.tiff
     *                 2.Call writeImageMetadata with the new metadata
     *                 3.Catch thrown exception
     *                 4.Verify error code is UNSUPPORTED_IMAGE_FORMATS
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_WRITEIMAGEMETADATA_PROMISE_ERROR_0200";
      let result: boolean = true;
      const fileName = "tiff_xmp.tiff";
      let configs: Array<metadataConfig> = [
        { path: "xmp:bool_tiff", type: image.XMPTagType.STRING, value: "tiff" },
      ]
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.XMPMetadata | null = await createXmpMetadata(testTag, configs);
        const imageMetadata: image.ImageMetadata = {
          xmpMetadata: xmpMetadata as image.XMPMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(`${testTag} writeImageMetadata succeeded`);
        result = false;
      } catch (error) {
        console.info(`${testTag} tiff writeImageMetadata failed with errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_IMAGE_FORMATS);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeImageMetadata setValue result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // registerXMPNamespace(xmlns: string, prefix: string): Promise<void>;
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_PROMISE_0100
     * @tc.desc        Verify registerXMPNamespace succeeds and custom prefix can be used by setValue/getTag
     *                 1.Register namespace uri http://mylibrary.com/story/1.0/ with prefix library
     *                 2.Set library:book1 as STRING with value "One Hundred Years of Solitude"
     *                 3.Get library:book1 from XMP metadata
     *                 4.Verify the returned value matches expected text
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_PROMISE_0100";
      let result: boolean = true;
      let xmpNamespace: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library"
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata?.registerXMPNamespace(xmpNamespace);
        console.log(`${testTag}: registerXMPNamespace Success! myUri: ${xmpNamespace.uri}, myPrefix: ${xmpNamespace.prefix}`);

        await xmpMetadata?.setValue(`${xmpNamespace.prefix}:book1`, image.XMPTagType.STRING, "One Hundred Years of Solitude");
        let tagValueSet: image.XMPTag | null = await xmpMetadata?.getTag(`${xmpNamespace.prefix}:book1`);
        result = result && checkTagValue(testTag, `${xmpNamespace.prefix}:book1`, tagValueSet, "One Hundred Years of Solitude");
      } catch (error) {
        console.info(`${testTag} registerXMPNamespace failed. errorCode: ${JSON.stringify(error)}`);
        result = false;
      }
      console.info(`${testTag} registerXMPNamespace result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0100
     * @tc.desc        Verify registerXMPNamespace rejects duplicate uri with different prefix
     *                 1.Register uri http://mylibrary.com/story/1.0/ with prefix library1
     *                 2.Register the same uri with another prefix library2
     *                 3.Catch thrown exception from second registration
     *                 4.Verify error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0100";
      let result: boolean = true;
      let xmpNamespace1: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library1"
      }
      let xmpNamespace2: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library2"
      }
      const xmpMetadata = new image.XMPMetadata();
      try {
        await xmpMetadata.registerXMPNamespace(xmpNamespace1);
        console.log(`${testTag}: registerXMPNamespace 1 Success! myUri: ${xmpNamespace1.uri}, myPrefix: ${xmpNamespace1.prefix}`);
        await xmpMetadata.registerXMPNamespace(xmpNamespace2);
        console.log(`${testTag}: registerXMPNamespace 2 Success! myUri: ${xmpNamespace2.uri}, myPrefix: ${xmpNamespace2.prefix}`);
        result = false; // 已经注册了的uri再次和一个未注册过的prefix时，后注册的会失败
      } catch (error) {
        console.info(`${testTag} registerXMPNamespace failed. errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} registerXMPNamespace result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0200
     * @tc.desc        Verify registerXMPNamespace rejects duplicate prefix with different uri
     *                 1.Register uri http://mylibrary.com/story/1.0/ with prefix library1
     *                 2.Register another uri http://mylibrary.com/story/2.0/ with the same prefix
     *                 3.Catch thrown exception from second registration
     *                 4.Verify error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0200";
      let result: boolean = true;
      let xmpNamespace1: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library1"
      }
      let xmpNamespace2: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/2.0/",
        prefix: "library1"
      }
      const xmpMetadata = new image.XMPMetadata();
      try {
        await xmpMetadata.registerXMPNamespace(xmpNamespace1);
        console.log(`${testTag}: registerXMPNamespace 1 Success! myUri: ${xmpNamespace1.uri}, myPrefix: ${xmpNamespace1.prefix}`);
        await xmpMetadata.registerXMPNamespace(xmpNamespace2);
        console.log(`${testTag}: registerXMPNamespace 2 Success! myUri: ${xmpNamespace2.uri}, myPrefix: ${xmpNamespace2.prefix}`);
        result = false; // 已经注册了的prefix再次和一个未注册过的uri时，后注册的会失败
      } catch (error) {
        console.info(`${testTag} registerXMPNamespace failed. errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} registerXMPNamespace result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0300
     * @tc.desc        Verify registerXMPNamespace rejects mixed duplicate mapping after multiple registrations
     *                 1.Register library1->story/1.0 and library2->story/2.0 successfully
     *                 2.Register story/1.0 again with prefix library2
     *                 3.Catch thrown exception from conflicting registration
     *                 4.Verify error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0300";
      let result: boolean = true;
      let xmpNamespace1: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library1"
      }
      let xmpNamespace2: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/2.0/",
        prefix: "library2"
      }
      let xmpNamespace3: image.XMPNamespace = {
        uri: "http://mylibrary.com/story/1.0/",
        prefix: "library2"
      }
      const xmpMetadata = new image.XMPMetadata();
      try {
        await xmpMetadata.registerXMPNamespace(xmpNamespace1);
        console.log(`${testTag}: registerXMPNamespace 1 Success! myUri: ${xmpNamespace1.uri}, myPrefix: ${xmpNamespace1.prefix}`);
        await xmpMetadata.registerXMPNamespace(xmpNamespace2);
        console.log(`${testTag}: registerXMPNamespace 2 Success! myUri: ${xmpNamespace2.uri}, myPrefix: ${xmpNamespace2.prefix}`);
        await xmpMetadata.registerXMPNamespace(xmpNamespace3);
        console.log(`${testTag}: registerXMPNamespace 3 Success! myUri: ${xmpNamespace3.uri}, myPrefix: ${xmpNamespace3.prefix}`);
        result = false; // 使用注册过的prefix但不同的uri时，注册会失败
      } catch (error) {
        console.info(`${testTag} registerXMPNamespace failed. errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} registerXMPNamespace result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0400
     * @tc.desc        Verify registerXMPNamespace rejects invalid namespace uri format
     *                 1.Create XMP metadata instance and prepare uri abc456defg with prefix library
     *                 2.Call registerXMPNamespace with the invalid uri
     *                 3.Catch thrown exception
     *                 4.Verify error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REGISTERXMPNAMESPACE_ERROR_0400";
      let result: boolean = true;
      let xmpNamespace1: image.XMPNamespace = {
        uri: "abc456defg",
        prefix: "library",
      }
      let xmpMetadata: image.XMPMetadata | null = new image.XMPMetadata();
      try {
        await xmpMetadata?.registerXMPNamespace(xmpNamespace1);
        console.log(`${testTag}: registerXMPNamespace Success! myUri: ${xmpNamespace1.uri}, myPrefix: ${xmpNamespace1.prefix}`);
        result = false; // 非法的URI应该注册失败
      } catch (error) {
        console.info(`${testTag} registerXMPNamespace failed. errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} registerXMPNamespace result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // removeTag(path: string): Promise<void>;
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_0100
     * @tc.desc        Verify removeTag deletes existing crs:CropRight from JPEG metadata
     *                 1.Read jpeg_xmp.jpg metadata and check crs:CropRight initial value is "1"
     *                 2.Call removeTag on crs:CropRight
     *                 3.Call getTag for crs:CropRight after removal
     *                 4.Verify getTag returns null
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:CropRight";
      const xmpValue = "1";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          const tagValueSet = await exifValue.xmpMetadata!.getTag(path);
          result = checkTagValue(testTag, path, tagValueSet, xmpValue);
          await exifValue.xmpMetadata!.removeTag(path);
          const tagValueGet = await exifValue.xmpMetadata!.getTag(path);
          console.info(`${testTag} removeTag ${path} value is: ${tagValueGet}`);
          if (tagValueGet !== null) {
            console.error(`${testTag} removeTag ${path} value is not expected`);
            result = false;
          }
        }
      } catch (error) {
        console.info(`${testTag} readImageMetadata setValue failed with errorCode: ${JSON.stringify(error)}`);
        result = false;
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} writeXMPMetadata result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0100
     * @tc.desc        Verify removeTag can be called repeatedly on the same existing path
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and remove an existing XMP tag
     *                 3.Call removeTag again for the same path
     *                 4.Verify getTag returns null
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0100";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "crs:CropRight";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          await exifValue.xmpMetadata!.removeTag(path);
          console.info(`${testTag} removeTag Success once, ${path}`);
          await exifValue.xmpMetadata!.removeTag(path);
          console.info(`${testTag} removeTag Success twice, ${path}`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} removeTag failed with errorCode: ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} removeTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0200
     * @tc.desc        Verify removeTag for a non-existing path fails with XMP_DECODE_FAILED
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call removeTag for a non-existing path
     *                 3.Verify the error code is 7600602 (XMP_DECODE_FAILED)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_ERROR_0200";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "xmp:not_exist_path";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          await exifValue.xmpMetadata!.removeTag(path);
          console.info(`${testTag} removeTag succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} removeTag exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} removeTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0300
     * @tc.desc        Verify removeTag for a non-existing xmlns path fails with XMP_DECODE_FAILED
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call removeTag for path "不存在的xmlns:CropRight"
     *                 3.Verify the error code is 7600602 (XMP_DECODE_FAILED)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0300";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "1231465:CropRight";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          await exifValue.xmpMetadata!.removeTag(path);
          console.info(`${testTag} removeTag succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} removeTag exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} removeTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0400
     * @tc.desc        Verify removeTag for invalid path "abc123def" fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call removeTag for path "abc123def"
     *                 3.Verify the error code is 7600206 (INVALID_PARAMETER)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_REMOVETAG_PROMISE_ERROR_0400";
      let result: boolean = true;
      const fileName = "jpeg_xmp.jpg";
      const path = "abc123def";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (exifValue.xmpMetadata != null) {
          await exifValue.xmpMetadata!.removeTag(path);
          console.info(`${testTag} removeTag succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} removeTag exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} removeTag result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    // enumerateTags(
    //     callback: (path: string, tag: XMPTag) => boolean,
    //     rootPath?: string,
    //     options?: XMPEnumerateOptions
    // ): void;
    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0100
     * @tc.desc        Verify enumerateTags counts all recursive tags in jpeg_xmp.jpg
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 272
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0100";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 272);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0200
     * @tc.desc        Verify enumerateTags counts all recursive tags in png_xmp.png
     *                 1.Read metadata from png_xmp.png in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 314
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0200";
      const fileName: string = "png_xmp.png";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 314);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0300
     * @tc.desc        Verify enumerateTags counts all recursive tags in dng_xmp.dng
     *                 1.Read metadata from dng_xmp.dng in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 271
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0300";
      const fileName: string = "dng_xmp.dng";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 271);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0400
     * @tc.desc        Verify enumerateTags counts all recursive tags in tiff_xmp.tiff
     *                 1.Read metadata from tiff_xmp.tiff in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 271
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0400";
      const fileName: string = "tiff_xmp.tiff";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 271);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0500
     * @tc.desc        Verify enumerateTags counts all recursive tags in 3gif_xmp.gif frame 0
     *                 1.Read metadata from 3gif_xmp.gif with index 0 in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: false }
     *                 3.Count callback invocations for all traversed paths
     *                 4.Verify the total tag count equals 314
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0500";
      const fileName: string = "3gif_xmp.gif";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata([], 0);
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 314);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0600
     * @tc.desc        Verify enumerateTags with rootPath undefined and isRecursive false traverses one-level root tags
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call enumerateTags with rootPath undefined and options { isRecursive: false }
     *                 3.Print path and XMPTag value in callback
     *                 4.Verify one-level tag count equals expected count
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0600";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath: string | undefined = undefined;
      const options: image.XMPEnumerateOptions = { isRecursive: false, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true;
          }, rootPath, options);

          result = result && (tagCount == 147);
          console.info(`${testTag} tagCount=${tagCount}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0700
     * @tc.desc        Verify enumerateTags without rootPath and options traverses one-level root tags
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call enumerateTags without rootPath and options
     *                 3.Print path and XMPTag value in callback
     *                 4.Verify one-level tag count equals expected count
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0700";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true;
          });

          result = result && (tagCount == 147);
          console.info(`${testTag} tagCount=${tagCount}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0800
     * @tc.desc        Verify enumerateTags with rootPath crs:ToneCurve and recursive true traverses all array elements
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call enumerateTags with rootPath "crs:ToneCurve" and options { isRecursive: true }
     *                 3.Print path and XMPTag value in callback
     *                 4.Verify array values are consistent with expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0800";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "crs:ToneCurve";
      const options: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const expectedItem1Value = "0, 0";
      const expectedItem2Value = "255, 255";
      let toneCurveItem1Value = "";
      let toneCurveItem2Value = "";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            console.log(`${testTag}: Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            if (path === `${rootPath}[1]`) {
              toneCurveItem1Value = `${tag.value}`;
            }
            if (path === `${rootPath}[2]`) {
              toneCurveItem2Value = `${tag.value}`;
            }
            return true;
          }, rootPath, options);
          result = result && (toneCurveItem1Value === expectedItem1Value)
            && (toneCurveItem2Value === expectedItem2Value);
          console.info(`${testTag} item1=${toneCurveItem1Value}, item2=${toneCurveItem2Value}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0900
     * @tc.desc        Verify enumerateTags with onlyQualifier=true returns qualifier entries only
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call enumerateTags with options { isRecursive: true, onlyQualifier: true }
     *                 3.Count callback invocations for returned paths
     *                 4.Verify the total tag count equals 1
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_0900";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : true };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          let tagCount = 0;
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true; // 继续枚举`
          }, undefined, isRecursive);
          result = result && (tagCount == 1);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} enumerateTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} readImageMetadata enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0100
     * @tc.desc        Verify enumerateTags with invalid rootPath abcabc fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call enumerateTags with invalid rootPath "abcabc"
     *                 3.Verify the error code is 7600206 (INVALID_PARAMETER)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0100";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "abcabc";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            console.log(`${testTag}: Path: ${path}, Namespace: ${tag.xmpNamespace.uri}, Prefix: ${tag.xmpNamespace.prefix}, Name: ${tag.name}, Type: ${tag.type}, Value: ${tag.value}`);
            return true;
          }, rootPath);
          console.info(`${testTag} enumerateTags succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} enumerateTags exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0200
     * @tc.desc        Verify enumerateTags with unregistered namespace rootPath abc123abc:CropRight fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call enumerateTags with rootPath "abc123abc:CropRight"
     *                 3.Verify the error code is 7600603 (INVALID_PARAMETER)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_READIMAGEMETADATA_ENUMERATETAGS_ERROR_0200";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "abc123abc:CropRight";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpValue.xmpMetadata != null) {
          xmpValue.xmpMetadata.enumerateTags((path: string, tag: image.XMPTag): boolean => {
            console.log(`${testTag}: Path: ${path}, Value: ${tag.value}`);
            return true;
          }, rootPath);
          console.info(`${testTag} enumerateTags succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} enumerateTags exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} enumerateTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0100
     * @tc.desc        Verify getTags returns full recursive tag map for jpeg_xmp.jpg
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call getTags(undefined, { isRecursive: true, onlyQualifier: false })
     *                 3.Iterate returned tag record and count all entries
     *                 4.Verify the total tag count equals 272
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0100";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          let tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(undefined, isRecursive);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
            
          }
          result = result && (tagCount == 272);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0200
     * @tc.desc        Verify getTags returns full recursive tag map for png_xmp.png
     *                 1.Read metadata from png_xmp.png in fd mode
     *                 2.Call getTags(undefined, { isRecursive: true, onlyQualifier: false })
     *                 3.Iterate returned tag record and count all entries
     *                 4.Verify the total tag count equals 314
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0200";
      const fileName: string = "png_xmp.png";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          let tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(undefined, isRecursive);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
            
          }
          result = result && (tagCount == 314);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0300
     * @tc.desc        Verify getTags returns full recursive tag map for dng_xmp.dng
     *                 1.Read metadata from dng_xmp.dng in fd mode
     *                 2.Call getTags(undefined, { isRecursive: true, onlyQualifier: false })
     *                 3.Iterate returned tag record and count all entries
     *                 4.Verify the total tag count equals 271
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0300";
      const fileName: string = "dng_xmp.dng";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          let tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(undefined, isRecursive);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
            
          }
          result = result && (tagCount == 271);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0400
     * @tc.desc        Verify getTags returns full recursive tag map for tiff_xmp.tiff
     *                 1.Read metadata from tiff_xmp.tiff in fd mode
     *                 2.Call getTags(undefined, { isRecursive: true, onlyQualifier: false })
     *                 3.Iterate returned tag record and count all entries
     *                 4.Verify the total tag count equals 271
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0400";
      const fileName: string = "tiff_xmp.tiff";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          let tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(undefined, isRecursive);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
            
          }
          result = result && (tagCount == 271);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0500
     * @tc.desc        Verify getTags returns full recursive tag map for 3gif_xmp.gif frame 0
     *                 1.Read metadata from 3gif_xmp.gif with index 0 in fd mode
     *                 2.Call getTags(undefined, { isRecursive: true, onlyQualifier: false })
     *                 3.Iterate returned tag record and count all entries
     *                 4.Verify the total tag count equals 314
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0500";
      const fileName: string = "3gif_xmp.gif";
      let result: boolean = true;
      const isRecursive: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata([], 0);
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          let tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(undefined, isRecursive);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
            
          }
          result = result && (tagCount == 314);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0600
     * @tc.desc        Verify getTags with rootPath undefined and isRecursive false traverses one-level root tags
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with rootPath undefined and options { isRecursive: false }
     *                 3.Print path and XMPTag value
     *                 4.Verify one-level tag count equals expected count
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0600";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath: string | undefined = undefined;
      const options: image.XMPEnumerateOptions = { isRecursive: false, onlyQualifier : false };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          const tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(rootPath, options);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
          }
          result = result && (tagCount == 147);
          console.info(`${testTag} tagCount=${tagCount}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0700
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0700
     * @tc.desc        Verify getTags without rootPath and options traverses one-level root tags
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags without rootPath and options
     *                 3.Print path and XMPTag value
     *                 4.Verify one-level tag count equals expected count
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0700", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0700";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          const tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags();
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
          }
          result = result && (tagCount == 147);
          console.info(`${testTag} tagCount=${tagCount}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0800
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0800
     * @tc.desc        Verify getTags with rootPath crs:ToneCurve and recursive true traverses all array elements
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with rootPath "crs:ToneCurve" and options { isRecursive: true }
     *                 3.Print path and XMPTag value
     *                 4.Verify array values are consistent with expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0800", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0800";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "crs:ToneCurve";
      const options: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : false };
      const expectedRootValue = undefined;
      const expectedItem1Value = "0, 0";
      const expectedItem2Value = "255, 255";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          const tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(rootPath, options);
          for (const entry of Object.entries(tagRecord)) {
            console.log(`${testTag}: Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri}, Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
          }
          result = result && (tagRecord[rootPath]?.value === expectedRootValue)
            && (tagRecord[`${rootPath}[1]`]?.value === expectedItem1Value)
            && (tagRecord[`${rootPath}[2]`]?.value === expectedItem2Value);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0900
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0900
     * @tc.desc        Verify getTags with rootPath undefined and isRecursive false traverses one-level root tags
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with rootPath undefined and options { isRecursive: false }
     *                 3.Print path and XMPTag value
     *                 4.Verify one-level tag count equals expected count
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0900", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_0900";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath: string | undefined = undefined;
      const options: image.XMPEnumerateOptions = { isRecursive: true, onlyQualifier : true };
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          let tagCount = 0;
          const tagRecord: Record<string, image.XMPTag> = await xmpMetadata.xmpMetadata.getTags(rootPath, options);
          for (const entry of Object.entries(tagRecord)) {
            tagCount++;
            console.log(`${testTag}: [${tagCount}] Path: ${entry[0]}, Namespace: ${entry[1].xmpNamespace.uri},
              Prefix: ${entry[1].xmpNamespace.prefix}, Name: ${entry[1].name}, Type: ${entry[1].type}, Value: ${entry[1].value}`);
          }
          result = result && (tagCount == 1);
          console.info(`${testTag} tagCount=${tagCount}`);
        }
      } catch (error) {
        result = false;
        console.info(`${testTag} getTags failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0100
     * @tc.desc        Verify getTags with invalid rootPath abc123abc fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with invalid rootPath "abc123abc"
     *                 3.Verify the error code is 7600206 (INVALID_PARAMETER)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0100";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "abcabc";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          await xmpMetadata.xmpMetadata.getTags(rootPath);
          console.info(`${testTag} getTags succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} getTags exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0200
     * @tc.desc        Verify getTags with unregistered namespace rootPath abc123abc:CropRight fails with INVALID_PARAMETER
     *                 1.Create image source from JPEG file using fd
     *                 2.Read metadata and call getTags with rootPath "abc123abc:CropRight"
     *                 3.Verify the error code is 7600603 (INVALID_PARAMETER)
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETTAGS_PROMISE_ERROR_0200";
      const fileName: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const rootPath = "abc123abc:CropRight";
      const imageSourceApi = await getImageSource(fileName, "fd");
      try {
        const xmpMetadata: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        if (xmpMetadata.xmpMetadata != null) {
          await xmpMetadata.xmpMetadata.getTags(rootPath);
          console.info(`${testTag} getTags succeeded unexpectedly`);
          result = false;
        }
      } catch (error) {
        console.info(`${testTag} getTags exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getTags result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0100
     * @tc.desc        Verify getBlob returns JPEG XMP raw packet with expected byte length
     *                 1.Read metadata from jpeg_xmp.jpg in fd mode
     *                 2.Call xmpMetadata.getBlob()
     *                 3.Check returned blob is not undefined
     *                 4.Verify blob byteLength equals 18349
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0100";
      const fileNameJpg: string = "jpeg_xmp.jpg";
      let result: boolean = true;
      const imageSourceApi = await getImageSource(fileNameJpg, "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata();
        let xmpBlobJpg: ArrayBuffer | undefined = await exifValue.xmpMetadata?.getBlob();
        console.info(`${testTag} getBlob xmpBlobJpg?.byteLength is: ${xmpBlobJpg?.byteLength}`);
        result = result && xmpBlobJpg != undefined && (xmpBlobJpg?.byteLength == 18349);
      } catch (error) {
        result = false;
        console.info(`${testTag} getBlob failed with errorCode: ${JSON.stringify(error)}`);
      } finally {
        await imageSourceApi?.release();
      }
      console.info(`${testTag} getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0200
     * @tc.desc        Verify getBlob on a newly created XMPMetadata returns a valid default packet
     *                 1.Create an empty XMPMetadata instance
     *                 2.Call getBlob on the instance
     *                 3.Check returned blob is not undefined
     *                 4.Verify blob byteLength equals 196
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_GETBOLB_PROMISE_0200";
      let result: boolean = true;
      const xmpMetadata = new image.XMPMetadata();
      try {
        const xmpArrayBuffer = await xmpMetadata.getBlob();
        console.info(`${testTag} getBlob succeeded unexpectedly. Blob length: ${xmpArrayBuffer.byteLength}`);
        result = result && xmpArrayBuffer != undefined && (xmpArrayBuffer?.byteLength == 196);
      } catch (error) {
        result = false;
        console.info(`${testTag} getBlob failed with errorCode: ${JSON.stringify(error)}`);
      }
      console.info(`${testTag} getBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_PROMISE_0100
     * @tc.desc        Verify setBlob imports JPEG XMP packet into PNG metadata and getBlob returns identical content
     *                 1.Read xmp blob from jpeg_xmp.jpg
     *                 2.Read metadata from png_xmp.png and call setBlob with JPEG blob
     *                 3.Call getBlob from the updated png xmpMetadata
     *                 4.Verify source and target blobs are byte-by-byte equal
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_PROMISE_0100";
      const fileNameJpg: string = "jpeg_xmp.jpg";
      const fileNamePng: string = "png_xmp.png";
      let result: boolean = true;
      const imageSourceApi = await getImageSource(fileNameJpg, "fd");
      const exifValueJpg: image.ImageMetadata = await imageSourceApi.readImageMetadata();
      let xmpBlobJpg: ArrayBuffer | undefined = await exifValueJpg.xmpMetadata?.getBlob();
      await imageSourceApi?.release();
      if (xmpBlobJpg != undefined) {
        try {
          const imageSourceApiGet = await getImageSource(fileNamePng, "fd");
          let exifValuePng = await imageSourceApiGet.readImageMetadata();
          await exifValuePng.xmpMetadata?.setBlob(xmpBlobJpg);
          await imageSourceApiGet?.release();
          let xmpBlobPng = await exifValuePng.xmpMetadata!.getBlob();
          result = result && compareArrayBuffer(xmpBlobPng, xmpBlobJpg);
        } catch (error) {
          result = false;
          console.info(`${testTag} setBlob failed`);
        }
      }
      console.info(`${testTag} getBlob setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_ERROR_0100
     * @tc.desc        Verify setBlob rejects empty array buffer input
     *                 1.Create an empty ArrayBuffer with length 0
     *                 2.Call setBlob on a new XMPMetadata instance
     *                 3.Catch thrown exception
     *                 4.Verify error code is INVALID_PARAMETER
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_XMPMETADATA_SETBLOBANDGETBOLB_ERROR_0100";
      let result: boolean = true;
      const emptyArrayBuffer: ArrayBuffer = new ArrayBuffer(0);
      const xmpMetadata = new image.XMPMetadata();
      try {
        await xmpMetadata.setBlob(emptyArrayBuffer);
        console.info(`${testTag} setBlob succeeded unexpectedly`);
        result = false;
      } catch (error) {
        console.info(`${testTag} setBlob exception: errorCode = ${JSON.stringify(error)}`);
        result = handleError(testTag, error as GenericError | Array<GenericError>, INVALID_PARAMETER);
      }
      console.info(`${testTag} getBlob setBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });
    
  });
}
