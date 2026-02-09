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
import { describe, it, expect, beforeAll, Level, afterAll, beforeEach, afterEach } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG = 'CreateAssetWithShortTermPermissionSupp';

export default function PhotoCreateAssetWithShortTermPermissionTest() {
  describe('PhotoCreateAssetWithShortTermPermissionTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001
     * @tc.desc     第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001";
      try {
        console.info(TAG, testNum, 'Start');
        await phAccessHelper.createAssetWithShortTermPermission(null);
        console.info(TAG, testNum, 'success createAssetWithShortTermPermission');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testNum, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002
     * @tc.desc     第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_002";
      try {
        console.info(TAG, testNum, 'Start');
        await phAccessHelper.createAssetWithShortTermPermission(undefined);
        console.info(TAG, testNum, 'success createAssetWithShortTermPermission');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testNum, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003
     * @tc.desc     第一个参数为空
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_003";
      try {
        console.info(TAG, testNum, 'Start');
        await phAccessHelper.createAssetWithShortTermPermission([] as ESObject);
        console.info(TAG, testNum, 'success createAssetWithShortTermPermission');
        expect().assertFail()
        done();
      } catch (error) {
        console.error(TAG, testNum, 'Failed createAssetWithShortTermPermission', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  })
}