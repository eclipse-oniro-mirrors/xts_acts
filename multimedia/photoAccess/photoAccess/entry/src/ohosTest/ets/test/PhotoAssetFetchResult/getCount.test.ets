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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import {
  fetchOption,
  photoType,
  photoKeys, getPermission, driveFn, sleep, albumSubtype, albumType
} from '../common'
import common from '@ohos.app.ability.common';
import { beforeAll, expect, Level } from '@ohos/hypium';
import { describe } from '@ohos/hypium';
import { it } from '@ohos/hypium';

export default function assetGetCountTest () {
  describe('assetGetCountTest', ()=>{

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext)

     let  getCountCallbackTest = async (done:Function, testNum:string, fetchOps:ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype, key: string = '', value: string | number = '') => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      if (key != '') {
        predicatesAlbum.equalTo(key, value);
      }
      let fetchOptionsAlbum: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicatesAlbum
      };
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await helper.getAlbums(type, subtype, fetchOptionsAlbum);
      console.info(testNum + ' album count is ' + albumFetchResult.getCount());
      let album: photoAccessHelper.Album = await albumFetchResult.getLastObject();
      return album;
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    //image
    /**
     * @tc.name   getCount_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0000
     * @tc.desc   getCount image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCount_callback_000', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getCount_callback_000';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getCountCallbackTest(done, testNum, fetchOps);
    });
    
    //video
    /**
     * @tc.name   getCount_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0100
     * @tc.desc   getCount video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCount_callback_001', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getCount_callback_001';
      const fetchOps:ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getCountCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0200
     * @tc.name   getCount_callback_002
     * @tc.desc   getCount with system album assets
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getCount_callback_002', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getCount_callback_002';
      let subTypes: Array<photoAccessHelper.AlbumSubtype> = [
        albumSubtype.VIDEO,
        albumSubtype.FAVORITE,
        albumSubtype.TRASH,
        albumSubtype.CAMERA,
        albumSubtype.IMAGE,
        albumSubtype.SCREENSHOT,
        albumSubtype.CLOUD_ENHANCEMENT,
      ];
      try {
        for (let i = 0; i < subTypes.length; i++) {
          let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, subTypes[i]);
          const predicates = new dataSharePredicates.DataSharePredicates();
          const ops: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          const fetchResult = await album.getAssets(ops);
          console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
          let count: number = fetchResult.getCount();
          expect(count >= 0).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0300
     * @tc.name   getCount_callback_003
     * @tc.desc   getCount with user album assets
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getCount_callback_003', Level.LEVEL0, async (done:Function)=> {
      const testNum: string = 'getCount_callback_003';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const predicates = new dataSharePredicates.DataSharePredicates();
        const ops: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await album.getAssets(ops);
        console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
        let count: number = fetchResult.getCount();
        expect(count >= 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0400
     * @tc.name   getCount_callback_004
     * @tc.desc   getCount with deleted user album assets
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getCount_callback_004', Level.LEVEL0, async (done:Function)=> {
      const testNum: string = 'getCount_callback_004';
      try {
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        await photoAccessHelper.MediaAlbumChangeRequest.deleteAlbums(testContext, [album]);
        const predicates = new dataSharePredicates.DataSharePredicates();
        const ops: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await album.getAssets(ops);
        console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
        let count: number = fetchResult.getCount();
        expect(count >= 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0500
     * @tc.name   getCount_callback_005
     * @tc.desc   getCount with source album assets
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('getCount_callback_005', Level.LEVEL0, async (done:Function)=> {
      const testNum = 'getCount_callback_005';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        const predicates = new dataSharePredicates.DataSharePredicates();
        const ops: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await album.getAssets(ops);
        console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
        let count: number = fetchResult.getCount();
        expect(count >= 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
