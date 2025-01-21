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

import { FILE_CONTENT, nextFileName, prepareFile, isIntNum, describe, it, expect } from "../Common";
import fileIO from "@ohos.file.fs";
import { BusinessError } from '@ohos.base';

export default function fileIOOpen() {
  describe("fileIO_fs_open", () => {
    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0000
     * @tc.name   : fileIO_test_open_async_000
     * @tc.desc   : Test open() interfaces. mode=0o0. Promise.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_000", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.READ_ONLY);

      try {
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(4096)).then((readLen) => {
          expect(readLen == FILE_CONTENT.length).assertTrue();
        });
        fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file)
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_async_000 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0100
     * @tc.name   : fileIO_test_open_async_001
     * @tc.desc   : Test open() interfaces.  mode=0o1. Promise.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_001", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 20;

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.WRITE_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.write(file.fd, new ArrayBuffer(length)).then((bytesWritten) => {
          expect(bytesWritten == length).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_001 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0200
     * @tc.name   : fileIO_test_open_async_002
     * @tc.desc   : Test open() interfaces.  mode=0o2. Promise.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_002", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_002");

      try {
        await fileIO.open(fpath, fileIO.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e) {
        console.log("fileIO_test_open_async_002 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900002 && e.message == "No such file or directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0300
     * @tc.name   : fileIO_test_open_async_003
     * @tc.desc   : Test open() interfaces.  mode=0o102. Promise.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_003", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_003");

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0400
     * @tc.name   : fileIO_test_open_async_004
     * @tc.desc   : Test open() interfaces.  mode=0o1002. Promise.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_004", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.read(file.fd, new ArrayBuffer(4096)).then((readLen) => {
          expect(readLen == 0).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0500
     * @tc.name   : fileIO_test_open_async_005
     * @tc.desc   : Test open() interfaces.  mode=0o2002. Promise.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_005", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 100;

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.writeSync(file.fd, new ArrayBuffer(length));
        fileIO.read(file.fd, new ArrayBuffer(4096), {
          offset: 0
        }).then((readLen) => {
          expect(readLen == length + FILE_CONTENT.length).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0600
     * @tc.name   : fileIO_test_open_async_006
     * @tc.desc   : Test open() interfaces.  mode=0o4002. Promise.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_006", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_006");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.NONBLOCK | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0700
     * @tc.name   : fileIO_test_open_async_007
     * @tc.desc   : Test open() interfaces.  mode=0o200000. Promise.
     * The path points to a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_007", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_open_async_007");
      fileIO.mkdirSync(dpath);

      try {
        let file: fileIO.File = await fileIO.open(dpath, fileIO.OpenMode.DIR);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0800
     * @tc.name   : fileIO_test_open_async_008
     * @tc.desc   : Test open() interfaces.  mode=0o200000. Promise.
     * The path does not point to a directory, throw error.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_008", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_008");
      expect(prepareFile(fpath, "")).assertTrue();

      try {
        await fileIO.open(fpath, fileIO.OpenMode.DIR);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_async_008 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900018 && e.message == "Not a directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_0900
     * @tc.name   : fileIO_test_open_async_009
     * @tc.desc   : Test open() interfaces.  mode=0o400002. Promise.
     * The path does not point to a symbolic link.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_009", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_009");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_009 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1000
     * @tc.name   : fileIO_test_open_async_010
     * @tc.desc   : Test open() interfaces.  mode=0o4010002. Promise.
     * Open the file in the way of synchronous IO.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_010", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_010");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = await fileIO.open(fpath, fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_010 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1100
     * @tc.name   : fileIO_test_open_async_011
     * @tc.desc   : Test open() interfaces. Promise.
     * The path refers to a file, not a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_011", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_open_async_011");
      fileIO.mkdirSync(dpath);

      try {
        await fileIO.open(dpath, fileIO.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.rmdirSync(dpath);
        console.log("fileIO_test_open_async_011 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900019 && e.message == "Is a directory").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1200
     * @tc.name   : fileIO_test_open_async_012
     * @tc.desc   : Test open() interfaces. Promise.
     * Undefined option arguments, use default mode = 0o0.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_012", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_012");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File;

      try {
        file = await fileIO.open(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length).assertTrue();
        fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_async_012 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1300
     * @tc.name   : fileIO_test_open_async_013
     * @tc.desc   : Test open() interfaces. mode=0o0. Callback.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_013", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_013");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.READ_ONLY, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_013 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == FILE_CONTENT.length).assertTrue();
          fileIO
            .write(file.fd, new ArrayBuffer(4096))
            .then((writeLen) => {
              console.info("write data to file succeed and size is:" + writeLen);
              expect(false).assertTrue();
            })
            .catch((err: BusinessError) => {
              console.info("write data to file failed with error message: " + err.message + ", error code: " + err.code);
              expect(err.code == 13900008 && err.message == "Bad file descriptor").assertTrue();
              fileIO.unlinkSync(fpath);
              done();
            });
        });
      } catch (e) {
        console.log("fileIO_test_open_async_013 has failed for " + e.message + ", code: " + e.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1400
     * @tc.name   : fileIO_test_open_async_014
     * @tc.desc   : Test open() interfaces. mode=0o1. Callback.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_014", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_014");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length = 20;

      try {
        fileIO.open(fpath, fileIO.OpenMode.WRITE_ONLY, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_014 error package" + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.write(file.fd, new ArrayBuffer(length)).then((bytesWritten) => {
            expect(bytesWritten == length).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
          });
        });
        done();
      } catch (e) {
        console.log("fileIO_test_open_async_014 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1500
     * @tc.name   : fileIO_test_open_async_015
     * @tc.desc   : Test open() interfaces. mode=0o2. Callback.
     * The path point to nothing, no such file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_015", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_015");

      try {
        fileIO.open(fpath, fileIO.OpenMode.READ_WRITE, (err) => {
          if (err) {
            console.log("fileIO_test_open_async_015 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900002 && err.message == "No such file or directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_open_async_015 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1600
     * @tc.name   : fileIO_test_open_async_016
     * @tc.desc   : Test open() interfaces. mode=0o102. Callback.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_016", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_016");

      try {
        fileIO.open(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.WRITE_ONLY, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_016 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_016 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1700
     * @tc.name   : fileIO_test_open_async_017
     * @tc.desc   : Test open() interfaces. mode=0o1002. Callback.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_017", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_017");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_017 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.read(file.fd, new ArrayBuffer(4096)).then((readLen) => {
            expect(readLen == 0).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
          });
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_017 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1800
     * @tc.name   : fileIO_test_open_async_018
     * @tc.desc   : Test open() interfaces. mode=0o2002. Callback.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_018", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_018");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let length: number = 100;

      try {
        fileIO.open(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_018 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.writeSync(file.fd, new ArrayBuffer(length));
          fileIO.read(file.fd, new ArrayBuffer(4096), {
            offset: 0
          }).then((readLen) => {
            expect(readLen == length + FILE_CONTENT.length).assertTrue();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
          });
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_018 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_1900
     * @tc.name   : fileIO_test_open_async_019
     * @tc.desc   : Test open() interfaces. mode=0o4002. Callback.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_019", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_019");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.NONBLOCK | fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_019 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_019 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2000
     * @tc.name   : fileIO_test_open_async_020
     * @tc.desc   : Test open() interfaces. mode=0o200000. Callback.
     * The path points to a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_020", 2, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_open_async_020");
      fileIO.mkdirSync(dpath);

      try {
        fileIO.open(dpath, fileIO.OpenMode.DIR, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_020 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_020 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2100
     * @tc.name   : fileIO_test_open_async_021
     * @tc.desc   : Test open() interfaces. mode=0o200000. Callback.
     * The path does not point to a directory, throw error.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_021", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_021");
      expect(prepareFile(fpath, "")).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.DIR, (err) => {
          if (err) {
            fileIO.unlinkSync(fpath);
            console.log("fileIO_test_open_async_021 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900018 && err.message == "Not a directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_open_async_021 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2200
     * @tc.name   : fileIO_test_open_async_022
     * @tc.desc   : Test open() interfaces. mode=0o400002. Callback.
     * The path does not point to a symbolic link.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_022", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_022");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_022 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_022 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2300
     * @tc.name   : fileIO_test_open_async_023
     * @tc.desc   : Test open() interfaces. mode=0o4010002. Callback.
     * Open the file in the way of synchronous IO.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_async_023", 2, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_023");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_023 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        console.log("fileIO_test_open_async_023 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2400
     * @tc.name   : fileIO_test_open_async_024
     * @tc.desc   : Test open() interfaces. Callback.
     * The path refers to a file, not a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_024", 3, async (done: Function) => {
      let dpath: string = await nextFileName("fileIO_test_open_async_024");
      fileIO.mkdirSync(dpath);

      try {
        fileIO.open(dpath, fileIO.OpenMode.READ_WRITE, (err, file) => {
          if (err) {
            fileIO.rmdirSync(dpath);
            console.log("fileIO_test_open_async_024 error: {message: " + err.message + ", code: " + err.code + "}");
            expect(err.code == 13900019 && err.message == "Is a directory").assertTrue();
            done();
          }
        });
      } catch (e) {
        console.log("fileIO_test_open_async_024 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_ASYNC_2500
     * @tc.name   : fileIO_test_open_async_025
     * @tc.desc   : Test open() interfaces. Callback.
     * Undefined option arguments, use default mode = 0o0.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_async_025", 3, async (done: Function) => {
      let fpath: string = await nextFileName("fileIO_test_open_async_025");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.open(fpath, (err, file) => {
          if (err) {
            console.log("fileIO_test_open_async_025 error package: " + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(isIntNum(file.fd)).assertTrue();
          let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(readLen == FILE_CONTENT.length).assertTrue();
          fileIO.write(file.fd, new ArrayBuffer(4096), (err, bytesWritten) => {
            if (err) {
              fileIO.closeSync(file);
              fileIO.unlinkSync(fpath);
              console.log("fileIO_test_open_async_025 error: {message: " + err.message + ", code: " + err.code + "}");
              expect(err.code == 13900008 && err.message == "Bad file descriptor").assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          });
        });
      } catch (e) {
        console.log("fileIO_test_open_async_025 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0000
     * @tc.name   : fileIO_test_open_sync_000
     * @tc.desc   : Test openSync() interfaces. mode=0o0.
     * Open the file in read-only mode, verifying the file is readable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_000", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_000");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_sync_000 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0100
     * @tc.name   : fileIO_test_open_sync_001
     * @tc.desc   : Test openSync() interfaces. mode=0o1.
     * Open the file in write-only mode, verifying the file is writable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_001", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_001");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let bytesWritten: number = fileIO.writeSync(file.fd, FILE_CONTENT);
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_001 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0200
     * @tc.name   : fileIO_test_open_sync_002
     * @tc.desc   : Test openSync() interfaces. mode=0o2.
     * Open the file in read-write mode, verifying the file is readable and writable.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_002", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_002");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        let length: number = 20;
        let bytesWritten: number = fileIO.writeSync(file.fd, new ArrayBuffer(length), {
          offset: 0
        });
        expect(bytesWritten == length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_002 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0300
     * @tc.name   : fileIO_test_open_sync_003
     * @tc.desc   : Test openSync() interfaces. mode=0o102.
     * If the path point to the file which does not exist, the file can be created.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_003", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_003");

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_003 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0400
     * @tc.name   : fileIO_test_open_sync_004
     * @tc.desc   : Test openSync() interfaces. mode=0o1002.
     * If the file exists and the file is opened for read-write, trim its length to zero.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_004", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_004");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.TRUNC | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_004 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0500
     * @tc.name   : fileIO_test_open_sync_005
     * @tc.desc   : Test openSync() interfaces. mode=0o2002.
     * Open as append, subsequent writes will append to the end of the file.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_005", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_005");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.APPEND | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let length: number = 100;
        let bytesWritten: number = fileIO.writeSync(file.fd, new ArrayBuffer(length));
        expect(bytesWritten == length).assertTrue();
        let readLen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096), {
          offset: 0
        });
        expect(readLen == length + FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_005 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0600
     * @tc.name   : fileIO_test_open_sync_006
     * @tc.desc   : Test openSync() interfaces. mode=0o4002.
     * If the file is a special file, the opening and subsequent IOs perform non-blocking operations.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_006", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_006");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.NONBLOCK | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_006 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0700
     * @tc.name   : fileIO_test_open_sync_007
     * @tc.desc   : Test openSync() interfaces. mode=0o200000.
     * The path points to a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_007", 2, async () => {
      let dpath: string = await nextFileName("fileIO_test_open_sync_007");
      fileIO.mkdirSync(dpath);

      try {
        let file: fileIO.File = fileIO.openSync(dpath, fileIO.OpenMode.DIR);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.rmdirSync(dpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_007 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0800
     * @tc.name   : fileIO_test_open_sync_008
     * @tc.desc   : Test openSync() interfaces. mode=0o200000.
     * The path does not a directory, throw error.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_sync_008", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_008");
      expect(prepareFile(fpath, "")).assertTrue();

      try {
        fileIO.openSync(fpath, fileIO.OpenMode.DIR);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_sync_008 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900018 && e.message == "Not a directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_0900
     * @tc.name   : fileIO_test_open_sync_009
     * @tc.desc   : Test openSync() interfaces. mode=0o400002.
     * The path does not point to a symbolic link.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_009", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_009");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.NOFOLLOW | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_009 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_1000
     * @tc.name   : fileIO_test_open_sync_010
     * @tc.desc   : Test openSync() interfaces. mode=0o4010002.
     * Open the file in the way of synchronous IO.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("fileIO_test_open_sync_010", 2, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_010");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file: fileIO.File = fileIO.openSync(fpath, fileIO.OpenMode.SYNC | fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log("fileIO_test_open_sync_010 has failed for " + e.message + ", code: " + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_1100
     * @tc.name   : fileIO_test_open_sync_011
     * @tc.desc   : Test openSync() interfaces.
     * The path refers to a file, not a directory.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_sync_011", 3, async () => {
      let dpath: string = await nextFileName("fileIO_test_open_sync_011");
      fileIO.mkdirSync(dpath);

      try {
        fileIO.openSync(dpath, fileIO.OpenMode.READ_WRITE);
        expect(false).assertTrue();
      } catch (e) {
        fileIO.rmdirSync(dpath);
        console.log("fileIO_test_open_sync_011 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900019 && e.message == "Is a directory").assertTrue();
      }
    });

    /**
     * @tc.number : SUB_FM_TEST_FILEFS_OPEN_SYNC_1200
     * @tc.name   : fileIO_test_open_sync_012
     * @tc.desc   : Test openSync() interfaces.
     * Undefined option arguments, use default mode = 0o0.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it("fileIO_test_open_sync_012", 3, async () => {
      let fpath: string = await nextFileName("fileIO_test_open_sync_012");
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file: fileIO.File;

      try {
        file = fileIO.openSync(fpath, undefined);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen: number = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.writeSync(file.fd, new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        console.log("fileIO_test_open_sync_012 has failed for " + e.message + ", code: " + e.code);
        expect(e.code == 13900008 && e.message == "Bad file descriptor").assertTrue();
      }
    });
  });
}
