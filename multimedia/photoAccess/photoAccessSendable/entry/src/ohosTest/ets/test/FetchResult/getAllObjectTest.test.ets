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
import { common } from '@kit.AbilityKit'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import {
  sleep,
  driveFn,
  photoKeys,
  fetchOption,
  getPermission,
  createResource
} from '../../util/common'

export default function getAllObjectTest () {

  describe('getAllObjectTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['getAllObj.jpg', 'getAllObj.mp4'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });


    let getAllObjectsPromiseTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        expect(fetchResult.getCount() > 0).assertTrue();
        const allObj: Array<sendablePhotoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        fetchResult.close();
        expect(allObj.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_All_001
     * @tc.name      : getAllObjects_promise_000
     * @tc.desc      : getAllObjects image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getAllObjects_promise_000';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getAllObjectsPromiseTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_All_002
     * @tc.name      : getAllObjects_promise_001
     * @tc.desc      : getAllObjects video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAllObjects_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getAllObjects_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getAllObjectsPromiseTest(done, testNum, fetchOps);
    });

  })
}
