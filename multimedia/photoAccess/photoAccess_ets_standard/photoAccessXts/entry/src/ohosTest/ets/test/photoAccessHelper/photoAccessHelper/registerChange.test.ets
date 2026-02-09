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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import {
  albumSubtype,
  albumType,
  driveFn,
  getFileAsset,
  getPermission,
  LOG_TAG,
  notifyType,
  photoFetchOption,
  photoKeys,
  sleep
} from '../../common';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { common } from '@kit.AbilityKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'registerChangeTest';
let title: string = '';
let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
let album: photoAccessHelper.Album;
let assetFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
let asset: photoAccessHelper.PhotoAsset;
let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest;
let newAsset: photoAccessHelper.PhotoAsset;

async function registerChangeUpdate(done: Function, testName: string, context: common.UIAbilityContext,
  asset: photoAccessHelper.PhotoAsset, forChildUris: boolean, notifyType: photoAccessHelper.NotifyType) {
  console.info(TAG, testName + ' begin.');
  const helper = photoAccessHelper.getPhotoAccessHelper(context);
  let count = 0;
  try {
    console.info(TAG, testName + ' uri: ' + JSON.stringify(asset.uri));
    helper.registerChange(asset.uri, forChildUris, (changeData) => {
      count++;
      console.info(TAG, testName + ' changeData: ' + JSON.stringify(changeData));
      helper.unRegisterChange(asset.uri);
      expect(changeData.type).assertEqual(notifyType);
      expect(changeData.uris[0]).assertEqual(asset.uri);
    });
    title = asset.get(photoKeys.TITLE).toString();
    let newTitle = testName + asset.get(photoKeys.TITLE);
    console.info(TAG, testName + ' newTitle: ' + newTitle);
    await modifyTitle(asset, newTitle);
    await sleep(500);
    expect(count).assertEqual(1);
    done();
  } catch (err) {
    console.error(TAG, testName + ' registerChangeUpdate failed. code: ' + err.code + ', msg: ' + err.message);
    expect().assertFail();
    done();
  }
}

async function registerChangeAdd(done: Function, testName: string, context: common.UIAbilityContext,
  type: photoAccessHelper.AlbumType, subType: photoAccessHelper.AlbumSubtype, options: photoAccessHelper.FetchOptions,
  forChildUris: boolean, notifyType: photoAccessHelper.NotifyType) {
  console.info(TAG, testName + ' begin.');
  const helper = photoAccessHelper.getPhotoAccessHelper(context);
  let count = 0;
  try {
    await init(helper, type, subType, options);
    console.info(TAG, 'name: ' + album.albumName + ', uri: ' + album.albumUri);
    helper.registerChange(album.albumUri, forChildUris, (changeData) => {
      count++;
      console.info(TAG, testName + ' changeData: ' + JSON.stringify(changeData));
      helper.unRegisterChange(album.albumUri);
      console.info(TAG, testName + ' type: ' + JSON.stringify(changeData.type));
      expect(changeData.type).assertEqual(notifyType);
      console.info(TAG, testName + ' uris: ' + JSON.stringify(changeData.uris));
      // expect(changeData.uris[0]).assertEqual(album.albumUri);
      // expect(newAsset.uri).assertContain(changeData.extraUris[0]);
    });
    console.info(TAG, 'registerChange passed.');
    title = asset.get(photoKeys.TITLE).toString();
    console.info(TAG, 'asset passed.');
    let newTitle = asset.get(photoKeys.TITLE) + '_clone';
    console.info(TAG, testName + ' newTitle: ' + title);
    await asset.clone(newTitle).then((newAsset) => {
      console.info(TAG, testName + ' newAsset: ' + JSON.stringify(newAsset));
      console.info(TAG, testName + ' uri: ' + asset.uri + ', newUri: ' + newAsset.uri);
      console.info(TAG, testName + ' name: ' + asset.displayName + ', newName: ' + newAsset.displayName);
      newAsset = newAsset;
    });
    await sleep(500);
    console.info(TAG, testName + ' count: ' + count);
    expect(count).assertEqual(1);
    done();
  } catch (err) {
    console.error(TAG, testName + ' registerChangeUpdate failed. code: ' + err.code + ', msg: ' + err.message);
    expect(err.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    done();
  }
}

async function registerChangeRemove(done: Function, testName: string, context: common.UIAbilityContext,
  asset: photoAccessHelper.PhotoAsset, forChildUris: boolean, notifyType: photoAccessHelper.NotifyType) {
  console.info(TAG, testName + ' begin.');
  const helper = photoAccessHelper.getPhotoAccessHelper(context);
  let count = 0;
  try {
    console.info(TAG, testName + ' uri: ' + JSON.stringify(asset.uri));
    console.info(TAG, testName + ' name: ' + JSON.stringify(asset.displayName));
    helper.registerChange(asset.uri, forChildUris, async (changeData) => {
      count++;
      console.info(TAG, testName + ' changeData: ' + JSON.stringify(changeData));
      helper.unRegisterChange(asset.uri);
      await sleep(500);
      console.info(TAG, testName + ' type: ' + JSON.stringify(changeData.type));
      expect(changeData.type).assertEqual(notifyType);
      console.info(TAG, testName + ' uris: ' + JSON.stringify(changeData.uris));
      expect(changeData.uris[0]).assertEqual(asset.uri);
    });
    await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, [asset.uri]);
    await asset.commitModify();
    await sleep(500);
    console.info(TAG, testName + ' count: ' + count);
    expect(count).assertEqual(1);
    done();
  } catch (err) {
    console.error(TAG,
      testName + ' registerChangeUpdate failed. code: ' + err.code + ', msg: ' + err.message + ',err: ' + err);
    if (err.code) {
      expect(err.code == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    } else {
      expect(err == ErrorCode.SYSTEM_INNER_ERROR_CODE).assertTrue();
    }
    done();
  }
}

async function init(helper: photoAccessHelper.PhotoAccessHelper, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, options: photoAccessHelper.FetchOptions) {
  albumFetchResult = await helper.getAlbums(type, subType);
  console.info(TAG, 'count1: ' + albumFetchResult.getCount());
  album = await albumFetchResult.getFirstObject();
  console.info(TAG, 'count2: ' + album.count + ', name: ' + album.albumName + 'uri: ' + album.albumUri);
  assetFetchResult = await album.getAssets(options);
  console.info(TAG, 'count3: ' + assetFetchResult.getCount());
  asset = await assetFetchResult.getFirstObject();
  console.info(TAG, 'count4: name: ' + asset.displayName);
  albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
  console.info(TAG, 'count5: name: ' + JSON.stringify(albumChangeRequest));
}

async function modifyTitle(asset: photoAccessHelper.PhotoAsset, newTitle: string) {
  asset.set(photoKeys.TITLE, newTitle);
  await asset.commitModify();
  console.info(TAG, 'title: ' + JSON.stringify(asset.get(photoKeys.TITLE)));
}

export default function registerChangeTest() {
  describe('registerChangeTest', () => {
    const imageDisplayName = 'registerChange.jpg';
    const videoDisplayName = 'registerChange.mp4';
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
      title = '';
      await sleep(500);
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   registerChange_album_image_uri_001
     * @tc.number PHOTO_ACCESS_HELPER_REGISTER_CHANGE_005
     * @tc.desc   listen album uri, modify image title-type: NOTIFY_ALBUM_ADD_ASSET
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('registerChange_album_image_uri_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'registerChange_album_image_uri_001';
      let fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, imageDisplayName);
      const type: photoAccessHelper.AlbumType = albumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = albumSubtype.IMAGE;
      let forChildUris: boolean = true;
      await registerChangeAdd(done, testName, testContext, type, subType, fetchOps, forChildUris,
        notifyType.NOTIFY_ALBUM_ADD_ASSET);
      done();
    })
  })
}
