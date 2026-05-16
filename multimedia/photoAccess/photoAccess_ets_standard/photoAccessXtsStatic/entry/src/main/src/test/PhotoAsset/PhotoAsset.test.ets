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

const TAG = 'createImageSource';

export default function PhotoAssetStatic(): void {
  describe('PhotoAssetStatic', () => {
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
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100
     * @tc.desc   photoAsset.get -fetchColumns-normal-title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0100';
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
        fetchColumns: ['title'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        expect(photoAssetTitle !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200
     * @tc.desc   photoAsset.get -fetchColumns-'uri'-非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.URI;
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        expect(photoAssetTitle !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300
     * @tc.desc   photoAsset.get -fetchColumns-空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0100
     * @tc.desc   photoAsset.set -fetchColumns-空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, 'newTitle');
        expect(photoAsset !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0200
     * @tc.desc   photoAsset.set -fetchColumns-非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, 'newTitle');
        expect(photoAsset !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0300
     * @tc.desc   photoAsset.set -第二个参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_SET_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, '');
        expect(photoAsset !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0100
     * @tc.desc   photoAsset.getThumbnail -normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 720, height: 720 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        let pixelMap = await asset.getThumbnail(size);
        console.info(TAG,testName,'getThumbnail successful ' + pixelMap.isEditable,pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable !== undefined).assertTrue();
        expect(pixelMap.isStrideAlignment !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0200
     * @tc.desc   photoAsset.getThumbnail -fetchColumns-空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_PROMISE_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 720, height: 720 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        let pixelMap = await asset.getThumbnail(size);
        console.info(TAG,testName,'getThumbnail successful ' + pixelMap.isEditable,pixelMap.isStrideAlignment);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0100
     * @tc.desc   photoAsset.getThumbnail -normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 720, height: 720 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG,testName,'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0200
     * @tc.desc   photoAsset.getThumbnail -fetchColumns-空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_SIZE_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let size: image.Size = { width: 720, height: 720 };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail(size, (err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG,testName,'getThumbnail successful');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0100
     * @tc.desc   photoAsset.getThumbnail -normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail((err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG,testName,'getThumbnail successful');
          expect(pixelMap!.isEditable !== undefined).assertTrue();
          expect(pixelMap!.isStrideAlignment !== undefined).assertTrue();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0200
     * @tc.desc   photoAsset.getThumbnail -fetchColumns空字符串覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_GET_THUMBNAIL_CALLBACK_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset = await fetchResult.getFirstObject();
        asset.getThumbnail((err: BusinessError<void> | null, pixelMap: image.PixelMap | undefined) => {
          console.info(TAG,testName,'getThumbnail successful');
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0100
     * @tc.desc   photoAsset.clone -normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = systemDateTime.getTime().toString();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'get new asset successfully');
        expect(newAsset.uri.length > 0).assertTrue();
        expect(newAsset.photoType !== undefined).assertTrue();
        expect(newAsset.displayName.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0200
     * @tc.desc   photoAsset.clone -fetchColumns空字符串覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = systemDateTime.getTime().toString();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'get new asset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0300
     * @tc.number SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0300
     * @tc.desc   photoAsset.clone -第一个参数空字符串覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone('');
        console.info(TAG,testName,'get new asset successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    })

  })
}
