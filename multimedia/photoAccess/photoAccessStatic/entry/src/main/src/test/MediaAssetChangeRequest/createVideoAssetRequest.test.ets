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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function createVideoAssetRequest() {
  describe("createVideoAssetRequest", (): void => {

    /**
     * @tc.name   create_video_asset_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_VIDEO_ASSET_REQUEST_STATIC_0000
     * @tc.desc   create video asset request with invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("create_video_asset_request_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_video_asset_request_static_000';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
          let invalidFileUri: string =
            "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/files/testVedio.MP4";
          let res = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(appContext, invalidFileUri);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));
          console.error(`${testNum} failed; error: succeed to create video asset with invalid fileUri`);
          expect(false).assertTrue();
          done();
        } catch (err: Error) {
          console.info(`${testNum} succeed to detect invalid fileUri`);
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'MediaAssetChangeRequest end');
}