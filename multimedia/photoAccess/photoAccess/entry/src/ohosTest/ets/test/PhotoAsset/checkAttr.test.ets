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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { photoKeys, fetchOption, getFileAsset, getAssetId, photoType, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common';

async function checkAssetAttr(done: Function, testNum: string, displayName: string, mediaType: ESObject) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let key: ESObject = photoKeys.DISPLAY_NAME;
    const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, key, displayName);
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testNum, fetchOps);
    console.info(`${testNum} uri: ${asset.uri} filetype: ${asset.photoType} displayName: ${asset.displayName}`)
    const id: string = getAssetId(asset.uri);
    const expectUri = 'file://media/Photo/' + id;
    const isIncludes = asset.uri.includes(expectUri);
    expect(isIncludes).assertTrue();
    expect(asset.photoType).assertEqual(mediaType);
    expect(asset.displayName).assertEqual(displayName);
    done();
  } catch (error) {
    console.info(`${testNum} failed; error: ${error}`);
    done();
    expect(false).assertTrue();
  }
}

export default function checkAttrTest() {
  describe('checkAttrTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_0000
     * @tc.name      : photoAsset_000
     * @tc.desc      : check image uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'photoAsset_000';
      const displayName = '01.jpg';
      const mediaType: ESObject = photoType.IMAGE;
      await checkAssetAttr(done, testNum, displayName, mediaType);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_0100
     * @tc.name      : photoAsset_001
     * @tc.desc      : check video uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'photoAsset_001';
      const displayName = '01.mp4';
      const mediaType: ESObject = photoType.VIDEO;
      await checkAssetAttr(done, testNum, displayName, mediaType);
    });
  })
}
