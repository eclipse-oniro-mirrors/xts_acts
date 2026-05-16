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
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import { getPermission, driveFn, sleep } from '../Common.test.ets'
import Context from "application.Context"
import common from '@ohos.app.ability.common';

export default function assetIsAfterLastTest() {
  describe('assetIsAfterLastTest', () => {

    let testContext: Context = Hypium.get('context') as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let isAfterLastCallbackTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = fetchResult.getCount();
          expect(count).assertEqual(2);
          let asset = await fetchResult.getFirstObject();
          asset = await fetchResult.getNextObject();
          const result = fetchResult.isAfterLast();
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    //image
    /**
     * @tc.name   isAfterLast_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_IS_AFTER_LAST_STATIC_0000
     * @tc.desc   isAfterLast image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isAfterLast_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'isAfterLast_callback_static_000';
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE as long).limit(2, 0);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        await isAfterLastCallbackTest(done, testNum, fetchOps);
      });

    //video
    /**
     * @tc.name   isAfterLast_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_IS_AFTER_LAST_STATIC_0100
     * @tc.desc   isAfterLast video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isAfterLast_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'isAfterLast_callback_static_001';
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE as long).limit(2, 0);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        await isAfterLastCallbackTest(done, testNum, fetchOps);
      });
  })
}
