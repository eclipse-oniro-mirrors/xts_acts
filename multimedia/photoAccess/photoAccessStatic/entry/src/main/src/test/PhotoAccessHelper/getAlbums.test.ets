/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import Utils from '../Util.test';
import hilog from '@ohos.hilog'
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import { ValueType } from '@ohos.data.ValuesBucket';
import { fetchOption, checkUserAlbum, checkSystemAlbum, sleep, getPermission, driveFn, } from '../Common.test.ets'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getAlbumsTest() {
  describe("getAlbumsTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'getAlbumsTest start');

    let appContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   getAlbums_callback_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALBUMS_STATIC_0200
     * @tc.desc   get system albums by albumType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("getAlbums_callback_static_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'getAlbums_callback_static_002';
        try {
          let subTypes: Array<photoAccessHelper.AlbumSubtype> = new Array<photoAccessHelper.AlbumSubtype>();
          subTypes.push(photoAccessHelper.AlbumSubtype.VIDEO);
          subTypes.push(photoAccessHelper.AlbumSubtype.FAVORITE);
          let count = 0;
          for (let i = 0; i < subTypes.length; i++) {
            (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i], (err: BusinessError<void> | null,
              fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
              try {
                if (err?.code !== 0) {
                  hilog.error(domain, tag,
                    testNum + ' getAlbums failed' + ", err.code:" + err?.code + ", err.message:" + err?.message);
                  expect(false).assertTrue();
                } else {
                  const album =
                    await (fetchResult as photoAccessHelper.FetchResult<photoAccessHelper.Album>).getFirstObject();
                  fetchResult?.close();
                  checkSystemAlbum(testNum, album, subTypes[i]);
                  count++;
                }
              } catch (error) {
                hilog.info(domain, tag,
                  testNum + ' getAlbums Failed!' + ", error.name:" + error.name + ", error.message:" + error.message);
              }
              if (i + 1 === subTypes.length) {
                expect(count === subTypes.length);
                done();
              }
            });
            await Utils.msSleep(50)
          }
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' PhotoAccessHelperTest failed' + ", error.name:" + error.name + ", error.message:" +
            error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   getAlbums_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALBUMS_STATIC_0300
     * @tc.desc   get user albums by albumName error code 13900020 or 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('getAlbums_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void):
      Promise<void> => {
      const testNum = 'getAlbums_callback_static_003';
      try {
        let albumName = testNum;
        const fetchOps = fetchOption(testNum, photoAccessHelper.AlbumKeys.ALBUM_NAME, albumName);
        (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (err: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined): void => {
            expect(false).assertTrue();
          });
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} failed, error code: ${error.code}`);
        expect(error.code === 13900020 || error.code === 401).assertTrue();
        done();
      }
    });
  })
  hilog.info(domain, tag, 'getAlbumsTest end');
}