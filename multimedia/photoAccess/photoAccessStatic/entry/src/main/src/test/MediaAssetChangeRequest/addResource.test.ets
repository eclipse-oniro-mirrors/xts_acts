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
import { BusinessError } from '@ohos.base';
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { fetchOption } from '../Common.test.ets';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function addResource() {
  describe("addResource", (): void => {

    /**
     * @tc.name   add_resource_change_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_0000
     * @tc.desc   add resource by ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("add_resource_change_request_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = 'add_resource_change_request_static_000';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);

          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
          let result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = result.getCount();

          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = "jpg";
          let res = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension);
          (res as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));

          let resultTwo: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(resultTwo.getCount()).assertEqual(count + 1);
          console.info(`${testNum} succeed to add resource by ArrayBuffer`);
          done();
        } catch (err: Error) {
          console.error(`${testNum} failed; error: ${err}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   add_resource_change_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_0100
     * @tc.desc   add resource by invalid fileUri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("add_resource_change_request_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum: string = 'add_resource_change_request_static_001';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);

          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = "mp4";
          let res = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension);
          let invalidFileUri: string =
            "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/files/test.mp4";
          (res as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, invalidFileUri);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));
          console.error(`${testNum} failed; error: succeed to add resource with invalid fileUri`);
          expect(false).assertTrue();
          done();
        } catch (err: Error) {
          console.info(`${testNum} succeed to detect invalid fileUri`);
          done();
        }
      })

    /**
     * @tc.name   add_resource_change_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_STATIC_0200
     * @tc.desc   add VIDEO resource by IMAGE_RESOURCE,error code is 13900002 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('add_resource_change_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'add_resource_change_request_static_002';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let photoType = photoAccessHelper.PhotoType.VIDEO;
          let extension = 'mp4';
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension);
          console.info(`assetChangeRequest is declared successfully`);
          (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
          console.info(`${testNum} succeed to add resource by ArrayBuffer`);
          expect(false).assertTrue();
          done();
        } catch (error: BusinessError) {
          console.error(`${testNum} failed; error: ${error}, ${error.code}`);
          expect(error.code == 13900002 || error.code == 401).assertTrue();
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'MediaAssetChangeRequest end');
}