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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import {
  sleep,
  driveFn,
  fetchOption,
  photoKeys,
  getPermission,
  createResource
} from '../../util/common'

export default function getObjectByPositionTest () {
  describe('getObjectByPositionTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['getObjectByPositionTest.jpg', 'getObjectByPositionTest.mp4'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });


   let getObjectByPositionPromiseTest = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const firAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(0);
        expect(asset.displayName).assertEqual(firAsset.displayName);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Obj_By_Position_001
     * @tc.name      : getObjectByPosition_promise_000
     * @tc.desc      : getObjectByPosition image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getObjectByPosition_promise_000';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getObjectByPositionPromiseTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Obj_By_Position_002
     * @tc.name      : getObjectByPosition_promise_001
     * @tc.desc      : getObjectByPosition video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getObjectByPosition_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getObjectByPositionPromiseTest(done, testNum, fetchOps);
    });
  })
}
