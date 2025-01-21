/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from 'deccjsunit/index'
import {
  sleep,
  fetchOption,
  photoKeys,
  getFileAsset,
  photoFetchOption,
} from '../../../../../../../common'

export default function unRegisterChangeTest () {
  describe('unRegisterChangeTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
    const DEFAULT_ALBUM_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI;

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_0100
     * @tc.name      : unRegisterChange_001
     * @tc.desc      : unRegister listening motify file title
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_001', 0, async function (done) {
      const testNum = 'unRegisterChange_001';
      try {
        const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'off01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await sleep(550);
        helper.registerChange(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(asset.uri);
        await sleep(550);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_0700
     * @tc.name      : unRegisterChange_007
     * @tc.desc      : unRegister listening create album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_007', 0, async function (done) {
      const testNum = 'unRegisterChange_007';
      try {
        let count = 0;
        helper.registerChange(DEFAULT_ALBUM_URI, true, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(DEFAULT_ALBUM_URI);
        await sleep(550);
        let albumName = testNum + Date.now();
        await helper.createAlbum(albumName);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_0800
     * @tc.name      : unRegisterChange_008
     * @tc.desc      : unRegister listening create album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_008', 0, async function (done) {
      const testNum = 'unRegisterChange_008';
      try {
        let albumUri = '';
        let count = 0;
        let albumName = testNum + Date.now();
        let album = await helper.createAlbum(albumName);
        albumUri = album.albumUri;
        await sleep(550);
        helper.registerChange(albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(albumUri);
        await sleep(550);
        album.albumName = Date.now() + album.albumName;
        await album.commitModify();
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_1000
     * @tc.name      : unRegisterChange_010
     * @tc.desc      : unRegister listening change album overUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_010', 0, async function example(done) {
      const testNum = 'unRegisterChange_010';
      try {
        let albumUri = '';
        let count = 0;
        let albumName = testNum + Date.now();
        let album = await helper.createAlbum(albumName);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off10.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        albumUri = album.albumUri;
        await album.addAssets([asset]);
        await sleep(550);
        helper.registerChange(albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(albumUri);
        await sleep(550);
        album.albumName = testNum + album.albumName;
        await album.commitModify();
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_1100
     * @tc.name      : unRegisterChange_011
     * @tc.desc      : unRegister listening album addAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_011', 0, async function (done) {
      const testNum = 'unRegisterChange_011';
      try {
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off11.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await sleep(550);
        helper.registerChange(album.albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(album.albumUri);
        await sleep(550);
        await album.addAssets([asset]);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_1200
     * @tc.name      : unRegisterChange_012
     * @tc.desc      : unRegister listening album removeAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('unRegisterChange_012', 0, async function (done) {
      const testNum = 'unRegisterChange_012';
      try {
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'off12.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await album.addAssets([asset]);
        await sleep(550);
        helper.registerChange(album.albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(album.albumUri);
        await sleep(550);
        await album.removeAssets([asset]);
        await sleep(1000);
        expect(count).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_1500
     * @tc.name      : unRegisterChange_015
     * @tc.desc      : unRegister remove all listening
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('unRegisterChange_015', 3, async function (done) {
      const testNum = 'unRegisterChange_015';
      try {
        let fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'off15.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let listenCount = 0;
        await sleep(550);
        helper.registerChange(asset.uri, false, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData1: ${JSON.stringify(changeData)}`);
        });
        helper.registerChange(asset.uri, false, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData2: ${JSON.stringify(changeData)}`);
        });
        await sleep(550);
        helper.unRegisterChange(asset.uri);
        await sleep(550);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        await sleep(1000);
        expect(listenCount).assertEqual(0);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_UNREGISTERCHANGE_CALLBACK_0000
     * @tc.name      : unRegisterChange_callback_000
     * @tc.desc      : unRegister remove specified callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('unRegisterChange_callback_000', 3, async function (done) {
      const testNum = 'unRegisterChange_callback_000';
      try {
        let fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'offCb01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let listenCount1 = 0;
        let listenCount2 = 0;
        await sleep(550);
        const callback1 = async (changeData) => {
          listenCount1++;
          console.info(`${testNum} callback1: ${JSON.stringify(changeData)}`);
        };
        const callback2 = async (changeData) => {
          listenCount2++;
          console.info(`${testNum} callback2: ${JSON.stringify(changeData)}`);
          helper.unRegisterChange(asset.uri, callback2);
        };
        helper.registerChange(asset.uri, false, callback1);
        helper.registerChange(asset.uri, false, callback2);

        await sleep(550);
        helper.unRegisterChange(asset.uri, callback1);
        await sleep(550);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        await sleep(1000);
        expect(listenCount1).assertEqual(0);
        expect(listenCount2).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
