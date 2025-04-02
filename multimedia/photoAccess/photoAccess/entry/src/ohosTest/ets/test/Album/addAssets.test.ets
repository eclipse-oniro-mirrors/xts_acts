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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import {
  photoKeys,
  fetchOption,
  fetchAllOption,
  getFileAsset,
  sleep,
  getPermission,
  driveFn
} from '../common'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function addAssetsTest () {
  describe('addAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext)

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0100
      * @tc.name      : addAssets_callback_001
      * @tc.desc      : add image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('addAssets_callback_001', 0, async (done: Function) => {
      const testNum = 'addAssets_callback_001';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addCb01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);
        let fetchResultBefore: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchAllOption());
        let countBefore: number = fetchResultBefore.getCount();
        fetchResultBefore.close();
        console.log(`${testNum} :: add asset to user album :: beforeCount is ${countBefore}`);
        // add an asset to album will create one new asset
        album.addAssets([asset], async (err:BusinessError) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult:ESObject = await album.getAssets(fetchOps);
              expect(fetchResult.getCount()).assertEqual(1);
              let fetchResultAfter: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchAllOption());
              expect(fetchResultAfter.getCount()).assertEqual(countBefore + 1);
              fetchResult.close();
              fetchResultAfter.close();
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0300
      * @tc.name      : addAssets_callback_003
      * @tc.desc      : add image&video asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_003', 2, async (done: Function) => {
      const testNum = 'addAssets_callback_003';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, ['addCb03.jpg', 'addCb01.mp4']);
        const fetchOps : photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult:ESObject = await helper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        const assetList:ESObject = await fetchResult.getAllObjects();
        fetchResult.close();
        album.addAssets(assetList, async (err:BusinessError) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} album.count: ${album.count}`);
              const fetchResult:ESObject = await album.getAssets(fetchAllOption());
              expect(fetchResult.getCount()).assertEqual(2);
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0400
      * @tc.name      : addAssets_callback_004
      * @tc.desc      : add empty array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_004', 2, async (done: Function) => {
      const testNum = 'addAssets_callback_004';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        album.addAssets([], async (err:BusinessError) => {
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
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ADD_ASSETS_0500
      * @tc.name      : addAssets_callback_005
      * @tc.desc      : add undefined array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_callback_005', 2, async (done: Function) => {
      const testNum = 'addAssets_callback_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        album.addAssets(undefined, async (err:BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
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

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0100
      * @tc.name      : addAssets_promise_001
      * @tc.desc      : add image asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('addAssets_promise_001', 0, async (done: Function) => {
      const testNum = 'addAssets_promise_001';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);

        await album.addAssets([asset]);
        const fetchResult:ESObject = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0300
      * @tc.name      : addAssets_promise_003
      * @tc.desc      : add image&video asset to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_003', 2, async (done: Function) => {
      const testNum = 'addAssets_promise_003';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, ['addCb04.jpg', 'addPro01.mp4']);
        const fetchOps : photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult:ESObject = await helper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        const assetList:ESObject = await fetchResult.getAllObjects();
        fetchResult.close();
        await album.addAssets(assetList);
        const albumFetchResult:ESObject = await album.getAssets(fetchAllOption());
        expect(albumFetchResult.getCount()).assertEqual(2);
        albumFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0400
      * @tc.name      : addAssets_promise_004
      * @tc.desc      : add empty array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_004', 2, async (done: Function) => {
      const testNum = 'addAssets_promise_004';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.addAssets([]);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ADD_ASSETS_0500
      * @tc.name      : addAssets_promise_005
      * @tc.desc      : add undefined array to user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('addAssets_promise_005', 2, async (done: Function) => {
      const testNum = 'addAssets_promise_005';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.addAssets(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    });
  })
}
