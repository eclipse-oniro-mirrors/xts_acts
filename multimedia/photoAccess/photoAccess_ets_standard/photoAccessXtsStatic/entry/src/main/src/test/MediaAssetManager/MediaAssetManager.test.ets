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

import image from '@ohos.multimedia.image'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import { createMovingPhoto, fetchOption, getPermission } from "../Common.test";
import { Context } from '@kit.ArkUI';
import { beforeAll, describe, expect, Hypium, it, Level, Size, TestType } from '../../../../hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

let domain = 0x0000;
let videoPathUri: string = 'test_mov_1.mp4';
let imagePathUri: string = 'test_mov_1.jpg';
const TAG: string = 'MediaAssetManagerTest';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource | undefined, map?: Map<string, string>) {
    hilog.info(domain, TAG, `MediaHandler succeed`);
  }
}

class MediaHandlerArrayBuffer implements photoAccessHelper.MediaAssetDataHandler<ArrayBuffer> {
  onDataPrepared(data: ArrayBuffer | undefined, map?: Map<string, string>) {
    hilog.info(domain, TAG, `MediaHandler succeed`);
  }
}

class MediaDataHandlerVideo implements photoAccessHelper.MediaAssetDataHandler<boolean> {
  onDataPrepared(data: boolean | undefined, map: Map<String, String> | undefined) {
    console.info('on video request status prepared');
  }
}

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let uri = movingPhoto.getUri();
    console.info("moving photo acquired successfully, uri: " + movingPhoto.getUri());
    expect(uri != undefined).assertTrue();
  }
}

interface MovingPhotoUris {
  imageFileUri: string;
  videoFileUri: string;
}

type GetMovingPhotoUrisCallback = () => MovingPhotoUris;

class MovingPhotoHandlerUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  private getUrisCallback: GetMovingPhotoUrisCallback;
  constructor(getUrisCallback: GetMovingPhotoUrisCallback) {this.getUrisCallback = getUrisCallback;}
  onDataPrepared(data : photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string> | undefined):void {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }

    const uriObj: MovingPhotoUris = this.getUrisCallback();
    let imageFileUri: string = uriObj.imageFileUri;
    let videoFileUri: string = uriObj.videoFileUri;

    try {
      data.requestContent(imageFileUri, videoFileUri);
      console.info("moving photo contents retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve contents of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

interface MovingPhotoImageUri {
  imageFileUri: string;
}

type GetImageUriCallback = () => MovingPhotoImageUri;

class MovingPhotoHandlerImageUri implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  private getImageUriCallback: GetImageUriCallback;
  constructor(getImageUriCallback: GetImageUriCallback) {this.getImageUriCallback = getImageUriCallback;}

  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string> | undefined) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    const uriObj: MovingPhotoImageUri = this.getImageUriCallback();
    let imageFileUri: string = uriObj.imageFileUri;
    try {
      movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageFileUri);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandlerBuffer implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string>) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    try {
      let buffer: Promise<ArrayBuffer> = movingPhoto.requestContent(photoAccessHelper.ResourceType.IMAGE_RESOURCE);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

class MovingPhotoHandlerBufferVideo implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto | undefined, map?: Map<string, string> | undefined) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    try {
      let buffer: Promise<ArrayBuffer> = movingPhoto.requestContent(photoAccessHelper.ResourceType.VIDEO_RESOURCE);
      console.info("moving photo image content retrieved successfully");
    } catch (err) {
      console.error(`failed to retrieve image content of moving photo, error code is ${err.code}, message is ${err.message}`);
    }
  }
}

export default function MediaAssetManagerStaticTest(): void {
  describe('MediaAssetManagerStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, TAG, 'beforeAll case');
      await getPermission();
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0100
     * @tc.desc   request image with fastMode and editedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0100';
      const handler = new MediaHandler();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0200
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0200
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0200';
      const handler = new MediaHandler();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0300
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0300
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0300';
      const handler = new MediaHandler();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0400
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0400
     * @tc.desc      requestImage-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_STATIC_0400';
      const handler = new MediaHandler();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0500
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0500
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0500';
      const handler = new MediaHandlerArrayBuffer();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0600
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0600
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0600';
      const handler = new MediaHandlerArrayBuffer();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0700
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0700
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0700';
      const handler = new MediaHandlerArrayBuffer();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '1');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0800
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0800
     * @tc.desc      requestImageData-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_IMAGE_DATA_STATIC_0800';
      const handler = new MediaHandlerArrayBuffer();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImageData(testContext, photoAsset, requestOptions, handler)
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_0900
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_0900
     * @tc.desc      requestMovingPhoto-HIGH_QUALITY_MODE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_0900';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_1000
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_1000
     * @tc.desc      requestMovingPhoto-BALANCE_MODE-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_STATIC_1000';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_STATIC_1100
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_STATIC_1100
     * @tc.desc      MovingPhoto-getUri-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_STATIC_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_GET_URI_STATIC_1100';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1200
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1200
     * @tc.desc      requestContent-imageUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1200';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const getUrisCallback = (): MovingPhotoUris => {
        return {
          imageFileUri: '',
          videoFileUri: testContext.filesDir + '/test_mov_1.mp4'
        };
      };
      const movingPhotoHandler = new MovingPhotoHandlerUri(getUrisCallback);
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, movingPhotoHandler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error:`,JSON.stringify(error.code));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1300
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1300
     * @tc.desc      requestContent-videoUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1300';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const getUrisCallback = (): MovingPhotoUris => {
        return {
          imageFileUri: testContext.filesDir + '/test_mov_1.jpg',
          videoFileUri: ''
        };
      };
      const movingPhotoHandler = new MovingPhotoHandlerUri(getUrisCallback);
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, movingPhotoHandler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1400
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1400
     * @tc.desc      requestContent-fileUri-''
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1400';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const getImageUriCallback = (): MovingPhotoImageUri => {
        return {
          imageFileUri: ''
        };
      };

      const movingPhotoHandler = new MovingPhotoHandlerImageUri(getImageUriCallback);
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, movingPhotoHandler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1500
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1500
     * @tc.desc      requestContent-resourceType-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_STATIC_1500';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandlerBuffer();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_STATIC_1700
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_STATIC_1700
     * @tc.desc      cancelRequest-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_STATIC_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_CANCEL_REQUEST_STATIC_1700';
      const handler = new MediaHandler();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
        await photoAccessHelper.MediaAssetManager.cancelRequest(testContext, '');
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1800
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1800
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1800';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '1');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1900
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1900
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_1900';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2000
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2000
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2000';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2100
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2100
     * @tc.desc      requestVideoFile-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2100';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2200
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2200
     * @tc.desc      requestVideoFile-801
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2200';
      const handler = new MediaDataHandlerVideo();
      let fileName:string = "demo.mp4";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
          compatibleMode: photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fileUri = `file://${testContext.filesDir}/${fileName}`;
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,fileUri, handler);
        expect(requestId.length > 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(801);//开发板不支持compatibleMode属性
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2300
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2300
     * @tc.desc      requestVideoFile-401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_REQUEST_VIDEO_FILE_STATIC_2300';
      const handler = new MediaDataHandlerVideo();
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, '2');
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        }
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let requestId = await photoAccessHelper.MediaAssetManager.requestVideoFile(testContext, photoAsset, requestOptions,'', handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2400
     * @tc.number SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2400
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testContext: Context = Hypium.get('Context') as Context;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, videoFileUri);
        let uri = movingPhoto.getUri();
        console.info(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2400 + loadMovingPhotoPromiseTest photo: " + uri);
        expect(uri != undefined).assertTrue();
      } catch (error) {
        console.error(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2400 + loadMoving errcode: " + error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2500
     * @tc.number SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2500
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testContext: Context = Hypium.get('Context') as Context;
      let videoFileUri: string = 'file://' + testContext.filesDir + "/" + videoPathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, '', videoFileUri);
        let uri = movingPhoto.getUri();
        console.info(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2500 + loadMovingPhotoPromiseTest photo: " + uri);
        expect(uri != undefined).assertTrue();
      } catch (error) {
        console.error(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2500 + loadMoving errcode: " + error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2600
     * @tc.number SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2600
     * @tc.desc   loadMovingPhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testContext: Context = Hypium.get('Context') as Context;
      let imageFileUri: string = 'file://' + testContext.filesDir + "/" + imagePathUri;
      try {
        let movingPhoto: photoAccessHelper.MovingPhoto =
          await photoAccessHelper.MediaAssetManager.loadMovingPhoto(testContext, imageFileUri, '');
        let uri = movingPhoto.getUri();
        console.info(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2600 + loadMovingPhotoPromiseTest photo: " + uri);
        expect(uri != undefined).assertTrue();
      } catch (error) {
        console.error(TAG + "SUB_MEDIA_ASSET_MANAGER_LOAD_MOVING_PHOTO_ERROR_STATIC_2600 + loadMoving errcode: " + error.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_VIDEO_RESOURCE_STATIC_2700
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_VIDEO_RESOURCE_STATIC_2700
     * @tc.desc      requestContent-resourceType-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_VIDEO_RESOURCE_STATIC_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_CONTENT_VIDEO_RESOURCE_STATIC_2700';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoAsset = await createMovingPhoto(testNum, testContext, 'movingPhoto');
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
      };
      const handler = new MovingPhotoHandlerBufferVideo();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect(requestId != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_COUNT_STATIC_2800
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_COUNT_STATIC_2800
     * @tc.desc   getCount-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_COUNT_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_COUNT_STATIC_2800';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let fetchCount = fetchResult.getCount();
        expect(fetchCount != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_2900
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_2900
     * @tc.desc   getFirstObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_2900';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(photoAsset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_3000
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_3000
     * @tc.desc   getFirstObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_FIRST_OBJECT_STATIC_3000';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        fetchResult.getFirstObject((err, photoAsset) => {
          if (photoAsset !== undefined) {
            console.info('photoAsset displayName: ', photoAsset.displayName);
            expect(photoAsset.displayName.length > 0).assertTrue();
          }
          done();
        });
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3100
     * @tc.desc   getNextObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3100';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
          console.info('photoAsset displayName: ', photoAsset.displayName);
          expect(photoAsset != undefined).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3200
     * @tc.desc   getNextObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3200';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
          console.info('photoAsset displayName: ', photoAsset.displayName);
          expect(photoAsset != undefined).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3300
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3300
     * @tc.desc   getNextObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_NEXT_OBJECT_STATIC_3300';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          fetchResult.getNextObject((err, photoAsset) => {
            if (photoAsset !== undefined) {
              console.info('photoAsset displayName: ', photoAsset.displayName);
              expect(photoAsset != undefined).assertTrue();
            } else {
              console.error(`photoAsset failed`);
            }
            done();
          });
        }
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3400
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3400
     * @tc.desc   getLastObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3400';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        fetchResult.getLastObject((err, photoAsset) => {
          if (photoAsset !== undefined) {
            console.info('photoAsset displayName: ', photoAsset.displayName);
            expect(photoAsset.displayName.length > 0).assertTrue();
          }
          done();
        });
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3500
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3500
     * @tc.desc   getLastObject-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_LAST_OBJECT_STATIC_3500';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        if (!fetchResult.isAfterLast()) {
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
          console.info('photoAsset displayName: ', photoAsset.displayName);
          expect(photoAsset != undefined).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3600
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3600
     * @tc.desc      getObjectByPosition-最小值-success
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3600';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(0);
        expect(photoAsset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3700
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3700
     * @tc.desc      getObjectByPosition-最小值-1
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_STATIC_3700';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(-1);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });

  })
}