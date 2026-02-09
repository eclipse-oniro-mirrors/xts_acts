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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { JSON } from '@kit.ArkTS';
import cameraObj from 'libentry.so'
import { photoAccessHelper } from "@kit.MediaLibraryKit";
import { common } from "@kit.AbilityKit";
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs, { ListFileOptions } from '@ohos.file.fs';
import fileuri from "@ohos.file.fileuri";
import { driveFn, getPermission } from '../PhotoCommon.test';

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const TAG = 'MediaAssetManagerRequestXts';

export function createSandboxFileUri(context: common.UIAbilityContext,extension: string) {
  let pathDir: string = context.filesDir;
  let path = pathDir + '/test' + new Date().getTime() + '.' + extension;
  fs.openSync(path, fs.OpenMode.CREATE)
  return fileuri.getUriFromPath(path);
}
export function fetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
}
const ERROR_REQUEST_ID = "00000000-0000-0000-0000-000000000000";
const REQUEST_ID_LENGTH = 37

export default function OHMediaAssetManagerRequest() {
  describe('OHMediaAssetManagerRequest', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100
     * @tc.desc    OH_MediaAssetManager_RequestImageForPath-
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_Image_0100', Level.LEVEL1, async () => {
      console.info(TAG,'Start',);
      let testNum = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_0100'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.jpg");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.info(TAG,testNum,'srcUri:',srcUri)
        let destUri = createSandboxFileUri(testContext, 'jpg');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result = cameraObj.TestRequestImageForPath(CASE_INDEX_1,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,'Success',JSON.stringify(result));
        expect(result).not().assertEqual("00000000-0000-0000-0000-000000000000");
      } catch (e) {
        console.error(TAG ,testNum, 'error', e);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100
     * @tc.name    SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100
     * @tc.desc    OH_MediaAssetManager_RequestVideoForPath-
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_VIDEO_0100', Level.LEVEL1, async () => {
      console.info(TAG,'Start',);
      let testNum = 'SUB_MEDIA_ASSET_MANAGER_REQUEST_SUPP_0100'
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchOps = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, "01.mp4");
        let fetchResult = await phAccessHelper.getAssets(fetchOps);
        let photoAsset = await fetchResult.getFirstObject();
        let srcUri = photoAsset.uri;
        console.info(TAG,testNum,'srcUri:',srcUri)
        let destUri = createSandboxFileUri(testContext, 'mp4');
        let requestOptions:photoAccessHelper.RequestOptions = {
          deliveryMode: photoAccessHelper.DeliveryMode.FAST_MODE,
        }
        let result = cameraObj.TestRequestImageForPath(CASE_INDEX_2,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,'Success',JSON.stringify(result));
        expect(result).not().assertEqual("00000000-0000-0000-0000-000000000000");
      } catch (e) {
        console.error(TAG ,testNum, 'error', e);
        expect().assertFail();
      }
    });

  });
}