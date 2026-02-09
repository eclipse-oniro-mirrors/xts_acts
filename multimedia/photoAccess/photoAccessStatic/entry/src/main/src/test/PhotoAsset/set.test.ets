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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import Context from "application.Context"
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import { sleep, getPermission, driveFn } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function setTest() {
  describe('setTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(1000);
      await driveFn();
    });

    const setPhotoAssetTitle = async (done: () => void, testNum: string): Promise<void> => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAsset.set(title, 'newTitle');
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `${testNum} release failed. error: ${err.code}, ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    const setPhotoAssetErrorTitle1 = async (done: () => void, testNum: string): Promise<void> => {
      console.info('photoAssetSetDemo');
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '';
        photoAsset.set(title, 'newTitle');
        done();
      } catch (err: BusinessError) {
        hilog.error(domain, tag, `${testNum} release failed. error: ${err.code}, ${err.message}`);
        expect(err.code === 14000014).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   set_photo_title_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_STATIC_0000
     * @tc.desc   set photo title success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_photo_title_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void):
      Promise<void> => {
      const testNum = 'get_image_uri_000';
      await setPhotoAssetTitle(done, testNum);
      done();
    });

    /**
     * @tc.name   set_photo_title_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_STATIC_0100
     * @tc.desc   set photo title '', error code 14000014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_photo_title_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void):
      Promise<void> => {
      const testNum = 'set_photo_title_static_001';
      await setPhotoAssetErrorTitle1(done, testNum);
      done();
    });
  });
}