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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import image from '@ohos.multimedia.image';
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';

import {
  sleep,
  driveFn,
  getPermission,
  photoKeys,
  fetchOption,
  createResource
} from '../../util/common'

export default function getThumbnailTest () {
  describe('getThumbnailTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['getThumb.jpg'];

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(2000);
      await createResource(globalContext, fileNameList);
    });

    const getThumbnailPromise2 = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, size: image.Size | undefined, expectSize: image.Size) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let pixelMap: image.PixelMap;
        pixelMap = await asset.getThumbnail(size);
        console.info(`${testNum} pixelMap: ${pixelMap}`);
        const info = await pixelMap.getImageInfo();
        expect(info.size.width).assertEqual(expectSize.width);
        expect(info.size.height).assertEqual(expectSize.height);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   getThumbnail_promise_001
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_001
     * @tc.desc   getThumbnail(image) by { width: 128, height: 128 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getThumbnail_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getThumbnail_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: image.Size = {
        width: 128, height: 128
      };
      const expectSize: image.Size = {
        width: 128, height: 128
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_002
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_002
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: image.Size = {
        width: 1, height: 1024
      };
      const expectSize: image.Size = {
        width: 1, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_003
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_003
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: image.Size = {
        width: 1024, height: 1
      };
      const expectSize: image.Size = {
        width: 1024, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_004
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_004
     * @tc.desc   getThumbnail(image) by { width: 1024, height: 1024 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: image.Size = {
        width: 1024, height: 1024
      };
      const expectSize: image.Size = {
        width: 1024, height: 1024
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });

    /**
     * @tc.name   getThumbnail_promise_005
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_005
     * @tc.desc   getThumbnail(image) by { width: 1, height: 1 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size: image.Size = {
        width: 1, height: 1
      };
      const expectSize: image.Size = {
        width: 1, height: 1
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });



    /**
     * @tc.name   getThumbnail_promise_008
     * @tc.number Sub_Photo_Access_Sendable_Asset_Get_Thumb_006
     * @tc.desc   getThumbnail(image) by undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getThumbnail_promise_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'getThumbnail_promise_008';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'getThumb.jpg');
      const size = undefined;
      const expectSize: image.Size = {
        width: 256, height: 256
      };
      await getThumbnailPromise2(done, testNum, fetchOps, size, expectSize);
    });
  })
}
