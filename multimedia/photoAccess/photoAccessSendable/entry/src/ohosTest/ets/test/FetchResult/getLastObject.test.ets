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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import {
  sleep,
  driveFn,
  getPermission,
  fetchAllOption,
  createResource
} from '../../util/common'

export default function getLastObjectTest () {
  describe('getLastObjectTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['lastObj.jpg'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    /**
     * @tc.name   get_last_object_promise_001
     * @tc.number Sub_Photo_Access_Sendable_Get_Last_Obj_001
     * @tc.desc   getLastObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_last_object_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'get_last_object_promise_001';
      try {
        const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        if (fetchResult === undefined) {
          expect(false).assertTrue();
          done();
        }
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
