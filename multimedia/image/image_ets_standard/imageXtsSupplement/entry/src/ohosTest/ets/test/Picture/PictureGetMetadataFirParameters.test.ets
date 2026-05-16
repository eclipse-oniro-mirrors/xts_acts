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
import { LOG_TAG, sleep } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'GetMetadataFirstParametersSupp';


async function getMetadataPromiseFirstParametersTest(done: Function, testName: string, pathUri: string,
  callback: (pictureObj: image.Picture,exifPictureObj: image.Picture) => void) {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let array = new ArrayBuffer(30000);
    let path = `file://${testContext.filesDir}/${pathUri}`;
    console.info(TAG, testName, `path: ${path}`);
    const fd = await fs.open(path);
    console.info(TAG, testName, `open: ${fd.fd}`);
    let readLength = await fs.read(fd.fd, array);
    console.info(TAG, testName, `readLength: ${readLength}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    };
    let imageSource: image.ImageSource = image.createImageSource(array, ops);
    console.info(TAG,'createImageSource success');
    let exifCommodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
    console.info(TAG,'get exifCommodityPixelMap  success');
    let exifPictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    console.info(TAG,'get exifPictureObj  success');
    let pictureObj: image.Picture = await image.createPicture(exifCommodityPixelMap);
    callback(pictureObj,exifPictureObj);
    await fs.close(fd );
    done();

}
export default function PictureGetMetadataFirstParameters() {
  describe('PictureGetMetadataFirstParameters', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
      sleep(1000);
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });


    /**
     * @tc.name   PICTURE_GET_METADATA_FIRST_PARAMETERS_001
     * @tc.number PICTURE_GET_METADATA_FIRST_PARAMETERS_001
     * @tc.desc   getMetadata :image.MetadataType.FRAGMENT_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_FIRST_PARAMETERS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_FIRST_PARAMETERS_001';
      await getMetadataPromiseFirstParametersTest(done, testName, 'test_exif_v2.jpg', async (pictureObj,exifPictureObj) => {
        console.info(TAG,testName,'come in');
        try {
          if (pictureObj != null) {
            let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(image.MetadataType.FRAGMENT_METADATA);
            if (exifMetaData != null) {
              console.info(TAG,testName,'get picture metadata success');
              expect().assertFail();
            } else {
              console.error(TAG,testName,'get picture metadata is failed');
            }
          } else {
            console.error(TAG,testName," pictureObj is null");
          }
          done();
        } catch (error) {
          console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
          expect(error.code).assertEqual('7600202');
          done();
        }
      })
    })
    /**
     * @tc.name   PICTURE_GET_METADATA_FIRST_PARAMETERS_002
     * @tc.number PICTURE_GET_METADATA_FIRST_PARAMETERS_002
     * @tc.desc   getMetadata :image.MetadataType.FRAGMENT_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_FIRST_PARAMETERS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_FIRST_PARAMETERS_002';
      await getMetadataPromiseFirstParametersTest(done, testName, 'test_exif_v2.png', async (pictureObj,exifPictureObj) => {
        try {
        if (pictureObj != null) {
          let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(image.MetadataType.FRAGMENT_METADATA);
          if (exifMetaData != null) {
            console.info(TAG,testName,'get picture metadata success');
            expect().assertFail();
          } else {
            console.error(TAG,testName,'get picture metadata is failed');
          }
        } else {
          console.error(TAG,testName," pictureObj is null");
        }
        done();
      } catch (error) {
        console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
        expect(error.code).assertEqual('7600202');
        done();
      }
    })
  })
    /**
     * @tc.name   PICTURE_GET_METADATA_FIRST_PARAMETERS_003
     * @tc.number PICTURE_GET_METADATA_FIRST_PARAMETERS_003
     * @tc.desc   getMetadata :image.MetadataType.FRAGMENT_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_FIRST_PARAMETERS_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_FIRST_PARAMETERS_003';
      await getMetadataPromiseFirstParametersTest(done, testName, 'test6.gif', async (pictureObj,exifPictureObj) => {
        try {
          if (pictureObj != null) {
            let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(image.MetadataType.FRAGMENT_METADATA);
            if (exifMetaData != null) {
              console.info(TAG,testName,'get picture metadata success');
              expect().assertFail();
            } else {
              console.error(TAG,testName,'get picture metadata is failed');
            }
          } else {
            console.error(TAG,testName," pictureObj is null");
          }
          done();
        } catch (error) {
          console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
          expect(error.code).assertEqual('7600202');
          done();
        }
      })
    })

    /**
     * @tc.name   PICTURE_GET_METADATA_FIRST_PARAMETERS_004
     * @tc.number PICTURE_GET_METADATA_FIRST_PARAMETERS_004
     * @tc.desc   getMetadata :image.MetadataType.FRAGMENT_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PICTURE_GET_METADATA_FIRST_PARAMETERS_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PICTURE_GET_METADATA_FIRST_PARAMETERS_004';
      await getMetadataPromiseFirstParametersTest(done, testName, 'AllAuxiliaryPictures.jpg', async (pictureObj,exifPictureObj) => {
        try {
          if (pictureObj != null) {
            let exifMetaData: image.Metadata = await exifPictureObj.getMetadata(image.MetadataType.FRAGMENT_METADATA);
            if (exifMetaData != null) {
              console.info(TAG,testName,'get picture metadata success');
              expect().assertFail();
            } else {
              console.error(TAG,testName,'get picture metadata is failed');
            }
          } else {
            console.error(TAG,testName," pictureObj is null");
          }
          done();
        } catch (error) {
          console.error(TAG, `failed; error: ${error},${error?.code}`, testName);
          expect(error.code).assertEqual('7600202');
          done();
        }
      })
    })

  })
}
