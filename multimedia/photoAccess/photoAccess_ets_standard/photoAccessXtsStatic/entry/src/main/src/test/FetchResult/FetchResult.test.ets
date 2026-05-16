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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium'
import { getPermission, LOG_TAG, sleep } from '../common';
import { Context } from '@kit.ArkUI';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { image } from '@kit.ImageKit';
import { BusinessError, systemDateTime } from '@kit.BasicServicesKit';

const TAG = 'FetchResultTest';

class MediaHandler implements photoAccessHelper.MediaAssetDataHandler<image.ImageSource> {
  onDataPrepared(data: image.ImageSource | undefined, map: Map<string, string> | undefined) {
    if (data === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    console.info('on image data prepared');
  }
}

async function onDataPreparedPromiseTest(done: () => void, testName: string,
  fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions): Promise<void> {
  let testContext: Context = Hypium.get('Context') as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const handler = new MediaHandler();
    helper!.getAssets(fetchOptions, (err: BusinessError<void> | null,
      fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
      console.info(TAG, 'fetchResult success');
      fetchResult!.getFirstObject().then((photoAsset) => {
        photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
          .then((requestId) => {
            console.info(TAG, 'requestImage successfully', requestId);
            photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId).then(() => {
              done();
            })
          })
      })
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

async function QuickOnDataPreparedPromiseTest(done: () => void, testName: string,
  fetchOptions: photoAccessHelper.FetchOptions,
  requestOptions: photoAccessHelper.RequestOptions): Promise<void> {
  let testContext: Context = Hypium.get('Context') as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const handler = new MediaHandler();
    helper!.getAssets(fetchOptions, (err: BusinessError<void> | null,
      fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
      console.info(TAG, 'fetchResult success');
      fetchResult!.getFirstObject().then((photoAsset) => {
        photoAccessHelper.MediaAssetManager.requestImage(testContext, photoAsset, requestOptions, handler)
          .then((requestId) => {
            console.info(TAG, 'requestImage successfully', requestId);
            photoAccessHelper.MediaAssetManager.cancelRequest(testContext, requestId).then(() => {
              done();
            })
          })
      })
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function FetchResultStatic(): void {
  describe('FetchResultStatic', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      await getPermission();
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
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0100
     * @tc.desc   FetchResult.close-fetchColumns-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0100';
      let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      let extension: string = 'jpg';
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null= photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
      let fileUri = testContext.filesDir + '/test_mov_1.jpg';
      if (assetChangeRequest !== null) {
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await helper!.applyChanges(assetChangeRequest);
      }
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        fetchResult.close();
        console.info(TAG, testName, 'close succeed.');
        expect(fetchResult != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0200
     * @tc.desc   FetchResult.close-fetchColumns-normal-非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        fetchResult.close();
        console.info(TAG, testName, 'close succeed.');
        expect(fetchResult != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0300
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0300
     * @tc.desc   FetchResult.close-fetchColumns-空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CLOSE_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        fetchResult.close();
        console.info(TAG, testName, 'close succeed.');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0100
     * @tc.number SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0100
     * @tc.desc   MediaAssetDataHandler_onDataPrepared-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        await onDataPreparedPromiseTest(done, testName, fetchOption, requestOptions);
      })
    /**
     * @tc.name   SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0200
     * @tc.number SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0200
     * @tc.desc   MediaAssetDataHandler_onDataPrepared-normal-非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_MEDIA_ASSET_CHANGE_REQUEST_ON_DATA_PREPARED_STATIC_0200';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        await onDataPreparedPromiseTest(done, testName, fetchOption, requestOptions);
      })
    /**
     * @tc.name   SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0100
     * @tc.number SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0100
     * @tc.desc   MediaAssetDataHandler_onDataPrepared-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0100';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        await QuickOnDataPreparedPromiseTest(done, testName, fetchOption, requestOptions);
      })
    /**
     * @tc.name   SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0200
     * @tc.number SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0200
     * @tc.desc   MediaAssetDataHandler_onDataPrepared-normal-fetchColumns非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0200', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTMEDIA_QUICK_IMAGE_DATA_HANDLER_ON_DATA_PREPARED_STATIC_0200';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        let requestOptions: photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE,
        };
        await QuickOnDataPreparedPromiseTest(done, testName, fetchOption, requestOptions);
      })
    /**
     * @tc.name   SUB_MULTMEDIA_GET_PHOTO_ACCESS_HELPER_STATIC_0100
     * @tc.number SUB_MULTMEDIA_GET_PHOTO_ACCESS_HELPER_STATIC_0100
     * @tc.desc   getPhotoAccessHelper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_GET_PHOTO_ACCESS_HELPER_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_GET_PHOTO_ACCESS_HELPER_STATIC_0100';
      try {
        let testContext: Context = Hypium.get('Context') as Context;
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
        expect(helper != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_KEYS_ENUM_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_KEYS_ENUM_STATIC_0100
     * @tc.desc   photoKeys - enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_KEYS_ENUM_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_KEYS_ENUM_STATIC_0100';
      try {
        expect(photoAccessHelper.PhotoKeys.OWNER_ALBUM_ID.valueOf() == 'owner_album_id').assertTrue();
        expect(photoAccessHelper.PhotoKeys.ASPECT_RATIO.valueOf() == 'aspect_ratio').assertTrue();
        expect(photoAccessHelper.PhotoKeys.CHANGE_TIME.valueOf() == 'change_time').assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_ALBUM_KEYS_ENUM_STATIC_0100
     * @tc.number SUB_MULTMEDIA_ALBUM_KEYS_ENUM_STATIC_0100
     * @tc.desc   AlbumKeys- enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_ALBUM_KEYS_ENUM_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_ALBUM_KEYS_ENUM_STATIC_0100';
      try {
        expect(photoAccessHelper.AlbumKeys.CHANGE_TIME.valueOf() == 'change_time').assertTrue();
        expect(photoAccessHelper.AlbumKeys.ALBUM_LPATH.valueOf() == 'lpath').assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_ALBUM_TYPE_ENUM_STATIC_0100
     * @tc.number SUB_MULTMEDIA_ALBUM_TYPE_ENUM_STATIC_0100
     * @tc.desc   AlbumType- enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_ALBUM_TYPE_ENUM_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_ALBUM_TYPE_ENUM_STATIC_0100';
      try {
        expect(photoAccessHelper.AlbumType.SOURCE == 2048).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_ALBUM_SUBTYPE_ENUM_STATIC_0100
     * @tc.number SUB_MULTMEDIA_ALBUM_SUBTYPE_ENUM_STATIC_0100
     * @tc.desc   AlbumSubtype- enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_ALBUM_SUBTYPE_ENUM_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_ALBUM_SUBTYPE_ENUM_STATIC_0100';
      try {
        expect(photoAccessHelper.AlbumSubtype.SOURCE_GENERIC == 2049).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_PROPERTY_CHANGE_INFOS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_PROPERTY_CHANGE_INFOS_STATIC_0100
     * @tc.desc   PhotoAssetChangeInfos-assetChangeDatas-isForRecheck
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_PROPERTY_CHANGE_INFOS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_PROPERTY_CHANGE_INFOS_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG, testName, 'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.isForRecheck).assertFalse();
        expect(changeData.assetChangeDatas != undefined).assertTrue();
        let data = changeData.assetChangeDatas![0];
        expect(data.assetBeforeChange != undefined).assertTrue();
        expect(data.isContentChanged != undefined).assertTrue();
        expect(data.isDeleted != undefined).assertTrue();
        expect(data.assetAfterChange != undefined).assertTrue();
        expect(data.assetAfterChange?.uri != undefined).assertTrue();
        expect(data.assetAfterChange?.mediaType != undefined).assertTrue();
        expect(data.assetAfterChange?.albumUri != undefined).assertTrue();


        done();
      }
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOption);
        console.info(TAG, testName, 'photoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper!.onSinglePhotoChange(photoAsset, onCallback);
        helper!.offSinglePhotoChange(photoAsset, onCallback);
        console.info(TAG, testName, 'close succeed.');
        expect(photoAsset.uri.length > 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_PROPERTY_ALBUM_CHANGE_INFOS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_PROPERTY_ALBUM_CHANGE_INFOS_STATIC_0100
     * @tc.desc   AlbumChangeInfos-property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_PROPERTY_ALBUM_CHANGE_INFOS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_PROPERTY_ALBUM_CHANGE_INFOS_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG, testName, 'onCallback1 success, changeData666: ' + JSON.stringify(changeData));
        expect(changeData.type).assertFalse();
        expect(changeData.albumChangeDatas != undefined).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        let data = changeData.albumChangeDatas![0];
        expect(data.albumBeforeChange != undefined).assertTrue();
        done();
      }
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        console.info(TAG, testName, 'photoAccessHelper.FetchResult success: ', fetchResult);
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        helper!.onSinglePhotoAlbumChange(album, onCallback);
        helper!.offSinglePhotoAlbumChange(album, onCallback);
        expect(album != undefined).assertTrue();
        console.info(TAG, testName, 'close succeed.');
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
  })
}
