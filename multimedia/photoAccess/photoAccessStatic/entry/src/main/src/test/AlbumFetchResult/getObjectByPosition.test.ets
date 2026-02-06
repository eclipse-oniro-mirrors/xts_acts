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

import { describe, it, expect, TestType, Size, Level, Hypium } from "../../../../hypium/index";
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import Context from "application.Context"
import hilog from '@ohos.hilog'
import { fetchOption, genRadomStr } from '../Common.test.ets'
import Utils from "../Util.test"
import { BusinessError } from '@ohos.base';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function albumGetPositionObjectTest() {
  describe("albumGetPositionObjectTest", (): void => {
    const appContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(appContext);

    /**
     * @tc.name   album_getObjectByPosition_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_OBJECT_BY_POSITION_STATIC_0000
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("album_getObjectByPosition_callback_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getObjectByPosition_callback_static_000';
        try {
          let subTypes: Array<photoAccessHelper.AlbumSubtype> = new Array<photoAccessHelper.AlbumSubtype>();
          subTypes.push(photoAccessHelper.AlbumSubtype.VIDEO);
          subTypes.push(photoAccessHelper.AlbumSubtype.FAVORITE);
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            fetchResult.getObjectByPosition(0, (err: BusinessError | null, asset) => {
              try {
                if (err?.code !== 0) {
                  hilog.info(domain, tag, `${testNum} getObjectByPosition failed; err: ${err?.message}`);
                  expect(false).assertTrue();
                } else {
                  expect(asset !== undefined).assertTrue();
                  passCount++;
                }
              } catch (error) {
                hilog.info(domain, tag, `${testNum} getObjectByPosition failed; error: ${error}`);
              }
              if (i + 1 === subTypes.length) {
                expect(passCount).assertEqual(subTypes.length);
                fetchResult.close();
                done();
              }
            })
            await Utils.msSleep(50);
          }
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   album_getObjectByPosition_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_OBJECT_BY_POSITION_STATIC_0000
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("album_getObjectByPosition_promise_static_000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getObjectByPosition_promise_static_000';
        try {
          let subTypes: Array<photoAccessHelper.AlbumSubtype> = new Array<photoAccessHelper.AlbumSubtype>();
          subTypes.push(photoAccessHelper.AlbumSubtype.VIDEO);
          subTypes.push(photoAccessHelper.AlbumSubtype.FAVORITE);
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            const asset = await fetchResult.getObjectByPosition(0);
            expect(asset !== undefined).assertTrue();
            passCount++;
            if (i + 1 === subTypes.length) {
              expect(passCount).assertEqual(subTypes.length);
              fetchResult.close();
              done();
            }
          }
        } catch (error) {
          hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });
  })
}