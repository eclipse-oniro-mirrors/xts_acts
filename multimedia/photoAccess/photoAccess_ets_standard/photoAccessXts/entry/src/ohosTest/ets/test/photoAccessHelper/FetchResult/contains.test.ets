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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { fetchAllOption, getPermission, driveFn, fetchOption, photoKeys, photoType, LOG_TAG, sleep } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'contains';

export default function containsTest() {
  describe('containsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let checkFetchResult = (done: Function, testNum: string, fetchResult:
      photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> |
      photoAccessHelper.FetchResult<photoAccessHelper.Album>) =>{
      if (fetchResult === undefined) {
        expect().assertFail();
        done();
      }
      let fetchCount: number = fetchResult.getCount();
      if (fetchCount === undefined || fetchCount < 0) {
        expect().assertFail();
        done();
      }
    }
    let createAsset = async (done:Function, title: string, extension: string) => {
      try {
        let fileUri: string =
          `file://ohos.acts.multimedia.photoaccess.xts/data/storage/el2/base/haps/entry_test/photos/cloneTest.${extension}`;
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let resourceType: photoAccessHelper.ResourceType = photoAccessHelper.ResourceType.IMAGE_RESOURCE
        if(extension !== 'jpg') {
          photoType= photoAccessHelper.PhotoType.VIDEO;
          resourceType = photoAccessHelper.ResourceType.VIDEO_RESOURCE
        }
        let options: photoAccessHelper.CreateOptions = {
          title: title,
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        assetChangeRequest.addResource(resourceType, fileUri);
        await helper.applyChanges(assetChangeRequest);
        await sleep(500);
        console.info('addResourceByFileUri successfully');
      } catch (err) {
        console.error(`createImageAsset:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect().assertFail();
        done();
      }
    }

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_001
     * @tc.name       fetchResult_contains_001
     * @tc.desc       PhotoAsset fetchResult contains
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_001';
      try {
        await createAsset(done, 'fetchResult_contains_001', 'jpg')
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let firstObject: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let isContains = await fetchResult.contains(firstObject)
        expect(isContains).assertTrue()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_002
     * @tc.name       fetchResult_contains_002
     * @tc.desc       PhotoAsset fetchResult not contains
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_002';
      try {
        await createAsset(done, 'fetchResult_contains_002', 'jpg')
        await createAsset(done, 'fetchResult_contains_002_1', 'mp4')
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'fetchResult_contains_002.jpg');
        let fetchOps1: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'fetchResult_contains_002_1.mp4');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        console.log(`neutest::fetchResult ${fetchResult.getCount()}`)
        checkFetchResult(done, testNum, fetchResult );
        let fetchResult_1: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps1);
        console.log(`neutest::fetchResult_1 ${fetchResult_1.getCount()}`)
        checkFetchResult(done, testNum, fetchResult_1 );
        let firstObject_1: photoAccessHelper.PhotoAsset = await fetchResult_1.getFirstObject();
        let isContains = await fetchResult.contains(firstObject_1)
        expect(!isContains).assertTrue()
        await fetchResult.close();
        await fetchResult_1.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_003
     * @tc.name       fetchResult_contains_003
     * @tc.desc       PhotoAsset fetchResult contains null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_003';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let isContains = await fetchResult.contains(null)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_004
     * @tc.name       fetchResult_contains_004
     * @tc.desc       PhotoAsset fetchResult contains undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_004';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let isContains = await fetchResult.contains(undefined)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     FETCH_RESULT_CONTAINS_005
     * @tc.name       fetchResult_contains_005
     * @tc.desc       PhotoAsset fetchResult is empty
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_005';
      try {
        await createAsset(done, 'fetchResult_contains_005', 'jpg')
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXx.jpg');
        let fetchOps1: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'fetchResult_contains_005.jpg');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        let fetchResult_1: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps1);
        checkFetchResult(done, testNum, fetchResult_1 );
        let firstObject_1: photoAccessHelper.PhotoAsset = await fetchResult_1.getFirstObject();
        let isContains = await fetchResult.contains(firstObject_1)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_006
     * @tc.name       fetchResult_contains_006
     * @tc.desc       album fetchResult contains
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_006', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_006';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        await createAsset(done, 'fetchResult_contains_006', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let firstObject: photoAccessHelper.Album = await fetchResult.getFirstObject();
        let isContains = await fetchResult.contains(firstObject)
        expect(isContains).assertTrue()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_007
     * @tc.name       fetchResult_contains_007
     * @tc.desc       album fetchResult not contains
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_007', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_007';
      try {
        await createAsset(done, 'fetchResult_contains_007', 'jpg')
        await createAsset(done, 'fetchResult_contains_007_1', 'mp4')
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let fetchResult_1: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO,fetchOps);
        checkFetchResult(done, testNum, fetchResult_1 );
        let firstObject_1: photoAccessHelper.Album = await fetchResult_1.getFirstObject();
        let isContains = await fetchResult.contains(firstObject_1)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_008
     * @tc.name       fetchResult_contains_008
     * @tc.desc       album fetchResult contains null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_008', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_008';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let isContains = await fetchResult.contains(null)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_CONTAINS_009
     * @tc.name       fetchResult_contains_009
     * @tc.desc       album fetchResult contains undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_009', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_009';
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let isContains = await fetchResult.contains(undefined)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     FETCH_RESULT_CONTAINS_010
     * @tc.name       fetchResult_contains_010
     * @tc.desc       album fetchResult is empty
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_contains_010', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_contains_010';
      try {
        await createAsset(done, 'fetchResult_contains_010', 'jpg')
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXxXx');
        let fetchOps1: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        fetchResult
        console.log(`neutest :: ${fetchResult.getCount()}`)
        let fetchResult_1: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps1);
        let firstObject_1: photoAccessHelper.Album = await fetchResult_1.getFirstObject();
        checkFetchResult(done, testNum, fetchResult_1 );
        let isContains = await fetchResult.contains(firstObject_1)
        expect(isContains).assertFalse()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })
  })
}