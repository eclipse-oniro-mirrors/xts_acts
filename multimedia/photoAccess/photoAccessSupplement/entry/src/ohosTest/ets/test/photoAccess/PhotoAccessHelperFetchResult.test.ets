/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, afterAll, beforeEach, afterEach } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';
import { dataSharePredicates } from '@kit.ArkData';
import { driveFn, fetchOption, getPermission, photoKeys, sleep } from '../common';
import { fileUri } from '@kit.CoreFileKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';

const TAG = 'PhotoShowAssetsFetchResultTestTAG';
const ERROR_PArameter  = '23800151';

export default function PhotoShowAssetsFetchResultTest() {
  let driver: Driver | undefined = undefined;
  describe('PhotoShowAssetsFetchResultTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await driveFn();
      driver = Driver.create();
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

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_GETObjectsByIndexSet_TEST_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_GETObjectsByIndexSet_TEST_0100
     * @tc.desc     返回值非空覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_GETObjectsByIndexSet_TEST_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_GETObjectsByIndexSet_TEST_0100";
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult = await phAccessHelper.getAssets(fetchOption);
        let indexSet: number[] = [0];
        let ret: photoAccessHelper.PhotoAsset[] = await fetchResult.getObjectsByIndexSet(indexSet);
        console.info(TAG, testNum, ' getObjectsByIndexSet', ret.length);
        expect(ret.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_ShowAssetsCreationDialogEx_TEST_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_ShowAssetsCreationDialogEx_TEST_0100
     * @tc.desc     返回值非空覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_ShowAssetsCreationDialogEx_TEST_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_ShowAssetsCreationDialogEx_TEST_0100";
      let isSupportPicker: boolean = true;
      try {
        const creationSetting: photoAccessHelper.PhotoCreationConfig = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
        };
        const boxPath = fileUri.getUriFromPath(testContext.filesDir + '/test.jpg').toString();
        phAccessHelper.showAssetsCreationDialogEx([boxPath], [creationSetting])
          .then((result) => {
            console.info(TAG, testNum, ` Success showAssetsCreationDialogEx`,
              result.length);
            expect(result.length > 0).assertTrue();
          }).catch((error: ESObject) => {
          console.error(TAG, testNum, ` Failed showAssetCreationDialog`, error.code,
            JSON.stringify(error));
          console.info(TAG, testNum, 'error code is 14000011, device does not support');
          expect(error.code).assertEqual(14000011);
          isSupportPicker = false;
        }).finally(() => {
          done();
        });
        if (isSupportPicker) {
          await sleep(3000);
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await sleep(500);
          await power?.click();
        }
      } catch (error) {
        console.info(TAG, testNum, 'Failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoAlbumChange_TEST_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoAlbumChange_TEST_0100
     * @tc.desc     error code 23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoAlbumChange_TEST_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoAlbumChange_TEST_0100";
      try {
        // 注册offCallback1监听。
        let offCallback1 = (changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info('onCallback1 success, changeData: ' + JSON.stringify(changeData));
          // 触发回调时，具体的操作。
        }
        phAccessHelper.offSinglePhotoAlbumChange(undefined, offCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testNum, 'offSinglePhotoAlbumChange failed, errCode is', error);
        expect(error.code).assertEqual(ERROR_PArameter);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoChange_TEST_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoChange_TEST_0100
     * @tc.desc     error code 23800151
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoChange_TEST_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_OffSinglePhotoChange_TEST_0100";
      try {
        // 注册offCallback1监听。
        let offCallback1 = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info('onCallback1 success, changeData: ' + JSON.stringify(changeData));
          // 触发回调时，具体的操作。
        }
        phAccessHelper.offSinglePhotoChange(undefined, offCallback1);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG,testNum, 'offSinglePhotoAlbumChange failed, errCode is', error);
        expect(error.code).assertEqual(ERROR_PArameter);
        done();
      }
    })



  })
}