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

import { FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect } from "../Common";
import fileIO from "@ohos.file.fs";

export default function fileIORead() {
  describe("fileIO_fs_read", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0000
     * @tc.name   : fileIO_test_read_async_000
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, default read from current offset.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_async_000", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen1: number = await fileIO.read(file.fd, new ArrayBuffer(16));
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2: number = await fileIO.read(file.fd, new ArrayBuffer(8));
        expect(readLen2 == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0100
     * @tc.name   : fileIO_test_read_async_001
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in write-only mode, verifying it is not readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_async_001", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);

      try {
        expect(isIntNum(file.fd)).assertTrue();
        await fileIO.read(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_read_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0200
     * @tc.name   : fileIO_test_read_async_002
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, reading the file with offset(position) = 1.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_002", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen: number = await fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(readlen == FILE_CONTENT.length - 1).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0300
     * @tc.name   : fileIO_test_read_async_003
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, reading the file with length = 3.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_003", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = await fileIO.read(file.fd, new ArrayBuffer(4096), {
          length: 3,
        });
        expect(readLen == 3).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0400
     * @tc.name   : fileIO_test_read_async_004
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, reading the file with offset > the content of file(Read normal).
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_004", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = await fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: FILE_CONTENT.length + 1,
        });
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0500
     * @tc.name   : fileIO_test_read_async_005
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, reading the file with offset(position) = 1, length = 11.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_005", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = await fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: 11,
        });
        expect(readLen == 10).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0600
     * @tc.name   : fileIO_test_read_async_006
     * @tc.desc   : Test read() interfaces. Promise.
     * Read with invalid fd parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_async_006", 3, async (done: Function) => {
      try {
        await fileIO.read(-1, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_read_async_006 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0700
     * @tc.name   : fileIO_test_read_async_007
     * @tc.desc   : Test read() interfaces. Promise.
     * Open the file in read-only mode, reading the file with empty option.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_007", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_007");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = await fileIO.read(file.fd, new ArrayBuffer(4096), {});
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0800
     * @tc.name   : fileIO_test_read_async_008
     * @tc.desc   : Test read() interfaces. Promise.
     * Undefined option arguments, use default options.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_008", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_008");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen1: number = await fileIO.read(file.fd, new ArrayBuffer(16), undefined);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2: number = await fileIO.read(file.fd, new ArrayBuffer(8), undefined);
        expect(readLen2 == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_read_async_008 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_0900
     * @tc.name   : fileIO_test_read_async_009
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, default read from current offset.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_009", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_009");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(16), (err, readlen1) => {
          if (err) {
            console.log("fileIO_test_read_async_009 err package1: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readlen1 == FILE_CONTENT.length).assertTrue();
          fileIO.read(file.fd, new ArrayBuffer(8), (err, readLen2) => {
            if (err) {
              console.log("fileIO_test_read_async_009 err package2: " + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen2 == 0).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log("fileIO_test_read_async_009 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1000
     * @tc.name   : fileIO_test_read_async_010
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in write-only mode, verifying it is not readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_async_010", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_010");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File;

      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(4096), (err) => {
          if (err) {
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            console.log("fileIO_test_read_async_010 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900008 && err.message == "Bad file descriptor").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_read_async_010 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1100
     * @tc.name   : fileIO_test_read_async_011
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, reading the file with offset(position) = 1.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_011", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_011");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(
          file.fd,
          new ArrayBuffer(4096),
          {
            offset: 1,
          },
          (err, readLen) => {
            if (err) {
              console.log("fileIO_test_read_async_011 err package" + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen == FILE_CONTENT.length - 1).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          }
        );
      } catch (e) {
        console.log("fileIO_test_read_async_011 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1200
     * @tc.name   : fileIO_test_read_async_012
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, reading the file with length = 3.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_012", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_012");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(
          file.fd,
          new ArrayBuffer(4096),
          {
            length: 3,
          },
          (err, readLen) => {
            if (err) {
              console.log("fileIO_test_read_async_012 err package" + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen == 3).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          }
        );
      } catch (e) {
        console.log("fileIO_test_read_async_012 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1300
     * @tc.name   : fileIO_test_read_async_013
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, reading the file with offset > the content of file(Read normal).
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_013", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_013");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(
          file.fd,
          new ArrayBuffer(4096),
          {
            offset: FILE_CONTENT.length + 1,
          },
          (err, readLen) => {
            if (err) {
              console.log("fileIO_test_read_async_013 err package" + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen == 0).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          }
        );
      } catch (e) {
        console.log("fileIO_test_read_async_013 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1400
     * @tc.name   : fileIO_test_read_async_014
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, reading the file with offset(position) = 1, length = 11.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_014", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_014");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(
          file.fd,
          new ArrayBuffer(4096),
          {
            offset: 1,
            length: 11,
          },
          (err, readLen) => {
            if (err) {
              console.log("fileIO_test_read_async_014 err package: " + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen == 10).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          }
        );
      } catch (e) {
        console.log("fileIO_test_read_async_014 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1500
     * @tc.name   : fileIO_test_read_async_015
     * @tc.desc   : Test read() interfaces. Callback.
     * Read with invalid fd parameters.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_async_015", 3, async (done: Function) => {
      try {
        fileIO.read(-1, new ArrayBuffer(4096), (err) => {
          if (err) {
            expect(false).assertTrue();
          }
        });
      } catch (e) {
        console.log("fileIO_test_read_async_015 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1600
     * @tc.name   : fileIO_test_read_async_016
     * @tc.desc   : Test read() interfaces. Callback.
     * Open the file in read-only mode, reading the file with empty option.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_016", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_016");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(4096), {}, (err, readLen) => {
          if (err) {
            console.log("fileIO_test_read_async_016 err package " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readLen == FILE_CONTENT.length).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_read_async_016 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_ASYNC_1700
     * @tc.name   : fileIO_test_read_async_017
     * @tc.desc   : Test read() interfaces. Callback.
     * Undefined option arguments, use default options.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_async_017", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_async_017");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(16), undefined, (err, readlen1) => {
          if (err) {
            console.log("fileIO_test_read_async_017 err package1: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(readlen1 == FILE_CONTENT.length).assertTrue();
          fileIO.read(file.fd, new ArrayBuffer(8), undefined, (err, readLen2) => {
            if (err) {
              console.log("fileIO_test_read_async_017 err package2: " + JSON.stringify(err));
              expect(false).assertTrue();
            }
            expect(readLen2 == 0).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          });
        });
      } catch (e) {
        console.log("fileIO_test_read_async_017 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0000
     * @tc.name   : fileIO_test_read_sync_000
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, default read from current offset.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen1 = fileIO.readSync(file.fd, new ArrayBuffer(16));
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = fileIO.readSync(file.fd, new ArrayBuffer(8));
        expect(readLen2 == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0100
     * @tc.name   : fileIO_test_read_sync_001
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in write-only mode, verifying it is not readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_sync_001", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);

      try {
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_read_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0200
     * @tc.name   : fileIO_test_read_sync_002
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with offset(position) = 1.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_002", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0300
     * @tc.name   : fileIO_test_read_sync_003
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with length = 3.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_003", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_003");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: 3,
        });
        expect(readLen == 3).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0400
     * @tc.name   : fileIO_test_read_sync_004
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with offset(position) > the content of file(Read normal).
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_004", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: FILE_CONTENT.length + 1,
        });
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0500
     * @tc.name   : fileIO_test_read_sync_005
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with offset(position) = 1, length = 11.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_005", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 1,
          length: 11,
        });
        expect(readLen == 10).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0600
     * @tc.name   : fileIO_test_read_sync_006
     * @tc.desc   : Test readSync() interfaces.
     * Read the file with invalid fd.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_sync_006", 3, async () => {
      try {
        fileIO.readSync(-1, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_read_sync_006 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0700
     * @tc.name   : fileIO_test_read_sync_007
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with empty option.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_007", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_007");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen1: number = fileIO.readSync(file.fd, new ArrayBuffer(16));
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2: number = fileIO.readSync(file.fd, new ArrayBuffer(8));
        expect(readLen2 == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0800
     * @tc.name   : fileIO_test_read_sync_008
     * @tc.desc   : Test readSync() interfaces.
     * Undefined option arguments, use default options.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_008", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_008");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen1: number = fileIO.readSync(file.fd, new ArrayBuffer(16), undefined);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2: number = fileIO.readSync(file.fd, new ArrayBuffer(8), undefined);
        expect(readLen2 == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_008 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_0900
     * @tc.name   : fileIO_test_read_sync_009
     * @tc.desc   : Test readSync() interfaces.
     * Read the file with invalid offset = -1.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_sync_009", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_009");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      const invalidOffset = -1;

      try {
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: invalidOffset,
        });
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_read_sync_009 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_1000
     * @tc.name   : fileIO_test_read_sync_010
     * @tc.desc   : Test readSync() interfaces.
     * Read the file with invalid length > size of ArrayBuffer.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_read_sync_010", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_010");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);

      try {
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: 4097,
        });
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_read_sync_010 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900020 && e.message == "Invalid argument").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_READ_SYNC_1100
     * @tc.name   : fileIO_test_read_sync_011
     * @tc.desc   : Test readSync() interfaces.
     * Open the file in read-only mode, reading the file with length > the content of file(Read normal).
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_read_sync_011", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_read_sync_011");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          length: FILE_CONTENT.length + 1,
        });
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_read_sync_011 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });
  });
}
