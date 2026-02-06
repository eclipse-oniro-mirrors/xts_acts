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


import { describe, it, expect, beforeAll, Level, afterAll } from "@ohos/hypium";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs from '@ohos.file.fs'
import {
  sleep,
  getPermission, driveFn
} from '../common';
import media from '@ohos.multimedia.media';
import common from '@ohos.app.ability.common';
export default function getMovingPhotoTranscodeTest() {
  describe("getMovingPhotoTranscodeTest", () => {
    let imageFileName = "ImageFile.jpg";
    let videoFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/VideoFile.mp4";
    let hdrUri: string = "data/storage/el2/base/haps/entry_test/photos/VideoFile.mp4";

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    afterAll(async (done: Function) => {
      await sleep(5000);
      done();
    });

    let TestHandler: photoAccessHelper.MediaAssetProgressHandler = {
      onProgress(progress: number) {
        console.info(`on video request onProgress: ${progress}`);
      }
    };

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

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

    const createMovingPhoto = async (done: Function, testNum: string) => {
      try {
        let displayName: ESObject = "test_transcode_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, displayName, createOption);
        let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
        let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_hdr_1.mp4";
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await phAccessHelper.applyChanges(assetChangeRequest);
        done();
      } catch (err) {
        console.error(`getMovingPhotoTranscodeTest::${testNum}:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    }

    const requestMovingPhotoTranscodeNoProgressContent = async (done: Function, testNum: string, case_num: number) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        switch (case_num) {
          case 0:
            handler = new MovingPhotoHandler();
            console.log(`${testNum}::handler::MovingPhotoHandler`);
            break;
          case 1:
            handler = new PhotoHandler();
            console.log(`${testNum}::handler::PhotoHandler`);
            break;
          case 2:
            handler = new VideoHandler();
            console.log(`${testNum}::handler::VideoHandler`);
            break;
          default:
            console.error(`${testNum}::requestMovingPhotoTranscodeNoProgressContent::illegal case_num: ${case_num}`);
            expect(false).assertTrue();
            done();
        }
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        await sleep(3000);
        let flag = await isHdr(testNum, hdrUri);
        expect(flag).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('801');
        done();
      }
    }

    const requestMovingPhotoTranscodeNoProgressContentArrayBuffer = async (done: Function, testNum: string, case_num: number) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        switch (case_num) {
          case 0:
            handler = new ArrayBufferHandler();
            console.log(`${testNum}::handler::ArrayBufferHandler`);
            break;
          case 1:
            handler = new ArrayBufferVideoHandler();
            console.log(`${testNum}::handler::ArrayBufferVideoHandler`);
            break;
          default:
            console.error(`${testNum}::requestMovingPhotoTranscodeNoProgressContentArrayBuffer::illegal case_num: ${case_num}`);
            expect(false).assertTrue();
            done();
        }
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('801');
        done();
      }
    }

    const requestMovingPhotoTranscodeContent = async (done: Function, testNum: string, case_num: number) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        switch (case_num) {
          case 0:
            handler = new MovingPhotoHandler();
            console.log(`${testNum}::handler::MovingPhotoHandler`);
            break;
          case 1:
            handler = new PhotoHandler();
            console.log(`${testNum}::handler::PhotoHandler`);
            break;
          case 2:
            handler = new VideoHandler();
            console.log(`${testNum}::handler::VideoHandler`);
            break;
          default:
            console.error(`${testNum}::requestMovingPhotoTranscodeContent::illegal case_num: ${case_num}`);
            expect(false).assertTrue();
            done();
        }
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        await sleep(3000);
        let flag = await isHdr(testNum, hdrUri);
        expect(flag).assertEqual(0);
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('801');
        done();
      }
    }

    const requestMovingPhotoTranscodeContentArrayBuffer = async (done: Function, testNum: string, case_num: number) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        switch (case_num) {
          case 0:
            handler = new ArrayBufferHandler();
            console.log(`${testNum}::handler::ArrayBufferHandler`);
            break;
          case 1:
            handler = new ArrayBufferVideoHandler();
            console.log(`${testNum}::handler::ArrayBufferVideoHandler`);
            break;
          default:
            console.error(`${testNum}::requestMovingPhotoTranscodeContentArrayBuffer::illegal case_num: ${case_num}`);
            expect(false).assertTrue();
            done();
        }
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual('801');
        done();
      }
    }

    const requestMovingPhotoErrorDeliveryModeNull = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const deliveryMode: ESObject = null;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: deliveryMode,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorDeliveryModeNull::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const requestMovingPhotoErrorCompatibleModeNull = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const compatibleMode: ESObject = null;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: compatibleMode,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorCompatibleModeNull::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const requestMovingPhotoErrorProgressHandlerNull = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const mediaAssetProgressHandler: ESObject = null;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: mediaAssetProgressHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorProgressHandlerNull::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code === '401' || err.code === '801').assertTrue();
        done();
      }
    }

    const requestMovingPhotoErrorDeliveryModeUndefined = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const deliveryMode: ESObject = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: deliveryMode,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorDeliveryModeUndefined::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const requestMovingPhotoErrorCompatibleModeUndefined = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const compatibleMode: ESObject = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: compatibleMode,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorCompatibleModeUndefined::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const requestMovingPhotoErrorProgressHandlerUndefined = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const mediaAssetProgressHandler: ESObject = undefined;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: mediaAssetProgressHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorProgressHandlerUndefined::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code === '401' || err.code === '801').assertTrue();
        done();
      }
    }

    const requestMovingPhotoErrorDeliveryModeOutlier = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const deliveryMode: ESObject = -100;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: deliveryMode,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorDeliveryModeOutlier::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }
    
    const requestMovingPhotoErrorCompatibleModeOutlier = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const compatibleMode: ESObject = -100;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: compatibleMode,
          mediaAssetProgressHandler: TestHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorCompatibleModeOutlier::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(`401`);
        done();
      }
    }

    const requestMovingPhotoErrorProgressHandlerOutlier = async (done: Function, testNum: string) => {
      try {
        await createMovingPhoto(done, 'create_moving_photo_0001');
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        const mediaAssetProgressHandler: ESObject = -100;
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
          mediaAssetProgressHandler: mediaAssetProgressHandler,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> | undefined = undefined;
        handler = new MovingPhotoHandler();
        console.log(`${testNum}::requestMovingPhotoErrorProgressHandlerOutlier::MovingPhotoHandler`);
        await photoAccessHelper.MediaAssetManager.requestMovingPhoto(null, asset, requestOptions, handler);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(err.code === '401' || err.code === '801').assertTrue();
        done();
      }
    }

    /**
     * @tc.name   create_moving_photo_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_MOVING_PHOTO_0001
     * @tc.desc   create a moving photo by sandbox resourece
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_moving_photo_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'create_moving_photo_0001';
      await createMovingPhoto(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_content_handler_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_0001
     * @tc.desc   request moving photo all content to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_handler_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_handler_0001';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test_transcode_moving_photo.jpeg');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset | undefined = undefined;
        if (assetResult != undefined) {
          asset = await assetResult.getFirstObject();
        }
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        };
        let handler: photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> = new MovingPhotoHandler();
        console.log(`${testNum}::handler::MovingPhotoHandler`);
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, asset, requestOptions, handler);
        if (requestId == undefined) {
          console.error(`${testNum}::failed to request moving photo::requestId is undefined !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`${testNum}::failed to request moving photo, error code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   request_moving_photo_content_transcode_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_0001
     * @tc.desc   request moving photo content transcode to sandbox, then cacel request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_0001';
      await requestMovingPhotoTranscodeContent(done, testNum, 0);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_0002
     * @tc.desc   request moving photo the part of img to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_0002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_0002';
      await requestMovingPhotoTranscodeContent(done, testNum, 1);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_0003
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_0003
     * @tc.desc   request moving photo the part of video to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_0003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_0003';
      await requestMovingPhotoTranscodeContent(done, testNum, 2);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_0004
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_0004
     * @tc.desc   request moving photo the part of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_0004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_0004';
      await requestMovingPhotoTranscodeContentArrayBuffer(done, testNum, 0);
      done();
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_0005
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_0005
     * @tc.desc   request moving photo the part of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_0005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_0005';
      await requestMovingPhotoTranscodeContentArrayBuffer(done, testNum, 1);
      done();
    });

    /**
     * @tc.name   request_moving_photo_content_transcode_noprogress_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_NOPROGRESS_0001
     * @tc.desc   request moving photo content transcode to sandbox, then cacel request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_noprogress_0001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_noprogress_0001';
      await requestMovingPhotoTranscodeNoProgressContent(done, testNum, 0);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_noprogress_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_NOPROGRESS_0002
     * @tc.desc   request moving photo the part of img to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_noprogress_0002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_noprogress_0002';
      await requestMovingPhotoTranscodeNoProgressContent(done, testNum, 1);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_noprogress_0003
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_NOPROGRESS_0003
     * @tc.desc   request moving photo the part of video to sandbox
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_noprogress_0003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_noprogress_0003';
      await requestMovingPhotoTranscodeNoProgressContent(done, testNum, 2);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_noprogress_0004
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_NOPROGRESS_0004
     * @tc.desc   request moving photo the part of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_noprogress_0004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_noprogress_0004';
      await requestMovingPhotoTranscodeNoProgressContentArrayBuffer(done, testNum, 0);
    });
    /**
     * @tc.name   request_moving_photo_content_transcode_noprogress_0005
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_CONTENT_TRANSCODE_NOPROGRESS_0005
     * @tc.desc   request moving photo the part of ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('request_moving_photo_content_transcode_noprogress_0005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'request_moving_photo_content_transcode_noprogress_0005';
      await requestMovingPhotoTranscodeNoProgressContentArrayBuffer(done, testNum, 1);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0001
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0001
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0001';
      await requestMovingPhotoErrorDeliveryModeNull(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0002
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0002
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0002';
      await requestMovingPhotoErrorCompatibleModeNull(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0003
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0003
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0003';
      await requestMovingPhotoErrorProgressHandlerNull(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0004
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0004
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0004';
      await requestMovingPhotoErrorDeliveryModeUndefined(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0005
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0005
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0005';
      await requestMovingPhotoErrorCompatibleModeUndefined(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0006
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0006
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0006';
      await requestMovingPhotoErrorProgressHandlerUndefined(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0007
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0007
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0007';
      await requestMovingPhotoErrorDeliveryModeOutlier(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0008
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0008
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0008';
      await requestMovingPhotoErrorCompatibleModeOutlier(done, testNum);
    });
    /**
     * @tc.name   request_moving_photo_error_content_0009
     * @tc.number SUB_PHOTOACCESS_HELPER_REQUEST_ERROR_CONTENT_0009
     * @tc.desc   request moving photo error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('request_moving_photo_error_content_0009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'request_moving_photo_error_content_0009';
      await requestMovingPhotoErrorProgressHandlerOutlier(done, testNum);
    });

    // export moving photo:: video and photo
    class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("MovingPhotoHandler::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/" + imageFileName;
        await movingPhoto.requestContent(imageFileUri, videoFileUri);
        let photoUri = await movingPhoto.getUri();
        console.log(`photoUri =====> ${photoUri}`);
        if (photoUri == undefined) {
          console.error(`MovingPhotoHandler get moving photo uri fail !`);
          expect(false).assertTrue();
        }
        console.log("moving photo contents retrieved successfully");
      }
    }

    // export moving photo:: only photo
    class PhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("PhotoHandler::movingPhoto onDataPrepared");
        let imageFileUri: string = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_picture.jpg";
        await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
        console.log("moving photo image content retrieved successfully");
      }
    }

    // export moving photo:: only video
    class VideoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("VideoHandler::movingPhoto onDataPrepared");
        await movingPhoto.requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoFileUri);
        console.log("moving photo video content retrieved successfully");
      }
    }

    // export moving photo:: ArrayBuffer
    class ArrayBufferHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ArrayBufferHandler::movingPhoto onDataPrepared");
        let buffer: ArrayBuffer = await movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE);
        if (buffer == undefined || buffer.byteLength <= 0) {
          console.error(`ArrayBufferHandler :: failed to request content ArrayBuffer !`);
          expect(false).assertTrue();
        }
      }
    }

    // export moving photo:: ArrayBuffer Video
    class ArrayBufferVideoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
      async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
        console.log("ArrayBufferVideoHandler::movingPhoto onDataPrepared");
        let buffer: ArrayBuffer = await movingPhoto.requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE);
        if (buffer == undefined || buffer.byteLength <= 0) {
          console.error(`ArrayBufferVideoHandler :: failed to request content ArrayBuffer !`);
          expect(false).assertTrue();
        }
      }
    }
  });
}