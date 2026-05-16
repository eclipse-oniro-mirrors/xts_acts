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
import { getPermission, driveFn, LOG_TAG, fetchAllOption} from '../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'PhotoAccessHelperAssetsCloseTestSupp';

export default function PhotoAccessHelperAssetsCloseTest() {
  describe('PhotoAccessHelperAssetsCloseTest', () => {
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

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_001
     * @tc.number PhotoAccessHelperAssetsCloseTest_001
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd: number = await asset.open('rw');
        asset.close(fd, (err) => {
          if (err === undefined) {
            console.info(TAG,testName,'asset close succeed.');
          } else {
            console.error(TAG,testName,`close failed, error: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
        });
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_002
     * @tc.number PhotoAccessHelperAssetsCloseTest_002
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd: number = -1;
        asset.close(fd, (err) => {
          if (err === undefined) {
            console.info(TAG,testName,'asset close succeed.');
          } else {
            console.error(TAG,testName,`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_003
     * @tc.number PhotoAccessHelperAssetsCloseTest_003
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd = undefined;
        asset.close(fd, (err) => {
          if (err === undefined) {
            console.info(TAG,testName,'asset close succeed.');
          } else {
            console.error(TAG,testName,`close failed, error: ${err.code}, ${err.message}`);
          }
        });
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_004
     * @tc.number PhotoAccessHelperAssetsCloseTest_004
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_004';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd: number = await asset.open('rw');
        await asset.close(fd);
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_005
     * @tc.number PhotoAccessHelperAssetsCloseTest_005
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_005';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd: number = -1;
        await asset.close(fd);
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

    /**
     * @tc.name   PhotoAccessHelperAssetsCloseTest_006
     * @tc.number PhotoAccessHelperAssetsCloseTest_006
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PhotoAccessHelperAssetsCloseTest_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PhotoAccessHelperAssetsCloseTest_006';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG, `phAccessHelper success`+ phAccessHelper  );
        const fetchOptions = fetchAllOption();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let fd = undefined;
        await asset.close(fd);
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error}`, error.code);
        expect(error.code).assertEqual('13900020');
        done();
      }
    })

  })
}