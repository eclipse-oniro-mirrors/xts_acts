/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  photoKeys,
  fetchOption,
  fetchAllOption,
  getFileAsset,
  sleep,
  getPermission
} from '../../../../../../../common'

export default function removeAssetsTest () {
  describe('removeAssetsTest', function () {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep();
    });

    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0000
      * @tc.name      : removeAssets_callback_000
      * @tc.desc      : user album remove image asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('removeAssets_callback_000', 0, async function (done) {
      const testNum = 'removeAssets_callback_000';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        // add asset to album will create a new asset
        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        album.removeAssets([newAsset], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(0);
              fetchResult.close()
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0200
      * @tc.name      : removeAssets_callback_002
      * @tc.desc      : user album remove image&video asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_002', 2, async function (done) {
      const testNum = 'removeAssets_callback_002';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testNum, fetchOps2);
        assetList.push(asset2);
        await album.addAssets(assetList);
        const fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        fetchResult.close();
        // remove video & image
        album.removeAssets(albumAssetList, async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult = await album.getAssets(fetchAllOption());
              expect(fetchResult.getCount()).assertEqual(0);
              fetchResult.close()
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0300
      * @tc.name      : removeAssets_callback_003
      * @tc.desc      : user album remove empty array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_003', 2, async function (done) {
      const testNum = 'removeAssets_callback_003';
      try {
        const album = await helper.createAlbum(testNum);
        album.removeAssets([], async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0400
      * @tc.name      : removeAssets_callback_004
      * @tc.desc      : user album remove undefined array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_004', 2, async function (done) {
      const testNum = 'removeAssets_callback_004';
      try {
        const album = await helper.createAlbum(testNum);
        album.removeAssets(undefined, async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
          } else {
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_REMOVE_ASSETS_0500
      * @tc.name      : removeAssets_callback_005
      * @tc.desc      : user album image asset twice
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_callback_005', 2, async function (done) {
      const testNum = 'removeAssets_callback_005';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removeCb04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        album.removeAssets([newAsset], async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0000
      * @tc.name      : removeAssets_promise_000
      * @tc.desc      : user album remove image asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('removeAssets_promise_000', 0, async function (done) {
      const testNum = 'removeAssets_promise_000';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(1);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        fetchResult = await album.getAssets(fetchOps);
        console.info(`${testNum} count: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0200
      * @tc.name      : removeAssets_promise_002
      * @tc.desc      : user album remove image&video asset
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_002', 2, async function (done) {
      const testNum = 'removeAssets_promise_002';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps1 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro03.jpg');
        const fetchOps2 = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro01.mp4');
        const assetList: Array<photoAccessHelper.PhotoAsset> = new Array();
        const asset1 = await getFileAsset(testNum, fetchOps1);
        assetList.push(asset1);
        const asset2 = await getFileAsset(testNum, fetchOps2);
        assetList.push(asset2);

        await album.addAssets(assetList);
        let fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(2);
        let albumAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        await album.removeAssets(albumAssetList);
        fetchResult = await album.getAssets(fetchAllOption());
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0300
      * @tc.name      : removeAssets_promise_003
      * @tc.desc      : user album remove empty array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_003', 2, async function (done) {
      const testNum = 'removeAssets_promise_003';
      try {
        const album = await helper.createAlbum(testNum);
        await album.removeAssets([]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0400
      * @tc.name      : removeAssets_promise_004
      * @tc.desc      : user album remove undefined array
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_004', 2, async function (done) {
      const testNum = 'removeAssets_promise_004';
      try {
        const album = await helper.createAlbum(testNum);
        await album.removeAssets(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_0500
      * @tc.name      : removeAssets_promise_005
      * @tc.desc      : remove image asset twice
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('removeAssets_promise_005', 2, async function (done) {
      const testNum = 'removeAssets_promise_005';
      try {
        const album = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'removePro04.jpg');
        const asset = await getFileAsset(testNum, fetchOps);

        await album.addAssets([asset]);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await album.removeAssets([newAsset]);
        await album.removeAssets([newAsset]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
