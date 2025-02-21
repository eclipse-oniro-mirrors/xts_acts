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

import { describe, beforeAll, afterAll, afterEach, it, expect } from '@ohos/hypium';
import ndkTest from 'libPictureNdk.so';
import image from "@ohos.multimedia.image";
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';

import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

const domain = 0x0000;
const testTag = 'pictureNdkTest';
const testFileHeic = 'HDRVividSingleLayer.heic';
const testFileJpg = 'test.jpg';
const testFileGainMapHeic = 'HEIFISOMultiChannelBaseColor0512V12.heic';
const testFileGainMapJpg = 'JPEGISOSingle.jpg';
const testFileUnrefocusHeic = 'IMG_825866834_004.heic';
const testFileUnrefocusJpg = 'AllAuxiliaryPictures_exclude_fragment.jpg';
const testFileDepthHeic = 'HeicDepthMap.heic';
const testFileDepthJpg = 'JpegDepthMap.jpg';
const testFileLinearmapHeic = 'HeicLinearMap.heic';
const testFileLinearmapJpg = 'JpegLinearMap.jpg';
const testFileFragmentHeic = 'HeicFragmentMap.heic';
const testFileFragmentJpg = 'JpegFragmentMap.jpg';

const testFileGainMap = 'GainMap.dat';
const testFileUnrefocus = 'UnrefocusMap.dat';
const testFileDepth = 'DepthMap.dat';
const testFileLinear = 'LinearMap.dat';
const testFileFragment = 'FragmentMap.dat';
const testFileGainMapSize: image.Size = { height: 960, width: 720 };
const testFileUnrefocusSize: image.Size = { height: 4096, width: 3072 };
const testFileDepthSize: image.Size = { height: 4096, width: 3072 };
const testFileLinearSize: image.Size = { height: 4096, width: 3072 };
const testFileFragmentSize: image.Size = { height: 4096, width: 3072 };
const imageFormatJpeg = 'image/jpeg';
const imageFormatHeif = 'image/heif';
const imageFormatPng = 'image/png';
const imageLengthKey = 'ImageLength';
const imageWidthKey = 'ImageWidth';
const imageLengthValue = '15';
const imageWidthValue = '20';

const imageFragmentHeightKey = 'FragmentImageHeight';
const imageFragmentWidthKey = 'FragmentImageWidth';
const imageFragmentHeightValue = '15';
const imageFragmentWidthValue = '20';

const GAINMAP = image.AuxiliaryPictureType.GAINMAP;
const DEPTH_MAP = image.AuxiliaryPictureType.DEPTH_MAP;
const UNREFOCUS_MAP = image.AuxiliaryPictureType.UNREFOCUS_MAP;
const LINEAR_MAP = image.AuxiliaryPictureType.LINEAR_MAP;
const FRAGMENT_MAP = image.AuxiliaryPictureType.FRAGMENT_MAP;

const IMAGE_BAD_PARAMETER = 401;
const IMAGE_UNKNOWN_ERROR = 7600901;

function getFilePath(fileName: string): string {
  let filePath = AppStorage.get('pathDir') + "/" + fileName;
  return filePath;
}

function getCachePath(fileName: string): string {
  let filePath = AppStorage.get('cacheDir') + "/" + fileName;
  return filePath;
}

function compareArray(array1: Array<number>, array2: Array<number>): boolean {
  if (array1.length != array2.length) {
    return false;
  }

  for (let i = 0; i < array1.length; i++) {
    if (array1[i] != array2[i]) {
      return false;
    }
  }
  return true;
}

function compareArrayBuffer(buffer1: ArrayBuffer, buffer2: ArrayBuffer): boolean {
  if (buffer1.byteLength != buffer2.byteLength) {
    return false;
  }

  let view1 = new Uint8Array(buffer1);
  let view2 = new Uint8Array(buffer2);
  for (let i = 0; i < view1.length; i++) {
    if (view1[i] != view2[i]) {
      return false;
    }
  }
  return true;
}

function createDefaultExifMetadata(): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);
  ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue);
  ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue);
  return metadata;
}

function createDefaultFragemntMetadata(): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
  ndkTest.MetadataSetProperty(imageFragmentHeightKey, imageFragmentHeightValue);
  ndkTest.MetadataSetProperty(imageFragmentWidthKey, imageFragmentWidthValue);
  return metadata;
}

function createFillBuffer(size: number, value: number): ArrayBuffer {
  let buffer = new ArrayBuffer(size);
  let view = new Uint8Array(buffer);
  view.fill(value);
  return buffer;
}

async function sleep(delay: number): Promise<void> {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(domain, testTag, 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function packPictureNdkTest() {
  describe('packPictureNdkTest', () => {
    let isSupportHdr: boolean = false;
    beforeAll(() => {
      isSupportHdr = !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
        display.getDefaultDisplaySync().hdrFormats.length != 0;
    })

    afterEach(() => {
      try {
        ndkTest.releaseTestContext();
      } catch (err) {
        hilog.error(domain, testTag, `afterAll: Test exception ` + err);
      }
    })

    const testCreateAuxiliaryPicture = (type: image.AuxiliaryPictureType) => {
      let auxSize: image.Size = {height: 15, width: 20};
      let auxBuffer = createFillBuffer(1200, 128);
      let auxPicture: image.AuxiliaryPicture =
        ndkTest.CreateAuxiliaryPicture(auxBuffer, auxSize, type);
      return auxPicture;
    }

    const testCreatePictureByPixelMap = (logger: Logger, fileName: string) => {
      let filePath = getFilePath(fileName);
      logger.log(`create image source from file: ${filePath}`);
      ndkTest.createTestImageSource(filePath);
      ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV21);
      let result = ndkTest.CreatePictureByPixelmap();
      logger.log(`create picture by pixelmap: ${result == 0 ? "success" : "failed"}`);
      expect(result).assertEqual(0);
    }

    const testCreatePictureByImageSource = (logger: Logger, fileName: string,
                                            auxTypes?: Array<image.AuxiliaryPictureType>) => {
      let filePath = getFilePath(fileName);
      logger.log(`create image source from file: ${filePath}`);
      ndkTest.createTestImageSource(filePath);
      ndkTest.CreatePictureDecodingOptions();
      if (auxTypes != undefined) {
        expect(ndkTest.SetDesiredAuxiliaryPictures(auxTypes.length, auxTypes)).assertEqual(0);
      }
      let result = ndkTest.CreatePictureByImageSource();
      logger.log(`create picture by ImageSource: ${result == 0 ? "success" : "failed"}`);
      expect(result).assertEqual(0);
    }

    const getBuffer = (fileName: string) => {
      let filePath = getFilePath(fileName);
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const addAuxiliaryPicture = (auxiliaryPicture: image.AuxiliaryPictureType) => {
      let fileName = '';
      let auxSize: image.Size = { width: 0, height: 0 };
      switch (auxiliaryPicture) {
        case GAINMAP: 
          fileName = testFileGainMap;
          auxSize = testFileGainMapSize;
          break;
        case UNREFOCUS_MAP: 
          fileName = testFileUnrefocus;
          auxSize = testFileUnrefocusSize;
          break;
        case DEPTH_MAP: 
          fileName = testFileDepth;
          auxSize = testFileDepthSize;
          break;
        case LINEAR_MAP: 
          fileName = testFileLinear;
          auxSize = testFileLinearSize;
          break;
        case FRAGMENT_MAP: 
          fileName = testFileFragment;
          auxSize = testFileFragmentSize;
          break;  
        default: break;
      }
      let auxBuffer = getBuffer(fileName);
      let auxPicture: image.AuxiliaryPicture =
        ndkTest.CreateAuxiliaryPicture(auxBuffer, auxSize, auxiliaryPicture);

      ndkTest.SetAuxiliaryPicture(auxiliaryPicture, auxPicture);
    }

    const createPicturePackingOption = (packOpt: image.PackingOption) => {
      ndkTest.createTestImagePacker();
      ndkTest.createTestPackingOptions();
      ndkTest.setMimeTypeToTestPackingOptions(packOpt.format);
      if (packOpt.desiredDynamicRange) {
        ndkTest.setDynamicRangeToTestPackingOptions(packOpt.desiredDynamicRange);
      }
      if (packOpt.needsPackProperties) {
        ndkTest.setNeedsPackPropertiesToTestPackingOptions(packOpt.needsPackProperties);
      }
    }

    const getWtriteFileName = (file: string, pictureFrom: string, packOpt: image.PackingOption,
                               auxiliaryPicture?: Array<image.AuxiliaryPictureType>) => {
      let writeFileName = "pack_" + file.substring(0, file.indexOf(".")) + "_" + pictureFrom + "_";
      if (packOpt.desiredDynamicRange == 0) {
        writeFileName = writeFileName + "DynamicRange_Auto_";
      } else {
        writeFileName = writeFileName + "DynamicRange_Sdr_";
      }
      if (packOpt.needsPackProperties) {
        writeFileName = writeFileName + "NeedPackPropertyies_True_";
      } else {
        writeFileName = writeFileName + "NeedPackPropertyies_False_";
      }
      if (auxiliaryPicture) {
        for (let i = 0; i < auxiliaryPicture.length; i++) {
          writeFileName = writeFileName + auxiliaryPicture[i] + "_";
        }
      }
      writeFileName = writeFileName + file.slice(file.indexOf("."));
      return writeFileName;
    }

    const testCheckResult = async (imageSource: image.ImageSource, packOpt: image.PackingOption, auxTypes?: Array<image.AuxiliaryPictureType>) => {
      await imageSource.createPicture().then((picture: image.Picture)=> {
        if (auxTypes && packOpt.desiredDynamicRange == 0) {
            for (let i = 0; i < auxTypes.length; i++) {
              let auxPic = picture.getAuxiliaryPicture(auxTypes[i]);
              console.info(`${testTag} PackResult: getAuxiliaryPicture:${auxTypes[i]} ${auxPic != undefined} `)
              expect(auxPic != undefined).assertTrue();
              if (auxTypes[i] == GAINMAP) {
                let isHdr = imageSource.getImageInfoSync().isHdr;
                console.info(`${testTag} PackResult: isHdr:${isHdr} `)
                expect(isHdr).assertEqual(true);
              }
            }
          }
          expect(picture.getMainPixelmap() != undefined).assertTrue();
      })
    }

    const testPackPicture = async (logger: Logger, done: Function, fileName: string, type: string,
    packOpt: image.PackingOption, interfaceName: string, auxTypes?: Array<image.AuxiliaryPictureType>) => {
      logger.log('begin');
      try {
        if (type == "PictureFromPixelMap") {
          testCreatePictureByPixelMap(logger, fileName);
          if (auxTypes) {
            for (let i = 0; i < auxTypes.length; i++) {
              addAuxiliaryPicture(auxTypes[i])
            }
          }
        } else {
          testCreatePictureByImageSource(logger, fileName, auxTypes);
        }
        if (auxTypes) {
          for (let i = 0; i < auxTypes.length; i++) {
            expect(ndkTest.GetAuxiliaryPicture(auxTypes[i]) != undefined).assertTrue();
          }
        }
        createPicturePackingOption(packOpt);
        if (interfaceName == "PackToDataFromPicture") {
          let size: image.Size = ndkTest.GetImageSourceInfoSize();
          logger.log(`GetImageSourceInfoSize: { width: ${size.width}, height: ${size.height} }`);
          let buffer = new ArrayBuffer(size.width * size.height * 4);
          expect(ndkTest.PackToDataFromPicture(buffer)).assertEqual(0);
          let imageSource = image.createImageSource(buffer);
          await testCheckResult(imageSource, packOpt, auxTypes);
        } else if (interfaceName == "PackToFileFromPicture") {
          let writeFileName = getWtriteFileName(fileName, type, packOpt, auxTypes);
          let writeFile = getCachePath(writeFileName);
          logger.log(`write image filePath ` + writeFile);
          let file = fs.openSync(writeFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          expect(ndkTest.PackToFileFromPicture(file.fd)).assertEqual(0);
          fs.closeSync(file.fd);
          let readFile = fs.openSync(writeFile);
          let imageSource = image.createImageSource(readFile.fd);
          await testCheckResult(imageSource, packOpt, auxTypes);
        } else if (interfaceName == "PackToDataFromPictureError") {
          let size: image.Size = ndkTest.GetImageSourceInfoSize();
          logger.log(`GetImageSourceInfoSize: { width: ${size.width}, height: ${size.height} }`);
          let buffer = new ArrayBuffer(size.width * size.height * 4);
          expect(ndkTest.PackToDataFromPicture(buffer)).assertEqual(0);
        } else if (interfaceName == "PackToFileFromPictureError") {
          let writeFileName = getWtriteFileName(fileName, type, packOpt, auxTypes);
          let writeFile = getCachePath(writeFileName);
          logger.log(`write image filePath ` + writeFile);
          let file = fs.openSync(writeFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          expect(ndkTest.PackToFileFromPicture(file.fd)).assertEqual(0);
        }
        done();
      } catch (error) {
        logger.log(`Test exception: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    }

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_CONVERT_PNG_TO_DATA_0100
     * @tc.name      : PackToFileFromPicture
     * @tc.desc      : Test packing pictures to file when the format of picture is png.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_CONVERT_PNG_TO_DATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let logger = new Logger("SUB_MULTIMEDIA_PICTURE_NDK_CONVERT_PNG_TO_DATA_0100");
        logger.log('begin');
        try {
          testCreatePictureByPixelMap(logger,testFileJpg);
  
          let packOpt: image.PackingOption = {
          format: imageFormatPng,
          quality: 100,
          needsPackProperties: true
          }
          ndkTest.createTestImagePacker();
          ndkTest.createTestPackingOptions();
          ndkTest.setMimeTypeToTestPackingOptions(packOpt.format);
  
          let writeFile = getCachePath("pack_native_picture.png");
          let file = fs.openSync(writeFile, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          expect(ndkTest.PackToFileFromPicture(file.fd)).assertEqual(IMAGE_BAD_PARAMETER);
          fs.closeSync(file.fd);
          done();
        } catch (err) {
          logger.log(`Test exception: ${JSON.stringify(err)}`);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PACK_PNG_PICTURE_TO_DATA_0100
     * @tc.name      : PackToDataFromPicture
     * @tc.desc      : Test packing pictures to data when the format of picture is png.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PACK_PNG_PICTURE_TO_DATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let logger = new Logger("SUB_MULTIMEDIA_PICTURE_NDK_PACK_PNG_PICTURE_TO_DATA_0100");
        logger.log('begin');
        try {
          testCreatePictureByPixelMap(logger,testFileJpg);
  
          let packOpt: image.PackingOption = {
          format: imageFormatPng,
          quality: 100,
          needsPackProperties: true
          }
          ndkTest.createTestImagePacker();
          ndkTest.createTestPackingOptions();
          ndkTest.setMimeTypeToTestPackingOptions(packOpt.format);
  
          let buffer = new ArrayBuffer(10000 * 10000);
          expect(ndkTest.PackToDataFromPictureErrorCode(buffer)).assertEqual(IMAGE_BAD_PARAMETER);
          done();
        } catch (err) {
          logger.log(`Test exception: ${JSON.stringify(err)}`);
          expect().assertFalse();
          done();
        }
      }
    })
  })
}