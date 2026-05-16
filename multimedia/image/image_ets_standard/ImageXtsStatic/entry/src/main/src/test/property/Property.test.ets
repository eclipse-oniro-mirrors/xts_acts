/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import { Context } from '@kit.ArkUI';
import fs from '@ohos.file.fs';

const TAG = 'Xts.PropertyTest';

let testContext: Context = Hypium.get("Context") as Context;
let path: string | undefined;
let pixelMap: image.PixelMap | undefined;

async function createPictureObj(done: () => void,testName: string, pathUri: string): Promise<image.Picture> {
  let fileC = fs.openSync(pathUri, fs.OpenMode.READ_ONLY);
  const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fileC.fd);
  console.info(TAG, testName, 'createImageSource Successful.');
  let commodityPixelMap: image.PixelMap | undefined = await imageSourceObj!.createPixelMap();
  console.info(TAG, testName, 'createPixelMap Successful.');
  fs.closeSync(fileC.fd);
  return image.createPicture(commodityPixelMap!);
}

export default function MakerNoteHuaweiMetadataTest(): void {
  describe('MakerNoteHuaweiMetadataTest', (): void => {
    let filePath: string = '';
    let fdNumber: int;

    const getFd = (fileName: string): int => {
      filePath = testContext.filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };

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
     * @tc.number     SUB_MEDIA_IMAGE_MakerNoteHuaweiMetadata_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_MakerNoteHuaweiMetadata_static_0100
     * @tc.desc       image -MakerNoteHuaweiMetadata -createInstance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_MakerNoteHuaweiMetadata_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_MakerNoteHuaweiMetadata_static_0100';
      try {
        let result = image.MakerNoteHuaweiMetadata.createInstance();
        expect(result.isXmageSupported == undefined).assertTrue();
        expect(result.xmageWatermarkMode == undefined).assertTrue();
        expect(result.xmageLeft == undefined).assertTrue();
        expect(result.xmageTop == undefined).assertTrue();
        expect(result.xmageRight == undefined).assertTrue();
        expect(result.xmageBottom == undefined).assertTrue();
        expect(result.xmageColorMode == undefined).assertTrue();
        expect(result.isCloudEnhanced == undefined).assertTrue();
        expect(result.cloudLabel == undefined).assertTrue();
        expect(result.isWindSnapshot == undefined).assertTrue();
        expect(result.sceneVersion == undefined).assertTrue();
        expect(result.sceneFoodConfidence == undefined).assertTrue();
        expect(result.sceneStageConfidence == undefined).assertTrue();
        expect(result.sceneBlueSkyConfidence == undefined).assertTrue();
        expect(result.sceneGreenPlantConfidence == undefined).assertTrue();
        expect(result.sceneBeachConfidence == undefined).assertTrue();
        expect(result.sceneSnowConfidence == undefined).assertTrue();
        expect(result.sceneSunsetConfidence == undefined).assertTrue();
        expect(result.sceneSunsetConfidence == undefined).assertTrue();
        expect(result.sceneFlowersConfidence == undefined).assertTrue();
        expect(result.sceneNightConfidence == undefined).assertTrue();
        expect(result.sceneTextConfidence == undefined).assertTrue();
        expect(result.faceCount == undefined).assertTrue();
        expect(result.faceConfidences == undefined).assertTrue();
        expect(result.faceSmileScores == undefined).assertTrue();
        expect(result.captureMode == undefined).assertTrue();
        expect(result.burstNumber == undefined).assertTrue();
        expect(result.isFrontCamera == undefined).assertTrue();
        expect(result.rollAngle == undefined).assertTrue();
        expect(result.pitchAngle == undefined).assertTrue();
        expect(result.physicalAperture == undefined).assertTrue();
        expect(result.focusMode == undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' createInstance error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_constant_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_constant_static_0100
     * @tc.desc       image - Constant类型覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_constant_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_constant_static_0100';
      try {
        expect(Number(image.XMAGE_WATERMARK_MODE_AT_THE_BOTTOM)).assertEqual(9);
        expect(Number(image.XMAGE_WATERMARK_MODE_BORDER)).assertEqual(10);
        expect(Number(image.CAPTURE_MODE_PROFESSIONAL)).assertEqual(2);
        expect(Number(image.CAPTURE_MODE_FRONT_LENS_NIGHT_VIEW)).assertEqual(7);
        expect(Number(image.CAPTURE_MODE_PANORAMA)).assertEqual(8);
        expect(Number(image.CAPTURE_MODE_TAIL_LIGHT)).assertEqual(9);
        expect(Number(image.CAPTURE_MODE_LIGHT_GRAFFITI)).assertEqual(10);
        expect(Number(image.CAPTURE_MODE_SILKY_WATER)).assertEqual(11);
        expect(Number(image.CAPTURE_MODE_STAR_TRACK)).assertEqual(12);
        expect(Number(image.CAPTURE_MODE_WIDEAPERTURE)).assertEqual(19);
        expect(Number(image.CAPTURE_MODE_MOVING_PHOTO)).assertEqual(20);
        expect(Number(image.CAPTURE_MODE_PORTRAIT)).assertEqual(23);
        expect(Number(image.CAPTURE_MODE_REAR_LENS_NIGHT_VIEW)).assertEqual(42);
        expect(Number(image.CAPTURE_MODE_SUPER_MACRO)).assertEqual(47);
        expect(Number(image.CAPTURE_MODE_SNAP_SHOT)).assertEqual(62);
        done();
      } catch (error) {
        console.error(TAG, testName, 'Error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_EnumValue_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_EnumValue_static_0100
     * @tc.desc       image - EnumValue 类型覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IMAGE_EnumValue_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_EnumValue_static_0100';
      try {
        expect(Number(image.DecodingDynamicRange.AUTO)).assertEqual(0);
        expect(image.PropertyKey.ISO_SPEED_RATINGS).assertEqual('ISOSpeedRatings');
        expect(Number(image.ComponentType.JPEG)).assertEqual(4);
        expect(Number(image.MetadataType.GIF_METADATA)).assertEqual(5);
        expect(Number(image.MetadataType.HEIFS_METADATA)).assertEqual(15);
        expect(Number(image.CAPTURE_MODE_TAIL_LIGHT)).assertEqual(9);
        expect(Number(image.CAPTURE_MODE_LIGHT_GRAFFITI)).assertEqual(10);
        expect(Number(image.FocusMode.AF_A)).assertEqual(0);
        expect(Number(image.FocusMode.AF_S)).assertEqual(1);
        expect(Number(image.FocusMode.AF_C)).assertEqual(2);
        expect(Number(image.FocusMode.MF)).assertEqual(3);
        expect(Number(image.XmageColorMode.NORMAL)).assertEqual(0);
        expect(Number(image.XmageColorMode.BRIGHT)).assertEqual(1);
        expect(Number(image.XmageColorMode.SOFT)).assertEqual(2);
        expect(Number(image.XmageColorMode.MONO)).assertEqual(3);
        done();
      } catch (error) {
        console.error(TAG, testName, 'Error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0100
     * @tc.desc       createImageReceiver cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0100';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'size.height：'+ receiver!.size.height);
        expect(receiver!.size.width).assertEqual(480);
        expect(receiver!.size.height).assertEqual(480);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_createImageReceiver_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_createImageReceiver_static_0200
     * @tc.desc       createImageReceiver cover return capacity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_createImageReceiver_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_createImageReceiver_static_0200';
      try {
        let options: image.ImageReceiverOptions = {
          size: { width: 480, height: 480 },
          capacity: 3
        }
        let receiver: image.ImageReceiver | undefined = image.createImageReceiver(options);
        console.info(TAG, testName, 'capacity为：'+ receiver!.capacity);
        expect(receiver!.capacity).assertEqual(3);
        done();
      } catch (error) {
        console.error(TAG, testName, `Fail: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getImageInfoSync_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getImageInfoSync_static_0100
     * @tc.desc   getImageInfoSync the AlphaType emu the size the density the stride the isHdr the mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getImageInfoSync_static_0100', Level.LEVEL0, async (done: () => void) : Promise<void>=> {
      const testName = 'SUB_MEDIA_IMAGE_getImageInfoSync_static_0100';
      try {
        getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
        console.info(TAG,testName, 'imageSource', JSON.stringify(imageSourceObj));
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: { width: 1, height: 2 },
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
          desiredRegion: { size: { width: 1, height: 2 }, x: 0, y: 0 },
          cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
          index: 0
        };
        pixelMap = imageSourceObj!.createPixelMapSync(decodingOptions);
        console.info(TAG,testName, 'pixelMap', JSON.stringify(pixelMap));
        let imageInfo : image.ImageInfo = pixelMap!.getImageInfoSync();
        expect(Number(imageInfo.size.width)).assertEqual(1);
        expect(Number(imageInfo.size.height)).assertEqual(2);
        expect(imageInfo.density == 0).assertTrue();
        expect(imageInfo.stride == 4).assertTrue();
        expect(imageInfo.alphaType == image.AlphaType.PREMUL).assertTrue();
        expect(imageInfo.mimeType == 'image/jpeg').assertTrue();
        expect(imageInfo.isHdr).assertFalse();
        console.info(TAG, testName, ' getImageInfoSync success', JSON.stringify(imageInfo));
      } catch (error) {
        console.error(TAG, testName, ' getImageInfoSync error', error);
        expect().assertFail();
      } finally {
        await pixelMap!.release();
        done();
      }
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100
     * @tc.desc       Metadata - getAllProperties
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100';
      getFd("test_exif_v2.jpg");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
      console.info(TAG,testName,'imageSourceObj: ' + JSON.stringify(imageSourceObj));
      let commodityPixelMap: image.PixelMap | undefined= await imageSourceObj!.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      let metaData: image.Metadata | undefined = await pictureObj.getMetadata(metadataType);
      try {
        let res =  await metaData!.getAllProperties();
        console.info(TAG, testName, `getAllProperties successs: ${res}`);
        expect(res!=undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     SUB_MEDIA_IAMGE_readImageMetadata_static_0200
     * @tc.name       SUB_MEDIA_IAMGE_readImageMetadata_static_0200
     * @tc.desc       readImageMetadata cover webPMetadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_IAMGE_readImageMetadata_static_0200', Level.LEVEL0, async (done: () => void) : Promise<void> => {
      const testName = 'SUB_MEDIA_IAMGE_readImageMetadata_static_0200';
      getFd("moving_test.webp");
      const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
      console.info(TAG,testName,'imageSourceObj: ' + JSON.stringify(imageSourceObj));
      try {
        let ImageMetadata = await imageSourceObj!.readImageMetadata();
        console.info(TAG,testName,'ImageMetadata.webPMetadata: ' + JSON.stringify(ImageMetadata.webPMetadata!.canvasWidth));
        console.info(TAG,testName,'ImageMetadata.webPMetadata: ' + JSON.stringify(ImageMetadata.webPMetadata!.canvasHeight));
        console.info(TAG,testName,'ImageMetadata.webPMetadata: ' + JSON.stringify(ImageMetadata.webPMetadata!.delayTime));
        console.info(TAG,testName,'ImageMetadata.webPMetadata: ' + JSON.stringify(ImageMetadata.webPMetadata!.unclampedDelayTime));
        console.info(TAG,testName,'ImageMetadata.webPMetadata: ' + JSON.stringify(ImageMetadata.webPMetadata!.loopCount));
        expect(ImageMetadata.webPMetadata!.canvasWidth).assertEqual(658);
        expect(ImageMetadata.webPMetadata!.canvasHeight).assertEqual(494);
        expect(ImageMetadata.webPMetadata!.delayTime).assertEqual(1000);
        expect(ImageMetadata.webPMetadata!.unclampedDelayTime).assertEqual(1000);
        expect(ImageMetadata.webPMetadata!.loopCount).assertEqual(0);
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj!.release();
      done();
    })

  })
}