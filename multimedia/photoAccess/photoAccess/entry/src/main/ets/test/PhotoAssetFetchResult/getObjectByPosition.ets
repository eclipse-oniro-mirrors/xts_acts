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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  fetchOption,
  photoType,
  photoKeys
} from '../../../../../../../common'

export default function assetGetPositionObjectTest () {
  describe('assetGetPositionObjectTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function getObjectByPositionCallbackTest (done, testNum, fetchOps) {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const firAsset = await fetchResult.getFirstObject();
        fetchResult.getObjectByPosition(0, (err, asset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getObjectByPosition failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(asset.displayName).assertEqual(firAsset.displayName);
            }
          } catch (error) {
            console.info(`${testNum} getObjectByPosition failed; error: ${error}`);
          }
          fetchResult.close();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function getObjectByPositionPromiseTest (done, testNum, fetchOps) {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const firAsset = await fetchResult.getFirstObject();
        const asset = await fetchResult.getObjectByPosition(0);
        fetchResult.close();
        expect(asset.displayName).assertEqual(firAsset.displayName);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }
    
    //image
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_OBJECT_BY_POSITION_0000
     * @tc.name      : getObjectByPosition_callback_000
     * @tc.desc      : getObjectByPosition image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_callback_000', 0, async function (done) {
      const testNum = 'getObjectByPosition_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getObjectByPositionCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_OBJECT_BY_POSITION_0000
     * @tc.name      : getObjectByPosition_promise_000
     * @tc.desc      : getObjectByPosition image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_promise_000', 0, async function (done) {
      const testNum = 'getObjectByPosition_promise_000';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getObjectByPositionPromiseTest(done, testNum, fetchOps);
    });
    
    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_OBJECT_BY_POSITION_0100
     * @tc.name      : getObjectByPosition_callback_001
     * @tc.desc      : getObjectByPosition video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_callback_001', 0, async function (done) {
      const testNum = 'getObjectByPosition_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getObjectByPositionCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_OBJECT_BY_POSITION_0100
     * @tc.name      : getObjectByPosition_promise_001
     * @tc.desc      : getObjectByPosition video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getObjectByPosition_promise_001', 0, async function (done) {
      const testNum = 'getObjectByPosition_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getObjectByPositionPromiseTest(done, testNum, fetchOps);
    });
  })
}
