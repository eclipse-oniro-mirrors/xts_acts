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

import fs from '@ohos.file.fs';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import { driveFn, fetchOption, getPermission, sleep } from '../Common.test.ets'
import Context from "application.Context"

export default function getWriteCacheHandlerTest() {
  describe('getWriteCacheHandlerTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   get_write_cache_handler_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_WRITE_CACHE_HANDLER_STATIC_0000
     * @tc.desc   get write cache handler of image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_write_cache_handler_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_write_cache_handler_static_000';
        try {
          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = fetchResult.getCount();

          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = 'jpg';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          let fd = await (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getWriteCacheHandler() as int;
          console.info('getWriteCacheHandler successfully');
          await fs.write(fd, "test image content");
          await fs.close(fd);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));

          fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(fetchResult.getCount()).assertEqual(count + 1);
          console.info(`${testNum} succeed to write image with getWriteCacheHandler`);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   get_write_cache_handler_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_WRITE_CACHE_HANDLER_STATIC_0100
     * @tc.desc   get write cache handler of video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_write_cache_handler_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_write_cache_handler_static_001';
        try {
          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = fetchResult.getCount();

          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
          let fd = await (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getWriteCacheHandler() as int;
          console.info('getWriteCacheHandler successfully');
          await fs.write(fd, "test video content");
          await fs.close(fd);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));

          fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(fetchResult.getCount()).assertEqual(count + 1);
          console.info(`${testNum} succeed to write video with getWriteCacheHandler`);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })
  })
}