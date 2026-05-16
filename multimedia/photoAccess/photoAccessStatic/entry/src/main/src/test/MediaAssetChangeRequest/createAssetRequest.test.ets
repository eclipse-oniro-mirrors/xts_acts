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

export default function createAssetRequest() {
  describe("createAssetRequest", (): void => {

    /**
     * @tc.name   create_asset_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_STATIC_0000
     * @tc.desc   create image without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("create_asset_request_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_asset_request_static_000';
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
          console.info(`${testNum} succeed to create image without options`);
          done();
        } catch (err: Error) {
          console.error(`${testNum} failed; error: ${err}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   create_asset_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_STATIC_0100
     * @tc.desc   create image with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("create_asset_request_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_asset_request_static_001';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);

          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
          let result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = result.getCount();

          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
          let extension: string = "jpg";
          let optionsOne: photoAccessHelper.CreateOptions = {};
          optionsOne.title = "testImage";
          let res =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension, optionsOne);
          (res as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));

          let resultTwo: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(resultTwo.getCount()).assertEqual(count + 1);
          console.info(`${testNum} succeed to create image with options`);
          done();
        } catch (err: Error) {
          console.error(`${testNum} failed; error: ${err}`);
          expect(false).assertTrue();
          done();
        }
      })


    /**
     * @tc.name   create_asset_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_STATIC_0200
     * @tc.desc   create video without options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("create_asset_request_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_asset_request_static_002';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);

          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
          let result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = result.getCount();

          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = "mp4";
          let res = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension);
          (res as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));

          let resultTwo: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(resultTwo.getCount()).assertEqual(count + 1);
          hilog.info(0x0000, 'testTag', 'count   ' + resultTwo.getCount() + count);
          console.info(`${testNum} succeed to create video without options`);
          done();
        } catch (err: Error) {
          console.error(`${testNum} failed; error: ${err}`);
          hilog.info(0x0000, 'testTag', 'create_asset_request_static_002 failed' + err.name + err.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   create_asset_request_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_STATIC_0300
     * @tc.desc   create video with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("create_asset_request_static_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_asset_request_static_003';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);

          let fetchOps =
            fetchOption(testNum, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.VIDEO);
          let result: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          let count = result.getCount();

          let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
          let extension: string = "mp4";
          let optionsOne: photoAccessHelper.CreateOptions = {};
          optionsOne.title = "testVideo";
          let res =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension, optionsOne);
          (res as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, new ArrayBuffer(4096));
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges((res as photoAccessHelper.MediaAssetChangeRequest));

          let resultTwo: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
          expect(resultTwo.getCount()).assertEqual(count + 1);
          console.info(`${testNum} succeed to create video with options`);
          done();
        } catch (err: Error) {
          console.error(`${testNum} failed; error: ${err}`);
          hilog.info(0x0000, 'testTag', 'create_asset_request_static_002 failed' + err.name + err.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   create_asset_request_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_ASSET_REQUEST_STATIC_0400
     * @tc.desc   create image with extension as ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('create_asset_request_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'create_asset_request_static_004';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let photoType = photoAccessHelper.PhotoType.IMAGE;
          let extension = '';
          let options: photoAccessHelper.CreateOptions = {
            title: 'testImage'
          }
          let assetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(appContext, photoType, extension, options);
          console.info(`${testNum} succeed to create image with options`);
          expect(false).assertTrue()
          done();
        } catch (error: BusinessError) {
          console.error(`${testNum} failed; error: ${error}, ${error.code}`);
          expect(error.code).assertEqual(401)
          done();
        }
      })
  })
  hilog.info(domain, tag, '%{public}s', 'MediaAssetChangeRequest end');
}