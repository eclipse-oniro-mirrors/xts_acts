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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  getPermission,
  driveFn, isEmpty,
} from '../common';
import common from '@ohos.app.ability.common';
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { dataSharePredicates } from '@kit.ArkData';
import { image } from '@kit.ImageKit';

const TAG =  'ImageGetThumbnailTestSupp';

export default function PhotoAssetImageGetThumbnail() {
  describe('PhotoAssetImageGetThumbnail', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '');
      AppStorage.setOrCreate('undefined', undefined);
      AppStorage.setOrCreate('null', null);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString');
      AppStorage.delete('undefined')
      AppStorage.delete('null')
    });

    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_001
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_001
     * @tc.desc       getThumbnail第一个参数为undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_001';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let thumb: image.PixelMap = await asset.getThumbnail(AppStorage.get('undefined') as image.Size)
        let info = await thumb.getImageInfo();
        console.info(TAG,testName,'getThumbnail',JSON.stringify(info));
        expect(isEmpty(info)).assertFalse();
        done();
      }catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      }
    })

    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_002
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_002
     * @tc.desc       getThumbnail第一个参数为null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_002';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();

        let thumb: image.PixelMap = await asset.getThumbnail(AppStorage.get('null') as image.Size)
        let info = await thumb.getImageInfo();
        console.info(TAG,testName,'getThumbnail',JSON.stringify(info));
        expect(isEmpty(info)).assertFalse();
        done();
      }catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      }
    })
    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_003
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_003
     * @tc.desc       getThumbnail第一个参数为""
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_003';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let thumb: image.PixelMap = await asset.getThumbnail(AppStorage.get('width: 0,height: 0') as image.Size)
        let info = await thumb.getImageInfo();
        console.info(TAG,testName,'getThumbnail',JSON.stringify(info));
        expect(isEmpty(info)).assertFalse();
        done();
      }catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      }
    })



    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_004
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_004
     * @tc.desc       getThumbnail(size: image.Size, callback: AsyncCallback<image.PixelMap>): void;第一个参数为null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_004';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.getThumbnail(null,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ');
          } else {
            console.error(`getThumbnail fail with error:`);
          }})

        console.info(TAG,testName,'getThumbnail successful');
          expect().assertFail();
          console.info(TAG,testName,'done begin call');
        done();
      } catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect(error.code).assertEqual('13900020');
        console.info(TAG,testName,'done begin call');
        done();
      }
    })

    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_005
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_005
     * @tc.desc       getThumbnail(size: image.Size, callback: AsyncCallback<image.PixelMap>): void;第一个参数为null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_005';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.getThumbnail(undefined,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ');
          } else {
            console.error(`getThumbnail fail with error:`);
          }})

        console.info(TAG,testName,'getThumbnail successful');
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      } catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect(error.code).assertEqual('13900020');
        console.info(TAG,testName,'done begin call');
        done();
      }
    })

    /**
     * @tc.number     SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_006
     * @tc.name       SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_006
     * @tc.desc       getThumbnail(size: image.Size, callback: AsyncCallback<image.PixelMap>): void;第一个参数为null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'SUB_PHOTO_ASSET_IMAGE_GET_THUMBNAIL_006';
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try{
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.getThumbnail(AppStorage.get('width: 0,height: 0') as image.Size,(err, pixelMap) => {
          if (err === undefined) {
            console.info('getThumbnail successful ');
          } else {
            console.error(`getThumbnail fail with error:`);
          }})

        console.info(TAG,testName,'getThumbnail successful');
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      } catch(error) {
        console.info(TAG, testName,'failed; error: ', error);
        expect(error.code).assertEqual('13900020');
        console.info(TAG,testName,'done begin call');
        done();
      }
    })
  })
}