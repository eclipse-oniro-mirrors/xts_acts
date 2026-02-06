/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterAll, it, expect, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';

import { camera } from '@kit.CameraKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

let isSupportHdr: Boolean;
const CAMERA_FORMAT_JPEG = camera.CameraFormat.CAMERA_FORMAT_JPEG;
const CAMERA_FORMAT_YUV_420_SP = camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
const CAMERA_FORMAT_YCBCR_P010 = camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010;
const CAMERA_FORMAT_YCRCB_P010 = camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010;

const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const NV21 = image.PixelMapFormat.NV21;
const YCBCR_P010 = image.PixelMapFormat.YCBCR_P010;
const YCRCB_P010 = image.PixelMapFormat.YCRCB_P010;

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "ImageReceiverTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

interface CameraInitResult {
  cameraManager: camera.CameraManager;
  cameraInput: camera.CameraInput;
  cameraDevice: camera.CameraDevice;
}

interface CameraResources {
  imageReceiver?: image.ImageReceiver;
  cameraInput?: camera.CameraInput;
  photoOutput?: camera.PhotoOutput;
  photoSession?: camera.PhotoSession;
  previewOutput?: camera.PreviewOutput;
  previewSession?: camera.VideoSession;
  videoOutput?: camera.VideoOutput;
  videoSession?: camera.VideoSession;
}

interface CaseResult {
  resources: CameraResources;
  result: boolean;
}

const cameraFormatToImgFormatMap = new Map<camera.CameraFormat, number>([
  [CAMERA_FORMAT_JPEG, 38],
  [CAMERA_FORMAT_YUV_420_SP, 25],
  [CAMERA_FORMAT_YCBCR_P010, 35],
  [CAMERA_FORMAT_YCRCB_P010, 36]
]);

const formatToPixelMapFormatMap = new Map<number, image.PixelMapFormat>([
  [12, RGBA_8888],
  [25, NV21],
  [35, YCBCR_P010],
  [36, YCRCB_P010]
]);

const pixelMapFormatToSizeMap = new Map<image.PixelMapFormat, number>([
  [RGBA_8888, 4],
  [NV21, 1.5],
  [YCBCR_P010, 3],
  [YCRCB_P010, 3]
]);

function isValidColorSpace(value: number): boolean {
  return Object.values(colorSpaceManager.ColorSpace).includes(value);
}

function isValidMetadataType(value: number): boolean {
  return Object.values(image.HdrMetadataType).includes(value);
}

function checkSupportOutputFormat(
  logger: Logger,
  cameraManager: camera.CameraManager,
  cameraDevice: camera.CameraDevice,
  sceneMode: camera.SceneMode,
  profileKey: 'photoProfiles' | 'previewProfiles',
  expectFormat: camera.CameraFormat
): boolean {
  const cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode);
  if (!cameraOutputCap) {
    logger.log('getSupportedOutputCapability returned null');
    return false;
  }
  const profilesArray: camera.Profile[] = cameraOutputCap[profileKey];
  logger.log(`Retrieved ${profileKey}: ${JSON.stringify(profilesArray)}`);
  if (!profilesArray || profilesArray.length === 0) {
    logger.log(`No ${profileKey} available`);
    return false;
  }

  const configProfile = profilesArray.find((profile) => profile.format === expectFormat);
  if (!configProfile) {
    logger.log('Expected format not supported');
    return false;
  }
  return true;
}

async function decodeImageUsingAllocator(
  logger: Logger,
  bufferData: image.ImageBufferData
): Promise<image.ImageInfo|undefined> {
  try {
    let sourceOptions: image.SourceOptions = {sourceDensity: 120};
    let imageSource = image.createImageSource(bufferData.byteBuffer, sourceOptions);
    logger.log("create ImageSource from buffer data using allocator.");
    let pixelMap = await imageSource.createPixelMapUsingAllocator();
    logger.log("create PixelMap using allocator success.");
    let imageInfo = await pixelMap!.getImageInfo();
    logger.log("PixelMap image info: " + JSON.stringify(imageInfo));
    return imageInfo;
  } catch (error) {
    logger.log("Error createPixelMapUsingAllocator from buffer data: " + error.code + ", message: " + error.message);
    return undefined;
  }
}

async function decodeImage(logger: Logger, nextImage: image.Image, bufferData: image.ImageBufferData): Promise<image.ImageInfo|undefined> {
  logger.log("create ImageSource from buffer data.");

  let width = nextImage.size.width;
  let height = nextImage.size.height;
  let stride = bufferData.rowStride;
  let imageFormat = nextImage.format;
  let pixelMapFormat = formatToPixelMapFormatMap.get(imageFormat) ?? RGBA_8888;
  let mSize = pixelMapFormatToSizeMap.get(pixelMapFormat) ?? 1.5;
  logger.log(`Image format: ${imageFormat}, mapped PixelMap format: ${pixelMapFormat}, mSize: ${mSize}`);
  logger.log(`getComponent with width:${width} height:${height} stride:${stride}`);
  try {
    let pixelMap : image.PixelMap;
    if (stride[0] == width) {
      logger.log("stride and width are consistent.");
      pixelMap = await image.createPixelMap(bufferData.byteBuffer, {
        size: { height: height, width: width },
        srcPixelFormat: pixelMapFormat,
      })
    } else {
      logger.log("stride and width are not consistent. Carry out data reorganization.");
      const dstBufferSize = width * height * mSize;
      let dstArr: Uint8Array | Uint16Array;
      if (pixelMapFormat == NV21) {
        dstArr = new Uint8Array(dstBufferSize);
        for (let j = 0; j < height * mSize; j++) {
          const srcBuf = new Uint8Array(bufferData.byteBuffer, j * stride[0], width);
          dstArr.set(srcBuf, j * width)
        }
      } else {
        dstArr = new Uint16Array(dstBufferSize / 2);
        for (let j = 0; j < height * mSize / 2; j++) {
          const srcBuf = new Uint16Array(bufferData.byteBuffer, j * stride[0], width);
          dstArr.set(srcBuf, j * width)
        }
      }

      pixelMap = await image.createPixelMap(dstArr.buffer, {
        size: { height: height, width: width },
        srcPixelFormat: pixelMapFormat
      })
    }

    let ImageInfo = await pixelMap.getImageInfo();
    logger.log("create pixelMap success, pixelMap image info: " + JSON.stringify(ImageInfo));

    pixelMap.release();
    return ImageInfo;
  } catch (error) {
    logger.log("Error createPixelMap from buffer data: " + error.code + ", message: " + error.message);
    return undefined;
  }
}

async function GetHdrMetadata(logger: Logger, img: image.Image) {
  let ret = true;
  try {
    let hdrMetadataType = img.getMetadata(image.HdrMetadataKey.HDR_METADATA_TYPE);
    logger.log("HDR Metadata Type: " + JSON.stringify(hdrMetadataType));
    ret = isValidMetadataType(hdrMetadataType as number);
    logger.log("HDR Metadata Type is valid: " + ret);
  } catch (error) {
    logger.log("HDR Metadata Type not available, error: " + error.code + ", message: " + error.message);
    return false;
  }

  try {
    let staticMetadata = img.getMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA);
    logger.log("HDR Static Metadata: " + JSON.stringify(staticMetadata));
    ret = ret && (staticMetadata != undefined);
  } catch (error) {
    logger.log("HDR Static Metadata not available, error: " + error.code + ", message: " + error.message);
    return false;
  }

  try {
    let dynamicMetadata = img.getMetadata(image.HdrMetadataKey.HDR_DYNAMIC_METADATA);
    let dynamicMetadataArray = new Uint8Array(dynamicMetadata as ArrayBuffer);
    for (let i = 0; i < dynamicMetadataArray.length; i++) {
      logger.log("HDR Dynamic Metadata byte[" + i + "]: " + dynamicMetadataArray[i]);
    }
    ret = ret && (dynamicMetadataArray.length > 0);
  } catch (error) {
    logger.log("HDR Dynamic Metadata not available, error: " + error.code + ", message: " + error.message);
    return false;
  }
  return ret;
}

function validationStride(logger: Logger, imageFormat: image.PixelMapFormat, bufferData: image.ImageBufferData, sizeWidth: number): boolean {
  let byteBuffer = bufferData.byteBuffer;
  let ret = false;
  if (imageFormat != image.PixelMapFormat.RGBA_8888) {
    let pixelStrideY = 0;
    let pixelStrideUV = 0;
    switch (imageFormat) {
      case image.PixelMapFormat.NV21:
        pixelStrideY = 1;
        pixelStrideUV = 2;
        break;
      case image.PixelMapFormat.YCBCR_P010:
      case image.PixelMapFormat.YCRCB_P010:
        pixelStrideY = 2;
        pixelStrideUV = 4;
        break;
      default:
        logger.log("Unsupported image format for stride validation: " + imageFormat);
        return false;
    }
    ret = (bufferData.rowStride[0] >= sizeWidth) &&
          (bufferData.rowStride[1] >= sizeWidth) &&
          (bufferData.pixelStride[0] >= pixelStrideY) &&
          (bufferData.pixelStride[1] >= pixelStrideUV) &&
          byteBuffer.byteLength > 0;
    if (!ret) {
      logger.log(`Stride validation failed: 
                  rowStride[0]: ${bufferData.rowStride[0]}, rowStride[1]: ${bufferData.rowStride[1]}, 
                  pixelStride[0]: ${bufferData.pixelStride[0]}, pixelStride[1]: ${bufferData.pixelStride[1]}`);
    }
  } else {
    ret = byteBuffer.byteLength > 0;
  }
  return ret;
}

async function GetAndVerifyImageBufferData(img: image.Image, logger: Logger): Promise<boolean> {
  logger.log("Getting image buffer data");
  let bufferData = img.getBufferData();
  if (bufferData == null) {
    logger.log("No buffer data available");
    return false;
  }

  let ret = false;
  let byteBuffer = bufferData.byteBuffer;
  logger.log("Buffer data: Row Stride length: " + bufferData.rowStride.length +
             ", Pixel Stride length: " + bufferData.pixelStride.length +
             ", Byte Buffer length: " + byteBuffer.byteLength);
  let imageFormat = formatToPixelMapFormatMap.get(img.format) ?? image.PixelMapFormat.RGBA_8888;
  ret = validationStride(logger, imageFormat, bufferData, img.size.width);

  if (!ret) {
    logger.log("Buffer data stride validation failed");
    return false;
  }

  if (imageFormat == image.PixelMapFormat.RGBA_8888) {
    let imgInfo = await decodeImageUsingAllocator(logger, bufferData);
    ret = ret && (imgInfo != undefined);
    logger.log("Image buffer data processed using allocator, result: " + ret);
    return ret;
  }

  if (imageFormat != image.PixelMapFormat.YCBCR_P010 && imageFormat != image.PixelMapFormat.YCRCB_P010) {
    let imgInfo = await decodeImage(logger, img, bufferData);
    ret = ret && (imgInfo != undefined);
    logger.log("Image buffer data processed, result: " + ret);
  } else {
    logger.log("No need to decode image for format: " + imageFormat);
  }

  return ret;
}

function waitForImage(
  logger: Logger,
  imageReceiver: image.ImageReceiver,
  isPreView: boolean,
  expectFormat: camera.CameraFormat,
): Promise<boolean> {
  return new Promise<boolean>((resolve) => {
    let resolved = false;
    const timeout = setTimeout(() => {
      if (!resolved) {
        logger.log('waitForImage timeout, resolve(false)');
        resolved = true;
        resolve(false);
      }
    }, 10000);

    imageReceiver.on('imageArrival', async () => {
      if (resolved) return;
      resolved = true;
      clearTimeout(timeout);
      logger.log('imageArrival event triggered');

      try {
        const img: image.Image = await imageReceiver.readNextImage();
        if (!img) {
          logger.log('No image available');
          resolve(false);
          return;
        }

        logger.log(`img format: ${img.format}, size: ${JSON.stringify(img.size)}, timestamp: ${img.timestamp}, Color space: ${img.colorSpace}`);
        let pixelMapFormat = formatToPixelMapFormatMap.get(img.format) ?? image.PixelMapFormat.RGBA_8888;
        if (isPreView && isSupportHdr && (pixelMapFormat == YCBCR_P010 || pixelMapFormat == YCRCB_P010)) {
          const retHdr = await GetHdrMetadata(logger, img);
          if (!retHdr) {
            logger.log('HDR metadata retrieval failed');
            resolve(false);
            return;
          }
        } else {
          logger.log('No HDR metadata retrieval needed');
        }
        let imgFormat = cameraFormatToImgFormatMap.get(expectFormat) ?? 25;
        const ret = await GetAndVerifyImageBufferData(img, logger) && img.format == imgFormat && isValidColorSpace(img.colorSpace);
        await img.release();
        resolve(ret);
      } catch (error) {
        logger.log('Error processing image data: ' + error);
        resolve(false);
      }
    });
  });
}

function createImageReceiver(logger: Logger): image.ImageReceiver|undefined {
  let opts: image.ImageReceiverOptions = {
    size : { width: 1920, height: 1080 },
    capacity : 8,
  };
  let receiver = image.createImageReceiver(opts);
  logger.log('ImageReceiver created');
  return receiver;
}

async function initCamera(logger: Logger, context: common.UIAbilityContext): Promise<CameraInitResult> {
  logger.log('Preparing camera');
  const cameraManager = camera.getCameraManager(context);
  logger.log('CameraManager obtained');
  const cameraArray = cameraManager.getSupportedCameras();
  logger.log(`Supported cameras: ${JSON.stringify(cameraArray)}`);
  const cameraInput = cameraManager.createCameraInput(cameraArray[0]);
  logger.log('Camera input created');
  await cameraInput.open();
  logger.log('Camera input opened');
  const result: CameraInitResult = {
    cameraManager: cameraManager,
    cameraInput: cameraInput,
    cameraDevice: cameraArray[0]
  };
  return result;
}

async function configCameraOutput(
  logger: Logger,
  cameraManager: camera.CameraManager,
  cameraDevice: camera.CameraDevice,
  imageReceiver: image.ImageReceiver,
  sceneMode: camera.SceneMode,
  profileKey: 'photoProfiles' | 'previewProfiles',
  expectFormat: number
): Promise<camera.PhotoOutput | camera.PreviewOutput> {
  logger.log(`Configuring camera output for scene mode: ${sceneMode}, profile key: ${profileKey}`);
  const cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode);
  const profilesArray = cameraOutputCap[profileKey];
  logger.log(`Retrieved ${profileKey}: ${JSON.stringify(profilesArray)}`);
  if (!profilesArray || profilesArray.length === 0) {
    logger.log(`No ${profileKey} available`);
    throw new Error(`No ${profileKey} available`);
  }

  let configProfile = profilesArray.find((profile: camera.Profile) => profile.format === expectFormat);
  if (!configProfile) {
    logger.log('Expected format not supported, defaulting to first profile');
    configProfile = profilesArray[0];
  }
  logger.log('Config profile: ' + JSON.stringify(configProfile));

  const surfaceId = await imageReceiver.getReceivingSurfaceId();
  logger.log(`ImageReceiver ID: ${surfaceId}`);
  if (profileKey === 'photoProfiles') {
    return cameraManager.createPhotoOutput(configProfile, surfaceId);
  } else {
    return cameraManager.createPreviewOutput(configProfile, surfaceId);
  }
}

function setColorSpaceBeforeCommitConfig(
  logger: Logger,
  session: camera.VideoSession,
  isHdr: boolean
): void {
  let colorSpace: colorSpaceManager.ColorSpace = isHdr ? colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT :
                                                         colorSpaceManager.ColorSpace.BT709_LIMIT;
  let colorSpaces: Array<colorSpaceManager.ColorSpace> = session.getSupportedColorSpaces();
  logger.log(`supported colorSpaces: ${JSON.stringify(colorSpaces)}`);
  let isSupportedColorSpaces = colorSpaces.indexOf(colorSpace) >= 0;
  if (isSupportedColorSpaces) {
    logger.log(`setColorSpace: ${colorSpace}`);
    try {
      session.setColorSpace(colorSpace);
    } catch (error) {
      let err = error as BusinessError;
      logger.log(`setColorSpace call failed. error code: ${err.code}, message: ${err.message}`);
    }
    let activeColorSpace:colorSpaceManager.ColorSpace = session.getActiveColorSpace();
    logger.log(`activeColorSpace: ${activeColorSpace}`);
  } else {
    logger.log(`colorSpace: ${colorSpace} is not supported, skip setting color space`);
  }
}

async function startPhotoSession(
  logger: Logger,
  cameraManager: camera.CameraManager,
  cameraInput: camera.CameraInput,
  photoOutput: camera.PhotoOutput,
  previewOutput: camera.PreviewOutput
): Promise<camera.PhotoSession> {
  const photoSession = cameraManager.createSession(camera.SceneMode.NORMAL_PHOTO) as camera.PhotoSession;
  photoSession.beginConfig();
  photoSession.addInput(cameraInput);
  photoSession.addOutput(photoOutput);
  photoSession.addOutput(previewOutput);
  await photoSession.commitConfig();
  logger.log('Photo session committed');
  await photoSession.start();
  logger.log('Photo session started');
  return photoSession;
}

async function startPreviewSession(
  logger: Logger,
  cameraManager: camera.CameraManager,
  cameraInput: camera.CameraInput,
  previewOutput: camera.PreviewOutput,
  isHdr: boolean
): Promise<camera.VideoSession> {
  const previewSession = cameraManager.createSession(camera.SceneMode.NORMAL_VIDEO) as camera.VideoSession;
  previewSession.beginConfig();
  previewSession.addInput(cameraInput);
  previewSession.addOutput(previewOutput);
  setColorSpaceBeforeCommitConfig(logger, previewSession, isHdr);
  await previewSession.commitConfig();
  logger.log('Preview session committed');
  await previewSession.start();
  logger.log('Preview session started');
  return previewSession;
}

async function capturePhoto(logger: Logger, photoOutput: camera.PhotoOutput): Promise<void> {
  const photoCaptureSetting: camera.PhotoCaptureSetting = {
    quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
    rotation: camera.ImageRotation.ROTATION_0
  };
  logger.log('Capturing photo');
  await photoOutput.capture(photoCaptureSetting);
  logger.log('Photo capture command sent');
}

async function imageReceiverPhotoCase(
  logger: Logger,
  context: common.UIAbilityContext,
  expectCameraFormat: camera.CameraFormat
): Promise<CaseResult> {
  const imageReceiver = createImageReceiver(logger);
  const imageReceiverPreview = createImageReceiver(logger);
  if (!imageReceiver || !imageReceiverPreview) {
    logger.log('Failed to create ImageReceiver');
    throw new Error('ImageReceiver is undefined');
  }
  const cameraInitResult = await initCamera(logger, context);
  const cameraManager = cameraInitResult.cameraManager;
  const cameraInput = cameraInitResult.cameraInput;
  const cameraDevice = cameraInitResult.cameraDevice;
  const outputCheck = checkSupportOutputFormat(logger, cameraManager, cameraDevice, camera.SceneMode.NORMAL_PHOTO,
    'photoProfiles', expectCameraFormat);
  if (!outputCheck) {
    logger.log('Expected output format not supported, releasing resources and skipping case');
    await releaseResources({ imageReceiver: imageReceiverPreview });
    return { resources: { imageReceiver, cameraInput }, result: true };
  }
  logger.log('Expected output format is supported');
  const photoOutput = await configCameraOutput(logger, cameraManager, cameraDevice, imageReceiver,
    camera.SceneMode.NORMAL_PHOTO, 'photoProfiles', expectCameraFormat) as camera.PhotoOutput;
  
  const previewOutput = await configCameraOutput(logger, cameraManager, cameraDevice, imageReceiverPreview,
    camera.SceneMode.NORMAL_PHOTO, 'previewProfiles', expectCameraFormat) as camera.PreviewOutput;
  const retPromise = waitForImage(logger, imageReceiver, false, expectCameraFormat);
  const photoSession = await startPhotoSession(logger, cameraManager, cameraInput, photoOutput, previewOutput);
  await capturePhoto(logger, photoOutput);
  const ret = await retPromise;

  return { resources: { imageReceiver, cameraInput, photoOutput, photoSession }, result: ret };
}

async function imageReceiverPreviewCase(
  logger: Logger,
  context: common.UIAbilityContext,
  expectCameraFormat: camera.CameraFormat
): Promise<CaseResult> {
  const imageReceiver = createImageReceiver(logger);
  if (!imageReceiver) {
    logger.log('Failed to create ImageReceiver');
    throw new Error('ImageReceiver is undefined');
  }
  const cameraInitResult = await initCamera(logger, context);
  logger.log('Camera initialized');
  const cameraManager = cameraInitResult.cameraManager;
  const cameraInput = cameraInitResult.cameraInput;
  const cameraDevice = cameraInitResult.cameraDevice;
  const outputCheck = checkSupportOutputFormat(logger, cameraManager, cameraDevice, camera.SceneMode.NORMAL_VIDEO,
    'previewProfiles', expectCameraFormat);
  if (!outputCheck) {
    logger.log('Expected preview output format not supported, releasing resources and skipping case');
    return { resources: { imageReceiver, cameraInput }, result: true };
  }
  logger.log('Expected preview output format is supported');
  const previewOutput = await configCameraOutput(logger, cameraManager, cameraDevice, imageReceiver, camera.SceneMode.NORMAL_VIDEO,
    'previewProfiles', expectCameraFormat) as camera.PreviewOutput;
  logger.log('Preview output configured');
  const retPromise = waitForImage(logger, imageReceiver, true, expectCameraFormat);
  logger.log('Waiting for image setup complete');
  let isHdr = (expectCameraFormat != CAMERA_FORMAT_YUV_420_SP) ? true : false;
  const previewSession = await startPreviewSession(logger, cameraManager, cameraInput, previewOutput, isHdr);
  logger.log('Setting color space before committing preview session config');
  logger.log('Preview session started, waiting for image');
  const ret = await retPromise;

  return { resources: { imageReceiver, cameraInput, previewOutput, previewSession }, result: ret };
}

async function releaseResources(resources: CameraResources) {
  try {
    if (resources.photoSession) {
      await resources.photoSession.stop();
      await resources.photoSession.release();
    }
    if (resources.previewSession) {
      await resources.previewSession.stop();
      await resources.previewSession.release();
    }
    if (resources.photoOutput) {
      await resources.photoOutput.release();
    }
    if (resources.previewOutput) {
      await resources.previewOutput.release();
    }
    if (resources.cameraInput) {
      await resources.cameraInput.close();
    }
    if (resources.imageReceiver) {
      resources.imageReceiver.off('imageArrival');
      await resources.imageReceiver.release();
    }
  } catch (err) {
    console.error('Error releasing resources:', err);
  }
}

export default function ImageReceiverTest() {
  let cameras: camera.CameraDevice[];
  const context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
  console.log('ImageReceiverTest context: ' + context);

  describe("ImageReceiverTest", (): void => {

    beforeAll(() => {
      console.info('ImageReceiverTest beforeAll');
      cameras = camera.getCameraManager(context).getSupportedCameras();
      isSupportHdr = 
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0100
     * @tc.desc        1.create receiver
     *                 2.set opts
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0100');
      let opts: image.ImageReceiverOptions = {
        size : { width: 1920, height: 1080 },
        capacity : 8
      };
      try {
        let receiver = image.createImageReceiver(opts);
        if (receiver) {
          let ret = receiver.size.width === 1920 && receiver.size.height === 1080 && receiver.capacity === 8;
          logger.log('ImageReceiver created successfully');
          expect(ret).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0200
     * @tc.desc        1.create receiver
     *                 2.set opts
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0200');
      try {
        let opts: image.ImageReceiverOptions = {
          size : { width: 1920, height: 1080 }
        };
        let receiver = image.createImageReceiver(opts);
        if (receiver) {
          logger.log('ImageReceiver created successfully');
          let ret = receiver.size.width === 1920 && receiver.size.height === 1080;
          expect(ret).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0300
     * @tc.desc        1.create receiver
     *                 2.set opts
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0300');
      try {
        let opts: image.ImageReceiverOptions = {
          capacity : 8
        };
        let receiver = image.createImageReceiver(opts);
        if (receiver) {
          logger.log('ImageReceiver created successfully, capacity: ' + receiver.capacity);
          let ret = receiver.capacity == 8;
          expect(ret).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0400
     * @tc.desc        1.create receiver
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0400');
      try {
        let receiver = image.createImageReceiver();
        if (receiver) {
          logger.log('ImageReceiver created successfully');
          expect(receiver != undefined).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0500
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0500
     * @tc.desc        1.create receiver
     *                 2.set error opts
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0500');
      try {
        let opts: image.ImageReceiverOptions = {
          size : { width: 0, height: 0 }
        };
        let receiver = image.createImageReceiver(opts);
        if (receiver) {
          logger.log('ImageReceiver created successfully, size: ' + JSON.stringify(receiver.size));
          expect(receiver != undefined).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0600
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0600
     * @tc.desc        1.create receiver
     *                 2.set error opts
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_TEST_0600');
      try {
        let opts: image.ImageReceiverOptions = {
          capacity : -1
        };
        let receiver = image.createImageReceiver(opts);
        if (receiver) {
          logger.log('ImageReceiver created successfully, capacity: ' + receiver.capacity);
          expect(receiver != undefined).assertTrue();
        } else {
          logger.log('Failed to create ImageReceiver');
          expect(false).assertTrue();
        }
      } catch (error) {
        logger.log(`Exception during ImageReceiver creation: code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0100
     * @tc.desc        1.create receiver
     *                 2.init camera
     *                 3.config preview output
     *                 4.start preview session
     *                 5.wait image arrival and get image data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0100");
      if (!cameras) {
        logger.log(`initCamera getSupportedCameras failed!`);
        return;
      }
      if (!isSupportHdr) {
        logger.log('device is not supported HDR, skipping test case');
        done();
        return;
      }
      let ret: CaseResult | undefined;
      try {
        ret = await imageReceiverPreviewCase(logger, context, CAMERA_FORMAT_YUV_420_SP);
        logger.log('Preview test case result: ' + JSON.stringify(ret));
        expect(ret.result).assertTrue();
        done();
      } catch(err) {
        logger.log('Preview test case failed: ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      } finally {
        if (ret) {
          await releaseResources(ret.resources);
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0200
     * @tc.desc        1.create receiver
     *                 2.init camera
     *                 3.config preview output
     *                 4.start preview session
     *                 5.wait image arrival and get image data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0200");
      if (!cameras) {
        logger.log(`initCamera getSupportedCameras failed!`);
        done();
        return;
      }
      if (!isSupportHdr) {
        logger.log('device is not supported HDR, skipping test case');
        done();
        return;
      }
      let ret: CaseResult | undefined;
      try {
        ret = await imageReceiverPreviewCase(logger, context, CAMERA_FORMAT_YCBCR_P010);
        logger.log('Preview test case result: ' + JSON.stringify(ret));
        expect(ret.result).assertTrue();
        done();
      } catch(err) {
        logger.log('Preview test case failed: ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      } finally {
        if (ret) {
          await releaseResources(ret.resources);
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0300
     * @tc.desc        1.create receiver
     *                 2.init camera
     *                 3.config preview output
     *                 4.start preview session
     *                 5.wait image arrival and get image data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PREVIEW_TEST_0300");
      if (!cameras) {
        logger.log(`initCamera getSupportedCameras failed!`);
        done();
        return;
      }
      if (!isSupportHdr) {
        logger.log('device is not supported HDR, skipping test case');
        done();
        return;
      }
      let ret: CaseResult | undefined;
      try {
        ret = await imageReceiverPreviewCase(logger, context, CAMERA_FORMAT_YCRCB_P010);
        logger.log('Preview test case result: ' + JSON.stringify(ret));
        expect(ret.result).assertTrue();
        done();
      } catch(err) {
        logger.log('Preview test case failed: ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      } finally {
        if (ret) {
          await releaseResources(ret.resources);
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PHOTO_TEST_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PHOTO_TEST_0100
     * @tc.desc        1.create receiver
     *                 2.init camera
     *                 3.config photo output
     *                 4.start photo session
     *                 5.capture photo
     *                 6.wait image arrival and get image data
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PHOTO_TEST_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATE_RECEIVER_PHOTO_TEST_0100");
      if (!cameras) {
        logger.log(`initCamera getSupportedCameras failed!`);
        return;
      }
      if (!isSupportHdr) {
        logger.log('device is not supported HDR, skipping test case');
        done();
        return;
      }
      let ret: CaseResult | undefined;
      try {
        ret = await imageReceiverPhotoCase(logger, context, CAMERA_FORMAT_JPEG);
        logger.log('Test case result: ' + JSON.stringify(ret));
        expect(ret.result).assertTrue();
      } catch(err) {
        logger.log('Test case failed: ' + JSON.stringify(err));
        expect(false).assertTrue(); 
      } finally {
        if (ret) {
          logger.log('Releasing resources');
          await releaseResources(ret.resources);
        }
      }
      done();
    });
  });
}