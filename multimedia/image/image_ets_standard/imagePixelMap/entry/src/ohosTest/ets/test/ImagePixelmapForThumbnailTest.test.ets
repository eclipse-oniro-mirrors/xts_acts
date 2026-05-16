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
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import taskpool from '@ohos.taskpool';

const ERR_NOT_CARRY_THUMBNAIL = 7700303;
const ERR_GENERATE_THUMBNAIL = 7700305;

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePixelmap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

@Concurrent
async function getPixelMapForThumbnailTestPool(
  filePath: string,
  type: string,
  decodingOptions: image.DecodingOptionsForThumbnail,
  exceptWidth: number = 0,
  exceptHeight: number = 0
): Promise<boolean> {
  let pixelMap: image.PixelMap | undefined = undefined;
  let imageSource = await image.createImageSource(filePath);
  try {
    if (type == "sync") {
      if (decodingOptions && Object.keys(decodingOptions).length > 0) {
        pixelMap = imageSource.createThumbnailSync(decodingOptions);
      } else {
        pixelMap = imageSource.createThumbnailSync();
      }
    } else {
      if (decodingOptions && Object.keys(decodingOptions).length > 0) {
        pixelMap = await imageSource.createThumbnail(decodingOptions);
      } else {
        pixelMap = await imageSource.createThumbnail();
      }
    }

    if (pixelMap != undefined) {
      let dstImageInfo = await pixelMap.getImageInfo();
      console.log("dstImageInfo is:" + JSON.stringify(dstImageInfo));
      let ret = (dstImageInfo.size.width == exceptWidth) &&
        (dstImageInfo.size.height == exceptHeight) &&
        (dstImageInfo.pixelFormat == image.PixelMapFormat.RGBA_8888);
      return ret;
    } else {
      console.log("pixelmap is undefined");
      return false;
    }
  } catch (error) {
    console.log("getPixelMapForThumbnail: create Thumbnail failed, error is: " + JSON.stringify(error));
    return false
  }
}

async function testThumbnailPixelMap(
  logger: Logger,
  filePath: string,
  type: string,
  decodingOptions: image.DecodingOptionsForThumbnail,
  exceptWidth: number = 0,
  exceptHeight: number = 0
): Promise<boolean> {
  logger.log("testThumbnailPixelMap start");
  let task = new taskpool.Task(getPixelMapForThumbnailTestPool, filePath, type, decodingOptions, exceptWidth, exceptHeight);
  logger.log('taskPool execute task');
  try {
    let ret = (await taskpool.execute(task)) as boolean;
    logger.log('taskPool execute ret is ' + ret);
    return ret;
  } catch (e) {
    logger.log('taskPool execute error: code: ' + e.code + " message: " + e.message);
    return false;
  }
}

async function getPixelMapForThumbnail(
  logger: Logger,
  filePath: string,
  type: string,
  decodingOptions?: image.DecodingOptionsForThumbnail
): Promise<image.PixelMap | undefined> {
  let pixelMap: image.PixelMap | undefined = undefined;
  let imageSource = await image.createImageSource(filePath);
  try {
    if (type == "sync") {
      if (decodingOptions != undefined) {
        pixelMap = imageSource.createThumbnailSync(decodingOptions);
      } else {
        pixelMap = imageSource.createThumbnailSync();
      }
    } else {
      if (decodingOptions != undefined) {
        pixelMap = await imageSource.createThumbnail(decodingOptions);
      } else {
        pixelMap = await imageSource.createThumbnail();
      }
    }
  } catch (error) {
    logger.log("create Thumbnail failed, error: code: " + error.code + " message is: " + error.message);
    expect().assertFalse();
  }
  return pixelMap;
}

async function testCreateThumbnailErrorCode(
  done: Function,
  logger: Logger,
  type: string,
  filePath: string,
  decodingOptions: image.DecodingOptionsForThumbnail,
  errorCode: number
) {
  let ret = true;
  let imageSource = image.createImageSource(filePath);
  try {
    let pixelMap: image.PixelMap | undefined;
    if (type == "noSync") {
      pixelMap = await imageSource.createThumbnail(decodingOptions);
    } else {
      pixelMap = imageSource.createThumbnailSync(decodingOptions);
    }
    if (pixelMap != undefined) {
      logger.log("create Thumbnail success, pixelmap is not undefined!");
      let info = await pixelMap.getImageInfo();
      logger.log("Thumbnail info: " + JSON.stringify(info));
      expect().assertFail();
      done();
      return ret;
    } else {
      logger.log("create Thumbnail failed, pixelmap is undefined!");
      expect().assertTrue();
      done();
      return ret;
    }
  } catch (error) {
    logger.log("createThumbnail failed, error code is: " + error.code + " error message is: " + error.message);
    expect(error.code == errorCode).assertTrue();
    done();
    return ret;
  }
}

export default function imagePixelMapForThumbnail() {
  let filesDir: string | undefined;
  let cacheDir: string | undefined;
  let testContext: common.UIAbilityContext;
  let isSupportHEIFDecode: boolean;

  const JPEG_EXIF_THUMBNAIL = "jpeg_exif_thumbnail.jpg";
  const JPEG_NO_THUMBNAIL = "jpeg_no_thumbnail.jpg";
  const HEIF_EXIF_THUMBNAIL = "heif_exif_thumbnail.heic";
  const HEIF_BOX_THUMBNAIL = "heif_box_thumbnail.heic";
  const HEIF_NO_THUMBNAIL = "heif_no_thumbnail.heic";
  const UNSUPPORTED_MIMETYPE = 7700102;
  const INVALID_PARAMETER = 7700204;
  const DECODE_FAILED = 7700301;

  describe('imagePixelMapForThumbnail', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
    })

    afterEach(async () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'afterEach case');
    });

    const getFilePath = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      return filePath;
    }

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0100");
      const filePath = getFilePath(JPEG_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 320, 240);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_EXIF_0200");
      const filePath = getFilePath(JPEG_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 320, 240);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 256, 192);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_EXIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 256, 192);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_BOX_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 512, 384);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_BOX_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_BOX_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 512, 384);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0100");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 30
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 23, 30);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 500 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0200");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 500
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 375, 500);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 512 (default)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0300");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 512
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0400
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1024 (>512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0400");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 768, 1024);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0500
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0500
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30000 (> original image size)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0500");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 30000
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 3072, 4096);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0600
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0600
     * @tc.desc      1. Call the interface without maxGeneratedPixelDimension (default 512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0600");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 30
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 30, 17);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 500 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 500
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 500, 282);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 512 (default)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 512
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 512, 288);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0400
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1024 (>512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 664, 374);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0500
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0500
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30000 (> original image size)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 30000
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 664, 374);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0600
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0600
     * @tc.desc      1. Call the interface without maxGeneratedPixelDimension (default 512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_HEIF_NO_THUMBNAIL_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 512, 288);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0700
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0700
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320, generateThumbnailIfAbsent = false
     *               2. Decode thumbnail failed, PixelMap object is undefined
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0700");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 320,
        generateThumbnailIfAbsent: false
      };
      let pixelMap: image.PixelMap | undefined = undefined;
      let imageSource = await image.createImageSource(filePath);
      try {
        pixelMap = imageSource.createThumbnailSync(decodingOptions);
      } catch (error) {
        logger.log("create Thumbnail failed, errorcode: " + error.code + " message is: " + error.message);
        expect(Number(error.code)).assertEqual(ERR_NOT_CARRY_THUMBNAIL);
      }
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0800
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0800
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320 (generateThumbnailIfAbsent defaults to true)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0800");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 320
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 240, 320);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0900
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0900
     * @tc.desc      1. Call the interface without parameters (generateThumbnailIfAbsent defaults to true)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_JPEG_NO_THUMBNAIL_0900");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "noSync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 0 (invalid value)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0100");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 0
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "noSync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1 (invalid value)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0200");
      const filePath = getFilePath("300_100.jpg");
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "noSync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = -1 (invalid value), generateThumbnailIfAbsent = true
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0300");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: -1
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "noSync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0400
     * @tc.desc      1. Call the interface with unsupported image format (e.g. .ico file)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700400 (Unsupported image format)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0400");
      const filePath = getFilePath("test.ico");
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 300
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "noSync", filePath, decodingOptions, UNSUPPORTED_MIMETYPE);
      expect(ret).assertTrue();
    })

    /**
    * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0500
    * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0500
    * @tc.desc      1. Use an image without thumbnail to Synchronously decode thumbnail 
    *               2. Set generateThumbnailIfAbsent = true
    *               3. Return error code:7700305 (ERR_GENERATE_THUMBNAIL)
    * @tc.size      MediumTest
    * @tc.type      Functional
    * @tc.level     Level 1
    */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0500");
      try {
        logger.log("Start test: SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_PROMISE_PIXELMAP_ERROR_0500");
        const filePath = getFilePath("generateThumbnailFailed.jpg");
        let imageSource = image.createImageSource(filePath);
        logger.log("ImageSource created, file: generateThumbnailFailed.jpg");
        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: true
        };
        logger.log("Creating thumbnail from imageSource");
        imageSource.createThumbnailSync(decodingOptions);
        logger.log("Thumbnail created unexpectedly");
        expect().assertFail();
      } catch (error) {
        logger.log(`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        console.log(typeof error.code);
        expect(Number(error.code)).assertEqual(ERR_GENERATE_THUMBNAIL);
      }
      logger.log("Test finished successfully");
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0100");
      const filePath = getFilePath(JPEG_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 320, 240);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_EXIF_0200");
      const filePath = getFilePath(JPEG_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 320, 240);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 256, 192);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_EXIF_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 256, 192);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0100
     * @tc.desc      1. Call the interface with generateThumbnailIfAbsent = false, maxGeneratedPixelDimension = 1024
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_BOX_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: false,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 512, 384);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0200
     * @tc.desc      1. Call the interface without parameters, generateThumbnailIfAbsent defaults to true, maxGeneratedPixelDimension defaults to 512
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are same as original thumbnail
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_BOX_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_BOX_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 512, 384);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0100");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 30
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 23, 30);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 500 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0200");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 500
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 375, 500);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 512 (default)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0300");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 512
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0400
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1024 (>512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0400");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 768, 1024);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0500
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0500
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30000 (> original image size)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0500");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 30000
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 3072, 4096);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0600
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0600
     * @tc.desc      1. Call the interface without maxGeneratedPixelDimension (default 512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0600");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0100");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 30
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 30, 17);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 500 (<512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0200");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 500
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 500, 282);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 512 (default)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0300");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 512
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 512, 288);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0400
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1024 (>512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0400");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1024
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 664, 374);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0500
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0500
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 30000 (> original image size)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0500");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 30000
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 664, 374);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0600
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0600
     * @tc.desc      1. Call the interface without maxGeneratedPixelDimension (default 512)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_HEIF_NO_THUMBNAIL_0600");
      if (!isSupportHEIFDecode) {
        logger.log("device does not support HEIF decode!");
        done();
        return;
      }
      const filePath = getFilePath(HEIF_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 512, 288);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0700
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0700
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320, generateThumbnailIfAbsent = false
     *               2. Decode thumbnail failed, PixelMap object is undefined
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0700', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0700");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 320,
        generateThumbnailIfAbsent: false
      };
      let pixelMap: image.PixelMap | undefined = undefined;
      let imageSource = await image.createImageSource(filePath);
      try {
        pixelMap = await imageSource.createThumbnail(decodingOptions);
      } catch (error) {
        logger.log("create Thumbnail failed, error: code: " + error.code + " message is: " + error.message);
        expect(Number(error.code)).assertEqual(ERR_NOT_CARRY_THUMBNAIL);
      }
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0800
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0800
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 320 (generateThumbnailIfAbsent defaults to true)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0800', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0800");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        maxGeneratedPixelDimension: 320
      };
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 240, 320);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0900
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0900
     * @tc.desc      1. Call the interface without parameters (generateThumbnailIfAbsent defaults to true)
     *               2. Successfully decode thumbnail, PixelMap object is not null
     *               3. Call getImageInfo, verify height, width, pixelFormat are as expected
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0900', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_JPEG_NO_THUMBNAIL_0900");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {};
      let ret = await testThumbnailPixelMap(logger, filePath, "sync", decodingOptions, 384, 512);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0100
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0100
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 0 (invalid value)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0100");
      const filePath = getFilePath(JPEG_EXIF_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 0
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "sync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0200
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0200
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = 1 (invalid value)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0200");
      const filePath = getFilePath("300_100.jpg");
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 1
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "sync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0300
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0300
     * @tc.desc      1. Call the interface with maxGeneratedPixelDimension = -1 (invalid value), generateThumbnailIfAbsent = true
     *                 2. Decode thumbnail failed, PixelMap object is undefined
     *                 3. Return error code:7700204 (Invalid parameter)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0300");
      const filePath = getFilePath(JPEG_NO_THUMBNAIL);
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: -1
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "sync", filePath, decodingOptions, INVALID_PARAMETER);
      expect(ret).assertTrue();
    })

    /**
     * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0400
     * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0400
     * @tc.desc      1. Call the interface with unsupported image format (e.g. .ico file)
     *               2. Decode thumbnail failed, PixelMap object is undefined
     *               3. Return error code:7700400 (Unsupported image format)
     * @tc.size      MediumTest
     * @tc.type      Functional
     * @tc.level     Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0400");
      const filePath = getFilePath("test.ico");
      let decodingOptions: image.DecodingOptionsForThumbnail = {
        generateThumbnailIfAbsent: true,
        maxGeneratedPixelDimension: 300
      };
      let ret = await testCreateThumbnailErrorCode(done, logger, "sync", filePath, decodingOptions, UNSUPPORTED_MIMETYPE);
      expect(ret).assertTrue();
    })

    /**
    * @tc.number    SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0500
    * @tc.name      SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0500
    * @tc.desc      1. Use an image without thumbnail to decode thumbnail
    *               2. Set generateThumbnailIfAbsent = true
    *               3. Return error code:7700305 (ERR_GENERATE_THUMBNAIL)
    * @tc.size      MediumTest
    * @tc.type      Functional
    * @tc.level     Level 1
    */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0500");
      try {
        logger.log("Start test: SUB_MULTIMEDIA_IMAGE_CREATE_THUMBNAIL_SYNC_PIXELMAP_ERROR_0500");
        const filePath = getFilePath("generateThumbnailFailed.jpg");
        let imageSource = image.createImageSource(filePath);
        logger.log("ImageSource created, file: generateThumbnailFailed.jpg");
        let decodingOptions: image.DecodingOptionsForThumbnail = {
          generateThumbnailIfAbsent: true
        };
        logger.log("Creating thumbnail from imageSource");
        await imageSource.createThumbnail(decodingOptions);
        logger.log("Thumbnail created unexpectedly");
        expect().assertFail();
      } catch (error) {
        logger.log(`Error in createThumbnail: ${error.message}, code: ${error.code}`);
        console.log(typeof error.code);
        expect(Number(error.code)).assertEqual(ERR_GENERATE_THUMBNAIL);
      }
      logger.log("Test finished successfully");
      done();
    })
  })
}