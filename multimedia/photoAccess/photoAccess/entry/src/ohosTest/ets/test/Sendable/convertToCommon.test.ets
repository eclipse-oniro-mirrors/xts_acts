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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import {
  sleep,
  photoKeys,
  genRadomStr,
  getPermission,
  albumFetchOption,
  pushCreateAsset,
  driveFn,
} from '../common'
import common from '@ohos.app.ability.common';

export default function convertToCommonTest () {
  describe('convertToCommonTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper:ESObject = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const fileName = 'convertToPhotoAssetTest.jpg';

    beforeAll(async () => {
      await getPermission();
      await driveFn();
      await sleep(1000);
      const fileNameList = [fileName];
      await pushCreateAsset(testContext, fileNameList);
    })

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Covert_001
     * @tc.name      : covert_photo_promise_000
     * @tc.desc      : covert photo
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('covert_photo_promise_000', 0, async (done: Function) => {
      const testNum = 'covert_photo_promise_000';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoKeys.DISPLAY_NAME, fileName);
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        let sendablePhotoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let photoAsset: photoAccessHelper.PhotoAsset = sendablePhotoAsset.convertToPhotoAsset();
        if (photoAsset === undefined) {
          expect(false).assertTrue()
          done();
        }
        console.log(`get no sendable uri success : ${photoAsset.uri}`);
        done();
      } catch(error) {
        console.error(`${testNum} :: convertToPhotoAsset failed, err is ${error}`);
        expect(false).assertTrue()
        done();
      }
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Covert_Album_001
     * @tc.name      : covert_photo_album_promise_000
     * @tc.desc      : covert photoAlbum
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('covert_photo_album_promise_000', 0, async (done: Function) => {
      const testNum = 'covert_photo_album_promise_000';
      try {
        let albumName: string = genRadomStr(20) + testNum;
        console.log(`${testNum} :: create album , name is ${albumName}`);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = photoAccessHelper.MediaAlbumChangeRequest.createAlbumRequest(testContext, albumName);
        await helper.applyChanges(albumChangeRequest);
        let ops: photoAccessHelper.FetchOptions = albumFetchOption(testNum, 'album_name', albumName);
        let fetchResult:ESObject = await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, ops);
        let sendableAlbum: sendablePhotoAccessHelper.Album = await fetchResult.getFirstObject();
        console.log(`${testNum} ::sendableAlbum get success`);
        let commonAlbum: photoAccessHelper.Album = sendableAlbum.convertToPhotoAlbum();
        if (commonAlbum === undefined) {
          expect(false).assertTrue();
          done();
        }
        expect(commonAlbum.imageCount !== undefined && commonAlbum.imageCount >= 0).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} :: convertToSendableAlbum failed, err is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

  });
}