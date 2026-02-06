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

let domain: int= 0x0000;
let tag: string = 'testTag';
let testContext: Context = new Context();
let helper: photoAccessHelper.PhotoAccessHelper | null = null;

export default function assetGetCountTest() {
  describe('assetGetCountTest', (): void => {

    beforeAll(() => {
      console.info('beforeAll case');
      testContext = Hypium.get("context") as Context;
      helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    let getCountCallbackTest = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    //image
    /**
     * @tc.name   getCount_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_STATIC_0000
     * @tc.desc   getCount image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCount_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getCount_callback_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await getCountCallbackTest(done, testNum, fetchOps);
      });

    //video
    /**
     * @tc.name   getCount_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_STATIC_0100
     * @tc.desc   getCount video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getCount_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'getCount_callback_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await getCountCallbackTest(done, testNum, fetchOps);
      });
  })
}
