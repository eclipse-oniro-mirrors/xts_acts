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
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium'
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
import fs from "@ohos.file.fs"
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import {
  photoKeys,
  fetchOption,
  createSandboxFileUri,
  getPermission,
  driveFn,
  sleep,
  createVideoBySandBoxUri
} from '../common'

export default function requestVideoTest() {
  describe('requestVideoTest', (done: Function) => {

    let AVFileDescriptor: media.AVFileDescriptor;
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let hdrVideoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_hdr_1.mp4";
    let isSupportHdr: Boolean;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await createVideoBySandBoxUri('createHdr001', testContext, hdrVideoUri);
      isSupportHdr =
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
    });

    afterAll(async () => {
      console.info('afterAll case');
      try {
        let files: string[] = fs.listFileSync(testContext.filesDir);
        for (let i = 0; i < files.length; i++) {
          if (files[i].includes('test')) {
            console.info(`requestVideoTest listFiles need to delete:${JSON.stringify(files[i])}}`)
            fs.unlinkSync(`${testContext.filesDir}/${files[i]}`);
          }
        }
      } catch (error) {
        console.error(`requestVideoTest listFiles failed; error: ${error.code}  ${error.message}`)
      }
    });

    let TestHandler: photoAccessHelper.MediaAssetProgressHandler = {
      onProgress(progress: number) {
        console.info(`on video request onProgress: ${progress}`);
      }
    };

    const createMovingPhoto = async (done: Function, testNum: string) => {
      try {
        let displayName: string = "hdr_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, displayName, createOption);
        let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
        let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.mp4";
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await helper.applyChanges(assetChangeRequest);
        let assertUri: string = assetChangeRequest.getAsset().uri;
        if (assertUri == undefined || assertUri == "") {
          console.error(`${testNum}::createMovingPhoto :: failed to create moving Photo !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`getMovingPhotoTest::${testNum}:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    };

    const requestVideoRequestOptions = async (testNum: string, done: Function, requestOptions: photoAccessHelper.RequestOptions) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          async onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestVideoRequestOptionsHdr = async (testNum: string, done: Function, requestOptions: photoAccessHelper.RequestOptions) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          async onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await sleep(3000);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(false).assertTrue();
        }
        done();
      }
    }

    const requestVideoRequestOptionsError = async (testNum: string, done: Function, requestOptions: photoAccessHelper.RequestOptions) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    }

    const requestVideoRequestOptionsErrorHdr = async (testNum: string, done: Function, requestOptions: photoAccessHelper.RequestOptions) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(data).assertTrue();
            done();
          }
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    }

    const requestVideoPhotoAssetError = async (testNum: string, done: Function, photoAsset: photoAccessHelper.PhotoAsset) => {
      try {
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    }

    const requestVideoPhotoAssetErrorCompatible = async  (testNum: string, done: Function, photoAsset: photoAccessHelper.PhotoAsset) => {
      try {
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    }

    const requestVideoPhotoAssetErrorCompatibleOnprogress = async (testNum: string, done: Function, photoAsset: photoAccessHelper.PhotoAsset) => {
      try {
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    }

    const requestVideoDestUriError = async (testNum: string, done: Function, destUri: string, errCode: string) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code).assertEqual(errCode);
        done();
      }
    }

    const requestVideoDestUriErrorCompatible = async (testNum: string, done: Function, destUri: string, errCode: string) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual(errCode);
        }
        done();
      }
    }

    const requestVideoDestUriErrorCompatibleOnprogress = async (testNum: string, done: Function, destUri: string, errCode: string) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        let uri: string = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual(errCode);
        }
        done();
      }
    }

    const isHdr = async (testNum: string, fileUri: string) => {
      let flag = -1;
      try {
        let avMetadataExtractor = await media.createAVMetadataExtractor();
        avMetadataExtractor.fdSrc = fs.openSync(fileUri);
        let metadata = await avMetadataExtractor.fetchMetadata();
        flag = metadata.hdrType === undefined ? -1:metadata.hdrType;
      } catch (error) {
        console.error(`handle ${testNum} err:`, error);
      }
      return flag;
    }

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0000
     * @tc.name      : request_video_000
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0100
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: originalMode
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: originalMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_original', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_original';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0200
     * @tc.name      : test requestVideo with balancedMode and sourceMode: originalMode
     * @tc.desc      : request image with deliveryMode: balancedMode and sourceMode: originalMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_original', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_original';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0300
     * @tc.name      : test requestVideo with fastMode and sourceMode: editedMode
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: editedMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_edited', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_edited';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0400
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: editedMode
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: editedMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_edited', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_edited';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0500
     * @tc.name      : test requestVideo with balancedMode and sourceMode: editedMode
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: editedMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_edited', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_edited';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptions(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0600
     * @tc.name      : test requestVideo with balancedMode and sourceMode: null
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_null', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_null';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: undefined,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0700
     * @tc.name      : test requestVideo with balancedMode and sourceMode: undefined
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_undefined';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: undefined,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0800
     * @tc.name      : test requestVideo with deliveryMode: balancedMode and sourceMode: -100
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: -100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_100', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_100';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: -100,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_0900
     * @tc.name      : test requestVideo with deliveryMode: null and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: null and sourceMode: EDITED_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_null', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_null';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1000
     * @tc.name      : test requestVideo with deliveryMode: undefined and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: undefined and sourceMode: EDITED_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_undefined';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: -1,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1100
     * @tc.name      : test requestVideo with deliveryMode: -100 and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: -100 and sourceMode: EDITED_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_100', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_100';
      let requestOptions : photoAccessHelper.RequestOptions = {
        deliveryMode: -100,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
      }
      await requestVideoRequestOptionsError(testNum, done, requestOptions)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1200
     * @tc.name      : test requestVideo with photoAsset = null
     * @tc.desc      : request video with photoAsset = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_null', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_null';
      let photoAsset: ESObject = null
      await requestVideoPhotoAssetError(testNum, done, photoAsset)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1300
     * @tc.name      : test requestVideo with photoAsset = undefined
     * @tc.desc      : request video with photoAsset = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_undefined';
      let photoAsset: ESObject = null;
      await requestVideoPhotoAssetError(testNum, done, photoAsset)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1400
     * @tc.name      : test requestVideo with photoAsset = 'test'
     * @tc.desc      : request video with photoAsset = 'test'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_test_string', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_test_string';
      let photoAsset: ESObject = 'test'
      await requestVideoPhotoAssetError(testNum, done, photoAsset)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1500
     * @tc.name      : test requestVideo with photoAsset = true
     * @tc.desc      : request video with photoAsset = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_true', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_true';
      let photoAsset: ESObject = true
      await requestVideoPhotoAssetError(testNum, done, photoAsset)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1600
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     * @tc.desc      : request video with photoAsset = {a: 10}
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_object', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_object';
      let photoAsset: ESObject = {a: 10}
      await requestVideoPhotoAssetError(testNum, done, photoAsset)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1700
     * @tc.name      : test requestVideo with fileUri = null
     * @tc.desc      : request video with fileUri = null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_null', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_null';
      let fileUri: ESObject = null
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1800
     * @tc.name      : test requestVideo with fileUri = undefined
     * @tc.desc      : request video with fileUri = undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_undefined', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_undefined';
      let fileUri: ESObject = undefined
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_1900
     * @tc.name      : test requestVideo with fileUri = true
     * @tc.desc      : request video with fileUri = true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_true', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_true';
      let fileUri: ESObject = true
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2000
     * @tc.name      : test requestVideo with fileUri = 'aaaaa.....mp4'(length = 384)
     * @tc.desc      : request video with fileUri = 'aaaaa.....mp4'(length = 384)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_test_string', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_test_string';
      let fileUri = ''
      for (let i = 0; i < 380; i++) {
        fileUri += 'a'
      }
      fileUri+= '.mp4'
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2100
     * @tc.name      : test requestVideo with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.desc      : request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_special_chat', 0, async (done: Function) => {
      let testNum = 'request_video_special_chat';
      let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2200
     * @tc.name      : test requestVideo with fileUri = 'a...a'(length = 385)
     * @tc.desc      : request video with fileUri = 'a...a'(length = 385)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_extr_long_string', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_extr_long_string';
      let fileUri = ''
      for (let i = 0; i < 385; i++) {
        fileUri += 'a'
      }
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2300
     * @tc.name      : test requestVideo with photoAsset : imageAsset
     * @tc.desc      : request video with photoAsset : imageAsset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photoAsset_imageAsset', 0, async (done: Function) => {
      let testNum = 'request_video_photoAsset_imageAsset';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri = createSandboxFileUri(testContext, 'mp4');
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data : boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2400
     * @tc.name      : test requestVideo fileUri : ***.jpg
     * @tc.desc      : request video with fileUri : ***.jpg
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_image', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_image';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri = createSandboxFileUri(testContext, 'jpg');
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data : boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2500
     * @tc.name      : test requestVideo with fileUri: ***.jpg, photoAsset: imageAsset
     * @tc.desc      : request video with fileUri: ***.jpg, photoAsset: imageAsset
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_imageUri_photoAsset_imageAsset', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_imageUri_photoAsset_imageAsset';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri = createSandboxFileUri(testContext, 'jpg');
        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data : boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }
        let requestOptions : photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        }
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler)
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2600
     * @tc.name      : test requestVideo with fileUri = 'test.mp4'
     * @tc.desc      : request video with fileUri = 'test.mp4'
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_empty_string', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_empty_string';
      let fileUri = ''
      let errCode = '401'
      await requestVideoDestUriError(testNum, done, fileUri, errCode)
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2700
     * @tc.name      : request_video_000
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_moving_photo', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_moving_photo';
      await createMovingPhoto(done, testNum);
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
      };
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "hdr_moving_photo.jpeg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset,
          requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(error.code).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2800
     * @tc.name      : request_video_delivery_fast_source_original_compatible
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_2900
     * @tc.name      : request_video_delivery_fast_source_original_compatible_onprogress
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and onProgress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3000
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: originalMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_original_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_original_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3100
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and onProgress
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and onProgress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_original_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_original_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3200
     * @tc.name      : test requestVideo with balancedMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.desc      : request image with deliveryMode: balancedMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_original_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_original_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3300
     * @tc.name      : test requestVideo with balancedMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and onProgress
     * @tc.desc      : request image with deliveryMode: balancedMode and sourceMode: originalMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and onProgress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_original_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_original_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3400
     * @tc.name      : test requestVideo with fastMode and sourceMode: editedMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: editedMode and transcoding
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_edited_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_edited_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3500
     * @tc.name      : test requestVideo with fastMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_edited_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_edited_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3600
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_edited_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_edited_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3700
     * @tc.name      : test requestVideo with hignQualityMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: hignQualityMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_high_source_edited_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_high_source_edited_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3800
     * @tc.name      : test requestVideo with balancedMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_edited_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_edited_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_3900
     * @tc.name      : test requestVideo with balancedMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: editedMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_balance_source_edited_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_balance_source_edited_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4000
     * @tc.name      : request_video_delivery_fast_source_original_compatible_moving_photo and transcoding
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_moving_photo', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_moving_photo';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "hdr_moving_photo.jpeg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4100
     * @tc.name      : request_video_delivery_fast_source_original_compatible_onprogress_moving_photo
     *               : and transcoding and progress
     * @tc.desc      : request video with deliveryMode: fastMode and sourceMode: originalMode
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_onprogress_moving_photo', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_onprogress_moving_photo';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "hdr_moving_photo.jpeg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} failed`);
            expect(data).assertTrue();
            done();
          }
        }

        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset,
          requestOptions, destUri, handler);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4200
     * @tc.name      : test requestVideo with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_100_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_100_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: -100,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4300
     * @tc.name      : test requestVideo with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: balancedMode and sourceMode: -100
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_source_mode_100_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_source_mode_100_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: -100,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4400
     * @tc.name      : test requestVideo with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_100_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_100_compatible';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -100,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4500
     * @tc.name      : test requestVideo with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with deliveryMode: -100 and sourceMode: EDITED_MODE
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_mode_100_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_mode_100_compatible_onprogress';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: -100,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        mediaAssetProgressHandler: TestHandler,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4600
     * @tc.name      : test requestVideo with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_null_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_null_compatible';
      let photoAsset: ESObject = null;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4700
     * @tc.name      : test requestVideo with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_null_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_null_compatible_onprogress';
      let photoAsset: ESObject = null;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4800
     * @tc.name      : test requestVideo with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_undefined_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_undefined_compatible';
      let photoAsset: ESObject = undefined;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_4900
     * @tc.name      : test requestVideo with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_undefined_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_undefined_compatible_onprogress';
      let photoAsset: ESObject = undefined;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5000
     * @tc.name      : test requestVideo with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_test_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_test_string_compatible';
      let photoAsset: ESObject = 'test';
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5100
     * @tc.name      : test requestVideo with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = 'test'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_test_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_test_string_compatible_onprogress';
      let photoAsset: ESObject = 'test';
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5200
     * @tc.name      : test requestVideo with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_true_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_true_compatible';
      let photoAsset: ESObject = true;
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5300
     * @tc.name      : test requestVideo with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_true_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_true_compatible_onprogress';
      let photoAsset: ESObject = true;
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5400
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_object_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_object_compatible';
      let photoAsset: ESObject = {
        a: 10
      };
      await requestVideoPhotoAssetErrorCompatible(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5500
     * @tc.name      : test requestVideo with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset = {a: 10}
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photo_asset_object_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photo_asset_object_compatible_onprogress';
      let photoAsset: ESObject = {
        a: 10
      };
      await requestVideoPhotoAssetErrorCompatibleOnprogress(testNum, done, photoAsset);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5600
     * @tc.name      : test requestVideo with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_null_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_null_compatible';
      let fileUri: ESObject = null;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5700
     * @tc.name      : test requestVideo with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = null
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_null_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_null_compatible_onprogress';
      let fileUri: ESObject = null;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5800
     * @tc.name      : test requestVideo with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_undefined_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_undefined_compatible';
      let fileUri: ESObject = undefined;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_5900
     * @tc.name      : test requestVideo with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = undefined
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_undefined_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_undefined_compatible_onprogress';
      let fileUri: ESObject = undefined;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6000
     * @tc.name      : test requestVideo with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_true_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_true_compatible';
      let fileUri: ESObject = true;
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6100
     * @tc.name      : test requestVideo with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = true
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_true_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_true_compatible_onprogress';
      let fileUri: ESObject = true;
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6200
     * @tc.name      : test requestVideo with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_test_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_test_string_compatible';
      let fileUri = '';
      for (let i = 0; i < 380; i++) {
        fileUri += 'a';
      }
      fileUri += '.mp4';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6300
     * @tc.name      : test requestVideo with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'aaaaa.....mp4'(length = 384)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_test_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_test_string_compatible_onprogress';
      let fileUri = '';
      for (let i = 0; i < 380; i++) {
        fileUri += 'a';
      }
      fileUri += '.mp4';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6400
     * @tc.name      : test requestVideo with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_special_chat_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_special_chat_compatible';
      let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ ';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6500
     * @tc.name      : test requestVideo with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ '
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_special_chat_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_special_chat_compatible_onprogress';
      let fileUri = '⛰ * ⛪ ⛩ ⛲ ⛺ ♨ ⛽ ⚓ ';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6600
     * @tc.name      : test requestVideo with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_extr_long_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_extr_long_string_compatible';
      let fileUri = '';
      for (let i = 0; i < 385; i++) {
        fileUri += 'a';
      }
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6700
     * @tc.name      : test requestVideo with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'a...a'(length = 385)
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_extr_long_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_extr_long_string_compatible_onprogress';
      let fileUri = '';
      for (let i = 0; i < 385; i++) {
        fileUri += 'a';
      }
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6800
     * @tc.name      : test requestVideo with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photoAsset_imageAsset_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_photoAsset_imageAsset_compatible';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_6900
     * @tc.name      : test requestVideo with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with photoAsset : imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_photoAsset_imageAsset_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_photoAsset_imageAsset_compatible_onprogress';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7000
     * @tc.name      : test requestVideo fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_image_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_image_compatible';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'jpg');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7100
     * @tc.name      : test requestVideo fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri : ***.jpg
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_image_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_image_compatible_onprogress';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_video.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'jpg');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7200
     * @tc.name      : test requestVideo with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_imageUri_photoAsset_imageAsset_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_imageUri_photoAsset_imageAsset_compatible';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'jpg');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7300
     * @tc.name      : test requestVideo with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri: ***.jpg, photoAsset: imageAsset
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_imageUri_photoAsset_imageAsset_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_imageUri_photoAsset_imageAsset_compatible_onprogress';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "request_image.jpg");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'jpg');

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            expect(false).assertTrue();
            done();
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await isHdr(testNum, destUri);
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        if (!isSupportHdr) {
          expect(error.code).assertEqual('801');
        } else {
          expect(error.code).assertEqual('401');
        }
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7400
     * @tc.name      : test requestVideo with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.desc      : request video with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_empty_string_compatible', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_empty_string_compatible';
      let fileUri = '';
      let errCode = '401';
      await requestVideoDestUriErrorCompatible(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7500
     * @tc.name      : test requestVideo with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.desc      : request video with fileUri = 'test.mp4'
     *-              : and compatibleMode: COMPATIBLE_FORMAT_MODE and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_fileUri_empty_string_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_video_fileUri_empty_string_compatible_onprogress';
      let fileUri = '';
      let errCode = '401';
      await requestVideoDestUriErrorCompatibleOnprogress(testNum, done, fileUri, errCode);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7600
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: originalMode
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: originalMode
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_illegal_compatibleMode', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_illegal_compatibleMode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
        compatibleMode: -100,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7700
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_video_delivery_fast_source_original_compatible_illegal_mode', 0, async (done: Function) => {
      let testNum = 'request_video_delivery_fast_source_original_compatible_illegal_mode';
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
        compatibleMode: -100,
      };
      await requestVideoRequestOptionsErrorHdr(testNum, done, requestOptions);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7800
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding and progress
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_compatible_onprogress', 0, async (done: Function) => {
      let testNum = 'request_hdr_video_compatible_onprogress';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');
        let status = false;

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            status = true;
          }
        }

        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        const handler = new MediaHandler();
        await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions, destUri, handler);
        await sleep(3500);
        let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
        let flag = await isHdr(testNum, uri);
        expect(flag).assertEqual(0);
        expect(status).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(true).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REQUEST_VIDEO_7900
     * @tc.name      : test requestVideo with compatibleMode -100 and deliveryMode: BALANCE_MODE
     *               : and sourceMode: EDITED_MODE
     * @tc.desc      : request video with deliveryMode: BALANCE_MODE and sourceMode: EDITED_MODE
     *-              : and compatibleMode: -100 and transcoding
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('request_hdr_video_fileUri_imageUri_photoAsset_compatible', 0, async (done: Function) => {
      let testNum = 'request_hdr_video_compatible';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, "test_hdr_1.mp4");
        let fetchResult = await helper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let destUri: string = createSandboxFileUri(testContext, 'mp4');
        let count: number = 0;
        let opsList: Array<photoAccessHelper.RequestOptions> = [];

        class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<boolean> {
          onDataPrepared(data: boolean) {
            console.info(`${testNum} succeed`);
            count++;
          }
        }

        let requestOptions1: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.ORIGINAL_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        };

        let requestOptions2: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          sourceMode: photoAccessHelper.SourceMode.EDITED_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        };
        opsList.push(requestOptions1, requestOptions2);

        const handler = new MediaHandler();
        
        for (let i = 0; i < opsList.length; i++) {
          await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, opsList[i], destUri, handler);
          await sleep(3000);
          let uri = await createVideoBySandBoxUri(testNum, testContext, destUri);
          let flag = await isHdr(testNum, uri);
          expect(flag).assertEqual(1);
        }
        expect(count).assertEqual(2);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect(true).assertTrue();
        done();
      }
    });

  });
}