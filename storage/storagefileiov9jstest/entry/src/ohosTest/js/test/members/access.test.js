/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOAccess() {
describe('fileIO_fs_access', function () {

    /**
     * @tc.name   test_FileIO_Access_Sync_000
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0000
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_000', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        expect(fileIO.accessSync(fpath)).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_001
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0100
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_001', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_001');

      try {
        let ret = fileIO.accessSync(fpath);
        expect(ret === false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_002
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0200
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_002', Level.LEVEL0, async function () {

      try {
        expect(fileIO.accessSync(-1)).assertTrue();
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
      * @tc.name   test_FileIO_Access_Sync_003
      * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0300
      * @tc.desc   Test accessSync() interface.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_FileIO_Access_Sync_003', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_004
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0400
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_004', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.WRITE);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_005
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0500
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_005', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_006
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0600
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_006', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ_WRITE);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_007
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0700
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_007', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_008
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0800
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_008', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_008');
      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.EXIST, fileIO.AccessFlagType.LOCAL);
        expect(ret === false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_009
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_0900
     * @tc.desc   Test accessSync() interface. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_009', Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(undefined, fileIO.AccessModeType.WRITE);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_010
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1000
     * @tc.desc   Test accessSync() interface. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_010', Level.LEVEL0, async function () {

      try {
        fileIO.accessSync(null, fileIO.AccessModeType.READ);
        expect().assertFail();
      } catch (e) {
        console.log('test_FileIO_Access_Sync_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_011
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1100
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_011', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_011');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_012
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1200
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_012', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.WRITE, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Sync_013
     * @tc.number SUB_DF_FILEIO_ACCESS_SYNC_1300
     * @tc.desc   Test accessSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Sync_013', Level.LEVEL0, async function () {
      let fpath = await nextFileName('test_FileIO_Access_Sync_013');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = fileIO.accessSync(fpath, fileIO.AccessModeType.READ_WRITE, fileIO.AccessFlagType.LOCAL);
        expect(ret == true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('test_FileIO_Access_Sync_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_000
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0000
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_000', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_001
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0100
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_001', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('test_FileIO_Access_Async_001 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(ret === true).assertTrue();
          let file = fileIO.openSync(fpath);
          expect(isIntNum(file.fd)).assertTrue();
          let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
          expect(readlen == FILE_CONTENT.length).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
        });
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_002
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0200
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_002', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_002');

      try {
        let ret = await fileIO.access(fpath);
        expect(ret === false).assertTrue();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_003
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0300
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_003', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_003');

      try {
        fileIO.access(fpath, (err, ret) => {
          if (err) {
            console.log('test_FileIO_Access_Async_003 error package: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(ret === false).assertTrue();
          done();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_004
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0400
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_004', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('test_FileIO_Access_Async_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_005
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0500
     * @tc.desc   Test access() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_005', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(-1, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  
    /**
      * @tc.name   test_FileIO_Access_Async_006
      * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0600
      * @tc.desc   Test access() interface. Promise.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_FileIO_Access_Async_006', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.EXIST);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_007
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0700
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_007', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.WRITE);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_008
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0800
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_008', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_008');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_009
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_0900
     * @tc.desc   Test access() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_009', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('test_FileIO_Access_Async_009');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let ret = await fileIO.access(fpath, fileIO.AccessModeType.READ_WRITE);
        expect(ret === true).assertTrue();
        let file = fileIO.openSync(fpath);
        expect(isIntNum(file.fd)).assertTrue();
        let readlen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readlen == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_010
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1000
     * @tc.desc   Test access() interface. Promise. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_010', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(null, fileIO.AccessModeType.EXIST);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_011
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1100
     * @tc.desc   Test access() interface. Promise. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_011', Level.LEVEL0, async function (done) {

      try {
        await fileIO.access(undefined, fileIO.AccessModeType.READ_WRITE);
        expect().assertFail();
        done();
      } catch (e) {
        console.log('test_FileIO_Access_Async_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_012
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1200
     * @tc.desc   Test access() interface. Callback. Path is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_012', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(null, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_FileIO_Access_Async_013
     * @tc.number SUB_DF_FILEIO_ACCESS_ASYNC_1300
     * @tc.desc   Test access() interface. Callback. Path is undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FileIO_Access_Async_013', Level.LEVEL0, async function (done) {

      try {
        fileIO.access(undefined, (err) => {
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('test_FileIO_Access_Async_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  });
}