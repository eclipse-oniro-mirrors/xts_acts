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

import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import Context from "application.Context"
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { fetchOption, getFileAsset, getAssetId, getPermission, driveFn, sleep } from '../Common.test.ets'
import common from '@ohos.app.ability.common';

async function checkAssetAttr(done: () => void, testNum: string, displayName: string,
  mediaType: photoAccessHelper.PhotoType) {
  let testContext: Context = Hypium.get('context') as Context;
  try {
    let key = photoAccessHelper.PhotoKeys.DISPLAY_NAME;
    const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, key, displayName);
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
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
     * @tc.name   photoAsset_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_STATIC_0000
     * @tc.desc   check image uri displayName photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_static_000';
        const displayName = '01.jpg';
        const mediaType = photoAccessHelper.PhotoType.IMAGE;
        await checkAssetAttr(done, testNum, displayName, mediaType);
      });

    /**
     * @tc.name   photoAsset_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_STATIC_0100
     * @tc.desc   check video uri displayName photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_static_001';
        const displayName = '01.mp4';
        const mediaType = photoAccessHelper.PhotoType.VIDEO;
        await checkAssetAttr(done, testNum, displayName, mediaType);
      });
  })
}
