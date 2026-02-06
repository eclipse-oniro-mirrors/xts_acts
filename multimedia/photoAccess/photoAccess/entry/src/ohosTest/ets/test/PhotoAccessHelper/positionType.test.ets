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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit'
import {
  sleep,
  driveFn,
  getPermission,
  fetchOption,
  pushCreateAsset
} from '../common'
import { dataSharePredicates } from '@kit.ArkData'

export default function positionTypeTest () {
  describe('positionTypeTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fileNameList: Array<string> = ['positionType_01.jpg'];

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(testContext, fileNameList);
    });

    /**
     * @tc.name   getAsset_by_positionType_001
     * @tc.number Sub_MediaLibrary_PhotoAccess_PositionType_001
     * @tc.desc   getAsset by positionType: local
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getAsset_by_positionType_001', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'getAsset_by_positionType_001';
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.POSITION, photoAccessHelper.PositionType.LOCAL);
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResultCount ${fetchResult.getCount()}`);
        expect(fetchResult.getCount() > 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   getAsset_by_positionType_002
     * @tc.number Sub_MediaLibrary_PhotoAccess_PositionType_002
     * @tc.desc   getAsset by positionType: cloud
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getAsset_by_positionType_002', Level.LEVEL3, async (done: Function) => {
      const testNum: string = 'getAsset_by_positionType_002';
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.POSITION, photoAccessHelper.PositionType.CLOUD);
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResultCount ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(0);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   getAsset_by_positionType_003
     * @tc.number Sub_MediaLibrary_PhotoAccess_PositionType_003
     * @tc.desc   getAsset by positionType: local and cloud
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getAsset_by_positionType_003', Level.LEVEL3, async (done: Function) => {
      const testNum: string = 'getAsset_by_positionType_003';
      try {
        const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.POSITION, photoAccessHelper.PositionType.LOCAL_AND_CLOUD);
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        console.log(`${testNum} :: fetchResultCount ${fetchResult.getCount()}`);
        expect(fetchResult.getCount()).assertEqual(0);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   getAllAsset_position_001
     * @tc.number Sub_MediaLibrary_PhotoAccess_PositionType_004
     * @tc.desc   get all asset position value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('getAllAsset_position_001', Level.LEVEL3, async (done: Function) => {
      const testNum: string = 'getAllAsset_position_001';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        const ops : photoAccessHelper.FetchOptions = {
          fetchColumns: [
            photoAccessHelper.PhotoKeys.DISPLAY_NAME,
            photoAccessHelper.PhotoKeys.POSITION
          ],
          predicates: predicates
        };
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        const positionLocal: number = parseInt(photoAccessHelper.PositionType.LOCAL.toString());
        const positionCloud: number = parseInt(photoAccessHelper.PositionType.CLOUD.toString());
        const positionLocalAndCloud: number = parseInt(photoAccessHelper.PositionType.LOCAL_AND_CLOUD.toString());
        for (let asset of photoAssetList) {
          let position: number = parseInt(asset.get(photoAccessHelper.PhotoKeys.POSITION).toString());
          console.log(`${testNum} :: asset position = ${position}`);
          expect(position).assertEqual(positionLocal);
          expect(position).not().assertEqual(positionCloud);
          expect(position).not().assertEqual(positionLocalAndCloud);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
