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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Size, TestType } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { dataSharePredicates } from '@kit.ArkData';


const TAG = LOG_TAG + 'PhotoAccessHelperGetAlbums';


export default function PhotoAccessHelperGetAlbumsSupp() {
  describe('PhotoAccessHelperGetAlbumsSupp', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
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
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0400
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0400
     * @tc.desc   phAccessHelper.setAssetCompatibleCapability-第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0400';
      console.info(TAG, testName + ' begin.');
      try {
        await phAccessHelper.setAssetCompatibleCapability(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0500
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0500
     * @tc.desc   phAccessHelper.setAssetCompatibleCapability-第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_SET_ASSET_COMPATIBLE_CAPABILITY_0500';
      console.info(TAG, testName + ' begin.');
      try {
        await phAccessHelper.setAssetCompatibleCapability(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
  })
}