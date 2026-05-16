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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'
import Context from "application.Context"
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base'

export default function assetGetLastObjectTest() {
  describe('assetGetLastObjectTest', () => {
    let testContext: Context = Hypium.get('context') as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let getLastObjectCallbackTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.getLastObject((err: BusinessError | null, asset) => {
          try {
            console.info(`${testNum} getLastObject failed; err code : ${err?.code}`);
            if (err?.code !== 0) {
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

    let getLastObjectPromiseTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
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
     * @tc.name   getLastObject_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_LAST_OBJECT_STATIC_0000
     * @tc.desc   getLastObject image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastObject_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getLastObject_callback_static_000';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getLastObjectCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getLastObject_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_LAST_OBJECT_STATIC_0000
     * @tc.desc   getLastObject image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastObject_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getLastObject_promise_static_000';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getLastObjectPromiseTest(done, testNum, fetchOps);
      });

    //video
    //callback
    /**
     * @tc.name   getLastObject_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_LAST_OBJECT_STATIC_0100
     * @tc.desc   getLastObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastObject_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getLastObject_callback_static_001';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getLastObjectCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getLastObject_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_LAST_OBJECT_STATIC_0100
     * @tc.desc   getLastObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getLastObject_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getLastObject_promise_static_001';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getLastObjectPromiseTest(done, testNum, fetchOps);
      });
  })
}
