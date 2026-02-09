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
import { getPermission, driveFn, LOG_TAG, createUserAlbum, genRandomStr } from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setAlbumName';

async function setAlbumNamePromiseTest(done: Function, testName: string, newAlbumName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
    const count = await albumFetchResult.getCount();
    if (count == 0) {
      console.log(TAG, 'album length is 0')
      await createUserAlbum(testContext, 'setAlbumName', genRandomStr(10));
      console.log(TAG, 'createAlbum successfully')
      albumFetchResult =
        await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
    }
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();

    if (album) {
      let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
        new photoAccessHelper.MediaAlbumChangeRequest(album);
      await albumChangeRequest.setAlbumName(newAlbumName);
      await phAccessHelper.applyChanges(albumChangeRequest);
      console.info(TAG, 'setAlbumName successfully');
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

async function setAlbumNameAbnormalPromiseTest(done: Function, testName: string, newAlbumName: string) {
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
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function MediaAlbumChangeRequestSetAlbumNameTest() {
  describe('MediaAlbumChangeRequestSetAlbumNameTest', () => {

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
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_001
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_001
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_001';
      let newAlbumName: string = 'newAlbumName' + genRandomStr(10);
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_002
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_002
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_002';
      let newAlbumName: string = genRandomStr(1);
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_003
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_003
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_003';
      let newAlbumName: string = genRandomStr(255);
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_004
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_004
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_004';
      let newAlbumName: string = '我是汉字';
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_005
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_005
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_005';
      let newAlbumName: string = 'ABC';
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_006
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_006
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_006';
      let newAlbumName: string = '123456';
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_007
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_007
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_007';
      let newAlbumName: string = '+-';
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_promise_008
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_008
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_promise_008';
      let newAlbumName: string = '_abc Abc 123';
      await setAlbumNamePromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_001
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_009   //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_001';
      let newAlbumName: string = '';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_002
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_010  //TODO  可以设置多个空格
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_002';
      let newAlbumName: string = '   ';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    });*/

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_003
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_011  //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_003';
      let newAlbumName: string = genRandomStr(256);
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_004
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_012  //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_004';
      let newAlbumName: string = '1.1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_005
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_013  //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_005';
      let newAlbumName: string = '1\\ 1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_006
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_014  //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_006';
      let newAlbumName: string = '1/1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_007
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_015  //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_007';
      let newAlbumName: string = '1/1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_008
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_016 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_008';
      let newAlbumName: string = '1:1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_009
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_017 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_009';
      let newAlbumName: string = '1*1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_010
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_018 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_010';
      let newAlbumName: string = '1?1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_011
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_019 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_011';
      let newAlbumName: string = '1"1';
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_012
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_020 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_012';
      let newAlbumName: string = "1'1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_013
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_021 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_013';
      let newAlbumName: string = "1`1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_014
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_022 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_014';
      let newAlbumName: string = "1<1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_015
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_023 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_015';
      let newAlbumName: string = "1>1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_016
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_024 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_016';
      let newAlbumName: string = "1|1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_017
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_025 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_017';
      let newAlbumName: string = "1{}1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_018
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_026 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_018';
      let newAlbumName: string = "1{1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })

    /**
     * @tc.name   mediaAlbumChangeRequest_setAlbumName_abnormal_promise_019
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_027 //TODO 401
     * @tc.desc   setAlbumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_setAlbumName_abnormal_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_setAlbumName_abnormal_promise_019';
      let newAlbumName: string = "1[]1";
      await setAlbumNameAbnormalPromiseTest(done, testName, newAlbumName);
    })
  })
}