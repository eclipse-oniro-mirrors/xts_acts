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

import { FILE_CONTENT, prepareFile, nextFileName, describe, it, expect } from "../Common";
import fileIO from "@ohos.file.fs";

export default function fileIOUnlink() {
  describe("fileIO_fs_unlink", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0000
     * @tc.name   : fileIO_test_unlink_async_000
     * @tc.desc   : Test unlink() interfaces. Promise.
     * Delete the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_unlink_async_000", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_unlink_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.unlink(fpath);
        expect(!fileIO.accessSync(fpath)).assertTrue();
        done();
      } catch (e) {
        console.log("fileIO_test_unlink_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0100
     * @tc.name   : fileIO_test_unlink_async_001
     * @tc.desc   : Test unlink() interfaces. Promise.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_001", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIOTest");

      try {
        await fileIO.unlink(fpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_unlink_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0200
     * @tc.name   : fileIO_test_unlink_async_002
     * @tc.desc   : Test unlink() interfaces. Promise.
     * The path refers to a directory, not a file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_002", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_unlink_async_002");
      fileIO.mkdirSync(dpath);

      try {
        await fileIO.unlink(dpath);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.rmdirSync(dpath);
        console.log("fileIO_test_unlink_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900019 && e.message == "Is a directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0300
     * @tc.name   : fileIO_test_unlink_async_003
     * @tc.desc   : Test unlink() interfaces. Callback.
     * Delete the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_unlink_async_003", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_unlink_async_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.unlink(fpath, (err) => {
          if (err) {
            console.log("fileIO_test_unlink_async_003 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(!fileIO.accessSync(fpath)).assertTrue();
          done();
        });
      } catch (e) {
        console.log("fileIO_test_unlink_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0400
     * @tc.name   : fileIO_test_unlink_async_004
     * @tc.desc   : Test unlink() interfaces. Callback.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_004", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIOTest");

      try {
        fileIO.unlink(fpath, (err) => {
          if (err) {
            console.log("fileIO_test_unlink_async_004 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_unlink_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0500
     * @tc.name   : fileIO_test_unlink_async_005
     * @tc.desc   : Test unlink() interfaces. Callback.
     * The path refers to a directory, not a file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_005", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_unlink_async_005");
      fileIO.mkdirSync(dpath);

      try {
        fileIO.unlink(dpath, (err) => {
          if (err) {
            fileIO.rmdirSync(dpath);
            console.log("fileIO_test_unlink_async_005 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_unlink_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0600
     * @tc.name   : fileIO_test_unlink_async_006
     * @tc.desc   : Test unlink() interfaces. Promise.
     * Delete twice.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_006", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_unlink_async_006");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.unlink(fpath);
        await fileIO.unlink(fpath);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log("fileIO_test_unlink_async_006 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_ASYNC_0700
     * @tc.name   : fileIO_test_unlink_async_007
     * @tc.desc   : Test unlink() interfaces. Callback.
     * Delete twice.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_async_007", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_unlink_async_007");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.unlink(fpath, async (err) => {
          if (err) {
            console.log("fileIO_test_unlink_async_007 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          fileIO.unlink(fpath, async (err) => {
            if (err) {
              console.log("fileIO_test_unlink_async_007 error package: " + err.message + ", code: " + err.code);
              expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
              done();
            }
          });
        });
      } catch (e) {
        console.log("fileIO_test_unlink_async_007 has failed for " + e.message + ", code: " + e.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_SYNC_0000
     * @tc.name   : fileIO_test_unlink_sync_000
     * @tc.desc   : Test unlinkSync() interfaces.
     * Delete the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_unlink_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_unlink_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.unlinkSync(fpath);
        expect(!fileIO.accessSync(fpath)).assertTrue();
      } catch (e) {
        console.log("fileIO_test_unlink_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_SYNC_0100
     * @tc.name   : fileIO_test_unlink_sync_001
     * @tc.desc   : Test unlinkSync() interfaces.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_sync_001", 3, async () => {
      let fpath: string = await nextFileName("fileIOTest");

      try {
        fileIO.unlinkSync(fpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_unlink_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_SYNC_0200
     * @tc.name   : fileIO_test_unlink_sync_002
     * @tc.desc   : Test unlinkSync() interfaces.
     * The path refers to a directory, not a file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_sync_002", 3, async () => {
      let dpath: string = await nextFileName("fileIO_test_unlink_sync_002");
      fileIO.mkdirSync(dpath);

      try {
        fileIO.unlinkSync(dpath);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.rmdirSync(dpath);
        console.log("fileIO_test_unlink_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900019 && e.message == "Is a directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_UNLINK_SYNC_0300
     * @tc.name   : fileIO_test_unlink_sync_003
     * @tc.desc   : Test unlinkSync() interfaces.
     * Delete twice.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_unlink_sync_003", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_unlink_sync_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(fpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_unlink_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });
  });
}
