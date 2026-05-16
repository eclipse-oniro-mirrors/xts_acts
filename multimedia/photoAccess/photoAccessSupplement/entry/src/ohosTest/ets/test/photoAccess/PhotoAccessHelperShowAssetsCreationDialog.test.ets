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

const TAG = 'ShowAssetsCreationDialogSupp';

export default function PhotoShowAssetsCreationDialogTest() {
  describe('PhotoShowAssetsCreationDialogTest', () => {
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
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0100
     * @tc.desc     第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0100";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialog',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await phAccessHelper.showAssetsCreationDialog(null, photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0200
     * @tc.desc     第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0200";
      let srcFileUris: Array<string> = ['123456'];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await phAccessHelper.showAssetsCreationDialog(srcFileUris, null);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0300
     * @tc.desc     第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0300";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialog',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await phAccessHelper.showAssetsCreationDialog([], photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0400
     * @tc.desc     第二个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_TEST_0400";
      let srcFileUris: Array<string> = ['123456'];
      try {
        console.info(TAG, testNum, 'Start');
        let result = await phAccessHelper.showAssetsCreationDialog(srcFileUris, []);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })


  })
}