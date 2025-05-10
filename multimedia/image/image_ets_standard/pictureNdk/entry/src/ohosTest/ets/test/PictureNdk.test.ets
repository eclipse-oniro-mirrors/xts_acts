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

import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium';
import ndkTest from 'libPictureNdk.so';
import image from "@ohos.multimedia.image";
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { BusinessError } from '@kit.BasicServicesKit';

import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

const domain = 0x0000;
const testTag = 'pictureNdkTest';
const testFileJpg = 'JPEGISOSingle.jpg';
const testFileHeic = 'HEIFISOMultiChannelBaseColor0512V12.heic';
const testNoAuxiliaryPictureJpg = 'test.jpg';
const testFileWithFiveAuxiliaryPictureJpg = 'AllAuxiliaryPictures_exclude_fragment.jpg';
const testFileWithFiveAuxiliaryPictureHeic = 'all_auxtype.heic';
const testNoAuxiliaryPictureHeic = '0801_sdr2.heic';
const testFileUnrefocusHeic = "IMG_825866834_004.heic";
const testFileFragmentHeic = 'HeicFragmentMap.heic';
const testFileFragmentJpg = 'JpegFragmentMap.jpg';
const testFilePng = "test.png";
const testFileAllAuxiliaryPictures = "AllAuxiliaryPictures.jpg";

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

const imageFormatPng = 'image/png';
const imageFormatJpeg = 'image/jpeg';
const imageFormatHeif = 'image/heif';

const imageWidthKey = 'ImageWidth';
const imageLengthKey = 'ImageLength';
const imageWidthValue = '20';
const imageHeightValue = "512";
const imageLengthValue = '15';
const fragmentImageWidthKey = 'FragmentImageWidth';
const fragmentImageHeightKey = 'FragmentImageHeight';
const fragmentImageWidthValue = '512';
const fragmentImageHeightValue = '512';
const xInOriginalKey = "XInOriginal";
const yInOriginalKey = "YInOriginal";
const xInOriginalValue = '0';
const yInOriginalValue = '0';
const orientationKey = 'Orientation';
const orientationValue = '1';

const imageWidthKeyErr ="ImageWidthErr";
const imageHeightKeyErr ="ImageHeightErr";
const imageLengthKeyErr = 'ImageLengthErr';
const imageWidthValueErr = "-1";
const imageHeightValueErr = "-1";
const fragmentImageWidthKeyErr = "FragmentImageWidthErr";
const fragmentImageHeightKeyErr = "FragmentImageHeightErr";
const fragmentImageWidthValueErr = "-1";
const fragmentImageHeightValueErr = "-1";
const xInOriginalKeyErr = "XInOriginalErr";
const yInOriginalKeyErr = "YInOriginalErr";
const xInOriginalValueErr = "-1";
const yInOriginalValueErr = "-1";
const orientationKeyErr = "OrientationErr";
const orientationValueErr = "-1";

const testAllAuxiliaryPicturesExcludeFragmentJpg = "AllAuxiliaryPictures_exclude_fragment.jpg";

enum ErrorCode {
  /** operation success */
  IMAGE_SUCCESS = 0,
  /** invalid parameter */
  IMAGE_BAD_PARAMETER = 401,
  /** unsupported metadata */
  IMAGE_UNSUPPORTED_METADATA = 7600202,
  /** encode failed */
  IMAGE_ENCODE_FAILED = 7800301,
  /** decode failed */
  IMAGE_DECODE_FAILED = 7700301,
};

interface ExifInfo {
  key: string,
  value: string
}

const metadataDefaultAllKey: Array<ExifInfo> = [
  {key: "ApertureValue", value: "2.00 EV (f/2.0)"},
  {key: "BitsPerSample", value: "8, 8, 8"},
  {key: "BrightnessValue", value: "-2.00 EV (0.86 cd/m^2)"},
  {key: "ColorSpace", value: "Uncalibrated"},
  {key: "ComponentsConfiguration", value: "Y Cb Cr -"},
  {key: "Contrast", value: "Normal"},
  {key: "CustomRendered", value: "Custom process"},
  {key: "DateTimeDigitized", value: "2024:01:11 09:39:58"},
  {key: "DateTimeOriginal", value: "2024:01:11 09:39:58"},
  {key: "ExposureBiasValue", value: "0.00 EV"},
  {key: "ExposureMode", value: "Auto exposure"},
  {key: "ExposureProgram", value: "Normal program"},
  {key: "ExposureTime", value: "1/590 sec."},
  {key: "FNumber", value: "f/2.0"},
  {key: "FileSource", value: "DSC"},
  {key: "Flash", value: "Flash did not fire"},
  {key: "FlashpixVersion", value: "FlashPix Version 1.0"},
  {key: "FocalLength", value: "6.3 mm"},
  {key: "FocalLengthIn35mmFilm", value: "27"},
  {key: "GPSAltitude", value: "0.00"},
  {key: "GPSAltitudeRef", value: "Sea level reference"},
  {key: "GPSDateStamp", value: "2024:01:11"},
  {key: "GPSTimeStamp", value: "01:39:58.00"},
  {key: "GPSVersionID", value: "2.2.0.0"},
  {key: "GainControl", value: "Normal"},
  {key: "HwMnoteBurstNumber", value: "default_exif_value"},
  {key: "HwMnoteCaptureMode", value: "0"},
  {key: "HwMnoteCloudEnhancementMode", value: "default_exif_value"},
  {key: "HwMnoteFaceConf", value: "default_exif_value"},
  {key: "HwMnoteFaceCount", value: "default_exif_value"},
  {key: "HwMnoteFaceLeyeCenter", value: "default_exif_value"},
  {key: "HwMnoteFaceMouthCenter", value: "default_exif_value"},
  {key: "HwMnoteFacePointer", value: "188"},
  {key: "HwMnoteFaceRect", value: "default_exif_value"},
  {key: "HwMnoteFaceReyeCenter", value: "default_exif_value"},
  {key: "HwMnoteFaceSmileScore", value: "default_exif_value"},
  {key: "HwMnoteFaceVersion", value: "1207959808"},
  {key: "HwMnoteFocusMode", value: "default_exif_value"},
  {key: "HwMnoteFrontCamera", value: "0"},
  {key: "HwMnoteIsXmageSupported", value: "1"},
  {key: "HwMnotePhysicalAperture", value: "1"},
  {key: "HwMnotePitchAngle", value: "-83"},
  {key: "HwMnoteRollAngle", value: "26"},
  {key: "HwMnoteSceneBeachConf", value: "default_exif_value"},
  {key: "HwMnoteSceneBlueSkyConf", value: "default_exif_value"},
  {key: "HwMnoteSceneFlowersConf", value: "default_exif_value"},
  {key: "HwMnoteSceneFoodConf", value: "default_exif_value"},
  {key: "HwMnoteSceneGreenPlantConf", value: "default_exif_value"},
  {key: "HwMnoteSceneNightConf", value: "default_exif_value"},
  {key: "HwMnoteScenePointer", value: "170"},
  {key: "HwMnoteSceneSnowConf", value: "default_exif_value"},
  {key: "HwMnoteSceneStageConf", value: "default_exif_value"},
  {key: "HwMnoteSceneSunsetConf", value: "default_exif_value"},
  {key: "HwMnoteSceneTextConf", value: "default_exif_value"},
  {key: "HwMnoteSceneVersion", value: "1207959808"},
  {key: "HwMnoteWindSnapshotMode", value: "default_exif_value"},
  {key: "HwMnoteXmageBottom", value: "0"},
  {key: "HwMnoteXmageLeft", value: "0"},
  {key: "HwMnoteXmageMode", value: "0"},
  {key: "HwMnoteXmageRight", value: "0"},
  {key: "HwMnoteXmageTop", value: "0"},
  {key: "ISOSpeedRatings", value: "160"},
  {key: "ImageDescription", value: "_cuva"},
  {key: "ImageLength", value: "4000"},
  {key: "ImageWidth", value: "3000"},
  {key: "LightSource", value: "Daylight"},
  {key: "MakerNote", value: "HwMnoteScenePointer:170,HwMnoteSceneVersion:1207959808,HwMnoteFacePointer:188,HwMnoteFaceVersion:1207959808,HwMnoteCaptureMode:0,HwMnoteFrontCamera:0,HwMnoteRollAngle:26,HwMnotePitchAngle:-83,HwMnotePhysicalAperture:1,HwMnoteIsXmageSupported:1,HwMnoteXmageMode:0,HwMnoteXmageLeft:0,HwMnoteXmageTop:0,HwMnoteXmageRight:0,HwMnoteXmageBottom:0"},
  {key: "MeteringMode", value: "Pattern"},
  {key: "MicroVideoPresentationTimestampUS", value: "default_exif_value"},
  {key: "MovingPhotoId", value: "default_exif_value"},
  {key: "MovingPhotoVersion", value: "default_exif_value"},
  {key: "Orientation", value: "Unknown value 0"},
  {key: "PhotographicSensitivity", value: "160"},
  {key: "PixelXDimension", value: "4000"},
  {key: "PixelYDimension", value: "3000"},
  {key: "ResolutionUnit", value: "Inch"},
  {key: "Saturation", value: "Normal"},
  {key: "SceneCaptureType", value: "Standard"},
  {key: "SceneType", value: "Directly photographed"},
  {key: "SensingMethod", value: "One-chip color area sensor"},
  {key: "Sharpness", value: "Normal"},
  {key: "ShutterSpeedValue", value: "29.00 EV (1/536870912 sec.)"},
  {key: "Software", value: "MNA-AL00 4.0.0.120(C00E116R3P7)"},
  {key: "SubjectDistanceRange", value: "Unknown"},
  {key: "SubsecTime", value: "427000"},
  {key: "SubsecTimeDigitized", value: "427000"},
  {key: "SubsecTimeOriginal", value: "427000"},
  {key: "WhiteBalance", value: "Auto white balance"},
  {key: "XResolution", value: "72"},
  {key: "YCbCrPositioning", value: "Centered"},
  {key: "YResolution", value: "72"},
]

const getBuffer = (fileName: string) => {
  let filePath = getFilePath(fileName);
  let file = fs.openSync(filePath);
  const stats = fs.statSync(filePath);
  const fileSize = stats.size;
  const bufferRead = new ArrayBuffer(fileSize)
  fs.readSync(file.fd, bufferRead)
  return bufferRead
}

const testCreateImageSource = (caseName: string, fileName: string) => {
  let filePath = getFilePath(fileName);
  hilog.info(domain, testTag, caseName + `: image filePath ` + filePath);
  ndkTest.createTestImageSource(filePath);
}

const testCreatePictureByPixelMap = (caseName: string, fileName: string) => {
  testCreateImageSource(caseName, fileName)
  ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);
  let result: number = ndkTest.CreatePictureByPixelmap();
  expect(result).assertEqual(ErrorCode.IMAGE_SUCCESS);
}

const testCreatePictureByImageSource = (caseName: string, fileName: string, 
  inAuxTpyes: Array<image.AuxiliaryPictureType>) => {
  testCreateImageSource(caseName, fileName)
  ndkTest.CreatePictureDecodingOptions();
  ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
  ndkTest.CreatePictureByImageSource();
}

const testCreateAuxiliaryPicture = (auxType: image.AuxiliaryPictureType): image.AuxiliaryPicture => {
  let fileName = '';
  let auxSize: image.Size = {height: 180, width: 240};
  let auxBuffer = createFillBuffer(172800, 4);
  switch (auxType) {
    case image.AuxiliaryPictureType.GAINMAP: 
      fileName = testFileGainMap;
      auxSize = testFileGainMapSize;
      auxBuffer = getBuffer(fileName);
      break;
    default: 
      break;
  }
  let auxPicture: image.AuxiliaryPicture =
    ndkTest.CreateAuxiliaryPicture(auxBuffer, auxSize, auxType);
  return auxPicture;
}

const testSetAuxiliaryPicture = (done: Function, auxType: image.AuxiliaryPictureType, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreatePictureByPixelMap(caseName, testFileJpg);
    let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(auxType);
    
    expect(ndkTest.SetAuxiliaryPicture(auxType, auxPicture)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.GetAuxiliaryPicture(auxType) != undefined).assertTrue();
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testCasesOfCreateAuxiliaryPicture = (done: Function, auxType: image.AuxiliaryPictureType,caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreateAuxiliaryPicture(auxType);

    expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testAuxiliaryPictureReadWritePixels = (done: Function, fileName: string,
  auxType: image.AuxiliaryPictureType, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    let inAuxTpyes: Array<image.AuxiliaryPictureType> = [auxType];
    testCreatePictureByImageSource(caseName, fileName, inAuxTpyes);

    let auxPicture: image.AuxiliaryPicture = ndkTest.GetAuxiliaryPicture(auxType);
    expect(auxPicture != undefined).assertTrue();

    let info: ndkTest.IAuxInfo = ndkTest.AuxiliaryPictureGetInfo();
    let writeBuffer = createFillBuffer(info.width * info.height * 4, 4);
    let readBuffer: ArrayBuffer = new ArrayBuffer(writeBuffer.byteLength);
    expect(ndkTest.AuxiliaryPictureWritePixels(writeBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(compareArrayBuffer(readBuffer, writeBuffer)).assertTrue();
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testAuxiliaryPictureInfoSetTypeAndGetType = (done: Function, auxType: image.AuxiliaryPictureType,
  caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    ndkTest.CreateAuxiliaryPictureInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetType(auxType)).assertEqual(ErrorCode.IMAGE_SUCCESS);

    expect(ndkTest.AuxiliaryPictureInfoGetType()).assertEqual(auxType);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testSetAndGetPixelFormatByCreateAuxInfo = (done: Function, pixelFormat: image.PixelMapFormat,
  caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    ndkTest.CreateAuxiliaryPictureInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetPixelFormat(pixelFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);

    expect(ndkTest.AuxiliaryPictureInfoGetPixelFormat()).assertEqual(pixelFormat);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testSetAndGetPixelFormat = (done: Function, auxType: image.AuxiliaryPictureType, 
  pixelMapFormat: image.PixelMapFormat, caseName: string) => {
  hilog.info(domain, testTag, caseName +` begin`);
  try {
    testCreateAuxiliaryPicture(auxType);

    ndkTest.AuxiliaryPictureGetInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetPixelFormat(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    if (pixelMapFormat == image.PixelMapFormat.RGBA_F16) {
      expect(ndkTest.AuxiliaryPictureSetInfoToCtx()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
    } else {
      expect(ndkTest.AuxiliaryPictureSetInfoToCtx()).assertEqual(ErrorCode.IMAGE_SUCCESS);
      ndkTest.AuxiliaryPictureGetInfo();
      expect(ndkTest.AuxiliaryPictureInfoGetPixelFormat()).assertEqual(pixelMapFormat);
    }
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testPixelMapFormatInPicture = (done: Function, fileName: string, 
  pixelMapFormat: image.PixelMapFormat, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreateImageSource(caseName, fileName)
    if(pixelMapFormat == image.PixelMapFormat.ALPHA_8) {
      expect(ndkTest.createTestPixelmapByImageSource(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
    } else {
      expect(ndkTest.createTestPixelmapByImageSource(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    }

    expect(ndkTest.CreatePictureByPixelmap()).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.GetMainPixelmapInfo().pixelFormat).assertEqual(pixelMapFormat);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

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
  return ndkTest.compareArrayBuffer(buffer1, buffer2);
}

function compareArrayForLessTimes(buffer1: ArrayBuffer, buffer2: ArrayBuffer): boolean {
  if (buffer1.byteLength != buffer2.byteLength) {
    return false;
  }

  let view1 = new Uint8Array(buffer1);
  let view2 = new Uint8Array(buffer2);
  for (let i = 0; i < 100; i++) {
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

function createDefaultFragmentMetadata(): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
  ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue);
  ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue);
  ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue);
  ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue);
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

export default function pictureNdkTest() {
  describe('pictureNdkTest', () => {
    let isSupportHdr: boolean = false;
    beforeAll(async () => {
      isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so').then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      });
    })

    afterEach(() => {
      try {
        ndkTest.releaseTestContext();
      } catch (err) {
        hilog.error(domain, testTag, `afterEach: Test exception ` + err);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100
     * @tc.name      : testImageSourceCreatePictureDecodingOptions
     * @tc.desc      : Test create default picture decoding options.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        testCreateAuxiliaryPicture(auxType);

        expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100
     * @tc.name      : testImageSourceCreatePicture
     * @tc.desc      : Test create default picture by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testFileJpg);
        ndkTest.CreatePictureDecodingOptions();

        expect(ndkTest.CreatePictureByImageSource()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100
     * @tc.name      : testImageSourceSetDesiredAuxiliaryPictures
     * @tc.desc      : Test set desired auxiliary pictures to decoding options.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        testCreateAuxiliaryPicture(auxType);
        
        expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100
     * @tc.name      : testImageSourceGetDesiredAuxiliaryPictures
     * @tc.desc      : Test get desired AuxiliaryPicture from DecodingOptions.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
        ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
        let outAuxTpyes: Array<image.AuxiliaryPictureType> = ndkTest.GetDesiredAuxiliaryPictures();

        expect(compareArray(inAuxTpyes, outAuxTpyes)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100
     * @tc.name      : testImageSourceReleasePictureDecodingOptions
     * @tc.desc      : Test release the created DecodingOptionsForPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.UNREFOCUS_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
        ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);

        expect(ndkTest.ReleasePictureDecodingOptions()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100
     * @tc.name      : testSetAuxiliaryPicture
     * @tc.desc      : Test inserting AuxiliaryPicture with GAIN_MAP type into Picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.GAINMAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100`)
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200
     * @tc.name      : testSetAuxiliaryPicture
     * @tc.desc      : Test inserting AuxiliaryPicture with DEPTH_MAP type into Picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.DEPTH_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200`)
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300
     * @tc.name      : testSetAuxiliaryPicture
     * @tc.desc      : Test inserting AuxiliaryPicture with UNREFOCUS_MAP type into Picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300`)
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400
     * @tc.name      : testSetAuxiliaryPicture
     * @tc.desc      : Test inserting AuxiliaryPicture with LINEAR_MAP type into Picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.LINEAR_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400`)
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500
     * @tc.name      : testSetAuxiliaryPicture
     * @tc.desc      : Test inserting AuxiliaryPicture with FRAGMENT_MAP type into Picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.FRAGMENT_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500`)
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600
     * @tc.name      : testPictureSetAuxiliaryPicture
     * @tc.desc      : Test set AuxiliaryPicture to picture. Type error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let depthType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(gainmapType);

        expect(ndkTest.SetAuxiliaryPictureErrorCode(depthType, auxPicture)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700
     * @tc.name      : testPictureSetAuxiliaryPicture
     * @tc.desc      : Test set AuxiliaryPicture to picture. The AuxiliaryPicture object is empty.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let auxPicture: null = null;
        let depthType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        expect(ndkTest.SetAuxiliaryPictureErrorCode(depthType, auxPicture)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200
     * @tc.name      : testPictureGetAuxiliaryPicture
     * @tc.desc      : Test get AuxiliaryPicture from picture failed Unable to get the correct type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.UNREFOCUS_MAP];
        testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureJpg, inAuxTpyes);

        let noexistTypes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP,image.AuxiliaryPictureType.FRAGMENT_MAP];

        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[0]) != undefined).assertFalse();
        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[1]) != undefined).assertFalse();
        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[2]) != undefined).assertFalse();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400
     * @tc.name      : testPictureGetAuxiliaryPicture
     * @tc.desc      : Test get  AuxiliaryPicture from picture failed Unable to get the correct type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
        testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureJpg, inAuxTpyes);

        let noexistTypes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP,image.AuxiliaryPictureType.FRAGMENT_MAP];

        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[0])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[1])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[2])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500
     * @tc.name      : testGetAuxiliaryPicture
     * @tc.desc      : Test get AuxiliaryPicture from Picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(gainmapType);

        ndkTest.SetAuxiliaryPicture(gainmapType, auxPicture);
        expect(ndkTest.GetAuxiliaryPicture(gainmapType) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600
     * @tc.name      : testPictureGetAuxiliaryPicture
     * @tc.desc      : Prerequisite: Create an picture from PixelMap.
     *                 Test get AuxiliaryPicture from picture. there is no AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testNoAuxiliaryPictureJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        expect(ndkTest.GetAuxiliaryPictureErrorCode(gainmapType)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100
     * @tc.name      : testMetadataCreate
     * @tc.desc      : Test create exif metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200
     * @tc.name      : testMetadataCreate
     * @tc.desc      : Test create fragment metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set ptoperty to exif metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);
        
        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set ptoperty to fragment metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to exif metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKeyErr, imageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to exif metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKeyErr, imageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(orientationKeyErr, orientationValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to exif metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKey, imageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to exif metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKey, imageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(orientationKeyErr, orientationValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKeyErr, xInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageWidthKeyErr,fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageHeightKeyErr,fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKeyErr, xInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get ptoperty from metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataGetProperty(imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.MetadataGetProperty(imageWidthKey)).assertEqual(imageWidthValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100
     * @tc.name      : testPictureSetMetadata
     * @tc.desc      : Test set exif metadata to picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        expect(ndkTest.PictureSetMetadata(image.MetadataType.EXIF_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200
     * @tc.name      : testPictureSetMetadata
     * @tc.desc      : Test set fragment metadata to picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        expect(ndkTest.PictureSetMetadataErrorCode(image.MetadataType.FRAGMENT_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100
     * @tc.name      : testPictureGetMetadata
     * @tc.desc      : Test get exif metadata from picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.PictureSetMetadata(exifType, inMetadata);

        expect(ndkTest.PictureGetMetadata(exifType) != undefined).assertTrue();
        expect(ndkTest.pictureMetadataGetProperty(exifType, imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.pictureMetadataGetProperty(exifType, imageWidthKey)).assertEqual(imageWidthValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200
     * @tc.name      : testPictureGetMetadata
     * @tc.desc      : Test get metadata from picture with illegal type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.PictureSetMetadata(exifType, inMetadata);

        expect(ndkTest.PictureGetMetadataErrorCode(fragmentType)).assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100
     * @tc.name      : testGetMainPixelmap
     * @tc.desc      : Test get MainPixelmap from Picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testNoAuxiliaryPictureJpg);
        const auxInfo: ndkTest.IAuxInfo = ndkTest.GetMainPixelmapInfo();

        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);

        const mapInfo: ndkTest.IAuxInfo = ndkTest.GetMainPixelmapInfo();

        expect(mapInfo.width).assertEqual(auxInfo.width);
        expect(mapInfo.height).assertEqual(auxInfo.height);
        expect(mapInfo.pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100
     * @tc.name      : testGetGainmapPixelmap
     * @tc.desc      : Test get GainmapPixelmap from Picture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        const auxInfo: ndkTest.IAuxInfo = ndkTest.GetGainmapPixelmapInfo();

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);

        const mapInfo: ndkTest.IAuxInfo = ndkTest.GetGainmapPixelmapInfo();

        expect(mapInfo.width).assertEqual(auxInfo.width);
        expect(mapInfo.height).assertEqual(auxInfo.height);
        expect(mapInfo.pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100
     * @tc.name      : testPictureRelease
     * @tc.desc      : Test release the created picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        expect(ndkTest.ReleasePicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100
     * @tc.name      : testMetadataRelease
     * @tc.desc      : Test release the EXIF metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataRelease()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200
     * @tc.name      : testMetadataRelease
     * @tc.desc      : Test release the FRAGMENT metadata.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultFragmentMetadata();

        expect(ndkTest.MetadataRelease()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with GAIN_MAP type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100', 0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.GAINMAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with DEPTH_MAP type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200', 0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.DEPTH_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with UNREFOCUS_MAP type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300', 0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with LINEAR_MAP type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400', 0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.LINEAR_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with FRAGMENT_MAP type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500', 0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.FRAGMENT_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600
     * @tc.name      : testCreateAuxiliaryPicture
     * @tc.desc      : Test the creation of AuxiliaryPicture with illegal type.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = -1;
        let auxSize: image.Size = {height: 180, width: 240};
        let auxBuffer = createFillBuffer(172800, 4);

        expect(ndkTest.CreateAuxiliaryPictureErrorCode(auxBuffer, auxSize, auxType))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100
     * @tc.name      : testAuxiliaryPictureSetMetadata
     * @tc.desc      : Test set fragment metadata to auxiliary picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();

        expect(ndkTest.AuxiliaryPictureSetMetadata(image.MetadataType.FRAGMENT_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100
     * @tc.name      : testAuxiliaryPictureGetMetadata
     * @tc.desc      : Test get metadata from fragment auxiliary picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.AuxiliaryPictureSetMetadata(fragmentType, inMetadata);

        expect(ndkTest.AuxiliaryPictureGetMetadataErrorCode(fragmentType)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200
     * @tc.name      : testAuxiliaryPictureGetMetadata
     * @tc.desc      : Test get metadata from fragment auxiliary picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
        try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.AuxiliaryPictureSetMetadata(fragmentType, inMetadata);

        expect(ndkTest.AuxiliaryPictureGetMetadataErrorCode(exifType)).assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
       } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
       }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100
     * @tc.name      : testAuxiliaryPictureWritePixels
     * @tc.desc      : Test write pixels to AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let buffer = getBuffer(testFileGainMap);
        ndkTest.CreateAuxiliaryPicture(buffer, auxSize, image.AuxiliaryPictureType.GAINMAP);

        expect(ndkTest.AuxiliaryPictureWritePixels(buffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200
     * @tc.name      : testAuxiliaryPictureWritePixels
     * @tc.desc      : Test write pixels to AuxiliaryPicture.The pixel data buffer size is abnormal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let buffer = getBuffer(testFileGainMap);
        let writeBuffer = createFillBuffer(0, 0);
        ndkTest.CreateAuxiliaryPicture(buffer, auxSize, image.AuxiliaryPictureType.GAINMAP);
        expect(ndkTest.AuxiliaryPictureWritePixelsErrorCode(writeBuffer)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let writeBuffer = getBuffer(testFileGainMap);
        let readBuffer: ArrayBuffer = new ArrayBuffer(writeBuffer.byteLength);

        ndkTest.CreateAuxiliaryPicture(writeBuffer, auxSize, image.AuxiliaryPictureType.GAINMAP);

        ndkTest.AuxiliaryPictureWritePixels(writeBuffer);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayBuffer(readBuffer, writeBuffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV12);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400
     * @tc.name      : testAuxiliaryPictureReadPixels
     * @tc.desc      : Test read pixels from AuxiliaryPicture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV21);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set type to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.UNREFOCUS_MAP,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          let newType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
          expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(newType);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set size to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: 30,
            height: 40,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(30);
          expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(40);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set rowStride to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: 20,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(20);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set pixelFormat to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to 
                       AuxiliaryPicture which get from Picture created by ImageSource.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat:  image.PixelMapFormat.RGBA_8888
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500
     * @tc.name      : testAuxiliaryPictureSetInfo
     * @tc.desc      : Test set auxiliaryPictureInfo to auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        expect(ndkTest.AuxiliaryPictureSetInfo(auxInfo)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100
     * @tc.name      : testAuxiliaryPictureGetInfo
     * @tc.desc      : Test get auxiliaryPictureInfo from auxiliaryPicture
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        ndkTest.AuxiliaryPictureSetInfo(auxInfo);

        expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(auxInfo.auxiliaryPictureType);
        expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(auxInfo.width);
        expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(auxInfo.height);
        expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(auxInfo.rowStride);
        expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100
     * @tc.name      : testAuxiliaryPictureRelease
     * @tc.desc      : Test release the created (GAINMAP/DEPTH_MAP/UNREFOCUS_MAP/LINEAR_MAP/FRAGMENT_MAP) object.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);
 
        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200
     * @tc.name      : testAuxiliaryPictureRelease
     * @tc.desc      : Test release the AuxiliaryPicture added to picture.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileWithFiveAuxiliaryPictureJpg);

        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100
     * @tc.name      : testAuxiliaryPictureInfoCrerate
     * @tc.desc      : Test create auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.CreateAuxiliaryPictureInfo() != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.GAINMAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.DEPTH_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.LINEAR_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500
     * @tc.name      : testAuxiliaryPictureInfoSetTypeGetType
     * @tc.desc      : Test set and get type from auxiliaryPictureInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500', 0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.FRAGMENT_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500');
    })


    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600
     * @tc.name      : testAuxiliaryPictureInfoSetType
     * @tc.desc      : Test set illegal type to AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        let auxType: number = -1;
        expect(ndkTest.AuxiliaryPictureInfoSetTypeErrorCode(auxType)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetSizeGetSize
     * @tc.desc      : Test set and get normal size about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let inSize: image.Size = {height: 15, width: 20};
        expect(ndkTest.AuxiliaryPictureInfoSetSize(inSize)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        let outSize: image.Size = ndkTest.AuxiliaryPictureInfoGetSize();
        expect(outSize.width).assertEqual(inSize.width);
        expect(outSize.height).assertEqual(inSize.height);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100
     * @tc.name      : testAuxiliaryPictureInfoSetRowStrideGetRowStride
     * @tc.desc      : Test set and get normal rowStride about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let rowStride = 40;
        expect(ndkTest.AuxiliaryPictureInfoSetRowStride(rowStride)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.AuxiliaryPictureInfoGetRowStride()).assertEqual(rowStride);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100
     * @tc.name      : testAuxiliaryPictureInfoRelease
     * @tc.desc      : Test release AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        expect(ndkTest.ReleaseAuxiliaryPictureInfo()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get exif metadata property from PictureMetadata that contains some wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetProperty(imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.MetadataGetProperty(imageWidthKey)).assertEqual(imageWidthValue);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get exif metadata property from PictureMetadata that contains all wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(imageLengthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(imageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get fragment metadata property from PictureMetadata that contains some wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetProperty(xInOriginalKey)).assertEqual(xInOriginalValue);
        expect(ndkTest.MetadataGetProperty(yInOriginalKey)).assertEqual(yInOriginalValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400
     * @tc.name      : testMetadataGetProperty
     * @tc.desc      : Test get fragment metadata property from PictureMetadata that contains all wrong key values
     * @tc.size      : MediumTest
     * @tc.type      : Reliability
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(xInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(yInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100
     * @tc.name      : testPictureMetadataClone
     * @tc.desc      : Test clone PictureMetadata
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataClone() != undefined).assertTrue();
        expect(ndkTest.clonedMetadataGetProperty(imageLengthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageLengthKey));
        expect(ndkTest.clonedMetadataGetProperty(imageWidthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageWidthKey));
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get UNKNOWN pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.UNKNOWN,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGB_565 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get BGRA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGB_888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get ALPHA_8 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.ALPHA_8,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_F16 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get NV21 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get NV12 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get RGBA_1010102 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get YCBCR_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get YCRCB_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200', 0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200');
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200
     * @tc.name      : testAuxiliaryPictureInfoSetPixelFormatGetPixelFormat
     * @tc.desc      : Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200', 0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200')
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV21,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV21,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGB_565,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGB_565,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGBA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGBA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.BGRA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.BGRA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900', 0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV12,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900`);
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000
     * @tc.name      : testCreatePictureByPixelmap
     * @tc.desc      : Test create picture by pixelmap with different pixelMapFormat.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV12,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000`);
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100
     * @tc.name      : testImageSourceGetDesiredAuxiliaryPictures
     * @tc.desc      : Test get desired AuxiliaryPicture from DecodingOptions. 
     *                 Added AuxiliaryPicture type array length abnormal.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
        expect(ndkTest.SetDesiredAuxiliaryPictures(0, inAuxTpyes)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageWidthKey,fragmentImageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKey, xInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000
     * @tc.name      : testMetadataSetProperty
     * @tc.desc      : Test set property to fragment metadata with illegal value.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageHeightKeyErr, fragmentImageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileAllAuxiliaryPictures, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900', 0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        expect(true).assertTrue();
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testFileAllAuxiliaryPictures)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from jpg.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg);
        expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100
     * @tc.name      : testDecodePictureFromJpg
     * @tc.desc      : Test decode picture from png.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100', 0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testFilePng);
        ndkTest.CreatePictureDecodingOptions();
        expect(ndkTest.CreatePictureByImageSourceErrorCode()).assertEqual(ErrorCode.IMAGE_DECODE_FAILED);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

        /*
     * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100
     * @tc.name      : testDecodePictureFromHeif
     * @tc.desc      : Test decode picture from heif.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700', 0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic)
              ndkTest.CreatePictureDecodingOptions();
              ndkTest.CreatePictureByImageSource();
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /*
         * @tc.number    : SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800
         * @tc.name      : testDecodePictureFromHeif
         * @tc.desc      : Test decode picture from heif.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800', 0, async (done: Function) => {
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            expect(true).assertTrue();
            done();
          } else {
            await sleep(1000);
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic);
              expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
  })
}