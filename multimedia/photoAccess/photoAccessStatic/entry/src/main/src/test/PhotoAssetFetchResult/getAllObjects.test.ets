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
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";

import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function assetGetAllObjectTest() {
  describe('assetGetAllObjectTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let getAllObjectsCallbackTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<void> => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          hilog.info(domain, tag, '%{public}s', `${testNum} fetchResult: ${fetchResult.getCount()}`);
          expect(fetchResult.getCount() > 0).assertTrue();
          fetchResult.getAllObjects((err: BusinessError | null,
            allObj: Array<photoAccessHelper.PhotoAsset> | undefined) => {
            hilog.info(domain, tag, '%{public}s', `${testNum} getAllObjects; err: ${err?.code} mes: ${err?.message}`);
            try {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s',
                  `${testNum} getAllObjects failed; err: ${err?.code} mes: ${err?.message}`);
                expect(false).assertTrue();
              } else {
                hilog.info(domain, tag, '%{public}s', `${testNum} getAllObjects; allObj.length: ${allObj?.length} `);
                expect(allObj?.length as int > 0).assertTrue();
              }
            } catch (error) {
              hilog.info(domain, tag, '%{public}s', `${testNum} getAllObjects failed; error: ${error}`);
            }
            fetchResult.close();
            done();
          })
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      }

    let getAllObjectsPromiseTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<void> => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          hilog.info(domain, tag, `${testNum} fetchResult: ${fetchResult.getCount()}`);
          expect(fetchResult.getCount() > 0).assertTrue();
          const allObj = await fetchResult.getAllObjects();
          fetchResult.close();
          expect(allObj.length > 0).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      }

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   getAllObjects_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALL_OBJECTS_STATIC_0000
     * @tc.desc   getAllObjects image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllObjects_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAllObjects_callback_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getAllObjectsCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getAllObjects_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALL_OBJECTS_STATIC_0000
     * @tc.desc   getAllObjects image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllObjects_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAllObjects_promise_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getAllObjectsPromiseTest(done, testNum, fetchOps);
      });

    //video
    //callback
    /**
     * @tc.name   getAllObjects_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALL_OBJECTS_STATIC_0100
     * @tc.desc   getAllObjects video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllObjects_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAllObjects_callback_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getAllObjectsCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getAllObjects_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALL_OBJECTS_STATIC_0100
     * @tc.desc   getAllObjects video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAllObjects_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getAllObjects_promise_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getAllObjectsPromiseTest(done, testNum, fetchOps);
      });
  })
}
