/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import image from "@ohos.multimedia.image";
import fs from "@ohos.file.fs";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

const ERR_CODE = 62980115;
const ADOBE_RGB_1998: int = colorSpaceManager.ColorSpace.ADOBE_RGB_1998
const DCI_P3: int = colorSpaceManager.ColorSpace.DCI_P3
const DISPLAY_P3: int = colorSpaceManager.ColorSpace.DISPLAY_P3
const SRGB: int = colorSpaceManager.ColorSpace.SRGB
const CUSTOM: int = colorSpaceManager.ColorSpace.CUSTOM

let filesDir: string | undefined | null;
let globalpixelmap: image.PixelMap | undefined = undefined;
let globalimageSource: image.ImageSource | undefined = undefined;

function getFd(fileName:string) {
  let filePath = filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  let file: fs.File | undefined;
  waitForCompletion(async () => {file = await fs.open(filePath, 0o0);})
  return file!.fd as int
}

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    console.info(this.testNum + " " + msg);
  }
}

const createPixelmapTestPromise = async (
  done: () => void,
  testNum: string,
  colorSpace: colorSpaceManager.ColorSpacePrimaries | colorSpaceManager.ColorSpace,
  gamma: int | undefined,
  checkColorSpace: (colorSpaceName: colorSpaceManager.ColorSpace) => void
) => {
  let logger = new Logger(testNum);
  try {
    let fd = getFd("colorspace.jpg");
    let imageSource = image.createImageSource(fd);
    logger.log("ImageSource " + (imageSource != undefined));
    if (imageSource != undefined) {
      globalimageSource = imageSource;
      let csm: colorSpaceManager.ColorSpaceManager;
      if(colorSpace instanceof colorSpaceManager.ColorSpacePrimaries) {
        csm = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpacePrimaries, gamma as int);
      } else {
        csm = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpace);
      }
      let decodingOptions: image.DecodingOptions = { desiredColorSpace: csm };
      let pixelMap: image.PixelMap | undefined;
      waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMap(decodingOptions);})
      logger.log("PixelMap " + pixelMap);
      if (pixelMap != undefined) {
        globalpixelmap = pixelMap;
        let cs = pixelMap!.getColorSpace();
        let csmn = cs.getColorSpaceName();
        logger.log('csmn ' + csmn);
        checkColorSpace(csmn);
        done();
      } else {
        logger.log('creat pixelMap failed ');
        expect(false).assertTrue();
        done();
      }
    } else {
      logger.log('creat imageSource failed ');
      expect(false).assertTrue();
      done();
    }
  } catch (error) {
    logger.log('failed ' + error);
    expect(false).assertTrue();
    done();
  }
}

const createPixelmapTestCb = async (
  done: () => void,
  testNum: string,
  colorSpace: colorSpaceManager.ColorSpacePrimaries | colorSpaceManager.ColorSpace,
  gamma: int | undefined,
  checkColorSpace: (colorSpaceName: colorSpaceManager.ColorSpace) => void
) => {
  let logger = new Logger(testNum);
  try {
    let fd = getFd("colorspace.jpg");
    let imageSource = image.createImageSource(fd);
    logger.log("ImageSource " + (imageSource != undefined));
    if (imageSource != undefined) {
      globalimageSource = imageSource;
      let csm: colorSpaceManager.ColorSpaceManager;
      if(colorSpace instanceof colorSpaceManager.ColorSpacePrimaries) {
        csm = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpacePrimaries, gamma as int);
      } else {
        csm = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpace);
      }
      logger.log('colorSpace name ' + csm.getColorSpaceName());
      let decodingOptions: image.DecodingOptions = { desiredColorSpace: csm };
      imageSource.createPixelMap(decodingOptions, (err: BusinessError | null, pixelMap) => {
        if (err && err.code) {
          logger.log("PixelMap err " + err);
          expect(false).assertTrue();
          done();
        } else {
          globalpixelmap = pixelMap!;
          let cs = pixelMap!.getColorSpace();
          let csmn = cs.getColorSpaceName();
          logger.log('csmn ' + csmn);
          checkColorSpace(csmn);
          done();
        }
      });
    } else {
      logger.log('creat imageSource failed ');
      expect(false).assertTrue();
      done();
    }
  } catch (error) {
    logger.log('failed ' + error);
    expect(false).assertTrue();
    done();
  }
}

const applyColorSpacePromiseTest = async (
  done: () => void,
  testNum:string,
  checkColorSpace: (colorSpaceName: colorSpaceManager.ColorSpace) => void,
  colorSpace: colorSpaceManager.ColorSpacePrimaries | colorSpaceManager.ColorSpace,
  gamma: int | undefined
) => {
  let logger = new Logger(testNum);
  try {
    let fd = getFd("colorspace.jpg");
    let imageSource = image.createImageSource(fd);
    logger.log("ImageSource " + (imageSource != undefined));
    if (imageSource != undefined) {
      globalimageSource = imageSource;
      let pixelMap: image.PixelMap | undefined;
      waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMap();})
      if (pixelMap != undefined) {
        globalpixelmap = pixelMap;
        let csmModify: colorSpaceManager.ColorSpaceManager;
        if(colorSpace instanceof colorSpaceManager.ColorSpacePrimaries) {
          csmModify = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpacePrimaries, gamma as int);
        } else {
          csmModify = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpace);
        }
        logger.log("csmModify " + csmModify);
        try{
          waitForCompletion(async () => {await pixelMap!.applyColorSpace(csmModify);})
          let csm1 = pixelMap!.getColorSpace();
          logger.log("getColorSpace " + csm1);
          let csmn = csm1.getColorSpaceName();
          logger.log("getColorSpaceName " + csmn);
          checkColorSpace(csmn);
          let pixelSize = pixelMap!.getPixelBytesNumber();
          logger.log(`new pixel size ${pixelSize}`);
          done();
        } catch(error) {
          logger.log("apply colorSpace failed " + error);
          expect().assertFail();
          done();
        };
      } else {
        logger.log('creat pixelMap failed ');
        expect(false).assertTrue();
        done();
      }
    } else {
      logger.log('creat imageSource failed ');
      expect(false).assertTrue();
      done();
    }
  } catch (error) {
    logger.log('failed ' + error);
    expect(false).assertTrue();
    done();
  }
}

const applyColorSpaceCbTest = async (
  done: () => void,
  testNum:string,
  checkColorSpace: (colorSpaceName: colorSpaceManager.ColorSpace) => void,
  colorSpace: colorSpaceManager.ColorSpacePrimaries | colorSpaceManager.ColorSpace,
  gamma: int | undefined
) => {
  let logger = new Logger(testNum);
  try {
    let fd = getFd("colorspace.jpg");
    let imageSource = image.createImageSource(fd);
    logger.log("ImageSource " + (imageSource != undefined));
    if (imageSource != undefined) {
      globalimageSource = imageSource;
      let pixelMap: image.PixelMap | undefined;
      waitForCompletion(async () => {pixelMap = await imageSource!.createPixelMap();})
      if (pixelMap != undefined) {
        globalpixelmap = pixelMap;
        let csmModify: colorSpaceManager.ColorSpaceManager;
        if(colorSpace instanceof colorSpaceManager.ColorSpacePrimaries) {
          csmModify = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpacePrimaries, gamma as int);
        } else {
          csmModify = colorSpaceManager.create(colorSpace as colorSpaceManager.ColorSpace);
        }
        pixelMap!.applyColorSpace(csmModify, (err: BusinessError | null) => {
          if (err && err.code) {
            expect(false).assertTrue();
            logger.log("applyColorSpace err " + err);
            done();
          } else {
            let csm1 = pixelMap!.getColorSpace();
            logger.log("getColorSpace " + csm1);
            let csmn = csm1.getColorSpaceName();
            logger.log("getColorSpaceName " + csmn);
            checkColorSpace(csmn);
            let pixelSize = pixelMap!.getPixelBytesNumber();
            logger.log(`new pixel size ${pixelSize}`);
            done();
          }
        })
      } else {
        logger.log('creat pixelMap failed ');
        expect(false).assertTrue();
        done();
      }
    } else {
      logger.log('creat imageSource failed ');
      expect(false).assertTrue();
      done();
    }
  } catch (error) {
    logger.log('failed ' + error);
    expect(false).assertTrue();
    done();
  }
}

export default function ImageColorSpaceTransferTest() {
  describe('ImageColorSpaceTransferTest', ()=> {
    beforeAll(async () => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
    })

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info('afterEach case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0100
     * @tc.desc   createPixelmap_promise_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
      }
      await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0100',
        colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0200
     * @tc.desc   createPixelmap_promise_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DCI_P3).assertTrue();
      }
      await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0200',
        colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0300
     * @tc.desc   createPixelmap_promise_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DISPLAY_P3).assertTrue();
      }
      await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0300',
        colorSpaceManager.ColorSpace.DISPLAY_P3, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0400
     * @tc.desc   createPixelmap_promise_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == SRGB).assertTrue();
      }
      await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0400',
        colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0500
     * @tc.desc   createPixelmap_promise_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bt2020: colorSpaceManager.ColorSpacePrimaries = {
        redX: 0.708,
        redY: 0.292,
        greenX: 0.170,
        greenY: 0.797,
        blueX: 0.131,
        blueY: 0.046,
        whitePointX: 0.31271,
        whitePointY: 0.32902
      }
      let gamma: int | undefined = 2.4 as int;
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == CUSTOM).assertTrue();
      }
      await createPixelmapTestPromise(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_PROMISE_STATIC_0500',
        bt2020, gamma, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0100
     * @tc.desc   createPixelmap_callback_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
      }
      await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0100',
        colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0200
     * @tc.desc   createPixelmap_callback_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DCI_P3).assertTrue();
      }
      await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0200',
        colorSpaceManager.ColorSpace.DCI_P3, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0300
     * @tc.desc   createPixelmap_callback_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DISPLAY_P3).assertTrue();
      }
      await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0300',
        colorSpaceManager.ColorSpace.DISPLAY_P3 , undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0400
     * @tc.desc   createPixelmap_callback_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == SRGB).assertTrue();
      }
      await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0400',
        colorSpaceManager.ColorSpace.SRGB, undefined, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0500
     * @tc.desc   createPixelmap_callback_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bt2020: colorSpaceManager.ColorSpacePrimaries = {
        redX: 0.708,
        redY: 0.292,
        greenX: 0.170,
        greenY: 0.797,
        blueX: 0.131,
        blueY: 0.046,
        whitePointX: 0.31271,
        whitePointY: 0.32902
      }
      let gamma: int = 2.4 as int;
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == CUSTOM).assertTrue();
      }
      await createPixelmapTestCb(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_DECODE_CALLBACK_STATIC_0500',
        bt2020, gamma, checkColorSpace)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0100
     * @tc.desc   applyColorSpace_promise_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
      }
      await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0100',
        checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0200
     * @tc.desc   applyColorSpace_promise_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DCI_P3).assertTrue();
      }
      await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0200',
        checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0300
     * @tc.desc   applyColorSpace_promise_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DISPLAY_P3).assertTrue();
      }
      await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0300',
        checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0400
     * @tc.desc   applyColorSpace_promise_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == SRGB).assertTrue();
      }
      await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0400',
        checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0500
     * @tc.desc   applyColorSpace_promise_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bt2020: colorSpaceManager.ColorSpacePrimaries = {
        redX: 0.708,
        redY: 0.292,
        greenX: 0.170,
        greenY: 0.797,
        blueX: 0.131,
        blueY: 0.046,
        whitePointX: 0.31271,
        whitePointY: 0.32902
      }
      let gamma: int = 2.4 as int;
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == CUSTOM).assertTrue();
      }
      await applyColorSpacePromiseTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_PROMISE_STATIC_0500',
        checkColorSpace, bt2020, gamma)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0100
     * @tc.desc   applyColorSpace_callback_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == ADOBE_RGB_1998).assertTrue();
      }
      await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0100',
        checkColorSpace, colorSpaceManager.ColorSpace.ADOBE_RGB_1998, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0200
     * @tc.desc   applyColorSpace_callback_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DCI_P3).assertTrue();
      }
      await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0200',
        checkColorSpace, colorSpaceManager.ColorSpace.DCI_P3, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0300
     * @tc.desc   applyColorSpace_callback_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == DISPLAY_P3).assertTrue();
      }
      await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0300',
        checkColorSpace, colorSpaceManager.ColorSpace.DISPLAY_P3, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0400
     * @tc.desc   applyColorSpace_callback_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == SRGB).assertTrue();
      }
      await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0400',
        checkColorSpace, colorSpaceManager.ColorSpace.SRGB, undefined)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0500
     * @tc.desc   applyColorSpace_callback_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bt2020: colorSpaceManager.ColorSpacePrimaries = {
        redX: 0.708,
        redY: 0.292,
        greenX: 0.170,
        greenY: 0.797,
        blueX: 0.131,
        blueY: 0.046,
        whitePointX: 0.31271,
        whitePointY: 0.32902
      }
      let gamma: int = 2.4 as int;
      let checkColorSpace = (colorSpaceName:colorSpaceManager.ColorSpace)=> {
        expect(colorSpaceName == CUSTOM).assertTrue();
      }
      await applyColorSpaceCbTest(done, 'SUB_MULTIMEDIA_IMAGE_COLORSPACE_TRANSFER_CALLBACK_STATIC_0500',
        checkColorSpace, bt2020, gamma)
    })
  })
}

