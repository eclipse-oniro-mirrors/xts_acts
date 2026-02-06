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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../common';
import common from '@ohos.app.ability.common';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';

const TAG = LOG_TAG + 'xts.RequestPhotoUrisReadPermissionSupp';
let fdNumber: number;


async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd;
  return fdNumber;
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function PhotoAccessHelperRequestPhotoUrisReadPermissionSupp() {
  describe('PhotoAccessHelperRequestPhotoUrisReadPermissionSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      AppStorage.setOrCreate('empty', '');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('empty');
    });

    /**
     * @tc.number    Photo_Assets_RequestPhotoUrisReadPermissionSupp_001
     * @tc.name      Photo_Assets_RequestPhotoUrisReadPermissionSupp_001
     * @tc.desc      Set value is undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Assets_RequestPhotoUrisReadPermissionSupp_001', Level.LEVEL0, async (done: Function,phAccessHelper: photoAccessHelper.PhotoAccessHelper,) => {
      const testName = 'Photo_Assets_RequestPhotoUrisReadPermissionSupp_001';
      let fileName: string = '1vp9_320x240_30.mp4';
      try {
        await getFd(fileName);
        console.info(TAG,testName,'getFd success, data is ',fdNumber);
        if(fdNumber!=undefined){
          let desFileUris: Array<string> = await phAccessHelper.requestPhotoUrisReadPermission(null);
          console.info(TAG,testName,'requestPhotoUrisReadPermission success, data is ' + desFileUris);
          expect().assertFail();
        }else {
          console.info(TAG,testName,'no such file' );
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG,testName,'requestPhotoUrisReadPermission failed, errCode is ' + err.code + ', errMsg is ' + err.message);
        expect( err.code).assertUndefined();
      }
      done();
    })
    /**
     * @tc.number    Photo_Assets_RequestPhotoUrisReadPermissionSupp_002
     * @tc.name      Photo_Assets_RequestPhotoUrisReadPermissionSupp_002
     * @tc.desc      Set value is undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Assets_RequestPhotoUrisReadPermissionSupp_002', Level.LEVEL0, async (done: Function,phAccessHelper: photoAccessHelper.PhotoAccessHelper,) => {
      const testName = 'Photo_Assets_RequestPhotoUrisReadPermissionSupp_002';
      let fileName: string = '1vp9_320x240_30.mp4';
      try {
        await getFd(fileName);
        console.info(TAG,testName,'getFd success, data is ',fdNumber);
        if(fdNumber!=undefined){
          let desFileUris: Array<string> = await phAccessHelper.requestPhotoUrisReadPermission(undefined);
          console.info(TAG,testName,'requestPhotoUrisReadPermission success, data is ' + desFileUris);
          expect().assertFail();
        }else {
          console.info(TAG,testName,'no such file' );
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG,testName,'requestPhotoUrisReadPermission failed, errCode is ' + err.code + ', errMsg is ' + err.message);
        expect( err.code).assertUndefined();
      }
      done();
    })
    /**
     * @tc.number    Photo_Assets_RequestPhotoUrisReadPermissionSupp_003
     * @tc.name      Photo_Assets_RequestPhotoUrisReadPermissionSupp_003
     * @tc.desc      Set value is undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Assets_RequestPhotoUrisReadPermissionSupp_003', Level.LEVEL0, async (done: Function,phAccessHelper: photoAccessHelper.PhotoAccessHelper,) => {
      const testName = 'Photo_Assets_RequestPhotoUrisReadPermissionSupp_003';
      let fileName: string = '1vp9_320x240_30.mp4';
      try {
        await getFd(fileName);
        console.info(TAG,testName,'getFd success, data is',fdNumber);
        if(fdNumber!=undefined) {
          let srcFileUris: Array<string> = AppStorage.get('key') as ESObject;
          let desFileUris: Array<string> = await phAccessHelper.requestPhotoUrisReadPermission(srcFileUris);
          console.info(TAG, testName, 'requestPhotoUrisReadPermission success, data is ' + desFileUris);
          expect().assertFail();
        }else {
          console.info(TAG,testName,'no such file' );
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG,testName,'requestPhotoUrisReadPermission failed, errCode is ' + err.code + ', errMsg is ' + err.message);
        expect( err.code).assertUndefined();
      }
      done();
    })
    })
}

