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

const TAG = LOG_TAG + 'getRangeObjects';

export default function getRangeObjectsTest() {
  describe('getRangeObjectsTest', () => {

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
     * @tc.number     FETCH_RESULT_getRangeObjects_001
     * @tc.name       fetchResult_getRangeObjects_001
     * @tc.desc       PhotoAsset fetchResult getRangeObjects
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getRangeObjects_001', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_001_1', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_001_2', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getRangeObjects(0,list.length)
        expect(currentList.length).assertEqual(list.length)
        for (let index = 0; index < list.length; index++) {
          expect(list[index].displayName).assertEqual(currentList[index].displayName)
        }
        console.info(TAG, `currentIndex.length: ${currentList.length}`, testNum);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getRangeObjects_002
     * @tc.name       fetchResult_getRangeObjects_002
     * @tc.desc       album fetchResult getRangeObjects
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_002', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getRangeObjects_002', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_002_1', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getRangeObjects(0,list.length)
        expect(currentList.length).assertEqual(list.length)
        for (let index = 0; index < list.length; index++) {
          expect(list[index].albumName).assertEqual(currentList[index].albumName)
        }
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getRangeObjects_003
     * @tc.name       fetchResult_getRangeObjects_003
     * @tc.desc       PhotoAsset fetchResult getRangeObjects null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_003', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getRangeObjects_003', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_003_1', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(null,null)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('13900020')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getRangeObjects_004
     * @tc.name       fetchResult_getRangeObjects_004
     * @tc.desc       album fetchResult getRangeObjects undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getRangeObjects_004', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_004_1', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(undefined,undefined)
        expect().assertFail();
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('13900020')
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getRangeObjects_005
     * @tc.name       fetchResult_getRangeObjects_005
     * @tc.desc       PhotoAsset fetchResult getRangeObjects(3,1),return 1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_005', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'fetchResult_getRangeObjects_005', 'jpg')
        await createAsset(done, 'fetchResult_getRangeObjects_005_1', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getRangeObjects(1,1)
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect(currentList.length).assertEqual(1)
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     FETCH_RESULT_getRangeObjects_006
     * @tc.name       fetchResult_getRangeObjects_006
     * @tc.desc       album fetchResult getRangeObjects(-1,0) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_006', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(-1,0)
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
     * @tc.number     FETCH_RESULT_getRangeObjects_007
     * @tc.name       fetchResult_getRangeObjects_007
     * @tc.desc       album fetchResult getRangeObjects(0,10000) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_007', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(0,10000)
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
     * @tc.number     FETCH_RESULT_getRangeObjects_008
     * @tc.name       fetchResult_getRangeObjects_008
     * @tc.desc       album fetchResult getRangeObjects(-1,1000) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_008', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(-1,1000)
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
     * @tc.number     FETCH_RESULT_getRangeObjects_009
     * @tc.name       fetchResult_getRangeObjects_009
     * @tc.desc       album fetchResult getRangeObjects
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('fetchResult_getRangeObjects_009', Level.LEVEL0, async (done: Function) => {
      const testNum = 'fetchResult_getRangeObjects_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(0,0)
        expect().assertFail()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual('23800151');
        done();
      }
    })
  })
}