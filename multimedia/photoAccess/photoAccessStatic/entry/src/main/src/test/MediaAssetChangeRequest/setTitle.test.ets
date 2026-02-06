/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import {
  fetchOption,
  getPermission,
  driveFn,
  sleep,
  photoFetchOption,
  getFileAsset,
  pushCreateAsset
} from '../Common.test.ets'
import Context from "application.Context"
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

const fileNames: Array<string> = [ 'off01.jpg' ];
export default function setTitleChangeRequestTest() {
  describe('setTitleChangeRequestTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(testContext, fileNames);
    });

    /**
     * @tc.name   set_title_change_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_STATIC_0100
     * @tc.desc   change asset title '', error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_title_change_request_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'set_title_change_request_static_001';
        try {
          const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'off01.jpg');
          const asset = await getFileAsset(testNum, fetchOps);
          let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
          assetChangeRequest.setTitle("");
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest);
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual(401);
          done();
        }
      })
  })
}