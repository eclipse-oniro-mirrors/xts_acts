/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { nextFileName, describe, it, expect } from "../Common";
import fileIO from "@ohos.file.fs";

export default function fileIOMkdtemp() {
  describe("fileIO_fs_mkdtemp", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0000
     * @tc.name   : fileIO_test_mkdtemp_async_000
     * @tc.desc   : Test mkdtemp() interfaces. Promise.
     * Create a temporary directory, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdtemp_async_000", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_000");
      try {
        dpath = dpath + "XXXXXX";
        let res: string = await fileIO.mkdtemp(dpath);
        expect(fileIO.accessSync(res)).assertTrue();
        fileIO.rmdirSync(res);
        done();
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0100
     * @tc.name   : fileIO_test_mkdtemp_async_001
     * @tc.desc   : Test mkdtemp() interfaces. Promise.
     * The directory do not end in XXXXXX.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_async_001", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_001");

      try {
        await fileIO.mkdtemp(dpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0200
     * @tc.name   : fileIO_test_mkdtemp_async_002
     * @tc.desc   : Test mkdtemp() interfaces. Callback.
     * Create a temporary directory, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdtemp_async_002", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_002");

      try {
        dpath = dpath + "XXXXXX";
        fileIO.mkdtemp(dpath, (err, res) => {
          if (err) {
            console.log("fileIO_test_mkdtemp_async_002 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(res)).assertTrue();
          fileIO.rmdirSync(res);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0300
     * @tc.name   : fileIO_test_mkdtemp_async_003
     * @tc.desc   : Test mkdtemp() interfaces. Callback.
     * The directory do not end in XXXXXX.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_async_003", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_003");

      try {
        fileIO.mkdtemp(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdtemp_async_003 error package: " + JSON.stringify(err));
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0400
     * @tc.name   : fileIO_test_mkdtemp_async_004
     * @tc.desc   : Test mkdtemp() interfaces. Promise.
     * The directory end in abcde*.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_async_004", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_004");

      try {
        dpath = dpath + "abcde*";
        await fileIO.mkdtemp(dpath);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_ASYNC_0500
     * @tc.name   : fileIO_test_mkdtemp_async_005
     * @tc.desc   : Test mkdtemp() interfaces. Callback.
     * The directory end in abcde*.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_async_005", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_async_005");

      try {
        dpath = dpath + "abcde*";
        fileIO.mkdtemp(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdtemp_async_005 error package: " + JSON.stringify(err));
            expect(err.code == 13900020 && err.message == "Invalid argument").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_mkdtemp_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_SYNC_0000
     * @tc.name   : fileIO_test_mkdtemp_sync_000
     * @tc.desc   : Test mkdtempSync() interfaces.
     * Create a temporary directory, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdtemp_sync_000", 2, async () => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_sync_000");

      try {
        dpath = dpath + "XXXXXX";
        let res: string = fileIO.mkdtempSync(dpath);
        expect(fileIO.accessSync(res)).assertTrue();
        fileIO.rmdirSync(res);
      } catch (e) {
        console.log("fileIO_test_mkdtemp_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_SYNC_0100
     * @tc.name   : fileIO_test_mkdtemp_sync_001
     * @tc.desc   : Test mkdtempSync() interfaces.
     * The directory do not end in XXXXXX.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_sync_001", 3, async () => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_sync_001");

      try {
        fileIO.mkdtempSync(dpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdtemp_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDTEMP_SYNC_0200
     * @tc.name   : fileIO_test_mkdtemp_sync_002
     * @tc.desc   : Test mkdtempSync() interfaces.
     * The directory end in abcde*.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_mkdtemp_sync_002", 3, async () => {
      let dpath: string = await nextFileName("fileIO_test_mkdtemp_sync_002");

      try {
        dpath = dpath + "abcde*";
        fileIO.mkdtempSync(dpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdtemp_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
  });
}
