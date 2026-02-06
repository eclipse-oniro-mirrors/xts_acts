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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function assetGetPositionObjectTest() {
  describe("assetGetPositionObjectTest", (): void => {
    const appContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(appContext);

    const getObjectByPositionCallbackTest = async (done: () => void, testNum: string,
      fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        const firAsset = await fetchResult.getFirstObject();
        hilog.info(domain, tag, '%{public}s', `${testNum} start`);
        fetchResult.getObjectByPosition(0,
          (err: BusinessError | null, asset: photoAccessHelper.PhotoAsset | undefined) => {
            hilog.info(domain, tag, '%{public}s', `${testNum} in callback`);
            try {
              if (err?.code !== 0) {
                hilog.info(domain, tag, '%{public}s', `${testNum} getObjectByPosition failed; err: ${err?.message}`);
                expect(false).assertTrue();
              } else {
                expect(asset?.displayName).assertEqual(firAsset.displayName);
              }
            } catch (error) {
              hilog.info(domain, tag, '%{public}s', `${testNum} getObjectByPosition failed; error: ${error}`);
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

    const getObjectByPositionPromiseTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(fetchResult.getCount() > 0).assertTrue();
          const firAsset = await fetchResult.getFirstObject();
          hilog.info(domain, tag, '%{public}s', `${testNum} start`);
          const asset = await fetchResult.getObjectByPosition(0);
          fetchResult.close();
          expect(asset.displayName).assertEqual(firAsset.displayName);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
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
     * @tc.name   getObjectByPosition_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_OBJECT_BY_POSITION_STATIC_0000
     * @tc.desc   getObjectByPosition image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getObjectByPosition_callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getObjectByPosition_callback_static_000';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getObjectByPositionCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getObjectByPosition_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_OBJECT_BY_POSITION_STATIC_0000
     * @tc.desc   getObjectByPosition image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getObjectByPosition_promise_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getObjectByPosition_promise_static_000';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getObjectByPositionPromiseTest(done, testNum, fetchOps);
      });

    //video
    //callback
    /**
     * @tc.name   getObjectByPosition_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_OBJECT_BY_POSITION_STATIC_0100
     * @tc.desc   getObjectByPosition video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getObjectByPosition_callback_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getObjectByPosition_callback_static_001';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getObjectByPositionCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getObjectByPosition_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_OBJECT_BY_POSITION_STATIC_0100
     * @tc.desc   getObjectByPosition video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getObjectByPosition_promise_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getObjectByPosition_promise_static_001';
        const fetchOps =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getObjectByPositionPromiseTest(done, testNum, fetchOps);
      });
  })
}
