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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit'
import {
  sleep,
  driveFn,
  getPermission,
  fetchAllOption,
  createResource
} from '../../util/common'

export default function IsAfterLastTest () {

  let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
  let fileNameList: Array<string> = ['IsAfterLastTest.jpg'];

  describe('IsAfterLastTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    /**
     * @tc.name   isAfterLast_000
     * @tc.number Sub_Photo_Access_Sendable_Is_Last_Obj_001
     * @tc.desc   isAfterLast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isAfterLast_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'isAfterLast_000';
      try {
        const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        expect(fetchResult !== undefined).assertTrue();
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
        expect(photoAsset !== undefined).assertTrue();
        expect(fetchResult.isAfterLast()).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
