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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoType,
  photoKeys
} from '../../../../../../../common'

export default function assetIsAfterLastTest () {
  describe('assetIsAfterLastTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function isAfterLastCallbackTest (done, testNum, fetchOps) {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
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
    
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_IS_AFTER_LAST_0000
     * @tc.name      : isAfterLast_callback_000
     * @tc.desc      : isAfterLast image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isAfterLast_callback_000', 0, async function (done) {
      const testNum = 'isAfterLast_callback_000';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).limit(2, 0);
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await isAfterLastCallbackTest(done, testNum, fetchOps);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_IS_AFTER_LAST_0100
     * @tc.name      : isAfterLast_callback_001
     * @tc.desc      : isAfterLast video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isAfterLast_callback_001', 0, async function (done) {
      const testNum = 'isAfterLast_callback_001';
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoKeys.PHOTO_TYPE, photoType.IMAGE).limit(2, 0);
      const fetchOps : photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      await isAfterLastCallbackTest(done, testNum, fetchOps);
    });
  })
}
