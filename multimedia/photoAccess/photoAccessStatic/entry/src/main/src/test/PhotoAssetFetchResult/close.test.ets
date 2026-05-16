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
import { fetchOption } from '../Common.test.ets'
import Context from "application.Context"
import hilog from '@ohos.hilog'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function assetCloseTest() {
  describe('assetCloseTest', (): void => {

    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let closeCallbackTest =
      async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<void> => {
        try {
          let fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(fetchResult.getCount() > 0).assertTrue();
          fetchResult.close();
          let testCount = 0;
          let count = 0;
          try {
            testCount++;
            fetchResult.getCount();
          } catch (error) {
            hilog.info(domain, tag, '%{public}s', `${testNum} getCount failed; error: ${error}`);
            count++;
          }
          try {
            testCount++;
            await fetchResult.getFirstObject();
          } catch (error) {
            console.info(`${testNum} getFirstObject failed; error: ${error}`);
            count++;
          }
          try {
            testCount++;
            await fetchResult.getNextObject();
          } catch (error) {
            console.info(`${testNum} getNextObject failed; error: ${error}`);
            count++;
          }
          try {
            testCount++;
            await fetchResult.getAllObjects();
          } catch (error) {
            hilog.info(domain, tag, '%{public}s', `${testNum} getAllObjects failed; error: ${error}`);
            count++;
          }
          expect(count).assertEqual(testCount);
          done();
        } catch (error) {
          hilog.info(domain, tag, '%{public}s', `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      }

    /**
     * @tc.name   close_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CLOSE_STATIC_0000
     * @tc.desc   close image
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('close_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'close_callback_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        await closeCallbackTest(done, testNum, fetchOps);
      });

    /**
     * @tc.name   close_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_CLOSE_STATIC_0100
     * @tc.desc   close video
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('close_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'close_callback_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
        await closeCallbackTest(done, testNum, fetchOps);
      });
  })
}
