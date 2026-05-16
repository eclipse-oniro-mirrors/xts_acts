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

const TAG = LOG_TAG + 'getObjectsIndexSet';

export default function getObjectsIndexSetTest() {
  describe('getObjectsIndexSetTest', () => {

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
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_001
     * @tc.name       fetchResult_getObjectsByIndexSet_001
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_001_1', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_001_2', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_001_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([0,2])
        expect(list[0].displayName).assertEqual(currentList[0].displayName)
        expect(list[2].displayName).assertEqual(currentList[1].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_002
     * @tc.name       fetchResult_getObjectsByIndexSet_002
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_002_1', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_002_2', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_002_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([2,0])
        expect(list[0].displayName).assertEqual(currentList[1].displayName)
        expect(list[2].displayName).assertEqual(currentList[0].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_003
     * @tc.name       fetchResult_getObjectsByIndexSet_003
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [1,2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_003_1', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_003_2', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_003_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,2,0])
        expect(list[0].displayName).assertEqual(currentList[2].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[2].displayName).assertEqual(currentList[1].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_004
     * @tc.name       fetchResult_getObjectsByIndexSet_004
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [1,1,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_004_1', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_004_2', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,1,1])
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_005
     * @tc.name       fetchResult_getObjectsByIndexSet_005
     * @tc.desc       album fetchResult getObjectsByIndexSet [0,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_005', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_005', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([0,1])
        expect(list[0].albumName).assertEqual(currentList[0].albumName)
        expect(list[1].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_006
     * @tc.name       fetchResult_getObjectsByIndexSet_006
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_006', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_006', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_006', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,0])
        expect(list[0].albumName).assertEqual(currentList[1].albumName)
        expect(list[0].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_007
     * @tc.name       fetchResult_getObjectsByIndexSet_007
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_007', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_007', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_007', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,2,0])
        expect(list[0].albumName).assertEqual(currentList[2].albumName)
        expect(list[1].albumName).assertEqual(currentList[0].albumName)
        expect(list[2].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_008
     * @tc.name       fetchResult_getObjectsByIndexSet_008
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,1,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_008', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_008', 'jpg')
        await createAsset(done, 'fetchResult_getObjectsByIndexSet_008', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,1,1])
        expect(list[1].albumName).assertEqual(currentList[0].albumName)
        expect(list[1].albumName).assertEqual(currentList[1].albumName)
        expect(list[1].albumName).assertEqual(currentList[2].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_009
     * @tc.name       fetchResult_getObjectsByIndexSet_009
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet null
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_009', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet(null)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_010
     * @tc.name       fetchResult_getObjectsByIndexSet_010
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet undefined
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_010', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet(undefined)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_011
     * @tc.name       fetchResult_getObjectsByIndexSet_011
     * @tc.desc       album fetchResult getObjectsByIndexSet null
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_011', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_011';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet(null)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_012
     * @tc.name       fetchResult_getObjectsByIndexSet_012
     * @tc.desc       album fetchResult getObjectsByIndexSet undefined
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_012', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_012';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet(undefined)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_013
     * @tc.name       fetchResult_getObjectsByIndexSet_013
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet []
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_013', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet([])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_014
     * @tc.name       fetchResult_getObjectsByIndexSet_014
     * @tc.desc       album fetchResult getObjectsByIndexSet []
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_014', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([])
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_015
     * @tc.name       fetchResult_getObjectsByIndexSet_015
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [-1,0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_015', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet([-1,0,2])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_016
     * @tc.name       fetchResult_getObjectsByIndexSet_016
     * @tc.desc       album fetchResult getObjectsByIndexSet [-1,0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_016', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([-1,0,2])
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_017
     * @tc.name       fetchResult_getObjectsByIndexSet_017
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [0,10000]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_017', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet( [0,10000])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_018
     * @tc.name       fetchResult_getObjectsByIndexSet_018
     * @tc.desc       album fetchResult getObjectsByIndexSet [0, 10000]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_018', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([0, 10000])
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_019
     * @tc.name       fetchResult_getObjectsByIndexSet_019
     * @tc.desc       album fetchResult getObjectsByIndexSet empty
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_019', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXxXx');
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([0])
        expect().assertFail()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getObjectsByIndexSet_020
     * @tc.name       fetchResult_getObjectsByIndexSet_020
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet empty
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('fetchResult_getObjectsByIndexSet_020', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getObjectsByIndexSet_020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXxXx');
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet( [0])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })
  })
}