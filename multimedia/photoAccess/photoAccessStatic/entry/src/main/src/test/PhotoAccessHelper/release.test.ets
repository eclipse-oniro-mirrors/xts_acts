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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Context from "application.Context"
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import { getPermission, driveFn, sleep } from '../Common.test.ets';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function releaseTest() {

  describe("releaseTest", (): void => {
    hilog.info(domain, tag, 'releaseTest start');
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   release_callback_static_000 
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_RELEASE_STATIC_0000
     * @tc.desc   release photoAccessHelper instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("release_callback_static_000 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'release_callback_static_000';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
          (helper as photoAccessHelper.PhotoAccessHelper).release((err: BusinessError<void> | null) => {
            if (err?.code !== 0) {
              expect(false).assertTrue();
            }
            done();
          });
        } catch (error: Error) {
          hilog.info(domain, tag,
            testNum + ' release failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue()
          done();
        }
      })

    /**
     * @tc.name   release_promise_static_000 
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_RELEASE_STATIC_0000
     * @tc.desc   release photoAccessHelper instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("release_promise_static_000 ", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'release_promise_static_000';
        try {
          let appContext: Context = Hypium.get("context") as Context;
          let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
          await (helper as photoAccessHelper.PhotoAccessHelper).release()
          done();
        } catch (error: Error) {
          hilog.info(domain, tag,
            testNum + ' release failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue()
          done();
        }
      })
  })
  hilog.info(domain, tag, 'getAlbumsTest end');
}