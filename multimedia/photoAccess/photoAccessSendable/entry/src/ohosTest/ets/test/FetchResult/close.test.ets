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

import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import {
  sleep,
  driveFn,
  getPermission,
  fetchAllOption,
  createResource
} from '../../util/common'

export default function closeTest () {
  describe('closeTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['011.jpg'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Close_001
     * @tc.name      : close_fetch_result_000
     * @tc.desc      : close fetchResult
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_fetch_result_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'close_fetch_result_000';
      try {
        const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        if (fetchResult === undefined) {
          expect(false).assertTrue();
          done();
        }
        fetchResult.close();
        console.info(`${testNum} close success .`);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Close_002
     * @tc.name      : close_fetch_result_001
     * @tc.desc      : close fetchResult, then operate fetchResult
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_fetch_result_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'close_fetch_result_001';
      try {
        const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        if (fetchResult === undefined) {
          expect(false).assertTrue();
          done();
        }
        fetchResult.close();
        console.info(`${testNum} close success .`);
        let count: number = fetchResult.getCount();
        console.log(`${testNum} :: after close fetchResult, can oprate object!`)
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        console.info(`${testNum} failed; error: ${error.code}`);
        done();
      }
    });

  })
}
