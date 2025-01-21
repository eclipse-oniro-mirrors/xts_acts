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

export default function fileIOMkdir() {
  describe("fileIO_fs_mkdir", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0000
     * @tc.name   : fileIO_test_mkdir_async_000
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * Create a directory, verify normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_000", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_000")) + "d";

      try {
        await fileIO.mkdir(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0100
     * @tc.name   : fileIO_test_mkdir_async_001
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * The path has pointed to a file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_async_001", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_mkdir_async_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.mkdir(fpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900015 && e.message == "File exists").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0200
     * @tc.name   : fileIO_test_mkdir_async_002
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * Create a directory, verify normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_002", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_002")) + "d";

      try {
        fileIO.mkdir(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdir_async_002 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(dpath)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0300
     * @tc.name   : fileIO_test_mkdir_async_003
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * The directory has been existed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_async_003", 2, async (done: Function) => {
      try {
        fileIO.mkdir("/", (err) => {
          if (err) {
            console.log("fileIO_test_mkdir_async_003 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900015 && err.message == "File exists").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0400
     * @tc.name   : fileIO_test_mkdir_async_004
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * The path is empty.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_async_004", 2, async (done: Function) => {
      try {
        await fileIO.mkdir("");
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0500
     * @tc.name   : fileIO_test_mkdir_async_005
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * The path exists *.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_005", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_005")) + "*";
      try {
        await fileIO.mkdir(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0600
     * @tc.name   : fileIO_test_mkdir_async_006
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * The path exists ?.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_006", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_006")) + "?";
      try {
        await fileIO.mkdir(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0700
     * @tc.name   : fileIO_test_mkdir_async_007
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * The path exists :.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_007", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_007")) + ":";
      try {
        await fileIO.mkdir(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0800
     * @tc.name   : fileIO_test_mkdir_async_008
     * @tc.desc   : Test mkdir() interfaces. Promise.
     * No path.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_async_008", 2, async (done: Function) => {
      try {
        // @ts-ignore
        await fileIO.mkdir();
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.log("fileIO_test_mkdir_async_008 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_0900
     * @tc.name   : fileIO_test_mkdir_async_009
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * The path is empty.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_async_009", 2, async (done: Function) => {
      try {
        fileIO.mkdir("", (err) => {
          expect(err != null).assertTrue();
          console.log("fileIO_test_mkdir_async_009 error package: " + err.code);
          expect(err.code == 13900002).assertTrue();
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_009 has failed for " + e.message + ", code: " + e.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_1000
     * @tc.name   : fileIO_test_mkdir_async_010
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * The path exists *.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_010", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_010")) + "*";
      try {
        fileIO.mkdir(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdir_async_010 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(dpath)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_010 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_1100
     * @tc.name   : fileIO_test_mkdir_async_011
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * The path exists ?.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_011", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_011")) + "?";
      try {
        fileIO.mkdir(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdir_async_011 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(dpath)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_011 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_ASYNC_1200
     * @tc.name   : fileIO_test_mkdir_async_012
     * @tc.desc   : Test mkdir() interfaces. Callback.
     * The path exists :.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_async_012", 1, async (done: Function) => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_async_012")) + ":";
      try {
        fileIO.mkdir(dpath, (err) => {
          if (err) {
            console.log("fileIO_test_mkdir_async_012 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(dpath)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_mkdir_async_012 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0000
     * @tc.name   : fileIO_test_mkdir_sync_000
     * @tc.desc   : Test mkdirSync() interfaces.
     * Create a directory, verify normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_sync_000", 1, async () => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_sync_000")) + "d";

      try {
        fileIO.mkdirSync(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0100
     * @tc.name   : fileIO_test_mkdir_sync_001
     * @tc.desc   : Test mkdirSync() interfaces.
     * The directory has been existed.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_sync_001", 2, async () => {
      try {
        fileIO.mkdirSync("/");
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900015 && e.message == "File exists").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0200
     * @tc.name   : fileIO_test_mkdir_sync_002
     * @tc.desc   : Test mkdirSync() interfaces.
     * The path is empty.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_sync_002", 2, async () => {
      try {
        fileIO.mkdirSync("");
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0300
     * @tc.name   : fileIO_test_mkdir_sync_003
     * @tc.desc   : Test mkdirSync() interfaces.
     * The path has pointed to a file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_sync_003", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_mkdir_sync_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.mkdirSync(fpath);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900015 && e.message == "File exists").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0400
     * @tc.name   : fileIO_test_mkdir_sync_004
     * @tc.desc   : Test mkdirSync() interfaces.
     * The path exists *.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_sync_004", 1, async () => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_sync_004")) + "*";
      try {
        await fileIO.mkdirSync(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0500
     * @tc.name   : fileIO_test_mkdir_sync_005
     * @tc.desc   : Test mkdirSync() interfaces.
     * The path exists ?.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_sync_005", 1, async () => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_sync_005")) + "?";
      try {
        await fileIO.mkdirSync(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0600
     * @tc.name   : fileIO_test_mkdir_sync_006
     * @tc.desc   : Test mkdirSync() interfaces.
     * The path exists :.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it("fileIO_test_mkdir_sync_006", 1, async () => {
      let dpath: string = (await nextFileName("fileIO_test_mkdir_sync_006")) + ":";
      try {
        await fileIO.mkdirSync(dpath);
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_MKDIR_SYNC_0700
     * @tc.name   : fileIO_test_mkdir_sync_007
     * @tc.desc   : Test mkdirSync() interfaces.
     * No path.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_mkdir_sync_007", 2, async () => {
      try {
        // @ts-ignore
        await fileIO.mkdirSync();
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_mkdir_sync_007 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });
  });
}
