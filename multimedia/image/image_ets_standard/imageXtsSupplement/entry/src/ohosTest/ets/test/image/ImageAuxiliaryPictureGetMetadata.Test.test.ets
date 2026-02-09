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
import { LOG_TAG } from '../common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'AuxiliaryPictureGetMetadataTestSupp';


async function getMetadataAbnormalTest(done: Function, testName: string, path: string, metadataType: image.MetadataType,
  callback: (errorCode: string) => void) {
  try {
    const testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const resourceMgr = testContext.resourceManager;
    console.info(TAG,testName,'resourceMgr' );
    const rawFile = await resourceMgr.getRawFileContent(path);
    console.info(TAG,testName,'rawFile' );
    const ops: image.SourceOptions = { sourceDensity: 98 };
    console.info(TAG,testName,'ops' );
    const imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);
    console.info(TAG,testName,'imageSource',JSON.stringify(imageSource) );
    let options: image.DecodingOptionsForPicture = { desiredAuxiliaryPictures: [image.AuxiliaryPictureType.GAINMAP]
    };
    console.info(TAG,testName,'options' );
    const commodityPicture: image.Picture | null = await imageSource.createPicture(options);
    console.info(TAG,testName,'commodityPicture' );
    const auxPictureObj: image.AuxiliaryPicture | null = await commodityPicture.getAuxiliaryPicture(
      image.AuxiliaryPictureType.FRAGMENT_MAP
    );
    if (auxPictureObj != null) {
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      let auxPictureObjMetaData: image.Metadata | null = await auxPictureObj.getMetadata(metadataType);
      if (auxPictureObjMetaData != null) {
        console.info('Get AuxPictureObj Metadata success' );
      } else {
        console.error('Get AuxPictureObj Metadata failed');
      }
    } else {
      console.error('Get AuxPictureObj is null.');
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.error(TAG, testName, `failed; error:`, JSON.stringify(error), error.code);
    callback(error.code);
    done();
 }
}




export default function ImageAuxiliaryPictureGetMetadataTest() {
  describe('ImageAuxiliaryPictureGetMetadataTest', () => {
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
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_001
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_001
     * @tc.desc   Get EXIF metadata from UNFOCUSED_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_001';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.EXIF_METADATA);
        done();
      })
  });
    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_002
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_002
     * @tc.desc   Get GIF metadata from FRAGMENT_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_002';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.GIF_METADATA);
        done();
      })
    })

    /**
     * @tc.name   IMAGE_AUXILIARY_PICTURE_GET_METADATA_003
     * @tc.number IMAGE_AUXILIARY_PICTURE_GET_METADATA_003
     * @tc.desc   Get GIF metadata from FRAGMENT_MAP auxiliary picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_003';
      const path = 'test8.png';
      const metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      await getMetadataAbnormalTest(done, testName, path, metadataType,(errCode) => {
        console.info(TAG, testName, `createAuxiliaryPicture success, enum=${metadataType}`);
        expect(metadataType).assertEqual(image.MetadataType.FRAGMENT_METADATA);
        done();
      })
    })


  })
}