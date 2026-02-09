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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import {
  fetchAllOption,
  sleep,
  getPermission,
  getBurstKey,
  photoFetchOption,
  driveFn,
  pushCreateAsset
} from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getBurstAssetsTest() {

  const fileNameList = ["getBurstAssetsTest.jpg", "getBurstAssetsTest.mp4"];
  const imageDisplayName = "getBurstAssetsTest.jpg";
  const videoDisplayName = "getBurstAssetsTest.mp4";

  describe("getBurstAssetsTest", (): void => {
    hilog.info(domain, tag, 'getBurstAssetsTest start');
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('getBurstAssetsTest beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000)
      await pushCreateAsset(testContext, fileNameList);
    });

    /**
     * @tc.name   get_image_burst_assets_static_003 
     * @tc.number Sub_PhotoAccess_Helper_Get_BurstAssets_Static_003
     * @tc.desc   getBurstAssets by burstKey not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("get_image_burst_assets_static_003 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_image_burst_assets_static_003';
        try {
          let ops = fetchAllOption();
          let burstKey = "e719d696-09fa-44f8-ec3f215aa62a";
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getBurstAssets(burstKey, ops);
          if (fetchResult === undefined || fetchResult.getCount() > 0) {
            expect(false).assertTrue();
            done();
          }
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' getBurstAssets failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   get_burst_asset_by_subtype_static_001
     * @tc.number Sub_PhotoAccess_Helper_Get_BurstAssets_Static_004
     * @tc.desc   getBurstAssets by subtype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("get_burst_asset_by_subtype_static_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = "get_burst_asset_by_subtype_static_001";
        try {
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.BURST as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          let assetResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          hilog.info(domain, tag, `${testNum} :: assetResult count:: count = ${assetResult.getCount()}`);
          expect(assetResult.getCount() >= 0).assertTrue();
          done();
        } catch (error) {
          hilog.error(domain, tag, `${testNum} :: getBurstAssets failed, error is ${error}`);
          expect(false).assertTrue();
          done();
        }
      })
  })
  hilog.info(domain, tag, 'getAlbumsTest end');
}