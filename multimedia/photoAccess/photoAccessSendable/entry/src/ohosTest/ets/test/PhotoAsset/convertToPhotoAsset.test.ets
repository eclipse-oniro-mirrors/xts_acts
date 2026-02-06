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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit';
import {
  sleep,
  driveFn,
  photoKeys,
  getPermission,
  createResource
} from '../../util/common'

export default function convertToPhotoAssetTest () {
  describe('convertToPhotoAssetTest', () => {

    const fileName: string = 'convertToPhotoAssetTest.jpg';
    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['convertToPhotoAssetTest.jpg'];

    beforeAll(async () => {
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    })

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Covert_001
     * @tc.name      : covert_photo_promise_000
     * @tc.desc      : covert photo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('covert_photo_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'covert_photo_promise_000';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoKeys.DISPLAY_NAME, fileName);
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        let sendablePhotoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let photoAsset: photoAccessHelper.PhotoAsset = sendablePhotoAsset.convertToPhotoAsset();
        if (photoAsset === undefined) {
          expect(false).assertTrue()
          done();
        }
        console.log(`get no sendable uri success : ${photoAsset.uri}`);
        done();
      } catch(error) {
        console.error(`${testNum} :: convertToPhotoAsset failed, err is ${error}`);
        expect(false).assertTrue()
        done();
      }
    })

  });
}