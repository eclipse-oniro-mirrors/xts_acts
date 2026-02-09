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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import cameraObj from 'libentry.so'
import { photoAccessHelper } from "@kit.MediaLibraryKit";
import { common } from "@kit.AbilityKit";
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs, { ListFileOptions } from '@ohos.file.fs';
import fileuri from "@ohos.file.fileuri";
import { driveFn, getPermission } from "../PhotoCommon.test";


const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const TAG = 'ImageNdk.MediaAssetManagerCancelRequestTest'
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
export default function AssetManagerCancelRequestTest() {
  describe('AssetManagerCancelRequestTest', () => {
    beforeAll(async () => {
      await getPermission();
      await driveFn();
      console.info(TAG, 'beforeAll case');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    SUB_MEDIA_MANAGER_CANCEL_REQUEST_001
     * @tc.name      SUB_MEDIA_MANAGER_CANCEL_REQUEST_001
     * @tc.desc      OH_MediaAssetManager_CancelRequest-False
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_MANAGER_CANCEL_REQUEST_001", Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_MEDIA_MANAGER_CANCEL_REQUEST_001';
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
        let result = cameraObj.MediaAssetManagerCancelRequestTest(CASE_INDEX_1,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,testNum,'result:',result);
        expect(result).assertEqual(false);
        done();
      } catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_MANAGER_CANCEL_REQUEST_002
     * @tc.name      SUB_MEDIA_MANAGER_CANCEL_REQUEST_002
     * @tc.desc      OH_MediaAssetManager_CancelRequest-False
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_MANAGER_CANCEL_REQUEST_002", Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_MEDIA_MANAGER_CANCEL_REQUEST_002';
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
        let result = cameraObj.MediaAssetManagerCancelRequestTest(CASE_INDEX_2,srcUri, requestOptions, destUri, (err: BusinessError, data: ESObject) =>{})
        console.info(TAG,testNum,'result:',result);
        expect(result).assertEqual(false);
        done();
      } catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}  ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}