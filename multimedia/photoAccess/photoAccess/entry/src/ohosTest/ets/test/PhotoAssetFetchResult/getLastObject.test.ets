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
import { fetchOption, photoType, photoKeys, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common';

export default function assetGetLastObjectTest() {
  describe('assetGetLastObjectTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let getLastObjectCallbackTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.getLastObject((err, asset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getLastObject failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(asset !== undefined).assertTrue();
              const ret = fetchResult.isAfterLast();
              expect(ret).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getLastObject failed; error: ${error}`);
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

    let getLastObjectPromiseTest = async (done: Function, testNum: string, fetchOps: ESObject) => {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const asset = await fetchResult.getLastObject();
        expect(asset !== undefined).assertTrue();
        const ret = fetchResult.isAfterLast();
        fetchResult.close();
        expect(ret).assertTrue();
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
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_LAST_OBJECT_0000
     * @tc.name      : getLastObject_callback_000
     * @tc.desc      : getLastObject image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getLastObject_callback_000';
      const fetchOps: ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getLastObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_LAST_OBJECT_0000
     * @tc.name      : getLastObject_promise_000
     * @tc.desc      : getLastObject image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getLastObject_promise_000';
      const fetchOps: ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getLastObjectPromiseTest(done, testNum, fetchOps);
    });

    //video
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_LAST_OBJECT_0100
     * @tc.name      : getLastObject_callback_001
     * @tc.desc      : getLastObject video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getLastObject_callback_001';
      const fetchOps: ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getLastObjectCallbackTest(done, testNum, fetchOps);
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_LAST_OBJECT_0100
     * @tc.name      : getLastObject_promise_001
     * @tc.desc      : getLastObject video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getLastObject_promise_001';
      const fetchOps: ESObject = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getLastObjectPromiseTest(done, testNum, fetchOps);
    });
  })
}
