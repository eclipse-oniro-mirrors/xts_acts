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
import { getPermission, driveFn, createUserAlbum, genRandomStr } from '../../test/common';
import common from '@ohos.app.ability.common';
const TAG = "photoAccessHelperSetAlbumName";


export default function MediaAlbumChangeRequestSetAlbumName() {
  describe('MediaAlbumChangeRequestSetAlbumName', () => {

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
     * @tc.number  SUB_PHOTOACCESS_HELPER_Request_Set_Album_Name_001
     * @tc.name    SUB_PHOTOACCESS_HELPER_Request_Set_Album_Name_001
     * @tc.desc    Test the function where the first parameter is an empty string ("")
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_PHOTOACCESS_HELPER_Request_Set_Album_Name_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTOACCESS_HELPER_Request_Set_Album_Name_001';
      let newAlbumName: string = '';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        const count = await albumFetchResult.getCount();
        if (count == 0) {
          await createUserAlbum(testContext, 'setAlbumName', genRandomStr(10));
          albumFetchResult =
            await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        }
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        await albumChangeRequest.setAlbumName(newAlbumName);
        await phAccessHelper.applyChanges(albumChangeRequest);
        console.info('setAlbumName successfully');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error:`,);
        expect(error.code).assertEqual('401');
        console.info(TAG,testName,'done begin call');
        done();
      }

    })

  })

}