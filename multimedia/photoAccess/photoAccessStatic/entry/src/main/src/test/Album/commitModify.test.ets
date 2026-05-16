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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { genRadomStr, fetchOption, sleep, driveFn, getPermission } from '../Common.test.ets'
import { BusinessError } from '@ohos.base';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function albumCommitModifyTest() {
  describe('albumCommitModifyTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   album_commitModify_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_STATIC__0000
     * @tc.desc   album change new name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        const testNum = 'album_commitModify_callback_static_000';
        try {
          let fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          let album = await fetchResult.getFirstObject();
          fetchResult.close();
          const newName = Date.now() + album.albumName;
          album.albumName = newName;
          album.commitModify((err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${testNum} success; err.message: ${err?.message}`);
            } else {
              hilog.info(domain, tag, `${testNum} failed`);
              expect(false).assertTrue();
            }
            done();
          })
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   album_commitModify_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_STATIC_0100
     * @tc.desc   album commitModify with no change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void):
        Promise<void> => {
        const testNum = 'album_commitModify_callback_static_001';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          album.commitModify((err: BusinessError | null) => {
            if (err?.code !== 0) {
              hilog.info(domain, tag, `${testNum} success; err.message: ${err?.message}`);
            } else {
              hilog.info(domain, tag, `${testNum} failed`);
              expect(false).assertTrue();
            }
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   album_commitModify_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_STATIC_0000
     * @tc.desc   album change new name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void):
        Promise<void> => {
        const testNum = 'album_commitModify_promise_static_000';
        try {
          let fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          const newName = Date.now() + album.albumName;
          album.albumName = newName;
          await album.commitModify();
          const fetchOps = fetchOption(testNum, photoAccessHelper.AlbumKeys.ALBUM_NAME, newName);
          fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO,
              fetchOps);
          hilog.info(domain, tag, `${testNum} fetchResult: ${fetchResult.getCount()}`);
          const curAlbum = await fetchResult.getFirstObject();
          expect(curAlbum.albumName).assertEqual(newName);
          fetchResult.close();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${testNum} success; error: ${error}`);
          done();
        }
      })

    /**
     * @tc.name   album_commitModify_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_STATIC_0100
     * @tc.desc   album commitModify with no change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void):
        Promise<void> => {
        const testNum = 'album_commitModify_promise_static_001';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          await album.commitModify();
          expect(false).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${testNum} success; error: ${error}`);
          done();
        }
      })

    /**
     * @tc.name   album_commitModify_promise_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_STATIC_0200
     * @tc.desc   album commitModify with invalid long albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void):
        Promise<void> => {
        const testNum = 'album_commitModify_promise_static_002';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          const invalidName = genRadomStr(256);
          album.albumName = invalidName;
          await album.commitModify();
          expect(false).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${testNum} success; error: ${error}`);
          done();
        }
      })
  })
}