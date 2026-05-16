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
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setMetadata';

async function setMetadataPromiseTest(done: Function, testName: string, path: string,
  metadataType: image.MetadataType, AuxiliaryPictureType: image.AuxiliaryPictureType) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    let commodityPixelMap: image.Picture | null = await imageSource.createPicture();
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    let auxPictureObj: image.AuxiliaryPicture | null =
      await commodityPixelMap.getAuxiliaryPicture(AuxiliaryPictureType);
    if (auxPictureObj != null) {
      let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(metadataType);
      auxPictureObj.setMetadata(metadataType, exifMetaData).then(() => {
        console.info(TAG, 'Set metadata success');
        expect(exifMetaData != null).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG, 'Failed to set metadata. error.code: ' + JSON.stringify(error.code) + ' ,error.message:' +
        JSON.stringify(error.message));
        expect().assertFail();
      });
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function setMetadataAbnormalPromiseTest(done: Function, testName: string, path: string,
  metadataType: ESObject, exifMetaData: ESObject) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    const rawFile = await resourceMgr.getRawFileContent(path);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
    let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    let commodityPixelMap: image.Picture | null = await imageSource.createPicture();
    let auxPictureObj: image.AuxiliaryPicture | null =
      await commodityPixelMap.getAuxiliaryPicture(AuxiliaryPictureType);
    if (auxPictureObj != null) {
      auxPictureObj.setMetadata(metadataType, exifMetaData).then(() => {
        console.info(TAG, 'Set metadata success');
        expect(exifMetaData != null).assertTrue();
      }).catch((error: BusinessError) => {
        console.error(TAG, 'Failed to set metadata. error.code: ' + JSON.stringify(error.code) + ' ,error.message:' +
        JSON.stringify(error.message));
        expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
      });
      done();
    } else {
      console.error(TAG, 'PictureObj is null');
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function AuxiliaryPictureSetMetadataTest() {
  describe('AuxiliaryPictureSetMetadataTest', () => {

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
     * @tc.name   auxiliaryPicture_setMetadata_promise_001
     * @tc.number AUXILIARY_PICTURE_SET_METADATA_001
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setMetadata_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setMetadata_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      const AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await setMetadataPromiseTest(done, testName, path, metadataType, AuxiliaryPictureType);
    })

    /**
     * @tc.name   auxiliaryPicture_setMetadata_promise_002
     * @tc.number AUXILIARY_PICTURE_SET_METADATA_002
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setMetadata_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setMetadata_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      const AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await setMetadataPromiseTest(done, testName, path, metadataType, AuxiliaryPictureType);
    })

    /**
     * @tc.name   auxiliaryPicture_setMetadata_abnormal_promise_001
     * @tc.number AUXILIARY_PICTURE_SET_METADATA_003
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setMetadata_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setMetadata_abnormal_promise_001';
      const path = 'AllAuxiliaryPictures.jpg';
      const metadataType = null;
      const exifMetaData = null;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType, exifMetaData);
    })

    /**
     * @tc.name   auxiliaryPicture_setMetadata_abnormal_promise_002
     * @tc.number AUXILIARY_PICTURE_SET_METADATA_005
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setMetadata_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setMetadata_abnormal_promise_002';
      const path = 'AllAuxiliaryPictures.jpg';
      const metadataType = undefined;
      const exifMetaData = undefined;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType, exifMetaData);
    })

    /**
     * @tc.name   auxiliaryPicture_setMetadata_abnormal_promise_003
     * @tc.number AUXILIARY_PICTURE_SET_METADATA_006
     * @tc.desc   setMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('auxiliaryPicture_setMetadata_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'auxiliaryPicture_setMetadata_abnormal_promise_003';
      const path = 'AllAuxiliaryPictures.jpg';
      const metadataType = NaN;
      const exifMetaData = NaN;
      await setMetadataAbnormalPromiseTest(done, testName, path, metadataType, exifMetaData);
    })
  })
}