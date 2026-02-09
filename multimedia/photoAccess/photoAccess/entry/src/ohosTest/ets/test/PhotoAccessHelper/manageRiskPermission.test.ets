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
import { image } from '@kit.ImageKit';
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption,
  getPermission,
  driveFn,
  sleep,
  createSandboxFileUri,
  pushCreateAsset
} from '../common'
import common from '@ohos.app.ability.common'

export default function manageRiskPermissionTest() {

  describe('manageRiskPermissionTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      const imageFile = ["riskImageAsset.jpg"];
      await pushCreateAsset(testContext, imageFile);
      const videoFile = ["riskVideoAsset.mp4"];
      await pushCreateAsset(testContext, videoFile);
    });

    const getAssetsCallbackTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        helper.getAssets(fetchOps, (err, fetchResult) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getAssets failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(expectCount);
              fetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} getAssets failed; error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getAssetsPromiseTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getThumbnailCallbackTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        photoAsset.getThumbnail((err, pixelMap) => {
          if (err == undefined) {
            expect(pixelMap).not().assertUndefined();
            console.info(`${testNum} getThumbnail success, pixelMap is ${pixelMap}`);
            done();
          } else {
            console.error(`${testNum} getThumbnail fail, err is ${err}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getThumbnailSizeCallbackTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let size: image.Size = { width: 720, height: 720 };
        fetchResult.close();
        photoAsset.getThumbnail(size, (err, pixelMap) => {
          if (err == undefined) {
            expect(pixelMap).not().assertUndefined();
            console.info(`${testNum} getThumbnail success, pixelMap is ${pixelMap}`);
            done();
          } else {
            console.error(`${testNum} getThumbnail fail, err is ${err}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const getThumbnailSizeTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let size: image.Size = { width: 720, height: 720 };
        fetchResult.close();
        let pixelMap = photoAsset.getThumbnail(size)
        expect(pixelMap).not().assertUndefined();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestImageTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
          onDataPrepared(data : image.ImageSource) {
            console.info(`${testNum} succeed`);
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler;
        photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestImageDataTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
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
        photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestVideoFileTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, expectCount: number) => {
      try {
        const fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');
        
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          async onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(data).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   manageRiskPermission_getAssets_callback_000
     * @tc.number manageRiskPermission_getAssets_callback_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_callback_001
     * @tc.number manageRiskPermission_getAssets_callback_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_callback_002
     * @tc.number manageRiskPermission_getAssets_callback_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_callback_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_callback_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_callback_003
     * @tc.number manageRiskPermission_getAssets_callback_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_callback_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_callback_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getAssetsCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_promise_000
     * @tc.number manageRiskPermission_getAssets_promise_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_promise_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_promise_001
     * @tc.number manageRiskPermission_getAssets_promise_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_promise_002
     * @tc.number manageRiskPermission_getAssets_promise_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_promise_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_promise_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getAssets_promise_003
     * @tc.number manageRiskPermission_getAssets_promise_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getAssets_promise_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getAssets_promise_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_callback_000
     * @tc.number manageRiskPermission_getThumbnail_callback_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_callback_001
     * @tc.number manageRiskPermission_getThumbnail_callback_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_callback_002
     * @tc.number manageRiskPermission_getThumbnail_callback_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_callback_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_callback_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_callback_003
     * @tc.number manageRiskPermission_getThumbnail_callback_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_callback_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_callback_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_callback_000
     * @tc.number manageRiskPermission_getThumbnail_size_callback_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailSizeCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_callback_001
     * @tc.number manageRiskPermission_getThumbnail_size_callback_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailSizeCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_callback_002
     * @tc.number manageRiskPermission_getThumbnail_size_callback_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_callback_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_callback_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailSizeCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_callback_003
     * @tc.number manageRiskPermission_getThumbnail_size_callback_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_callback_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_callback_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await getThumbnailSizeCallbackTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_000
     * @tc.number manageRiskPermission_getThumbnail_size_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getThumbnailSizeTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_001
     * @tc.number manageRiskPermission_getThumbnail_size_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getThumbnailSizeTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_002
     * @tc.number manageRiskPermission_getThumbnail_size_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getThumbnailSizeTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_getThumbnail_size_003
     * @tc.number manageRiskPermission_getThumbnail_size_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_getThumbnail_size_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_getThumbnail_size_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await getThumbnailSizeTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImage_000
     * @tc.number manageRiskPermission_requestImage_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImage_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImage_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImage_001
     * @tc.number manageRiskPermission_requestImage_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImage_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImage_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImage_002
     * @tc.number manageRiskPermission_requestImage_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImage_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImage_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImage_003
     * @tc.number manageRiskPermission_requestImage_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImage_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImage_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImageData_000
     * @tc.number manageRiskPermission_requestImageData_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImageData_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImageData_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageDataTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImageData_001
     * @tc.number manageRiskPermission_requestImageData_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImageData_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImageData_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageDataTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImageData_002
     * @tc.number manageRiskPermission_requestImageData_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImageData_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImageData_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageDataTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestImageData_003
     * @tc.number manageRiskPermission_requestImageData_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestImageData_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestImageData_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskImageAsset.jpg');
      const expectCount = 1;
      await requestImageDataTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestVideoFile_000
     * @tc.number manageRiskPermission_requestVideoFile_000
     * @tc.desc   UNIDENTIFIED 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestVideoFile_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestVideoFile_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await requestVideoFileTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestVideoFile_001
     * @tc.number manageRiskPermission_requestVideoFile_001
     * @tc.desc   APPROVED 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestVideoFile_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestVideoFile_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await requestVideoFileTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestVideoFile_002
     * @tc.number manageRiskPermission_requestVideoFile_002
     * @tc.desc   SUSPICIOUS 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestVideoFile_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestVideoFile_002';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await requestVideoFileTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.name   manageRiskPermission_requestVideoFile_003
     * @tc.number manageRiskPermission_requestVideoFile_003
     * @tc.desc   REJECTED 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('manageRiskPermission_requestVideoFile_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'manageRiskPermission_requestVideoFile_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'riskVideoAsset.mp4');
      const expectCount = 1;
      await requestVideoFileTest(done, testNum, fetchOps, expectCount);
    });
    
  })
}
