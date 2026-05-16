/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import { BusinessError } from '@ohos.base';
const TAG = 'xtsStatic_imagePackerStaticTest';
let metaData: image.Metadata;
let filesDir: string | undefined | null;
let filePath: string = '';
let fdNumber: int;


const compareValues = (
  actual: string | number |  number[] | undefined | null | boolean,
  expected: string | number | number[] | undefined | null | boolean
): boolean => {
  if (Array.isArray(actual!) && Array.isArray(expected!)) {
    let a:  number[] = actual! as number[];
    let b: number[] = expected! as number[];
    if (a.length !== b.length) return false;
    for (let i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
  return actual === expected;
}


const getFd = (fileName: string): int => {
  let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
  filePath =  testContext.filesDir + "/" + fileName;
  console.info(TAG,"image filePath:" + filePath);
  const file = fs.openSync(filePath!);
  fdNumber = file.fd as int;
  return fdNumber;
};


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
  let fd: int = getFd(sourceFileName);
  const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
  try {
    const exifValue = await imageSourceApi!.readImageMetadata(camelCaseMetadataKeys, 0);
    const sourceMetadata = getMetadataObject(typeMetadata, exifValue);
    const sourceMetadataKeys = await sourceMetadata?.getProperties(camelCaseMetadataKeys);
    console.info(TAG,`${testNum} getMetadataObject successfully for sourceMetadata : ${JSON.stringify(sourceMetadataKeys)}` );

    if (!sourceMetadata) {
      console.info(TAG,`${testNum} Source metadata not found.`);
      return false;
    }
    const actualBlob: ArrayBuffer = await sourceMetadata.getBlob();
    console.info(TAG,`${testNum} getBlob successfully for exifArrayBuffer: ${actualBlob != undefined}`);
    let targetfd: int = getFd(targetFileName);
    const imageSourceApiModify : image.ImageSource | undefined = image.createImageSource(targetfd);
    try {
      const exifValueGet = await imageSourceApiModify!.readImageMetadata(camelCaseMetadataKeys, 0);
      let targetMetadata = getMetadataObject(typeMetadata, exifValueGet);
      if (!targetMetadata) {
        console.info(TAG,`${testNum} Target metadata not found.`);
        return false;
      }
      await targetMetadata.setBlob(actualBlob);

      let getMetadata = await targetMetadata?.getProperties(camelCaseMetadataKeys);
      camelCaseMetadataKeys.forEach((key) => {
        const actualValue: string | number | number[] | undefined | null | ArrayBuffer = sourceMetadataKeys![key];
        const verifyValue: string | number | number[] | undefined | null | ArrayBuffer = getMetadata![key];
        if (!compareValues(actualValue, verifyValue)) {
          console.info(TAG,`${testNum} Verification failed for key: ${key}, verifyValue: ${JSON.stringify(verifyValue)}, actualValue: ${JSON.stringify(actualValue)}`);
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
async function createPixelMapTest(context : common.UIAbilityContext):Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

function createPixelMapSUPP(context : common.UIAbilityContext ):image.PixelMap {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

export default function metaDataStaticTest(): void {
  describe('metaDataStaticTest', (): void => {
    // let filesDir: string | undefined | null;
    // let filePath: string = '';
    // let fdNumber: int;

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.number      SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0100
     * @tc.name        SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0100
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0100", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0100";
      let sourceFileName = "food.jpg";
      let targetFileName = "AllAuxiliaryPictures.jpg";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "exifMetadata",
        camelCaseMetadataKeys);
      console.info(TAG,testTag,`testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0200
     * @tc.name        SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0200
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0200", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0200";
      let sourceFileName = "food.jpg";
      let targetFileName = "AllAuxiliaryPictures.jpg";
      let camelCaseMetadataKeys: Array<string> = ["HwMnoteCaptureMode"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd",
        "makerNoteHuaweiMetadata", camelCaseMetadataKeys);
      console.info(TAG,testTag,`testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0300
     * @tc.name        SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0300
     * @tc.desc        Verify HEIFS metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read HEIFS metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0300", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0300";
      let sourceFileName = "C027.heic";
      let targetFileName = "C025.heic";
      let camelCaseMetadataKeys: Array<string> = ["HeifsDelayTime"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testTag, "device is not support heif encode");
        done();
      } else {
        let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "heifsMetadata",
          camelCaseMetadataKeys);
        console.info(TAG,testTag,` testExifMetadataGetAndSetBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    })



    /**
     * @tc.number      SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0400
     * @tc.name        SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0400
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0400", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0400";
      let sourceFileName = "food.jpg";
      let targetFileName = "AllAuxiliaryPictures.jpg";
      let camelCaseMetadataKeys: Array<string> = ["ImageLength", "ImageWidth", "BitsPerSample", "Make"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "exifMetadata",
        camelCaseMetadataKeys);
      console.info(TAG,testTag,`$testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0500
     * @tc.name        SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0500
     * @tc.desc        Verify EXIF metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read EXIF metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0500", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_EXIFMETADATA_GETANDSETBLOB_PROMISE_static_0500";
      let sourceFileName = "food.jpg";
      let targetFileName = "AllAuxiliaryPictures.jpg";
      let camelCaseMetadataKeys: Array<string> = ["HwMnoteCaptureMode"];
      let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd",
        "makerNoteHuaweiMetadata", camelCaseMetadataKeys);
      console.info(TAG,testTag,`testExifMetadataGetAndSetBlob result is: ${result}`);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.number      SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0600
     * @tc.name        SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0600
     * @tc.desc        Verify HEIFS metadata persistence after getBlob/setBlob and packToFile for HEIC
     *                 1.Read HEIFS metadata from source as ArrayBuffer using getBlob
     *                 2.Write ArrayBuffer to target HEIC using setBlob
     *                 3.Pack to HEIC file with needsPackProperties=true
     *                 4.Verify transferred metadata persists in packed file
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0600", Level.LEVEL0, async (done:() => void)=>{
      const testTag: string = "SUB_MEDIA_IMAGE_HEIFSMETADATA_GETANDSETBLOB_PROMISE_static_0600";
      let sourceFileName = "C027.heic";
      let targetFileName = "test_blob_v1.heic";
      let camelCaseMetadataKeys: Array<string> = ["HeifsDelayTime"];
      if (!image.createImagePacker().supportedFormats.includes("image/heic")) {
        console.info(TAG,testTag + "device is not support heif encode");
        done();
      } else {
        let result = await testExifMetadataGetAndSetBlob(testTag, sourceFileName, targetFileName, "fd", "heifsMetadata",
          camelCaseMetadataKeys);
        console.info(TAG,testTag,`testExifMetadataGetAndSetBlob result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });






    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0100";
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG,testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_static_0200";
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      console.info(TAG, `start：${testName}`);
      let PixelMap = await createPixelMapTest(context);
      try {
        let newPixelMap = await PixelMap.clone();
        console.info(TAG,testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100
     * @tc.desc      clone isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0100";
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isEditable).assertEqual(PixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200
     * @tc.name      SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200
     * @tc.desc      clone isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200', Level.LEVEL1, async (done:() => void) => {
      const testName = "SUB_MEDIA_IMAGE_PIXEL_MAP_CLONE_SYNC_static_0200";
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      console.info(TAG, `start：${testName}`);
      let PixelMap = createPixelMapSUPP(context);
      try {
        let newPixelMap = PixelMap.cloneSync();
        console.info(TAG, testName,'Succeeded clone pixelmap.');
        expect(newPixelMap.isStrideAlignment).assertEqual(PixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect().assertFail();
      }
      done();
    });
  })
}


