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

import { FILE_CONTENT, nextFileName, prepareFile, describe, it, expect } from "../Common";
import fileIO from "@ohos.file.fs";

export default function fileIOFsync() {
  describe("fileIO_fs_fsync", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0000
     * @tc.name   : fileIO_test_fsync_async_000
     * @tc.desc   : Test fsync() interfaces. Promise.
     * Open the file in read-write mode, and synchronize the file data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_fsync_async_000", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_fsync_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        await fileIO.fsync(file.fd);
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_fsync_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0100
     * @tc.name   : fileIO_test_fsync_async_001
     * @tc.desc   : Test fsync() interfaces. Promise.
     * Invalid fd parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_async_001", 3, async (done: Function) => {
      try {
        await fileIO.fsync(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_fsync_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0200
     * @tc.name   : fileIO_test_fsync_async_002
     * @tc.desc   : Test fsync() interfaces. Callback.
     * Open the file in read-write mode, and synchronize the file data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_fsync_async_002", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_fsync_async_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.fsync(file.fd, (err) => {
          if (err) {
            console.log("fileIO_test_fsync_async_002 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log("fileIO_test_fsync_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0300
     * @tc.name   : fileIO_test_fsync_async_003
     * @tc.desc   : Test fsync() interfaces. Callback.
     * Invalid fd parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_async_003", 3, async (done: Function) => {
      try {
        fileIO.fsync(-1, (err) => {
          if (err) {
            console.log("fileIO_test_fsync_async_003 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900008 && err.message == "Bad file descriptor").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_fsync_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0400
     * @tc.name   : fileIO_test_fsync_async_004
     * @tc.desc   : Test fsync() interfaces. Promise.
     * Use file instead of fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_async_004", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_fsync_async_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        // @ts-ignore
        await fileIO.fsync(file);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_fsync_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_ASYNC_0500
     * @tc.name   : fileIO_test_fsync_async_005
     * @tc.desc   : Test fsync() interfaces. Callback.
     * Use file instead of fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_async_005", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_fsync_async_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        // @ts-ignore
        fileIO.fsync(file, (err) => {
          expect(err != null).assertTrue();
          console.log("fileIO_test_fsync_async_005 error package: " + JSON.stringify(err));
          done();
        });
      } catch (e) {
        console.log("fileIO_test_fsync_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_SYNC_0000
     * @tc.name   : fileIO_test_fsync_sync_000
     * @tc.desc   : Test fsyncSync() interfaces.
     * Open the file in read-write mode, and synchronize the file data.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_fsync_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_fsync_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.fsyncSync(file.fd);
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_fsync_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_SYNC_0100
     * @tc.name   : fileIO_test_fsync_sync_001
     * @tc.desc   : Test fsyncSync() interfaces.
     * Invalid fd parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_sync_001", 3, () => {
      try {
        fileIO.fsyncSync(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_fsync_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_FSYNC_SYNC_0200
     * @tc.name   : fileIO_test_fsync_sync_002
     * @tc.desc   : Test fsyncSync() interfaces.
     * Invalid fd parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_fsync_sync_002", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_fsync_sync_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        // @ts-ignore
        fileIO.fsyncSync(file);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_fsync_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
  });
}
