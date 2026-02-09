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
import { fetchOption, sleep, genRadomStr } from '../Common.test.ets'
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function albumGetAllObjectTest() {
  describe('albumGetAllObjectTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.name   album_getAllObjects_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_ALL_OBJECTS_STATIC_0000
     * @tc.desc   get all system album object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getAllObjects_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getAllObjects_callback_static_000';
        try {
          let subTypes: Array<photoAccessHelper.AlbumSubtype> = new Array<photoAccessHelper.AlbumSubtype>();
          subTypes.push(photoAccessHelper.AlbumSubtype.VIDEO);
          subTypes.push(photoAccessHelper.AlbumSubtype.FAVORITE);
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            fetchResult.getAllObjects((err: BusinessError | null,
              allObj: Array<photoAccessHelper.Album> | undefined) => {
              try {
                if (err?.code !== 0) {
                  console.info(`${testNum} getAllObjects failed; err: ${err}`);
                  expect(false).assertTrue();
                } else {
                  expect(allObj?.length).assertEqual(1);
                  passCount++;
                }
              } catch (error) {
                console.info(`${testNum} getAllObjects failed; error: ${error}`);
              }
              if (i + 1 === subTypes.length) {
                expect(passCount).assertEqual(subTypes.length);
                fetchResult.close();
                done();
              }
            })
            await sleep(50);
          }
        } catch (error) {
          console.info(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   album_getAllObjects_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_ALL_OBJECTS_STATIC_0300
     * @tc.desc   get all system album object,albumSubtype=photoAccessHelper.AlbumSubtype.IMAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getAllObjects_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getAllObjects_callback_static_003';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.IMAGE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[0]);
          expect(fetchResult.getCount()).assertEqual(1);
          fetchResult.getAllObjects((err: BusinessError | null, allObj: Array<photoAccessHelper.Album> | undefined) => {
            try {
              if (err?.code !== 0) {
                console.info(`${testNum} getAllObjects failed; err: ${err}`);
                expect(false).assertTrue();
              } else {
                expect(allObj?.length).assertEqual(1);
                passCount++;
              }
              done();
            } catch (error) {
              console.info(`${testNum} getAllObjects failed; error: ${error}`);
              expect(false).assertTrue();
              done();
            }
          })
        } catch (error) {
          console.info(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   album_getAllObjects_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_ALL_OBJECTS_STATIC_0000
     * @tc.desc   get all system album object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getAllObjects_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getAllObjects_promise_static_000';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.VIDEO,
            photoAccessHelper.AlbumSubtype.FAVORITE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            const allObj = await fetchResult.getAllObjects();
            expect(allObj.length).assertEqual(1);
            passCount++;
            if (i + 1 === subTypes.length) {
              expect(passCount).assertEqual(subTypes.length);
              fetchResult.close();
              done();
            }
          }
        } catch (error) {
          console.info(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });
  })
}