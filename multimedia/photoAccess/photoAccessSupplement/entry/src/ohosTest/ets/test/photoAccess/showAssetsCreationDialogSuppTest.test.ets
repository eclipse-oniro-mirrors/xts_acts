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
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { sleep, driveFn } from '../common'
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.PhotoAccessHelpers';

export default function ShowAssetsCreationDialogSuppTest() {
  describe('ShowAssetsCreationDialogSuppTest', () => {
    let driver: Driver | undefined = undefined;
    beforeAll(async () => {
      AppStorage.setOrCreate<string>('testString', 'test');
      AppStorage.setOrCreate<number>('testNumber', 123);
      AppStorage.setOrCreate<Number[]>('testArray', [-1, 0, 1]);
      console.info('beforeAll case');
      await driveFn();
      driver = Driver.create();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testNumber');
      AppStorage.delete('testArray');
    })
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0100
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0100
     * @tc.desc   PhotoAccessHelper_showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0100";
      let srcFileUris: Array<string> = ['123456'];
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
        setTimeout(async () => {
          console.info(TAG, testNum, 'setTimeout Success showAssetsCreationDialog');
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await power?.click();
        }, 8000);
        let result = await phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        console.info(TAG, testNum, 'error code is 14000011, device does not support');
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0200
     * @tc.number SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0200
     * @tc.desc   PhotoAccessHelper_showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_BACK_0200";
      let srcFileUris: Array<string> = ['123456'];
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
        setTimeout(async () => {
          console.info(TAG, testNum, 'setTimeout Success showAssetsCreationDialog');
          let power = await driver?.waitForComponent(ON.text('禁止', MatchPattern.EQUALS), 500);
          await power?.click();
        }, 8000);
        let result = await phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
        console.info(TAG, testNum, 'Success showAssetsCreationDialog', JSON.stringify(result));
        expect(result.length == 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testNum, 'Failed showAssetsCreationDialog', JSON.stringify(error), error.code);
        console.info(TAG, testNum, 'error code is 14000011, device does not support');
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })
  })
}