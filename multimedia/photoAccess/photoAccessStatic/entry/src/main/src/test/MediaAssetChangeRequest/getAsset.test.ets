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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getAsset() {
  describe("getAsset", (): void => {

    /**
     * @tc.name   get_asset_change_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_ASSET_CHANGE_REQUEST_STATIC_0100
     * @tc.desc   get asset before/after applyChanges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("get_asset_change_request_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_asset_change_request_static_001';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = 'jpg';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension);
          expect((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset()).assertEqual(null);
          (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1000));
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
          let asset = (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset();
          if (asset === null || asset === undefined || !asset.uri.match('file://media/Photo')) {
            console.error(`${testNum} failed to get asset after applyChanges`);
            expect(false).assertTrue();
          }
          done();
        } catch (err) {
          console.error(`${testNum} failed; error: ${err}`);
          expect(false).assertTrue();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'MediaAssetChangeRequest end');
}