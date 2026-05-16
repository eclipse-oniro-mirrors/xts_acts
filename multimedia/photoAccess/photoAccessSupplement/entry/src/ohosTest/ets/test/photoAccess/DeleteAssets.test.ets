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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium'
import { driveFn, getPermission, sleep, } from '../common';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.DeleteAssertSuppTest';

export default function DeleteAssetsChangeRequestSuppTest() {
  describe('DeleteAssetsChangeRequestSuppTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      AppStorage.setOrCreate<number>('testNumber', 123);
      AppStorage.setOrCreate<number[]>('testArray', [-1, 0, 1])
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    afterAll(async () => {
      AppStorage.delete('testNumber');
      AppStorage.delete('testArray');
    });

    const deleteAssetsErrorTest =
      async (done: Function, testName: string, testContext: common.UIAbilityContext | null | undefined,
        fileUri: Array<string> | null | undefined,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, 'start');
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, fileUri);
          console.info(TAG, testName, ` succeed to deleteassets `)
          expect().assertFail();
          done();
        } catch (error) {
          console.error(TAG, testName, `failed  deleteassets`, JSON.stringify(error), error.code);
          callback(error.code);
          done();
        }
      }

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0100
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0100
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0100', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0100';
      await deleteAssetsErrorTest(done, testNum, testContext, null, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0200
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0200
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0200', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0200';
      await deleteAssetsErrorTest(done, testNum, testContext, [], (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0300
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0300
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0300', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0300';
      await deleteAssetsErrorTest(done, testNum, testContext, ['file://test.jpg'], (errCode) => {
        expect(errCode).assertEqual('14000002');
      });
    });


    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0400
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0400
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0400', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0400';
      await deleteAssetsErrorTest(done, testNum, testContext, undefined, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0500
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0500
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0500', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0500';
      await deleteAssetsErrorTest(done, testNum, testContext, AppStorage.get('testNumber'), (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0600
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0600
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0600', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0600';
      const uriList: Array<string> = new Array();
      await deleteAssetsErrorTest(done, testNum, null, uriList, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0700
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0700
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0700', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0700';
      const uriList: Array<string> = new Array();
      await deleteAssetsErrorTest(done, testNum, undefined, uriList, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0800
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0800
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0800', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0800';
      await deleteAssetsErrorTest(done, testNum, testContext, AppStorage.get('testArray'), (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0900
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0900
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0900', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_0900';
      const uriList: Array<string> = new Array();
      await deleteAssetsErrorTest(done, testNum, AppStorage.get('testArray'), uriList, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_1000
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_1000
     * @tc.desc   MediaAssetChangeRequest_deleteAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_1000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_DELETE_ASSETS_1000';
      const uriList: Array<string> = new Array();
      await deleteAssetsErrorTest(done, testNum, AppStorage.get('testNumber'), uriList, (errCode) => {
        expect(errCode).assertEqual('401');
      });
    });
  });
}