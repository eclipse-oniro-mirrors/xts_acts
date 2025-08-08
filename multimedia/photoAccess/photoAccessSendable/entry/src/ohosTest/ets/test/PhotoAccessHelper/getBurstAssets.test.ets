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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { common } from '@kit.AbilityKit';
import {
  sleep,
  driveFn,
  photoKeys,
  getPermission,
  photoFetchOption,
  fetchAllOption,
  createResource
} from '../../util/common'

export default function getBurstAssetsTest () {

  const imageDisplayName: string = "getBurstAssetsTest.jpg";
  const videoDisplayName: string = "getBurstAssetsTest.mp4";
  let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
  let fileNameList: Array<string> = ['getBurstAssetsTest.jpg', 'getBurstAssetsTest.mp4']

  describe('getBurstAssetsTest', () => {
    beforeAll(async () => {
      console.info('getBurstAssetsTest beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    const getBurstKey = async (testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<string> => {
      let burstKey: string = '-1';
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        if (fetchResult === undefined) {
          console.error(`${testNum} :: getBurstKey :: fetchResult is undefined !`);
          return burstKey;
        }
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        if (photoAsset === undefined) {
          console.error(`${testNum} :: getBurstKey :: photoAsset is undefined !`);
          return burstKey;
        }
        burstKey = photoAsset.get(photoKeys.BURST_KEY).toString();
        console.log(`${testNum} :: get burstKey success, burstKey is ${burstKey}`);
        return burstKey;
      } catch (error) {
        console.error(`${testNum} :: getBurstKey failed, msg is ${error}`);
        return burstKey;
      }
    }

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Burst_001
     * @tc.name      : get_image_burst_assets_001
     * @tc.desc      : getBurstAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_burst_assets_image_001", Level.LEVEL0, async (done: Function) => {
      const testNum = "get_burst_assets_image_001";
      try {
        let fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, imageDisplayName);
        let ops:  photoAccessHelper.FetchOptions = fetchAllOption();
        let burstKey = await getBurstKey(testNum, fetchOps);
        console.log(`${testNum} :: burstKey is '' :: ${burstKey == ''}`);
        if (burstKey === '-1') {
          expect(false).assertTrue();
          done();
        }
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getBurstAssets(burstKey, ops);
        console.log(`${testNum} :: getBurstAssets success, fetchResult is undefined :: ${fetchResult === undefined}`);
        if (fetchResult !== undefined) {
          expect(false).assertTrue();
          done();
        }
        done();
      } catch(error) {
        console.error(`${testNum} :: getBurstAssets failed, error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Burst_002
     * @tc.name      : get_burst_assets_video_001
     * @tc.desc      : getBurstAssets video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_burst_assets_video_001", Level.LEVEL0, async (done: Function) => {
      const testNum = "get_burst_assets_video_001";
      try {
        let fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, videoDisplayName);
        let ops: photoAccessHelper.FetchOptions = fetchAllOption();
        let burstKey = await getBurstKey(testNum, fetchOps);
        console.log(`${testNum} :: burstKey is '' :: ${burstKey == ''}`);
        if (burstKey === '-1') {
          expect(false).assertTrue();
          done();
        }
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getBurstAssets(burstKey, ops);
        console.log(`${testNum} :: getBurstAssets success, fetchResult is undefined :: ${fetchResult === undefined}`);
        if (fetchResult !== undefined) {
          expect(false).assertTrue();
          done();
        }
        done();
      } catch(error) {
        console.error(`${testNum} :: getBurstAssets failed, error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Burst_003
     * @tc.name      : get_image_burst_assets_003
     * @tc.desc      : getBurstAssets by burstKey not exist
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_image_burst_assets_003", Level.LEVEL0, async (done: Function) => {
      const testNum = "get_burst_assets_image_003";
      try {
        let ops: photoAccessHelper.FetchOptions = fetchAllOption();
        let burstKey = "e719d696-09fa-44f8-ec3f215aa62a";
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset>  = await sendablePhAccessHelper.getBurstAssets(burstKey, ops);
        expect(fetchResult !== undefined).assertTrue();
        expect(fetchResult.getCount() === 0).assertTrue();
        done();
      } catch(error) {
        console.error(`${testNum} :: getBurstAssets failed, error is ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

     /**
     * @tc.number    : SUB_PHOTO_ACCESS_SENDABLE_ERROR_GET_BURST_0000
     * @tc.name      : sendable_error_get_burst_assets_invalid_fetchColumns_000
     * @tc.desc      : getBurstAssets with burstKey fetchColumns
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("sendable_error_get_burst_assets_invalid_fetchColumns_000", Level.LEVEL0, async (done: Function) => {
      const testNum = "sendable_error_get_burst_assets_invalid_fetchColumns_000";
      try {
        let ops:  photoAccessHelper.FetchOptions = fetchAllOption();
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getBurstAssets(null as ESObject, ops);
        console.log(`${testNum} :: getBurstAssets success`);
        expect(false).assertTrue();
        done();
      } catch(error) {
        console.error(`${testNum} :: getBurstAssets failed, error is ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
  });
}
