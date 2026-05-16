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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  getPermission,
  driveFn,
  LOG_TAG,
  getSendableFileAsset
} from '../common';
import common from '@ohos.app.ability.common';
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'sendableGetThumbnailTestSupp';


export default function sendableGetThumbnailTest() {
  describe('sendableGetThumbnailTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;



    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('emptyString', '');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString');
    });

    /**
     * @tc.name   SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_01
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_01
     * @tc.desc   第一个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_01', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_01';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const size: ESObject = null;
      try {
        console.info(TAG, `${testName} start.`);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, ops);
        let thumb = await asset.getThumbnail(size);
        console.info(TAG,testName,'getThumbnail',thumb);
        expect(thumb).not().assertUndefined();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_02
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_02
     * @tc.desc   第一个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_02', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_02';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const size: ESObject = undefined;
      try {
        console.info(TAG, `${testName} start.`);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, ops);
        let thumb = await asset.getThumbnail(size);
        console.info(TAG,testName,'getThumbnail',thumb);
        expect(thumb).not().assertUndefined();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_03
     * @tc.number SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_03
     * @tc.desc   第一个参数为空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_03', Level.LEVEL2, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ASSET_GET_THUMBNAIL_03';
      const predicates = new dataSharePredicates.DataSharePredicates();
      const ops : photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const size: ESObject = AppStorage.get('emptyString');
      try {
        console.info(TAG, `${testName} start.`);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, ops);
        let thumb = await asset.getThumbnail(size);
        console.info(TAG,testName,'getThumbnail',thumb);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, `${testName} failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual('13900020')
        done();
      }
    })
  })
}



