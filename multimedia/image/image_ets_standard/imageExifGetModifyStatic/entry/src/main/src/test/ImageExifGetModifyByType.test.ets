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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import { 
  ReadOnlyMetaDataRule,
  dngMetadataMap,
  webpMetadataMap
} from './ImagePropertyByType.test'
import { initialize } from './AbilityContextHelper.test';

const UNSUPPORTED_IMAGE_FORMATS = 7700102;

export default function imageExifGetModifyByTypeTest(): void {
  describe("imageExifGetModifyByTypeTest", () => {
    let filePath: string;
    let fdNumber: int;
    let filesDir: string | undefined | null;

    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
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

    const getFd = async (fileName: string): Promise<void> => {
      filePath = filesDir + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fdNumber = file.fd;
    }

    const getBuffer = async (fileName: string): Promise<ArrayBuffer> => {
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize: long = stats.size;
      const bufferRead = new ArrayBuffer(fileSize);
      fs.readSync(file.fd, bufferRead);
      return bufferRead;
    }

    const getImageSource = async(fileName: string, type: string): Promise<image.ImageSource|undefined> => {
      let imageSourceApi: image.ImageSource|undefined;
      if(type === "buffer"){
        const buffer = await getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      }else if(type === "uri"){
        const filePath: string = filesDir + '/' + fileName;
        imageSourceApi = image.createImageSource(filePath);
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = image.createIncrementalSource(picBuffer);
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber);
      }
      return imageSourceApi;
    }

    const verifyMetadataProperties = async (
      testNum: string,
      fileName: string,
      type: string,
      typeMetadata: string,
      exifMetadataKey: string[],
      rulesMap: Map<image.DngPropertyKey, ReadOnlyMetaDataRule>
    ): Promise<boolean> => {
      let ret: boolean = true;
      const imageSourceApiGet = await getImageSource(fileName, type);
      const exifValue: image.ImageMetadata = await imageSourceApiGet!.readImageMetadata(exifMetadataKey);
      for (let i = 0; i < exifMetadataKey.length; i++) {
        const rule = rulesMap.get(image.DngPropertyKey.fromValue(exifMetadataKey[i]));
        if (!rule) {
          console.info(`${testNum} No rule found for key: ${exifMetadataKey[i]}`);
          continue;
        }
        try {
          let expectedValue = rule.newExpectValue;
          if (exifValue.dngMetadata == undefined) {
            await imageSourceApiGet?.release();
            console.info(`${testNum} Not meeting the conditions.`);
            return false;
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

    const verifyMultipleFramesMetadata = (
      testTag: string,
      exifValue: image.ImageMetadata,
      keys: image.WebPPropertyKey[],
      expectedIndex: int,
      rulesMap: Map<image.WebPPropertyKey, ReadOnlyMetaDataRule>,
      metadataType: string
    ): boolean => {
      let result: boolean = true;
      if (exifValue.webPMetadata == undefined) {
        console.info(`${testTag} Not meeting the conditions.`);
        return false;
      }
      for (let i = 0; i < keys.length; i++) {
        const key = keys[i];
        const rule = rulesMap.get(key);
        if (!rule) {
          console.info(`${testTag} No rule found for key: ${key}`);
          continue;
        }
        try {
          let ruleExpectedValue = rule.newExpectValue;
        } catch (error) {
          console.error(`${testTag} Error processing key ${key}: ${error}`);
          result = false;
        }
      }
      return result;
    }

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
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0100";
      try {
        const imageSourceApi = await getImageSource("fake.dng", "uri");
        console.info(`${testTag} Created image source for fake.dng file.`);
        const dngMetadata = await imageSourceApi!.createImageRawData();
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
    it("SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_CREATE_IMAGE_RAW_DATA_ERROR_0200";
      try {
        const imageSourceApi = await getImageSource("test.ico", "uri");
        console.info(`${testTag} Created image source for ico file.`);
        const dngMetadata = await imageSourceApi!.createImageRawData();
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_DNG_METADATA_0100";
      try {
        let keys: string[] = []; //Object.values(image.DngPropertyKey);
        for (let s of image.DngPropertyKey.values()) {
          keys.push(s.toString());
        }
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0100";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi!.readImageMetadataByType([image.MetadataType.DNG_METADATA]);
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_DNG_METADATA_0200";
      try {
        const imageSourceApi = await getImageSource("test_fake.dng", "uri");
        const imageMetadata = await imageSourceApi!.readImageMetadataByType();
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0100";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType();
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0200";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType([], 2);
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0300";
      let result: boolean = true;
      let keys: image.WebPPropertyKey[] = Array.from(webpMetadataMap.keys());
      const imageSourceApi = await getImageSource("loop_count_9.webp", "fd");
      let frameCount: int = await imageSourceApi!.getFrameCount();
      console.info(`${testTag} get frameCount num is: ${frameCount}`);
      try {
        for (let i = 0; i < frameCount; i++) {
          const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType([image.MetadataType.WEBP_METADATA], i);
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_0400";
      let result: boolean = true;
      const imageSourceApi = await getImageSource("1.webp", "fd");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        let canvasWidth: int | undefined = exifValue.webPMetadata!.canvasWidth;
        let canvasHeight: int | undefined = exifValue.webPMetadata!.canvasHeight;
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
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500", Level.LEVEL0, async (done: () => void) => {
      const testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATABYTYPE_WEBP_METADATA_ERROR_0500";
      const imageSourceApi = await getImageSource("test_exif_v2.jpg", "uri");
      try {
        const exifValue: image.ImageMetadata = await imageSourceApi!.readImageMetadataByType([image.MetadataType.WEBP_METADATA], 0);
        console.error(`${testTag} Unsupported metadata exifValue: ${exifValue}`);
        expect(true).assertFail();
      } catch (err) {
        console.error(`${testTag} Error processing err: ${err}`);
        expect(err.code).assertEqual(UNSUPPORTED_IMAGE_FORMATS);
      }  finally {
        await imageSourceApi?.release();
      }
      // console.info(`${testTag} webp metadata readImageMetadataByType result is: ${result}`);
      done();
    });

  });
}
