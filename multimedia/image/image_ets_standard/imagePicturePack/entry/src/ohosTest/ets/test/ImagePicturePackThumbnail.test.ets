/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level, Size, TestType } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

export default function imagePicturePackThumbnail() {
  let filesDir: string | undefined;
  let cacheDir: string | undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;
  let isSupportHEICEncode: boolean;
  const testFileWithThumbnailJpeg = "jpeg_exif_thumbnail.jpg";
  const testFileWithOutThumbnailJpeg = "jpeg_no_thumbnail.jpg";
  const testFileWithThumbnailHeifBox = "heif_box_thumbnail.heic";
  const testFileWithThumbnailHeifExif = "heif_exif_thumbnail.heic";
  const testFileWithOutThumbnailHeif = "heif_no_thumbnail.heic";
  const ERR_NOT_CARRY_THUMBNAIL = 7700303;
  const ERR_GENERATE_THUMBNAIL = 7700305;

  describe('imagePicturePackThumbnail', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHEIFDecode =
        image.getImageSourceSupportedFormats().includes("image/heic");
      isSupportHEICEncode =
        image.getImagePackerSupportedFormats().includes("image/heic");
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    class Logger {
      testNum: string;

      constructor(testNum: string) {
        this.testNum = testNum;
      }

      log(msg: string) {
        hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }

    const getBuffer = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource;
      if (type === "buffer") {
        const buffer = await getBuffer(fileName);
        imageSourceApi = await image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = await image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = await image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = await image.CreateIncrementalSource(picBuffer);
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = await fs.open(filePath);
        imageSourceApi = await image.createImageSource(file.fd);
      }
      return imageSourceApi;
    }

    const getFdCacheDir = async (fileName: string) => {
      const uri: string = cacheDir + '/' + fileName;
      const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      return file.fd;
    }

    const verifyThumbnailInfo = async (
      logger: Logger,
      thumbnail: image.PixelMap | undefined,
      expectWidth: number,
      expectHeight: number,
      expectFormat: image.PixelMapFormat
    ) => {
      logger.log("Start verifyThumbnailInfo");
      let ret: boolean = true;
      if (thumbnail != undefined) {
        logger.log("Getting thumbnail image info");
        const info = await thumbnail.getImageInfo();
        logger.log(`Thumbnail info: ${JSON.stringify(info)}`);
        expect(info?.size?.width).assertEqual(expectWidth);
        expect(info?.size?.height).assertEqual(expectHeight);
        expect(info?.pixelFormat).assertEqual(expectFormat);
        logger.log("Releasing thumbnail");
        await thumbnail.release?.();
      } else {
        logger.log("thumbnail is undefined");
        expect().assertFail();
      }
      logger.log("End verifyThumbnailInfo");
      return ret;
    }

    const packAndVerifyThumbnail = async (
      logger: Logger,
      srcFile: string,
      srcType: string,
      packOpts: image.PackingOption,
      expectWidth: number,
      expectHeight: number,
      expectFormat: image.PixelMapFormat,
      toFile: boolean = false
    ) => {
      let ret: boolean = true;
      try {
        logger.log(`Start packAndVerifyThumbnail: srcFile=${srcFile}, toFile=${toFile}`);
        let imageSource = await getImageSource(srcFile, srcType);
        logger.log("ImageSource created");
        let picture = await imageSource.createPicture();
        logger.log("Picture created");
        await imageSource.release();
        expect(picture != null).assertTrue();

        let packedSource: image.ImageSource;
        if (toFile) {
          let fdNum = await getFdCacheDir(`pack_${Date.now()}.${packOpts.format?.split('/')[1] || 'img'}`);
          logger.log(`Packing to file, fdNum=${fdNum}`);
          const imagePackerApi: image.ImagePacker = image.createImagePacker();
          await imagePackerApi.packToFile(picture, fdNum, packOpts);
          logger.log("Pack to file done");
          await imagePackerApi.release?.();
          await picture.release();
          packedSource = image.createImageSource(fdNum);
          await fs.close(fdNum);
        } else {
          logger.log("Packing to buffer");
          const imagePackerApi: image.ImagePacker = image.createImagePacker();
          let packedBuffer = await imagePackerApi.packing(picture, packOpts);
          logger.log("Pack to buffer done");
          await imagePackerApi.release?.();
          await picture.release();
          packedSource = image.createImageSource(packedBuffer);
        }

        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false
        };
        logger.log("Creating thumbnail from packedSource");
        let thumbnail: image.PixelMap | undefined = await packedSource.createThumbnail(decodingOptions);
        logger.log("Thumbnail created, thumbnail object: " + (thumbnail != undefined));
        await packedSource.release();
        ret = await verifyThumbnailInfo(logger, thumbnail, expectWidth, expectHeight, expectFormat);
        logger.log("End packAndVerifyThumbnail");
        return ret;
      } catch (error) {
        logger.log(`Error in packAndVerifyThumbnail: ${error.message}, code: ${error.code}`);
        ret = false;
        return ret;
      }
    }

    /**
     * @tc.number   SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_JPEG_0100
     * @tc.name     SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_JPEG_0100
     * @tc.desc     1. Create ImageSource from JPEG with thumbnail (320x240, original 3072x4096)
     *              2. Create Picture from ImageSource
     *              3. Encode Picture with maxEmbedThumbnailDimension: 0
     *              4. Decode and verify thumbnail info
     * @tc.size     MediumTest
     * @tc.type     Functional
     * @tc.level    Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_JPEG_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_JPEG_0100");
      const packOption: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 0
      };
      let ret = await packAndVerifyThumbnail(
        logger,
        testFileWithThumbnailJpeg,
        "uri",
        packOption,
        320, 240, image.PixelMapFormat.RGBA_8888
      );
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number   SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_BOX_0100
     * @tc.name     SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_BOX_0100
     * @tc.desc     1. Create ImageSource from HEIF with meta box thumbnail (320x240, original 3072x4096)
     *              2. Create Picture from ImageSource
     *              3. Encode Picture with maxEmbedThumbnailDimension: 100
     *              4. Decode and verify thumbnail info
     * @tc.size     MediumTest
     * @tc.type     Functional
     * @tc.level    Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_BOX_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_BOX_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        logger.log("device does not support HEIF encode/decode");
        done();
        return;
      }
      const packOption: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 100
      };
      let ret = await packAndVerifyThumbnail(
        logger,
        testFileWithThumbnailHeifBox,
        "uri",
        packOption,
        100, 75, image.PixelMapFormat.RGBA_8888
      );
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number   SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_NO_THUMBNAIL_0100
     * @tc.name     SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_NO_THUMBNAIL_0100
     * @tc.desc     1. Create ImageSource from HEIF without thumbnail
     *              2. Create Picture from ImageSource
     *              3. Encode Picture with maxEmbedThumbnailDimension: 320
     *              4. Decode and verify thumbnail info
     * @tc.size     MediumTest
     * @tc.type     Functional
     * @tc.level    Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKING_HEIF_NO_THUMBNAIL_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        logger.log("device does not support HEIF encode/decode");
        done();
        return;
      }
      const packOption: image.PackingOption = {
        format: "image/heif",
        quality: 98,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 320
      };
      let ret = await packAndVerifyThumbnail(
        logger,
        testFileWithOutThumbnailHeif,
        "uri",
        packOption,
        320, 180, image.PixelMapFormat.RGBA_8888
      );
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_HEIF_EXIF_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_HEIF_EXIF_0100
     * @tc.desc      1. Create ImageSource from HEIF with EXIF thumbnail (320x240, original 3072x4096)
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with maxEmbedThumbnailDimension: 500
     *               4. Decode and verify thumbnail info
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_HEIF_EXIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_HEIF_EXIF_0100");
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        logger.log("device does not support HEIF encode/decode");
        done();
        return;
      }
      const packOption: image.PackingOption = {
        format: "image/heif",
        quality: 98,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 500
      };
      let ret = await packAndVerifyThumbnail(
        logger,
        testFileWithThumbnailHeifExif,
        "uri",
        packOption,
        500, 375, image.PixelMapFormat.RGBA_8888,
        true
      );
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NO_THUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NO_THUMBNAIL_0100
     * @tc.desc      1. Create ImageSource from JPEG without thumbnail
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with maxEmbedThumbnailDimension: 5000
     *               4. Decode and verify thumbnail info
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NO_THUMBNAIL_0100");
      const packOption: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 5000
      };
      let ret = await packAndVerifyThumbnail(
        logger,
        "300_100.jpg",
        "uri",
        packOption,
        300, 100, image.PixelMapFormat.RGBA_8888,
        true
      );
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NEEDSPACKPROPERTIES_FALSE_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NEEDSPACKPROPERTIES_FALSE_0100
     * @tc.desc      1. Create ImageSource from JPEG
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with needsPackProperties: false, maxEmbedThumbnailDimension: 500
     *               4. Decode and verify thumbnail is absent (error code 7700303)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NEEDSPACKPROPERTIES_FALSE_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_NEEDSPACKPROPERTIES_FALSE_0100");
      logger.log("Start test: PACKTOFILE_JPEG_NEEDSPACKPROPERTIES_FALSE_0100");
      let imageSource = await getImageSource(testFileWithOutThumbnailJpeg, "uri");
      logger.log("ImageSource created");
      let picture = await imageSource.createPicture();
      logger.log("Picture created");
      expect(picture != null).assertTrue();

      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: false,
        maxEmbedThumbnailDimension: 500
      };

      let fdNum = await getFdCacheDir("pack_jpeg_needsPackProperties_false_0150.jpg");
      logger.log(`Packing to file, fdNum=${fdNum}`);
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      await imagePackerApi.packToFile(picture, fdNum, packOpts);
      logger.log("Pack to file done");

      let packedSource = image.createImageSource(fdNum);
      await fs.close(fdNum);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false
      };
      logger.log("Creating thumbnail from packedSource");
      try {
        await packedSource.createThumbnail(decodingOptions);
        logger.log("Thumbnail created unexpectedly");
        expect().assertFail();
      } catch (error) {
        logger.log(`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        expect(Number(error.code)).assertEqual(ERR_NOT_CARRY_THUMBNAIL);
      }
      logger.log("Test finished successfully");
      // expect().assertFail(); 
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100
     * @tc.desc      1. Create ImageSource from JPEG
     *               2. Create Picture from ImageSource
     *               3. Encode Picture with maxEmbedThumbnailDimension: 1
     *               4. Decode and verify thumbnail is absent (error code 7700303)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PICTURE_THUMBNAIL_PACKTOFILE_JPEG_EMBEDTHUMBNAIL_0100");
      try {
        logger.log("Start test: PACKTOFILE_JPEG_EMBEDTHUMBNAIL_1_0100");
        let imageSource = await getImageSource("300_100.jpg", "uri");
        logger.log("ImageSource created, file: 300_100.jpg");
        let picture = await imageSource.createPicture();
        logger.log("Picture created");
        expect(picture != null).assertTrue();

        let packOpts: image.PackingOption = {
          format: "image/jpeg",
          quality: 98,
          needsPackProperties: true,
          maxEmbedThumbnailDimension: 1
        };

        let fdNum = await getFdCacheDir("pack_jpeg_embedThumbnail_1_0160.jpg");
        logger.log(`Packing to file, fdNum=${fdNum}`);
        const imagePackerApi: image.ImagePacker = image.createImagePacker();
        await imagePackerApi.packToFile(picture, fdNum, packOpts);
        logger.log("Pack to file done");

        let packedSource = image.createImageSource(fdNum);
        await fs.close(fdNum);
        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: false
        };
        logger.log("Creating thumbnail from packedSource");
        await packedSource.createThumbnail(decodingOptions);
        logger.log("Thumbnail created unexpectedly");
        expect().assertFail();
      } catch (error) {
        logger.log(`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        expect(Number(error.code)).assertEqual(ERR_NOT_CARRY_THUMBNAIL);
      }
      done();
    })

  })
}