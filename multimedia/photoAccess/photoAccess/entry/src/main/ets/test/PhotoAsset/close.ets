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

import fileio from "@ohos.fileio";
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  getFileAsset,
} from '../../../../../../../common'

export default function closeTest () {
  describe('closeTest', function () {
    async function closeCallbackTest (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const fd = await asset.getReadOnlyFd();
        console.info(`${testNum} fd: ${fd}`);
        asset.close(fd, async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } else {
            let count = 0;
            let buf = new ArrayBuffer(4096);
            try {
              await fileio.read(fd, buf);
              console.info(`${testNum} read suc`);
            } catch (error) {
              console.info(`${testNum} read fail`);
              count++;
            }
            try {
              await fileio.write(fd, buf);
              console.info(`${testNum} write suc`);
            } catch (error) {
              count++;
              console.info(`${testNum} write fail`);
            }
            console.info(`${testNum} count: ${count}`);
            expect(count).assertEqual(2);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function closePromiseTest (done, testNum, fetchOps) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const fd = await asset.getReadOnlyFd();
        console.info(`${testNum} fd: ${fd}`);
        await asset.close(fd);
        let count = 0;
        let buf = new ArrayBuffer(4096);
        try {
          await fileio.read(fd, buf);
          console.info(`${testNum} read suc`);
        } catch (error) {
          count++;
          console.info(`${testNum} read fail`);
        }
        try {
          await fileio.write(fd, buf);
          console.info(`${testNum} write suc`);
        } catch (error) {
          count++;
          console.info(`${testNum} write fail`);
        }
        console.info(`${testNum} count: ${count}`);
        expect(count).assertEqual(2);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_CALLBACK_0000
     * @tc.name      : photoAsset_close_callback_000
     * @tc.desc      : image asset close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_close_callback_000', 0, async function (done) {
      const testNum = 'photoAsset_close_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await closeCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_CALLBACK_0100
     * @tc.name      : photoAsset_close_callback_001
     * @tc.desc      : video asset close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_close_callback_001', 0, async function (done) {
      const testNum = 'photoAsset_close_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closeCallbackTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_PROMISE_0000
     * @tc.name      : photoAsset_close_promise_000
     * @tc.desc      : image asset close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_close_promise_000', 0, async function (done) {
      const testNum = 'photoAsset_close_promise_000';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.jpg');
      await closePromiseTest(done, testNum, fetchOps);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CLOSE_PROMISE_0100
     * @tc.name      : photoAsset_close_promise_001
     * @tc.desc      : video asset close
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_close_promise_001', 0, async function (done) {
      const testNum = 'photoAsset_close_promise_001';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, '01.mp4');
      await closePromiseTest(done, testNum, fetchOps);
    });
  })
}
