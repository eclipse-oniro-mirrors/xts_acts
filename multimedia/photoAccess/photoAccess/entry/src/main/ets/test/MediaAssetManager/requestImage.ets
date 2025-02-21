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
import image from '@ohos.multimedia.image'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { albumType, albumSubtype, genRadomStr, albumKeys } from '../../../../../../../common'
import {
  photoKeys,
  fetchOption,
} from '../../../../../../../common'

export default function requestImageTest() {
  describe('requestImageTest', function () {
    let helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0000
     * @tc.name      : request_image_000
     * @tc.desc      : request image with highQualityMode and originalMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_000', 0, async function (done) {
      let testNum = 'request_image_000';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0100
     * @tc.name      : request_image_001
     * @tc.desc      : request image with FastMode and originalMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_001', 0, async function (done) {
      let testNum = 'request_image_001';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0200
     * @tc.name      : request_image_002
     * @tc.desc      : request image with balanceMode and originalMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_002', 0, async function (done) {
      let testNum = 'request_image_002';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0300
     * @tc.name      : request_image_003
     * @tc.desc      : request image with highQualityMode and editedMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_003', 0, async function (done) {
      let testNum = 'request_image_003';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0400
     * @tc.name      : request_image_004
     * @tc.desc      : request image with fastMode and editedMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_004', 0, async function (done) {
      let testNum = 'request_image_004';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_IMAGE_0500
     * @tc.name      : request_image_005
     * @tc.desc      : request image with balanceMode and editedMode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_image_005', 0, async function (done) {
      let testNum = 'request_image_005';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data: image.ImageSource) {
            console.info(`${testNum} succeed`);
            expect(true).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(globalThis.abilityContext, photoAsset, requestOptions, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_QUICK_REQUEST_IMAGE_0001
     * @tc.name      : quick_request_image_001
     * @tc.desc      : quick request image with HIGH_QUALITY_MODE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('quick_request_image_001', 0, async (done: Function) => {
      let testNum = 'quick_request_image_001';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.QuickImageDataHandler<image.Picture> {
          onDataPrepared(data: image.Picture, imageSource: image.ImageSource) {
            if (data === undefined && imageSource === undefined) {
              console.error(`${testNum} :: Error occurred when preparing data !`);
              expect(false).assertTrue();
              done();
            }
            console.info(`${testNum} :: on image data prepared success`);
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        const handler = new MediaHandler();
        let requestId: string = await photoAccessHelper.MediaAssetManager.quickRequestImage(globalThis.abilityContext, photoAsset, requestOptions, handler);
        console.log(`${testNum} :: quick request success, requestId = ${requestId}`);
        if (requestId === undefined) {
          console.log(`${testNum} :: requestId is undefined !`)
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  });
}