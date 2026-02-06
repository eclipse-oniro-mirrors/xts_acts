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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setOrientation';

async function setOrientationPromiseTest(done: Function, testName: string, orientation: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption(testName, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE));
    const count = await fetchResult.getCount();
    if (count == 0) {
      await createUserAlbum(testContext, 'setOrientation', 'testAlbum');
      fetchResult = await phAccessHelper.getAssets(fetchOption(testName, photoAccessHelper.PhotoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE));
    }
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    await asset.clone(genRandomStr(10));
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    await assetChangeRequest.setOrientation(orientation);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply setOrientation  successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function setOrientationAbnormalPromiseTest(done: Function, testName: string, orientation: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchAllOption());
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    await asset.clone(genRandomStr(10));
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    await assetChangeRequest.setOrientation(orientation);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply setOrientation  successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function MediaAssetChangeRequestSetOrientationTest() {
  describe('MediaAssetChangeRequestSetOrientationTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.name   MediaAssetChangeRequest_setOrientation_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_001
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setOrientation_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_promise_001';
      const orientation = 0;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_002
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setOrientation_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_promise_002';
      const orientation = 90;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_promise_003
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_003
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setOrientation_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_promise_003';
      const orientation = 180;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_promise_004
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_004
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_setOrientation_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_promise_004';
      const orientation = 270;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_Abnormal_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_005  //TODO error.code is undefined
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_setOrientation_Abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_Abnormal_promise_001';
      const orientation = 360;
      await setOrientationAbnormalPromiseTest(done, testName, orientation);
    })*/

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_Abnormal_promise_002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_006   //TODO error.code is undefined
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_setOrientation_Abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_Abnormal_promise_002';
      const orientation = -90;
      await setOrientationAbnormalPromiseTest(done, testName, orientation);
    })*/
  })
}