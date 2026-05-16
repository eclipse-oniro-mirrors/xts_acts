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
import fs from '@ohos.file.fs';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import { Context } from '@kit.ArkUI';
import { resourceManager } from '@kit.LocalizationKit';

const TAG = 'Xts.PictureTest';

let testContext: Context = Hypium.get("Context") as Context;

export default function AuxiliaryPictureGetAuxiliaryPictureInfoTest(): void {
  describe('AuxiliaryPictureGetAuxiliaryPictureInfoTest', () => {
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
     * @tc.name   SUB_MEDIA_IMAGE_getMainPixelmap_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getMainPixelmap_static_0100
     * @tc.desc   getMainPixelmap return isEditable:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getMainPixelmap_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_getMainPixelmap_static_0100";
      try {
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        const rawFileDescriptor: resourceManager.RawFileDescriptor =
          await resourceMgr.getRawFd('AllAuxiliaryPictures.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(rawFileDescriptor);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        let mainPixelmap: image.PixelMap | undefined = pictureObj.getMainPixelmap();
        console.info(TAG, testName, 'succeed', JSON.stringify(mainPixelmap));
        expect(mainPixelmap!.isEditable).assertEqual(commodityPixelMap!.isEditable);
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getMainPixelmap_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getMainPixelmap_static_0200
     * @tc.desc   getMainPixelmap return isEditable:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getMainPixelmap_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_getMainPixelmap_static_0200";
      try {
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        const rawFileDescriptor: resourceManager.RawFileDescriptor =
          await resourceMgr.getRawFd('AllAuxiliaryPictures.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(rawFileDescriptor);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        let mainPixelmap: image.PixelMap | undefined = pictureObj.getMainPixelmap();
        console.info(TAG, testName, 'succeed', JSON.stringify(mainPixelmap));
        expect(mainPixelmap!.isEditable).assertEqual(commodityPixelMap!.isEditable);
      } catch (error) {
        console.error(TAG, testName, `Failed: code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_MEDIA_IMAGE_setMetadata_static_0100
     * @tc.name      SUB_MEDIA_IMAGE_setMetadata_static_0100
     * @tc.desc      setMetadata cover metadataType
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_MEDIA_IMAGE_setMetadata_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = "SUB_MEDIA_IMAGE_setMetadata_static_0100";
      try {
        getFd('test_exif_v2.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(fdNumber);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        let exifPictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let exifMetaData: image.Metadata | undefined = await exifPictureObj.getMetadata(metadataType);
        let data = exifPictureObj.setMetadata(metadataType, exifMetaData!);
        console.log(TAG, testName, `succeeded`, data);
        expect(data != null).assertTrue();
        exifPictureObj.release();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getAuxiliaryPicture_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getAuxiliaryPicture_static_0100
     * @tc.desc   getAuxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getAuxiliaryPicture_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getAuxiliaryPicture_static_0100';
      try {
        const resourceMgr: resourceManager.ResourceManager = testContext.resourceManager;
        const rawFileDescriptor: resourceManager.RawFileDescriptor =
          await resourceMgr.getRawFd('AllAuxiliaryPictures_exclude_fragment.jpg');
        const imageSourceObj: image.ImageSource | undefined = image.createImageSource(rawFileDescriptor);
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
          index: 0,
        };
        const commodityPixelMap = await imageSourceObj!.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'commodityPixelMap', JSON.stringify(commodityPixelMap));
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap!);
        console.info(TAG, testName, 'pictureObj', JSON.stringify(pictureObj));
        let type: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPictureObj: image.AuxiliaryPicture | null = pictureObj.getAuxiliaryPicture(type);
        console.info(TAG, testName, 'succeed', JSON.stringify(auxPictureObj));
        expect(auxPictureObj != undefined).assertFalse();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

  })
}