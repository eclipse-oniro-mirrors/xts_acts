/*
 * Copyright (C) 2022-2026 Huawei Device Co., Ltd.
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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOFileMapping() {
  describe('fileIO_fs_filemapping', function () {

    /**
     * @tc.name   fileIO_test_mmap_sync_000
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0000
     * @tc.desc   Test mmapSync() interfaces. mode=READ_WRITE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_mmap_sync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_001
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0100
     * @tc.desc   Test mmapSync() interfaces. mode=READ_ONLY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file.fd, fileIO.MappingMode.READ_ONLY, 0, 11);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_mmap_sync_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_002
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0200
     * @tc.desc   Test mmapSync() interfaces. mode=PRIVATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.PRIVATE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_mmap_sync_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_003
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0300
     * @tc.desc   Test mmapSync() interfaces. Using fd instead of File object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file.fd, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_mmap_sync_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_004
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0400
     * @tc.desc   Test mmapSync() interfaces. Invalid fd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      try {
        let mapping = fileIO.mmapSync(-1, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mmap_sync_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900008 || e.code === 13900020).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_005
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0500
     * @tc.desc   Test mmapSync() interfaces. Invalid offset (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, -1, 1024);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mmap_sync_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_006
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0600
     * @tc.desc   Test mmapSync() interfaces. Invalid size (negative) size=0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 0);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mmap_sync_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_007
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0700
     * @tc.desc   Test mmapSync() interfaces. Invalid size (negative) size=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, -1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_mmap_sync_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_sync_008
     * @tc.number SUB_DF_FILEIO_MMAP_SYNC_0800
     * @tc.desc   Test mmapSync() with offset exceeding file size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_mmap_sync_008');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 4096, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_mmap_sync_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue(); 
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_async_000
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_0000
     * @tc.desc   Test mmap() interfaces. mode=READ_WRITE. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_mmap_async_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.mmap(file, fileIO.MappingMode.READ_WRITE, 0, 1024).then((mapping) => {
          expect(mapping != null).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_mmap_async_000 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_mmap_async_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_async_001
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_0100
     * @tc.desc   Test mmap() interfaces. mode=READ_ONLY. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_mmap_async_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.mmap(file, fileIO.MappingMode.READ_ONLY, 0, 11).then((mapping) => {
          expect(mapping != null).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_mmap_async_001 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_mmap_async_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_async_002
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_0200
     * @tc.desc   Test mmap() interfaces. mode=PRIVATE. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_mmap_async_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.mmap(file, fileIO.MappingMode.PRIVATE, 0, 1024).then((mapping) => {
          expect(mapping != null).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_mmap_async_002 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_mmap_async_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_mmap_async_003
     * @tc.number SUB_DF_FILEIO_MMAP_ASYNC_0300
     * @tc.desc   Test mmap() interfaces. Using fd. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_mmap_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_mmap_async_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        fileIO.mmap(file.fd, fileIO.MappingMode.READ_WRITE, 0, 1024).then((mapping) => {
          expect(mapping != null).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_mmap_async_003 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_mmap_async_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_000
     * @tc.number SUB_DF_FILEIO_SETPOSITION_0000
     * @tc.desc   Test setPosition() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setPosition_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(100);
        let pos = mapping.getPosition();
        expect(pos == 100).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_setPosition_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_001
     * @tc.number SUB_DF_FILEIO_SETPOSITION_0100
     * @tc.desc   Test setPosition() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setPosition_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setPosition_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_002
     * @tc.number SUB_DF_FILEIO_SETPOSITION_0200
     * @tc.desc   Test setPosition() interfaces. Position exceeds limit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setPosition_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(512);
        mapping.setPosition(600);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setPosition_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_003
     * @tc.number SUB_DF_FILEIO_SETPOSITION_0300
     * @tc.desc   Test setPosition() interfaces. Position= null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setPosition_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setPosition_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setPosition_004
     * @tc.number SUB_DF_FILEIO_SETPOSITION_0400
     * @tc.desc   Test setPosition() interfaces. Position= undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setPosition_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setPosition_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setPosition_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });


    /**
     * @tc.name   fileIO_test_getPosition_000
     * @tc.number SUB_DF_FILEIO_GETPOSITION_0000
     * @tc.desc   Test getPosition() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_getPosition_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_getPosition_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let pos = mapping.getPosition();
        expect(pos == 0).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_getPosition_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_capacity_000
     * @tc.number SUB_DF_FILEIO_CAPACITY_0000
     * @tc.desc   Test capacity() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_capacity_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_capacity_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let cap = mapping.capacity();
        expect(cap == 1024).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_capacity_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_capacity_001
     * @tc.number SUB_DF_FILEIO_CAPACITY_0100
     * @tc.desc   Test capacity() after unmap.Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_capacity_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_capacity_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        mapping.capacity();
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_capacity_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });


    /**
     * @tc.name   fileIO_test_setLimit_000
     * @tc.number SUB_DF_FILEIO_SETLIMIT_0000
     * @tc.desc   Test setLimit() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setLimit_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(512);
        let lim = mapping.getLimit();
        expect(lim == 512).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_setLimit_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_001
     * @tc.number SUB_DF_FILEIO_SETLIMIT_0100
     * @tc.desc   Test setLimit() interfaces. Invalid limit (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setLimit_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(-1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setLimit_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_002
     * @tc.number SUB_DF_FILEIO_SETLIMIT_0200
     * @tc.desc   Test setLimit() interfaces. Limit exceeds capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setLimit_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let cap = mapping.capacity();
        mapping.setLimit(cap + 100);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setLimit_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_setLimit_003
     * @tc.number SUB_DF_FILEIO_SETLIMIT_0300
     * @tc.desc   Test setLimit() interfaces. Limit=null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setLimit_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(null);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setLimit_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });
    
    /**
     * @tc.name   fileIO_test_setLimit_004
     * @tc.number SUB_DF_FILEIO_SETLIMIT_0400
     * @tc.desc   Test setLimit() interfaces. Limit=undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_setLimit_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_setLimit_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(undefined);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_setLimit_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_getLimit_000
     * @tc.number SUB_DF_FILEIO_GETLIMIT_0000
     * @tc.desc   Test getLimit() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_getLimit_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_getLimit_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let lim = mapping.getLimit();
        expect(lim == 1024).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_getLimit_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_getLimit_001
     * @tc.number SUB_DF_FILEIO_GETLIMIT_0100
     * @tc.desc   Test getLimit() after unmap,Error code 13900052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_getLimit_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_getLimit_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        mapping.getLimit();
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_getLimit_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_flip_000
     * @tc.number SUB_DF_FILEIO_FLIP_0000
     * @tc.desc   Test flip() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_flip_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_flip_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(50);
        mapping.flip();
        let pos = mapping.getPosition();
        let lim = mapping.getLimit();
        expect(pos == 0).assertTrue();
        expect(lim == 50).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_flip_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_flip_001
     * @tc.number SUB_DF_FILEIO_FLIP_0100
     * @tc.desc   Test flip() after unmap,Error code 13900052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_flip_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_flip_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        mapping.flip();
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_flip_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_remaining_000
     * @tc.number SUB_DF_FILEIO_REMAINING_0000
     * @tc.desc   Test remaining() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_remaining_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_remaining_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setPosition(100);
        let rem = mapping.remaining();
        expect(rem == 924).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_remaining_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });


    /**
     * @tc.name   fileIO_test_read_buffer_000
     * @tc.number SUB_DF_FILEIO_READ_BUFFER_0000
     * @tc.desc   Test read(buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_buffer_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_buffer_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(buffer);
        expect(bytesRead == 100).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_buffer_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_buffer_001
     * @tc.number SUB_DF_FILEIO_READ_BUFFER_0100
     * @tc.desc   Test read(buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_buffer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_buffer_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(buffer, 50);
        expect(bytesRead == 50).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_buffer_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_position_000
     * @tc.number SUB_DF_FILEIO_READ_POSITION_0000
     * @tc.desc   Test read(position, buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_position_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_position_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(50, buffer);
        expect(bytesRead == 100).assertTrue();
        let pos = mapping.getPosition();
        expect(pos == 0).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_position_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_position_001
     * @tc.number SUB_DF_FILEIO_READ_POSITION_0100
     * @tc.desc   Test read(position, buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_position_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_position_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesRead = mapping.read(50, buffer, 50);
        expect(bytesRead == 50).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_read_position_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_000
     * @tc.number SUB_DF_FILEIO_READ_ERROR_0000
     * @tc.desc   Test read() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_error_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.read(-1, buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_read_error_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_001
     * @tc.number SUB_DF_FILEIO_READ_ERROR_0100
     * @tc.desc   Test read() interfaces. Position exceeds limit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_error_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.setLimit(512);
        let buffer = new ArrayBuffer(100);
        mapping.read(600, buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_read_error_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900051 || e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_read_error_002
     * @tc.number SUB_DF_FILEIO_READ_ERROR_0200
     * @tc.desc   Test read() after unmap,Error code 13900052
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_read_error_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_read_error_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.read(buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_read_error_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
    * @tc.name   fileIO_test_read_error_003
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0300
    * @tc.desc   Test read() interfaces. buffer=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_read_error_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.read(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_error_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      mapping.unmapSync();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });

  /**
    * @tc.name   fileIO_test_read_error_004
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0400
    * @tc.desc   Test read() interfaces.length=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.read(100,null);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_004 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_005
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0500
    * @tc.desc   Test read() interfaces. position =null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.read(null,buffer);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_005 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_006
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0600
    * @tc.desc   Test read() interfaces. buffer=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_006');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       mapping.read(50,null);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_006 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_007
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0700
    * @tc.desc   Test read() interfaces.length=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_007');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       let bytesRead = mapping.read(50,buffer,null);
       console.log('fileIO_test_read_error_007 bytesRead ' + bytesRead);
       expect(bytesRead == 100).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     } catch (e) {
       console.log('fileIO_test_read_error_007 has failed for ' + e.message + ', code: ' + e.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_008
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0800
    * @tc.desc   Test read() interfaces. buffer=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_read_error_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.read(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_read_error_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      mapping.unmapSync();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });

  /**
    * @tc.name   fileIO_test_read_error_009
    * @tc.number SUB_DF_FILEIO_READ_ERROR_0900
    * @tc.desc   Test read() interfaces.length=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_009');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.read(100,undefined);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_009 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_010
    * @tc.number SUB_DF_FILEIO_READ_ERROR_1000
    * @tc.desc   Test read() interfaces. position =undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_010');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
 let buffer = new ArrayBuffer(100);
       mapping.read(undefined,buffer);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_010 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_011
    * @tc.number SUB_DF_FILEIO_READ_ERROR_1100
    * @tc.desc   Test read() interfaces. buffer=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_011');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       mapping.read(50,undefined);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_read_error_011 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_read_error_012
    * @tc.number SUB_DF_FILEIO_READ_ERROR_1200
    * @tc.desc   Test read() interfaces.length=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_read_error_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_read_error_012');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       let bytesRead =  mapping.read(50,buffer,undefined);
       console.log('fileIO_test_read_error_012 bytesRead' + bytesRead);
       expect(bytesRead == 100).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     } catch (e) {
       console.log('fileIO_test_read_error_012 has failed for ' + e.message + ', code: ' + e.code);
       expect(false).assertTrue();
     }
   });

    /**
     * @tc.name   fileIO_test_write_buffer_000
     * @tc.number SUB_DF_FILEIO_WRITE_BUFFER_0000
     * @tc.desc   Test write(buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_buffer_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_buffer_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(buffer);
        expect(bytesWritten == 100).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_buffer_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_buffer_001
     * @tc.number SUB_DF_FILEIO_WRITE_BUFFER_0100
     * @tc.desc   Test write(buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_buffer_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_buffer_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(buffer, 50);
        expect(bytesWritten == 50).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_buffer_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_position_000
     * @tc.number SUB_DF_FILEIO_WRITE_POSITION_0000
     * @tc.desc   Test write(position, buffer) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_position_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_position_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(50, buffer);
        expect(bytesWritten == 100).assertTrue();
        let pos = mapping.getPosition();
        expect(pos == 0).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_position_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_position_001
     * @tc.number SUB_DF_FILEIO_WRITE_POSITION_0100
     * @tc.desc   Test write(position, buffer, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_position_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_position_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        let bytesWritten = mapping.write(50, buffer, 50);
        expect(bytesWritten == 50).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_write_position_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_write_error_000
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0000
     * @tc.desc   Test write() interfaces. READ_ONLY mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_error_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_error_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file ;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_ONLY, 0, 11);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_write_error_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900053).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_write_error_001
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0100
     * @tc.desc   Test write() interfaces. Invalid position (negative).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_write_error_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_write_error_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(-1, buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_write_error_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

  /**
   * @tc.name   fileIO_test_write_error_002
   * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0200
   * @tc.desc   Test write() after unmap,Error code 13900052
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_error_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_error_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.unmapSync();
      let buffer = new ArrayBuffer(100);
      mapping.write(buffer);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_error_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900052).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });  

  /**
    * @tc.name   fileIO_test_write_error_003
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0300
    * @tc.desc   Test write() interfaces. data =null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('fileIO_test_write_error_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_error_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.write(null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_error_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      mapping.unmapSync();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });

  /**
    * @tc.name   fileIO_test_write_error_004
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0400
    * @tc.desc   Test write() interfaces.length=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_004');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.write(100,null);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_004 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_005
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0500
    * @tc.desc   Test write() interfaces. position =null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_005');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.write(null,buffer);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_005 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_006
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0600
    * @tc.desc   Test write() interfaces. data =null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_006');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       mapping.write(50,null);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_006 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_007
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0700
    * @tc.desc   Test write() interfaces.length=null.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_007');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       let bytesRead = mapping.write(50,buffer,null);
       console.log('fileIO_test_write_error_007 bytesRead ' + bytesRead);
       expect(bytesRead == 100).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     } catch (e) {
       console.log('fileIO_test_write_error_007 has failed for ' + e.message + ', code: ' + e.code);
       expect(false).assertTrue();
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_008
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0800
    * @tc.desc   Test write() interfaces. data =undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_error_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.write(undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_error_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020).assertTrue();
      mapping.unmapSync();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });

  /**
    * @tc.name   fileIO_test_write_error_009
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_0900
    * @tc.desc   Test write() interfaces.length=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_009');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.write(100,undefined);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_009 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_010
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_1000
    * @tc.desc   Test write() interfaces. position =undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_010');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       mapping.write(undefined,buffer);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_010 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_011
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_1100
    * @tc.desc   Test write() interfaces. data =undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_011');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       mapping.write(50,undefined);
       expect(false).assertTrue();
     } catch (e) {
       console.log('fileIO_test_write_error_011 has failed for ' + e.message + ', code: ' + e.code);
       expect(e.code === 13900020).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     }
   });

   /**
    * @tc.name   fileIO_test_write_error_012
    * @tc.number SUB_DF_FILEIO_WRITE_ERROR_1200
    * @tc.desc   Test write() interfaces.length=undefined.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_error_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
     let fpath = await nextFileName('fileIO_test_write_error_012');
     expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

     let file;
     let mapping;
     try {
       file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
       expect(isIntNum(file.fd)).assertTrue();
       mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
       expect(mapping != null).assertTrue();
       let buffer = new ArrayBuffer(100);
       let bytesRead = mapping.write(50,buffer,undefined);
       console.log('fileIO_test_write_error_012 bytesRead ' + bytesRead);
       expect(bytesRead == 100).assertTrue();
       mapping.unmapSync();
       fileIO.closeSync(file);
       fileIO.unlinkSync(fpath);
     } catch (e) {
       console.log('fileIO_test_write_error_012 has failed for ' + e.message + ', code: ' + e.code);
       expect(false).assertTrue();
     }
   });

   /**
     * @tc.name   fileIO_test_write_error_013
     * @tc.number SUB_DF_FILEIO_WRITE_ERROR_1300
     * @tc.desc   Test write() interfaces. Position exceeds limit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
   it('fileIO_test_write_error_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_error_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let file;
    let mapping;
    try {
      file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
      expect(mapping != null).assertTrue();
      mapping.setLimit(512);
      let buffer = new ArrayBuffer(100);
      mapping.write(600, buffer);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_error_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900051 || e.code === 13900020).assertTrue();
      mapping.unmapSync();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    }
  });

    /**
     * @tc.name   fileIO_test_msync_000
     * @tc.number SUB_DF_FILEIO_MSYNC_0000
     * @tc.desc   Test msync() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        mapping.msync().then(() => {
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_msync_000 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_msync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_001
     * @tc.number SUB_DF_FILEIO_MSYNC_0100
     * @tc.desc   Test msync(position, length) interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(50, buffer);
        mapping.msync(50, 100).then(() => {
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_msync_001 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_msync_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_000
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0000
     * @tc.desc   Test msync() interfaces. Invalid position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          mapping.msync(-1, 100).then(() => {
            expect(false).assertTrue();
            mapping.unmapSync();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          }).catch((err) => {
            console.log('fileIO_test_msync_error_000 error: ' + err.message + ', code: ' + err.code);
            expect(err.code == 13900020).assertTrue();
            mapping.unmapSync();
            fileIO.closeSync(file);
            fileIO.unlinkSync(fpath);
            done();
          });
        }catch(SyncErr){
          console.log('fileIO_test_msync_error_000 sync error: ' + SyncErr.message + ', code: ' + SyncErr.code);
          expect(SyncErr.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_001
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0100
     * @tc.desc   Test msync() interfaces. Invalid length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msync(0, -1);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msync_error_001 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_002
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0200
     * @tc.desc   Test msync() interfaces. position = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msync(null, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msync_error_002 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_003
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0300
     * @tc.desc   Test msync() interfaces. position = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msync(undefined, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msync_error_003 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_004
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0400
     * @tc.desc   Test msync() interfaces. length = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msync(100, null);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msync_error_004 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msync_error_005
     * @tc.number SUB_DF_FILEIO_MSYNC_ERROR_0500
     * @tc.desc   Test msync() interfaces. length = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msync_error_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msync_error_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msync(undefined, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msync_error_005 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msync_error_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_000
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_0000
     * @tc.desc   Test msyncSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_msyncSync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        mapping.msyncSync();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_msyncSync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_001
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_0100
     * @tc.desc   Test msyncSync(position, length) interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_msyncSync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        let buffer = new ArrayBuffer(100);
        mapping.write(50, buffer);
        mapping.msyncSync(50, 100);
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_msyncSync_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_000
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0000
     * @tc.desc   Test msyncSync() interfaces. Invalid position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.msyncSync(-1, 100);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_001
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0100
     * @tc.desc   Test msyncSync() interfaces. Invalid length.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.msyncSync(0, -1);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900020).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_002
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0200
     * @tc.desc   Test msyncSync() interfaces. position = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msyncSync(null, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msyncSync_error_002 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_003
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0300
     * @tc.desc   Test msyncSync() interfaces. position = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msyncSync(undefined, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msyncSync_error_003 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_004
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0400
     * @tc.desc   Test msyncSync() interfaces. length = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msyncSync(100, null);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msyncSync_error_004 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_msyncSync_error_005
     * @tc.number SUB_DF_FILEIO_MSYNCSYNC_ERROR_0500
     * @tc.desc   Test msyncSync() interfaces. length = undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_msyncSync_error_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_msyncSync_error_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
     
      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        try{
          await mapping.msyncSync(undefined, 100);
          expect(false).assertTrue();
        }catch(Err){
          console.log('fileIO_test_msyncSync_error_005 error: ' + Err.message + ', code: ' + Err.code);
          expect(Err.code === 13900020).assertTrue();
          mapping.unmapSync();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }
      } catch (e) {
        console.log('fileIO_test_msyncSync_error_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_000
     * @tc.number SUB_DF_FILEIO_UNMAP_0000
     * @tc.desc   Test unmap() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('fileIO_test_unmap_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmap().then(() => {
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        }).catch((err) => {
          console.log('fileIO_test_unmap_000 error: ' + err.message + ', code: ' + err.code);
          expect(false).assertTrue();
        });
      } catch (e) {
        console.log('fileIO_test_unmap_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_unmapSync_000
     * @tc.number SUB_DF_FILEIO_UNMAPSYNC_0000
     * @tc.desc   Test unmapSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmapSync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_unmapSync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      } catch (e) {
        console.log('fileIO_test_unmapSync_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_000
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_0000
     * @tc.desc   Test access after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_unmap_released_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        mapping.getPosition();
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unmap_released_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_001
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_0100
     * @tc.desc   Test read after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_unmap_released_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.read(buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unmap_released_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });

    /**
     * @tc.name   fileIO_test_unmap_released_002
     * @tc.number SUB_DF_FILEIO_UNMAP_RELEASED_0200
     * @tc.desc   Test write after unmap. Error code 13900052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_unmap_released_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
      let fpath = await nextFileName('fileIO_test_unmap_released_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      let file;
      let mapping;
      try {
        file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        mapping = fileIO.mmapSync(file, fileIO.MappingMode.READ_WRITE, 0, 1024);
        expect(mapping != null).assertTrue();
        mapping.unmapSync();
        let buffer = new ArrayBuffer(100);
        mapping.write(buffer);
        expect(false).assertTrue();
      } catch (e) {
        console.log('fileIO_test_unmap_released_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 13900052).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      }
    });
  });
}