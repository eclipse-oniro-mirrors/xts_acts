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

//import featureAbility from '@ohos.ability.featureAbility';
import { FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, randomString } from "../Common";
import fileIO from "@ohos.file.fs";

export default function fileIORename() {
  describe("fileIO_fs_rename", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0000
     * @tc.name   : fileIO_test_rename_async_000
     * @tc.desc   : Test rename() interfaces. Promise.
     * Rename the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_000", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let newf: string = fpath + "123";

      try {
        await fileIO.rename(fpath, newf);
        expect(fileIO.accessSync(newf)).assertTrue();
        fileIO.unlinkSync(newf);
        done();
      } catch (e) {
        console.log("fileIO_test_rename_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0100
     * @tc.name   : fileIO_test_rename_async_001
     * @tc.desc   : Test rename() interfaces. Promise.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_001", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_001");

      try {
        await fileIO.rename(fpath, fpath + "bbb");
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_rename_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0200
     * @tc.name   : fileIO_test_rename_async_002
     * @tc.desc   : Test rename() interfaces. Promise.
     * Illegal second parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_002", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.rename(fpath, null);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0300
     * @tc.name   : fileIO_test_rename_async_003
     * @tc.desc   : Test rename() interfaces. Promise.
     * Illegal second parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_003", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.rename(fpath, undefined);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0400
     * @tc.name   : fileIO_test_rename_async_004
     * @tc.desc   : Test rename() interfaces. Promise.
     * Modify file names across directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_004", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_rename_async_004");
      let fpath: string = dpath + "/file_001";
      fileIO.mkdirSync(dpath);
      fileIO.mkdirSync(dpath + "/dir_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let newf: string = dpath + "/dir_001/newFileName";
        await fileIO.rename(fpath, newf);
        expect(fileIO.accessSync(newf)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_rename_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0500
     * @tc.name   : fileIO_test_rename_async_005
     * @tc.desc   : Test rename() interfaces. Promise.
     * The length of file name is too long.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_005", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_005");
      let fpathTarget: string = fpath + randomString(250);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.rename(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900030 && e.message == "File name too long").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0600
     * @tc.name   : fileIO_test_rename_async_006
     * @tc.desc   : Test rename() interfaces. Callback.
     * Rename the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_006", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_006");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let newf: string = fpath + "aaa";

      try {
        fileIO.rename(fpath, newf, (err) => {
          if (err) {
            console.log("fileIO_test_rename_async_006 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(newf)).assertTrue();
          fileIO.unlinkSync(newf);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_rename_async_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0700
     * @tc.name   : fileIO_test_rename_async_007
     * @tc.desc   : Test rename() interfaces. Callback.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_007", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_007");

      try {
        fileIO.rename(fpath, fpath + "bbb", (err) => {
          if (err) {
            console.log("fileIO_test_rename_async_007 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_rename_async_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0800
     * @tc.name   : fileIO_test_rename_async_008
     * @tc.desc   : Test rename() interfaces. Callback.
     * Modify file names across directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_008", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_rename_async_008");
      let fpath: string = dpath + "/file_002";
      fileIO.mkdirSync(dpath);
      fileIO.mkdirSync(dpath + "/dir_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let newf: string = dpath + "/dir_002/newFileName";
        fileIO.rename(fpath, newf, (err) => {
          if (err) {
            console.log("fileIO_test_rename_async_008 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(newf)).assertTrue();
          fileIO.rmdirSync(dpath);
        });
        done();
      } catch (e) {
        console.log("fileIO_test_rename_async_008 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_0900
     * @tc.name   : fileIO_test_rename_async_009
     * @tc.desc   : Test rename() interfaces. Callback.
     * The length of file name is too long.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_async_009", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_009");
      let fpathTarget: string = fpath + randomString(250);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.rename(fpath, fpathTarget, (err) => {
          if (err) {
            fileIO.unlinkSync(fpath);
            console.log("fileIO_test_rename_async_009 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900030 && err.message == "File name too long").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_rename_async_009 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_1000
     * @tc.name   : fileIO_test_rename_async_010
     * @tc.desc   : Test rename() interfaces. Promise.
     * Newpath is as same as oldpath.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_010", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_010");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fileIO.rename(fpath, fpath);
        expect(fileIO.accessSync(fpath)).assertTrue();
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_rename_async_010 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_ASYNC_1100
     * @tc.name   : fileIO_test_rename_async_011
     * @tc.desc   : Test rename() interfaces. Callback.
     * Newpath is as same as oldpath.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_async_011", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_rename_async_011");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.rename(fpath, fpath, (err) => {
          if (err) {
            console.log("fileIO_test_rename_async_011 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(fpath)).assertTrue();
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_rename_async_011 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0000
     * @tc.name   : fileIO_test_rename_sync_000
     * @tc.desc   : Test renameSync() interfaces.
     * Rename the file by path, verify the normal function.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let newf: string = fpath + "test";
        fileIO.renameSync(fpath, newf);
        expect(fileIO.accessSync(newf)).assertTrue();
        fileIO.unlinkSync(newf);
      } catch (e) {
        console.log("fileIO_test_rename_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0100
     * @tc.name   : fileIO_test_rename_sync_001
     * @tc.desc   : Test renameSync() interfaces.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_sync_001", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_001");

      try {
        fileIO.renameSync(fpath, fpath + "test");
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_rename_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0200
     * @tc.name   : fileIO_test_rename_sync_002
     * @tc.desc   : Test renameSync() interfaces.
     * Illegal second parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_sync_002", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.renameSync(fpath, null);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0300
     * @tc.name   : fileIO_test_rename_sync_003
     * @tc.desc   : Test renameSync() interfaces.
     * Illegal second parameter.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_sync_003", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.renameSync(fpath, undefined);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0400
     * @tc.name   : fileIO_test_rename_sync_004
     * @tc.desc   : Test renameSync() interfaces.
     * Modify file names across directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_sync_004", 2, async () => {
      let dpath: string = await nextFileName("fileIO_test_rename_sync_004");
      let fpath: string = dpath + "/file_000";
      fileIO.mkdirSync(dpath);
      fileIO.mkdirSync(dpath + "/dir_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let newf: string = dpath + "/dir_000/newFileName";
        fileIO.renameSync(fpath, newf);
        expect(fileIO.accessSync(newf)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_rename_sync_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0500
     * @tc.name   : fileIO_test_rename_sync_005
     * @tc.desc   : Test renameSync() interfaces.
     * The length of file name is too long.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_rename_sync_005", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_005");
      let fpathTarget: string = fpath + randomString(250);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.renameSync(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_rename_sync_005 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900030 && e.message == "File name too long").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_RENAME_SYNC_0600
     * @tc.name   : fileIO_test_rename_sync_006
     * @tc.desc   : Test renameSync() interfaces.
     * Newpath is as same as oldpath.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_rename_sync_006", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_rename_sync_006");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.renameSync(fpath, fpath);
        expect(fileIO.accessSync(fpath)).assertTrue();
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_rename_sync_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });
  });
}
