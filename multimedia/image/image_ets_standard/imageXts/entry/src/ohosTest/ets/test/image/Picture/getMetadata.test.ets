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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getMetadata';

async function getMetadataPromiseTest(done: Function, testName: string, path: string,
  metadataType: image.MetadataType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    if (pictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType);
      expect(exifMetaData != null).assertTrue();
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getMetadataAbnormalPromiseTest(done: Function, testName: string, path: string,
  metadataType: image.MetadataType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = await image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    if (pictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType);
      expect(exifMetaData != null).assertTrue();
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
      expect(pictureObj == null).assertTrue();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(error.code == ErrorCode.Unsupported_Metadata).assertTrue();
    done();
  }
}


export default function PictureGetMetadataTest() {
  describe('PictureGetMetadataTest', () => {

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
     * @tc.name   picture_getMetadata_promise_001
     * @tc.number PICTURE_GET_METADATA_001
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_promise_001';
      const path = 'CUVAHdrMulti.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType);
    })

    /**
     * @tc.name   picture_getMetadata_promise_002
     * @tc.number PICTURE_GET_METADATA_002
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType);
    })

    /**
     * @tc.name   picture_getMetadata_promise_003
     * @tc.number PICTURE_GET_METADATA_003
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_promise_003';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataPromiseTest(done, testName, path, metadataType);
    })

    /**
     * @tc.name   picture_getMetadata_abnormal_promise_001
     * @tc.number PICTURE_GET_METADATA_004
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_abnormal_promise_001';
      const path = 'CUVAHdrMulti.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataAbnormalPromiseTest(done, testName, path, metadataType);
    })

    /**
     * @tc.name   picture_getMetadata_abnormal_promise_002
     * @tc.number PICTURE_GET_METADATA_005
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_abnormal_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataAbnormalPromiseTest(done, testName, path, metadataType);
    })

    /**
     * @tc.name   picture_getMetadata_abnormal_promise_003
     * @tc.number PICTURE_GET_METADATA_006
     * @tc.desc   getMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('picture_getMetadata_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'picture_getMetadata_abnormal_promise_003';
      const path = 'test.jpeg';
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataAbnormalPromiseTest(done, testName, path, metadataType);
    })
  })
}