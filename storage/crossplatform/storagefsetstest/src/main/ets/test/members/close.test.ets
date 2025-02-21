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

export default function fileIOClose() {
  describe("fileIO_fs_close", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0000
     * @tc.name   : fileIO_test_close_async_000
     * @tc.desc   : Test close() interfaces. Promise.
     * Open file and close file by fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_async_000", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        await fileIO.close(file.fd);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_close_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0100
     * @tc.name   : fileIO_test_close_async_001
     * @tc.desc   : Test close() interfaces. Promise.
     * Open file and close file by file object.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_async_001", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        await fileIO.close(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_close_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0200
     * @tc.name   : fileIO_test_close_async_002
     * @tc.desc   : Test close() interfaces. Promise.
     * Test file has been closed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_close_async_002", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        await fileIO.close(file);
        await fileIO.close(file);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_close_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0300
     * @tc.name   : fileIO_test_close_async_003
     * @tc.desc   : Test close() interfaces. Promise.
     * Illegal type of parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_close_async_003", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

      try {
        await fileIO.close(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_close_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0400
     * @tc.name   : fileIO_test_close_async_004
     * @tc.desc   : Test close() interfaces. Callback.
     * Open file and close file by fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_async_004", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.close(file.fd, (err) => {
          if (err) {
            console.log("fileIO_test_close_async_004 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_close_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_ASYNC_0500
     * @tc.name   : fileIO_test_close_async_005
     * @tc.desc   : Test close() interfaces. Callback.
     * Open file and close file by file object.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_async_005", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_close_async_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.close(file, (err) => {
          if (err) {
            console.log("fileIO_test_close_async_005 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_close_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_SYNC_0000
     * @tc.name   : fileIO_test_close_sync_000
     * @tc.desc   : Test closeSync() interfaces.
     * Open file and close file by fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_close_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.closeSync(file.fd);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_close_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_SYNC_0100
     * @tc.name   : fileIO_test_close_sync_001
     * @tc.desc   : Test closeSync() interfaces.
     * Open file and close file by file object.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_close_sync_001", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_close_sync_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_close_sync_001 for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_SYNC_0200
     * @tc.name   : fileIO_test_close_sync_002
     * @tc.desc   : Test closeSync() interfaces.
     * Test fd has been closed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_close_sync_002", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_close_sync_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        let fd: number = file.fd;
        fileIO.closeSync(file);
        fileIO.closeSync(fd);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_close_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_SYNC_0300
     * @tc.name   : fileIO_test_close_sync_003
     * @tc.desc   : Test closeSync() interfaces.
     * Test file has been closed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_close_sync_003", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_close_sync_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        fileIO.closeSync(file);
        fileIO.closeSync(file);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_close_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_CLOSE_SYNC_0400
     * @tc.name   : fileIO_test_close_sync_004
     * @tc.desc   : Test closeSync() interfaces.
     * Illegal type of parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_close_sync_004", 3, () => {
      try {
        fileIO.closeSync(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_close_sync_004 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
  });
}
