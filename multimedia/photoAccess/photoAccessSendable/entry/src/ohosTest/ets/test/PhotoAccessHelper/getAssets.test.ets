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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit'
import { BusinessError } from '@ohos.base';
import {
  driveFn,
  photoKeys,
  fetchOption,
  sleep,
  getPermission,
  createResource
} from '../../util/common'

export default function getAssetsTest() {
  describe('getAssetsTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let helper = photoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['01.jpg', '01.mp4'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });


    const getAssetsPromiseTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      expectCount: number) => {
      try {
        const fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(expectCount);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Asset_001
     * @tc.name      : getAssets_promise_000
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getAssets_promise_000';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Asset_002
     * @tc.name      : getAssets_promise_001
     * @tc.desc      : getAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getAssets_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '666');
      const expectCount = 0;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Asset_003
     * @tc.name      : getAssets_promise_004
     * @tc.desc      : getAssets video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAssets_promise_004', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getAssets_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      const expectCount = 1;
      await getAssetsPromiseTest(done, testNum, fetchOps, expectCount);
    });

    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_0000
     * @tc.name      : sendable_get_assets_error_000
     * @tc.desc      : get assets with invalid fetchColumns
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_assets_error_000', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ["ssss"],
          predicates: predicates
        };
        await sendablePhAccessHelper.getAssets(fetchOptions);
        console.info("getAssets successfully");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_assets_error_000 failed, error: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_0100
     * @tc.name      : sendable_get_assets_error_001
     * @tc.desc      : get assets with undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_assets_error_001', Level.LEVEL0, async (done: Function) => {
      try {
        await sendablePhAccessHelper.getAssets(undefined as ESObject);
        console.info("getAssets successfully");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_assets_error_001 failed, error: ${error}, ${error.code}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_ERROR_0000
     * @tc.name      : sendable_get_albums_error_fetchOptions_undefined
     * @tc.desc      : use undefined get albums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_albums_error_000', Level.LEVEL0, async (done: Function) => {
      try {
        await sendablePhAccessHelper.getAlbums(undefined as ESObject, undefined as ESObject, undefined as ESObject);
        console.info("getAlbums successfully");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_albums_error_000 failed, error: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_ERROR_0100
     * @tc.name      : sendable_get_albums_error_fetchOptions_undefined
     * @tc.desc      : use undefined get albums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_albums_error_001', Level.LEVEL0, async (done: Function) => {
      try {
        await sendablePhAccessHelper.getAlbums(undefined as ESObject);
        console.info("getAlbums successfully");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_albums_error_001 failed, error: ${error}, ${error.code}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ALBUMS_ERROR_0200
     * @tc.name      : sendable_get_albums_error_invalid_fetchColumns
     * @tc.desc      : useless fetchColumns get albums
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_albums_error_002', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['afdadfasfa'],
          predicates: predicates
        };
        await sendablePhAccessHelper.getAlbums(fetchOptions);
        console.info("getAlbums successfully");
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_albums_error_002 failed, error: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
  })
}
