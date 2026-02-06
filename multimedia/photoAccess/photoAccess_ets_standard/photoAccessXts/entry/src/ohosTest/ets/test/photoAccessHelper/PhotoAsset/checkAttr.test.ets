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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import {
  photoKeys,
  fetchOption,
  getFileAsset,
  getAssetId,
  photoType,
  getPermission,
  driveFn,
  LOG_TAG
} from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'checkAssetAttr';

async function checkAssetAttr(done: Function, testName: string, displayName: string, mediaType: ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let key: ESObject = photoKeys.DISPLAY_NAME;
    const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, key, displayName);
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
    console.info(TAG, `${testName} uri: ${asset.uri} filetype: ${asset.photoType} displayName: ${asset.displayName}`);
    const id: string = getAssetId(asset.uri);
    const expectUri = 'file://media/Photo/' + id;
    const isIncludes = asset.uri.includes(expectUri);
    expect(isIncludes).assertTrue();
    expect(asset.photoType).assertEqual(mediaType);
    expect(asset.displayName).assertEqual(displayName);
    done();
  } catch (error) {
    console.error(TAG, `${testName} failed; error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function checkAttrTest() {
  describe('checkAttrTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.number    : PHOTO_ASSET_CHECK_ATTR_001
     * @tc.name      : checkAttr_image_001
     * @tc.desc      : Check image uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('checkAttr_image_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'checkAttr_image_001';
      const displayName = '01.jpg';
      const mediaType: ESObject = photoType.IMAGE;
      await checkAssetAttr(done, testName, displayName, mediaType);
    })

    /**
     * @tc.number    : PHOTO_ASSET_CHECK_ATTR_002
     * @tc.name      : checkAttr_video_001
     * @tc.desc      : Check video uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('checkAttr_video_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'checkAttr_video_001';
      const displayName = '01.mp4';
      const mediaType: ESObject = photoType.VIDEO;
      await checkAssetAttr(done, testName, displayName, mediaType);
    })
  })
}