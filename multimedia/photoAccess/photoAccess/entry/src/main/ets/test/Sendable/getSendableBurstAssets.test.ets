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
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import {
  sleep,
  photoKeys,
  getPermission,
  pushCreateAsset,
  photoFetchOption,
  fetchAllOption
} from '../../../../../../../common'

export default function getSendableBurstAssetsTest () {

  const fileNameList = ["getBurstAssetsTest.jpg", "getBurstAssetsTest.mp4"];
  const imageDisplayName = "getBurstAssetsTest.jpg";
  const videoDisplayName = "getBurstAssetsTest.mp4";

  let sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

  describe('getSendableBurstAssetsTest', () => {
    beforeAll(async () => {
      console.info('getBurstAssetsTest beforeAll case');
      await getPermission();
      await sleep()
      await pushCreateAsset(fileNameList);
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
     * @tc.number    : Sub_PhotoAccess_Helper_Get_BurstAssets_001
     * @tc.name      : get_image_burst_assets_001
     * @tc.desc      : getBurstAssets image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_burst_assets_image_001", 0, async (done: Function) => {
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
     * @tc.number    : Sub_PhotoAccess_Helper_Get_BurstAssets_002
     * @tc.name      : get_burst_assets_video_001
     * @tc.desc      : getBurstAssets video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_burst_assets_video_001", 0, async (done: Function) => {
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
     * @tc.number    : Sub_PhotoAccess_Helper_Get_BurstAssets_003
     * @tc.name      : get_image_burst_assets_003
     * @tc.desc      : getBurstAssets by burstKey not exist
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("get_image_burst_assets_003", 0, async (done: Function) => {
      const testNum = "get_burst_assets_image_003";
      try {
        let ops: photoAccessHelper.FetchOptions = fetchAllOption();
        let burstKey = "e719d696-09fa-44f8-ec3f215aa62a";
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset>  = await sendablePhAccessHelper.getBurstAssets(burstKey, ops);
        if (fetchResult === undefined || fetchResult.getCount() > 0) {
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
  });
}
