/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption, getPermission, driveFn, sleep,
} from '../common'
import common from '@ohos.app.ability.common';

export default function requestImageDataTest() {
  describe('requestImageDataTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   request_image_datadata_000
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0000
     * @tc.desc   request image data with highQualityMode and originalMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_datadata_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_000'; 
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_image_data_001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0100
     * @tc.desc   request image data with fastMode and oringinalMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_001';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_image_data_002
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0200
     * @tc.desc   request image data with balanceMode and originalMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_002';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_image_data_003
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0300
     * @tc.desc   request image data with highQualityMode and editedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_003';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_image_data_004
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0400
     * @tc.desc   request image data with fastMode and editedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_004';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      } 
    });

    /**
     * @tc.name   request_image_data_005
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0500
     * @tc.desc   request image data with balanceMode and editedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_005';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data  : ArrayBuffer) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_image_data_005
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_DATA_0500
     * @tc.desc   request image data with balanceMode and editedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_image_data_005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'request_image_data_005';
      try {
        let photoAsset = null;
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
          onDataPrepared(data  : ArrayBuffer) {
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImageData(null, photoAsset, requestOptions, handler)
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log(`${testNum} success; error.code: ${error.code}`); 
        expect(error.code).assertEqual(`401`);
        done();
      }
    });
  });
}
