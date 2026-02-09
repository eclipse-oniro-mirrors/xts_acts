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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { driveFn, getPermission, sleep } from '../common';
import common from '@ohos.app.ability.common';
const TAG = 'PhotoGetPhotoAccessHelper';

export default function PhotoAccessHelperGetPhotoAccessHelper() {
  describe('PhotoAccessHelperGetPhotoAccessHelper', () => {
    beforeAll(async () => {
      console.info('beforeAll case')
      AppStorage.setOrCreate('emptyString','');
      await getPermission();
      await driveFn();
      await sleep(1000);
    })

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('emptyString');
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_001
     * @tc.desc   Obtains a photoAccess instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(AppStorage.get('emptyString') as Context);
        console.info(TAG, testName, `getPhotoAccessHelperSuccess`, helper);
        expect(helper).not().assertUndefined();
        done();
      } catch (error) {
        console.info(TAG,testName,`getPhotoAccessHelper_001 failed, error: `, error);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_002
     * @tc.desc   Obtains a photoAccess instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_002';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(undefined);
        console.info(TAG,testName,`getPhotoAccessHelperSuccess`, helper);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG,testName,`getPhotoAccessHelper_002 failed, error: `, error);
        expect(error.code).assertUndefined();
        done();
      }
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_003
     * @tc.desc   SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_003';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let helper = photoAccessHelper.getPhotoAccessHelper(null);
        console.info(TAG,testName,`getPhotoAccessHelperSuccess`, helper);
        expect(helper).not().assertUndefined();
        done();
      } catch (error) {
        console.info(TAG,testName,`getPhotoAccessHelper_003 failed, error: `, error);
        expect().assertFail();
        done();
      }
    })
  })
}