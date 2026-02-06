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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function assetGetFirstObjectTest() {
  describe('assetGetFirstObjectTest', (): void => {

    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let getFirstObjectCallbackTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          hilog.info(domain, tag, '%{public}s', `${testNum} fetchResult: ${fetchResult.getCount()}`);
          expect(fetchResult.getCount()).assertEqual(1);
          fetchResult.getFirstObject((err: BusinessError | null, asset: photoAccessHelper.PhotoAsset | undefined) => {
            try {
              if (err?.code !== 0) {
                hilog.info(domain, tag, `${testNum} err: ${err}`);
                expect(false).assertTrue();
              } else {
                hilog.info(domain, tag, '%{public}s', `${testNum} asset: ${asset?.displayName}`);
                expect(asset !== undefined).assertTrue();
              }
            } catch (error) {
              hilog.info(domain, tag, '%{public}s', `${testNum} error: ${error}`);
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

    let getFirstObjectPromiseTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(fetchResult.getCount()).assertEqual(1);
          const asset = await fetchResult.getFirstObject();
          fetchResult.close();
          hilog.info(domain, tag, '%{public}s', `${testNum} asset: ${asset.displayName}`);
          expect(asset !== undefined).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
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
     * @tc.name   getFirstObject_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_FIRST_OBJECT_STATIC_0100
     * @tc.desc   getFirstObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getFirstObject_callback_static_001';
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: new Array<string>(),
          predicates: predicates
        };
        await getFirstObjectCallbackTest(done, testNum, fetchOps);
      });

    //promise
    /**
     * @tc.name   getFirstObject_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_GET_FIRST_OBJECT_STATIC_0100
     * @tc.desc   getFirstObject video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getFirstObject_promise_static_001';
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '01.mp4');
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: new Array<string>(),
          predicates: predicates
        };
        await getFirstObjectPromiseTest(done, testNum, fetchOps);
      });
  })
}
