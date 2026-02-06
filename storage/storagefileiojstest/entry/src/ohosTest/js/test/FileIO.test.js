/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio';
import { describe, it, expect, Level }from '@ohos/hypium'
import {
  FILE_CONTENT,
  prepareFile,
  nextFileName,
  prepareEmptyFile,
  randomString,
  fileName,
  forceRemoveDir
}
from './Common'
export default function fileIOTest() {
  describe('fileIOTest', function () {

    /**
     * @tc.number SUB_STORAGE_FileIO_open&closesync_0000
     * @tc.name fileio_test_open_close_sync_000
     * @tc.desc Function of API, openSync. The test file is exist.
     */
    it('fileio_test_open_close_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_close_sync_000');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_close_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0000
     * @tc.name fileio_test_open_000
     * @tc.desc Function of API, openSync(mode not for value). The test file is exist.
     */
    it('fileio_test_open_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o202);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0100
     * @tc.name fileio_test_open_001
     * @tc.desc Function of API, flags=0o100. mode=0o001
     */
    it('fileio_test_open_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o100, 0o001);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0200
     * @tc.name fileio_test_open_002
     * @tc.desc Function of API,
     */
    it('fileio_test_open_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_002 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0300
     * @tc.name fileio_test_open_003
     * @tc.desc Function of API, flags=0o100. mode=0o004
     */
    it('fileio_test_open_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o100, 0o004);
        expect(fd !== null).assertTrue();
        fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
      }catch (err) {
        console.info('fileio_test_open_003 has failed for ' + err);
        expect(err.message == "Bad file descriptor").assertTrue();
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0400
     * @tc.name fileio_test_open_004
     * @tc.desc Function of API, flags=0o101. mode=0o002
     */
    it('fileio_test_open_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o101, 0o002);
        expect(fd !== null).assertTrue();
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
      }catch (err) {
        console.info('fileio_test_open_004 has failed for ' + err);
        expect(err.message == "Bad file descriptor").assertTrue();
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0500
     * @tc.name fileio_test_open_005
     * @tc.desc Function of API, flags=0o102. mode=0o001.
     */
    it('fileio_test_open_005', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o001);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_005 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0600
     * @tc.name fileio_test_open_006
     * @tc.desc Function of API, flags=0o200. mode=0o700
     */
    it('fileio_test_open_006', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.openSync(fpath, 0o200, 0o700);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_006 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0700
     * @tc.name fileio_test_open_007
     * @tc.desc Function of API, flags=0o302. mode=0o700.
     */
    it('fileio_test_open_007', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_007');
      try {
        let fd = fileio.openSync(fpath, 0o302, 0o700);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_007 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0800
     * @tc.name fileio_test_open_008
     * @tc.desc Function of API, flags=0o102. mode=0o700
     */
    it('fileio_test_open_008', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_008');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o700);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_008 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0900
     * @tc.name fileio_test_open_009
     * @tc.desc Function of API, flags=0o302.
     */
    it('fileio_test_open_009', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_009');
      try {
        fileio.openSync(fpath, 0o302);
      }catch (err) {
        console.info('fileio_test_open_009 has failed for ' + err);
        expect(err.message == "called with O_CREAT/O_TMPFILE but no mode").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1000
     * @tc.name fileio_test_open_010
     * @tc.desc Function of API, flags=0o402.
     */
    it('fileio_test_open_010', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_010');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o402);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_010 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1100
     * @tc.name fileio_test_open_011
     * @tc.desc Function of API, flags=0o1000.
     */
    it('fileio_test_open_011', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_011');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o1000);
        expect(fd !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_011 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1200
     * @tc.name fileio_test_open_012
     * @tc.desc Function of API, flags=0o1001.
     */
    it('fileio_test_open_012', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_012');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o1001);
        expect(fd !== null).assertTrue();
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
      } 
      catch (err) {
        console.info('fileio_test_open_012 has failed for ' + err);
        expect(err.message == "Bad file descriptor").assertTrue();
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1300
     * @tc.name fileio_test_open_013
     * @tc.desc Function of API, flags=0o2002.
     */
    it('fileio_test_open_013', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_013');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2002);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_013 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1400
     * @tc.name fileio_test_open_014
     * @tc.desc Function of API, flags=0o4002.
     */
    it('fileio_test_open_014', Level.LEVEL1, async function (done) {
      let fpath = await nextFileName('fileio_test_open_014');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o4002);
        expect(fd !== null).assertTrue();
        let fd2 = fileio.openSync(fpath, 0o4002);
        expect(fd2 !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.closeSync(fd2);
        fileio.unlinkSync(fpath);
        done();
      } 
      catch (err) {
        console.info('fileio_test_open_014 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1500
     * @tc.name fileio_test_open_015
     * @tc.desc Function of API, flags=0o20002.
     */
    it('fileio_test_open_015', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_015');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o20002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_015 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1600
     * @tc.name fileio_test_open_016
     * @tc.desc Function of API, flags=0o10002.
     */
    it('fileio_test_open_016', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_016');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o10002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_016 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1700
     * @tc.name fileio_test_open_017
     * @tc.desc Function of API, flags=0o4010002.
     */
    it('fileio_test_open_017', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_017');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o4010002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_017 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1800
     * @tc.name fileio_test_open_018
     * @tc.desc Function of API, flags=0o100002.
     */
    it('fileio_test_open_018', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_018');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o100002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_018 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1900
     * @tc.name fileio_test_open_019
     * @tc.desc Function of API, flags=0o40002. mode=0o700
     */
    it('fileio_test_open_019', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_019');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.openSync(fpath, 0o40002, 0o700);
        fileio.unlinkSync(fpath);
      }catch (err) {
        console.info('fileio_test_open_019 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2100
     * @tc.name fileio_test_open_021
     * @tc.desc Function of API, flags=0o2000002.
     */
    it('fileio_test_open_021', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_021');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2000002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_021 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2200
     * @tc.name fileio_test_open_022
     * @tc.desc Function of API, flags=0o200000.
     */
    it('fileio_test_open_022', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_open_022') + 'd';
      fileio.mkdirSync(dpath);
      try {
        fileio.openSync(dpath, 0o200000, 0o666);
        fileio.rmdirSync(dpath);
      }
      catch (err) {
        console.info('fileio_test_open_022 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2300
     * @tc.name fileio_test_open_023
     * @tc.desc Function of API, flags=0o400002.
     */
    it('fileio_test_open_023', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_023');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o400002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_023 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2400
     * @tc.name fileio_test_open_024
     * @tc.desc Function of API, flags=0o1000002.mode=0o700
     */
    it('fileio_test_open_024', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_024');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o1000002, 0o700);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
      catch (err) {
        console.info('fileio_test_open_024 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2500
     * @tc.name fileio_test_open_025
     * @tc.desc Function of API, flags=0o10000002.
     */
    it('fileio_test_open_025', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_025');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o10000002);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
      catch (err) {
        console.info('fileio_test_open_025 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2600
     * @tc.name fileio_test_open_026
     * @tc.desc Function of API,flags=0o002.mode=0o700
     */
    it('fileio_test_open_026', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_026');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o700);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_026 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2700
     * @tc.name fileio_test_open_027
     * @tc.desc Function of API, flags=0o002.mode=0o400
     */
    it('fileio_test_open_027', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_027');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o400);
        expect(fd !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        throw new Error('read only');
      } 
      catch (err) {
        console.info('fileio_test_open_027 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2800
     * @tc.name fileio_test_open_028
     * @tc.desc Function of API, flags=0o002.mode=0o200
     */
    it('fileio_test_open_028', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_028');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o200);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        throw new Error('write only');
      } 
      catch (err) {
        console.info('fileio_test_open_028 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_2900
     * @tc.name fileio_test_open_029
     * @tc.desc Function of API, flags=0o002.mode=0o100
     */
    it('fileio_test_open_029', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_029');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o100);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_029 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3000
     * @tc.name fileio_test_open_030
     * @tc.desc Function of API,  flags=0o002.mode=0o070
     */
    it('fileio_test_open_030', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_030');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o070);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_030 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3100
     * @tc.name fileio_test_open_031
     * @tc.desc Function of API, flags=0o002.mode=0o040
     */
    it('fileio_test_open_031', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_031');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o040);
        expect(fd !== null).assertTrue();
        let red = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(red !== null).assertTrue();
        fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        throw new Error('read only');
      } 
      catch (err) {
        console.info('fileio_test_open_031 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3200
     * @tc.name fileio_test_open_032
     * @tc.desc Function of API, flags=0o002.mode=0o020
     */
    it('fileio_test_open_032', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_032');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o020);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        throw new Error('write only');
      } 
      catch (err) {
        console.info('fileio_test_open_032 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3300
     * @tc.name fileio_test_open_033
     * @tc.desc Function of API, flags=0o002.mode=0o010
     */
    it('fileio_test_open_033', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_033');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o010);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_033 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3400
     * @tc.name fileio_test_open_034
     * @tc.desc Function of API, flags=0o002.mode=0o007
     */
    it('fileio_test_open_034', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_034');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o007);
        expect(fd !== null).assertTrue();
        let ret = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(ret !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_034 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3500
     * @tc.name fileio_test_open_035
     * @tc.desc Function of API, flags=0o002.mode=0o004
     */
    it('fileio_test_open_035', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_035');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o004);
        expect(fd !== null).assertTrue();
        let ret = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        expect(ret !== null).assertTrue();
        fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        throw new Error('read only');
      } 
      catch (err) {
        console.info('fileio_test_open_035 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3600
     * @tc.name fileio_test_open_036
     * @tc.desc Function of API, flags=0o002.mode=0o002
     */
    it('fileio_test_open_036', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_036');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o002);
        expect(fd !== null).assertTrue();
        let wri = fileio.writeSync(fd, 'hello', {
          encoding: 'utf-8',
          offset: 1,
          length: 1,
        });
        expect(wri !== null).assertTrue();
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
        });
        throw new Error('write only');
      } 
      catch (err) {
        console.info('fileio_test_open_036 has failed for ' + err);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3700
     * @tc.name fileio_test_open_037
     * @tc.desc Function of API, flags=0o002.mode=0o001
     */
    it('fileio_test_open_037', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_037');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o002, 0o001);
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_037 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_3800
     * @tc.name fileio_test_open_038
     * @tc.desc Function of API, flags=0o102.mode=0o700
     */
    it('fileio_test_open_038', Level.LEVEL1, async function () {
      let txt = randomString(4100);
      let fpath = await nextFileName(txt);
      try {
        fileio.openSync(fpath, 0o102, 0o700);
      } 
      catch (err) {
        console.info('fileio_test_open_038 has failed for ' + err);
        expect(err.message == 'Filename too long').assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0100
     * @tc.name fileio_test_open_sync_001
     * @tc.desc Function of API, openSync(flags=0o200). The test file is exist.
     */
    it('fileio_test_open_sync_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_sync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o200);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0200
     * @tc.name fileio_test_open_sync_002
     * @tc.desc Function of API, openSync(flags=0o201). The test file is exist.
     */
    it('fileio_test_open_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_sync_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o201);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_002 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0300
     * @tc.name fileio_test_open_sync_003
     * @tc.desc Function of API, openSync(flags=0o202). The test file is exist.
     */
    it('fileio_test_open_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o202);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0400
     * @tc.name fileio_test_open_sync_004
     * @tc.desc Function of API, openSync(flags=0o102, mode=0o777). The test file is not exist.
     */
    it('fileio_test_open_sync_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_open_sync_004');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o777);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_004 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0500
     * @tc.name fileio_test_open_sync_005
     * @tc.desc Function of API, openSync(flags not for value, mode not for value).
     */
    it('fileio_test_open_sync_005', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_open_sync_005') + 'd'
      try {
        fileio.mkdirSync(dpath);
        let fd = fileio.openSync(dpath);
        expect(fd !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_005 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0600
     * @tc.name fileio_test_open_sync_006
     * @tc.desc Function of API, openSync(flags=0o1, illegal parameter).
     */
    it('fileio_test_open_sync_006', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_open_sync_006') + 'd'
      try {
        fileio.mkdirSync(dpath);
        fileio.openSync(dpath, 0o1);
      }catch (err) {
        console.info('fileio_test_open_sync_006 has failed for ' + err);
        expect(err.message == "Is a directory").assertTrue();
        fileio.rmdirSync(dpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0700
     * @tc.name fileio_test_open_sync_007
     * @tc.desc Function of API, openSync(fpath too long).
     */
    it('fileio_test_open_sync_007', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_open_sync_007');
      fileio.mkdirSync(dpath);
      try {
        for (let i = 0; i < 16; i++) {
          if (i == 15) {
            let fpath = dpath + '/f' + i;
            fileio.openSync(fpath, 0o102, 0o777);
            fileio.unlinkSync(fpath);
          } else {
            dpath = dpath + '/d' + i;
            fileio.mkdirSync(dpath);
          }
        }
        throw new Error('fpath too long');
      } 
      catch (err) {
        console.info('fileio_test_open_sync_007 has failed for ' + err);
        forceRemoveDir(dpath, 15);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0800
     * @tc.name fileio_test_open_sync_008
     * @tc.desc Function of API, openSync(filename too long).
     */
    it('fileio_test_open_sync_008', Level.LEVEL1, async function () {
      let fpath = await nextFileName(randomString(256));
      try {
        fileio.openSync(fpath, 0o102, 0o777);
      } 
      catch (err) {
        console.info('fileio_test_open_sync_008 has failed for ' + err);
        expect(err.message == "Filename too long").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_0900
     * @tc.name fileio_test_open_sync_009
     * @tc.desc Function of API, openSync(dir layers too long).
     */
    it('fileio_test_open_sync_009', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_open_sync_009');
      fileio.mkdirSync(dpath);
      try {
        for (let i = 0; i < 113; i++) {
          if (i == 112) {
            let fpath = dpath + '/f' + i
            fileio.openSync(fpath, 0o102, 0o777);
            fileio.unlinkSync(fpath);
          } else {
            dpath = dpath + '/d' + i
            fileio.mkdirSync(dpath);
          }
        }
        throw new Error('dir layers too long');
      } 
      catch (err) {
        console.info('fileio_test_open_sync_009 has failed for ' + err);
        forceRemoveDir(dpath, 112);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_OpenSync_1000
     * @tc.name fileio_test_open_sync_010
     * @tc.desc Function of API, openSync(filename has special characters).
     */
    it('fileio_test_open_sync_010', Level.LEVEL1, async function () {
      let fpath = await nextFileName('?*:<>/|');
      try {
        fileio.openSync(fpath, 0o102, 0o777);
      } catch (err) {
        console.info('fileio_test_open_sync_010 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_CloseSync_0000
     * @tc.name fileio_test_close_sync_000
     * @tc.desc Function of API, close. The test file is not exist.
     */
    it('fileio_test_close_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_chmod_sync_000');
      try {
        fileio.closeSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_close_sync_000 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_CloseSync_0100
     * @tc.name fileio_test_close_sync_001
     * @tc.desc Function of API, close(fpath=vaild value). The test file is not exist.
     */
    it('fileio_test_close_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.closeSync(-1);
        expect(false).assertTrue();
      } 
      catch (err) {
        console.info('fileio_test_close_sync_001 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0000
     * @tc.name fileio_test_access_sync_000
     * @tc.desc Function of API,access. The test file is exist.
     */
    it('fileio_test_access_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.accessSync(fpath);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0100
     * @tc.name fileio_test_access_sync_001
     * @tc.desc Function of API, launch via fileio. The test file is not exist.
     */
    it('fileio_test_access_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.accessSync(1);
      } catch (err) {
        console.info('fileio_test_access_sync_001 has failed for ' + err);
        expect(err.message == "Invalid path").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0200
     * @tc.name fileio_test_access_sync_002
     * @tc.desc Function of API, access. The test file is not exist.
     */
    it('fileio_test_access_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileIOTest');
      try {
        fileio.accessSync(fpath);
      }catch (err) {
        console.info('fileio_test_access_sync_002 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0300
     * @tc.name fileio_test_access_sync_003
     * @tc.desc Function of API, access(mode=1). The test file is exist and have the authority.
     */
    it('fileio_test_access_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_sync_004');
      expect(prepareEmptyFile(fpath)).assertTrue();
      try {
        fileio.accessSync(fpath);
        fileio.accessSync(fpath, 1);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_004 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0400
     * @tc.name fileio_test_access_sync_004
     * @tc.desc Function of API, access(mode=2). The test file is exist and have the authority.
     */
    it('fileio_test_access_sync_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.accessSync(fpath);
        fileio.accessSync(fpath, 2);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_004 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0500
     * @tc.name fileio_test_access_sync_005
     * @tc.desc Function of API, access(fpath=dir address). The test dir is exist.
     */
    it('fileio_test_access_sync_005', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_access_sync_005') + 'd'
      try {
        fileio.mkdirSync(dpath);
        fileio.accessSync(dpath);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_005 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0600
     * @tc.name fileio_test_access_sync_006
     * @tc.desc Function of API, access(fpath=dir address). The test dir is not exist.
     */
    it('fileio_test_access_sync_006', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_access_sync_006') + 'd'
      try {
        fileio.accessSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_006 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_AccessSync_0700
     * @tc.name fileio_test_access_sync_007
     * @tc.desc Function of API, access(mode=4).
     */
    it('fileio_test_access_sync_007', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_sync_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.accessSync(fpath);
        fileio.accessSync(fpath, 4);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_access_sync_007 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_Access_Promise_001
     * @tc.name fileio_test_access_promise_001
     * @tc.desc Function of API, access(mode=4).
     */
    it('fileio_test_access_promise_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_promise_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      let fd = fileio.access(fpath).then(() => {
        expect(fd !== null).assertTrue();
        fileio.unlinkSync(fpath);
        console.info('file access Success');
      }).catch(function(err) {
        console.info("file access err: "  + JSON.stringify(err));
      });
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_Access_Async_001
     * @tc.name fileio_test_access_async_001
     * @tc.desc Function of API, access(mode=4).
     */
    it('fileio_test_access_async_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_access_async_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd = fileio.access(fpath, function (err) {
        expect(fd !== null).assertTrue();
        fileio.unlinkSync(fpath);
      });
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_UnlinkSync_0000
     * @tc.name fileio_test_unlink_sync_000
     * @tc.desc Function of API,unlinkSync. The test file is exist.
     */
    it('fileio_test_unlink_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_unlink_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_unlink_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_UnlinkSync_0100
     * @tc.name fileio_test_unlink_sync_001
     * @tc.desc Function of API, no parameter.
     */
    it('fileio_test_unlink_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.unlinkSync(1);
      } 
      catch (err) {
        console.info('fileio_test_unlink_sync_001 has failed for ' + err);
        expect(err.message == "Invalid path").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_UnlinkSync_0200
     * @tc.name fileio_test_unlink_sync_002
     * @tc.desc Function of API, invalid parameter
     */
    it('fileio_test_unlink_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileIOTest');
      try {
        fileio.unlinkSync(fpath);
      } catch (err) {
        console.info('fileio_test_unlink_sync_002 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0000
     * @tc.name fileio_test_write_sync_000
     * @tc.desc Function of API, writeSync.
     */
    it('fileio_test_write_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_000');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        let res = fileio.writeSync(fd, FILE_CONTENT);
        expect(typeof(res) == 'number').assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0100
     * @tc.name fileio_test_write_sync_001
     * @tc.desc Function of API, encoding=UTF-8.
     */
    it('fileio_test_write_sync_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_001');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        let res = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
        });
        expect(typeof(res) == 'number').assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0200
     * @tc.name fileio_test_write_sync_002
     * @tc.desc Function of API, offset=1.
     */
    it('fileio_test_write_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_002');
      let text = '0123456789abcdefg';
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        expect(fileio.writeSync(fd, text, {
          offset: 1,
        }) == text.length - 1).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_002 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0300
     * @tc.name fileio_test_write_sync_003
     * @tc.desc Function of API, length = - 1.
     */
    it('fileio_test_write_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_003');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        expect(fileio.writeSync(fd, FILE_CONTENT, {
          length: FILE_CONTENT.length - 1,
        }) == (FILE_CONTENT.length - 1)).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0400
     * @tc.name fileio_test_write_sync_004
     * @tc.desc Function of API, length = 1, offset = 1.
     */
    it('fileio_test_write_sync_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_004');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        let res = fileio.writeSync(fd, FILE_CONTENT, {
          offset: 1,
          length: 1,
        });
        expect(typeof(res) == 'number').assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_004 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0500
     * @tc.name fileio_test_write_sync_005
     * @tc.desc Function of API, invalid offset.
     */
    it('fileio_test_write_sync_005', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_005');
      const invalidOffset = 999
      let fd
      try {
        fd = fileio.openSync(fpath, 0o102, 0o666);
        expect(fd).assertInstanceOf('Number');
        expect(fileio.writeSync(fd, FILE_CONTENT, {
          offset: invalidOffset,
        }) == 1).assertTrue();
        throw new Error('invalid offset');
      } 
      catch (err) {
        console.info('fileio_test_write_sync_005 has failed for ' + err);
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0600
     * @tc.name fileio_test_write_sync_006
     * @tc.desc Function of API, invalid length.
     */
    it('fileio_test_write_sync_006', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_006');
      const invalidLength = 999
      let fd
      try {
        fd = fileio.openSync(fpath, 0o102, 0o666);
        expect(fd).assertInstanceOf('Number');
        expect(fileio.writeSync(fd, FILE_CONTENT, {
          length: invalidLength,
        }) == 1);
        throw new Error('invalid length');
      } 
      catch (err) {
        console.info('fileio_test_write_sync_006 has failed for ' + err);
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0700
     * @tc.name fileio_test_write_sync_007
     * @tc.desc Function of API, no parameter.
     */
    it('fileio_test_write_sync_007', Level.LEVEL1, async function () {
      try {
        fileio.writeSync(1, 1);
      }catch (err) {
        console.info('fileio_test_write_sync_007 has failed for ' + err);
        expect(err.message == "Illegal write buffer or encoding").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0800
     * @tc.name fileio_test_write_sync_008
     * @tc.desc Function of API, invalid parameter.
     */
    it('fileio_test_write_sync_008', Level.LEVEL1, async function () {
      try {
        fileio.writeSync(-1, FILE_CONTENT);
        expect(false).assertTrue();
      } 
      catch (err) {
        console.info('fileio_test_write_sync_008 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_0900
     * @tc.name fileio_test_write_sync_009
     * @tc.desc Function of API, Set all parameters.
     */
    it('fileio_test_write_sync_009', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_009');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o666);
        let res = fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'utf-8',
          position: 0,
          offset: 1,
          length: 1,
        });
        expect(typeof(res) == 'number').assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_write_sync_009 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_WriteSync_1000
     * @tc.name fileio_test_write_sync_010
     * @tc.desc Function of API, encoding=gb2312.
     */
    it('fileio_test_write_sync_010', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_write_sync_010');
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      try {
        fileio.writeSync(fd, FILE_CONTENT, {
          encoding: 'gb2312',
        });
      }catch (err) {
        console.info('fileio_test_write_sync_010 has failed for ' + err);
        expect(err.message == "Illegal write buffer or encoding").assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0100
     * @tc.name fileio_test_read_sync_001
     * @tc.desc Function of API, offset = 1.
     */
    it('fileio_test_read_sync_001', Level.LEVEL1, async function () {
      let bufLen = 5
      expect(FILE_CONTENT.length > bufLen).assertTrue();
      let fpath = await nextFileName('fileio_test_read_sync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let len = fileio.readSync(fd, new ArrayBuffer(bufLen), {
          offset: 1,
        });
        expect(len == bufLen - 1).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0200
     * @tc.name fileio_test_read_sync_002
     * @tc.desc Function of API, length = 1.
     */
    it('fileio_test_read_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let len = fileio.readSync(fd, new ArrayBuffer(4096), {
          length: 1,
        });
        expect(len == 1).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_002 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0300
     * @tc.name fileio_test_read_sync_003
     * @tc.desc Function of API, invalid offset
     */
    it('fileio_test_read_sync_003', Level.LEVEL1, async function () {
      let fd
      const invalidOffset = 99999
      let fpath = await nextFileName('fileio_test_read_sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fd = fileio.openSync(fpath, 0o2);
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: invalidOffset,
        });
      }catch (err) {
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        console.info('fileio_test_read_sync_003 has failed for ' + err);
        expect(err.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0300
     * @tc.name fileio_test_read_sync_004
     * @tc.desc Function of API, invalid length.
     */
    it('fileio_test_read_sync_004', Level.LEVEL1, async function () {
      let fd
      const invalidLength = 9999
      let fpath = await nextFileName('fileio_test_read_sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      try {
        fd = fileio.openSync(fpath, 0o2);
        fileio.readSync(fd, new ArrayBuffer(4096), {
          length: invalidLength,
        });
      }catch (err) {
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        console.info('fileio_test_read_sync_004 has failed for ' + err);
        expect(err.message == "Invalid option.length").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0500
     * @tc.name fileio_test_read_sync_005
     * @tc.desc Function of API, fpatch = -1.
     */
    it('fileio_test_read_sync_005', Level.LEVEL1, async function () {
      try {
        fileio.readSync(-1, new ArrayBuffer(4096));
      } 
      catch (err) {
        console.info('fileio_test_read_sync_005 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0600
     * @tc.name fileio_test_read_sync_006
     * @tc.desc Function of API, offset & length & position = 1.
     */
    it('fileio_test_read_sync_006', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_006');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let len = fileio.readSync(fd, new ArrayBuffer(4096), {
          position: 1,
        });
        expect(len == FILE_CONTENT.length - 1);
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_006 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0700
     * @tc.name fileio_test_read_sync_007
     * @tc.desc Function of API, invalid position.
     */
    it('fileio_test_read_sync_007', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_007');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let invalidPos = FILE_CONTENT.length;
        let len = fileio.readSync(fd, new ArrayBuffer(4096), {
          position: invalidPos,
        });
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_007 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0800
     * @tc.name fileio_test_read_sync_008
     * @tc.desc Function of API, Enter all parameters correctly.
     */
    it('fileio_test_read_sync_008', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_008');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let len = fileio.readSync(fd, new ArrayBuffer(4096), {
          position: 1,
          offset: 1,
          length: 1,
        });
        expect(len == 1).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_008 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_0900
     * @tc.name fileio_test_read_sync_009
     * @tc.desc Function of API, Set offset and length.
     */
    it('fileio_test_read_sync_009', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_009');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let len = fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: 1,
          length: 1,
        });
        expect(len == 1).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_read_sync_009 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_ReadSync_1000
     * @tc.name fileio_test_read_sync_010
     * @tc.desc Function of API, Set error parameters (options).
     */
    it('fileio_test_read_sync_010', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_read_sync_010');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd;
      try {
        fd = fileio.openSync(fpath, 0o2);
        fileio.readSync(fd, new ArrayBuffer(4096), {
          offset: -1,
          length: 1,
        });
      }catch (err) {
        console.info('fileio_test_read_sync_010 has failed for ' + err);
        expect(err.message == "Invalid option.offset, positive integer is desired").assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      }
    });

    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0000
     * @tc.name fileio_test_copy_file_sync_000
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, same path, file not same.
     */
    it('fileio_test_copy_file_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_000');
      let fpathTarget = fpath + 'tgt'
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.copyFileSync(fpath, fpathTarget);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0100
     * @tc.name fileio_test_copy_file_sync_001
     * @tc.desc Function of API, copy. fpatch is invalid, fpathTarget is vaild, same path, file not same.
     */
    it('fileio_test_copy_file_sync_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_001') + 'd'
      let fpathTarget = fpath + 'tgt'
      try {
        fileio.copyFileSync(fpath, fpathTarget);
      }catch (err) {
        console.info('fileio_test_copy_file_sync_001 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0200
     * @tc.name fileio_test_copy_file_sync_002
     * @tc.desc Function of API, copyFileSync. fpath is vaild, fpathTarget is invalid.
     */
    it('fileio_test_copy_file_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_002');
      try {
        fileio.copyFileSync(fpath, 0);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_002 has failed for ' + err);
        expect(err.message == "The first/second argument requires filepath/fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0300
     * @tc.name fileio_test_copy_file_sync_003
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, path not same, file not same.
     */
    it('fileio_test_copy_file_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_003');
      let fpathTarget = fpath + 'f1'
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.copyFileSync(fpath, fpathTarget);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0400
     * @tc.name fileio_test_copy_file_sync_004
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, path not same, file not same.
     */
    it('fileio_test_copy_file_sync_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_004');
      let fpathTarget = await fileName('fileio_test_copy_file_sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.copyFileSync(fpath, fpathTarget);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_004 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0500
     * @tc.name fileio_test_copy_file_sync_005
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, path not same, file not same.
     */
    it('fileio_test_copy_file_sync_005', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_005');
      let fpathTarget = fpath
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.copyFileSync(fpath, fpathTarget);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_005 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0600
     * @tc.name fileio_test_copy_file_sync_006
     * @tc.desc Function of API, copy.When missing parameters.
     */
    it('fileio_test_copy_file_sync_006', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_006');
      try {
        fileio.copyFileSync(fpath);
      }catch (err) {
        console.info('fileio_test_copy_file_sync_006 has failed for ' + err);
        expect(err.message == "Number of arguments unmatched").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0700
     * @tc.name fileio_test_copy_file_sync_007
     * @tc.desc Function of API, copy. fpatch is invalid, fpathTarget is invalid.
     */
    it('fileio_test_copy_file_sync_007', Level.LEVEL1, async function () {
      try {
        fileio.copyFileSync(-1, -1);
      } catch (err) {
        console.info('fileio_test_copy_file_sync_007 has failed for ' + err);
        expect(err.message == "The first/second argument requires filepath/fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0800
     * @tc.name fileio_test_copy_file_sync_008
     * @tc.desc Function of API, parameter more than 4096.
     */
    it('fileio_test_copy_file_sync_008', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_008');
      fileio.openSync(fpath, 0o102, 0o777);
      let dpath = await nextFileName('fileio_test_copy_file_sync_008') + 'd';
      fileio.mkdirSync(dpath);
      try {
        for (let i = 0; i < 16; i++) {
          if (i == 15) {
            let fpathTarget = dpath + '/f' + i;
            fileio.copyFileSync(fpath, fpathTarget);
            fileio.unlinkSync(fpath);
            fileio.unlinkSync(fpathTarget);
          } else {
            dpath = dpath + '/d' + i;
            fileio.mkdirSync(dpath);
          }
        }
        throw new Error('parameter more than 4096');
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_008 has failed for ' + err);
        forceRemoveDir(dpath, 15);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_0900
     * @tc.name fileio_test_copy_file_sync_009
     * @tc.desc Function of API, filename is too long.
     */
    it('fileio_test_copy_file_sync_009', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_009');
      fileio.openSync(fpath, 0o102, 0o777);
      let fpathTarget = await nextFileName(randomString(256));
      try {
        fileio.copyFileSync(fpath, fpathTarget);
      } 
      catch (err) {
        fileio.unlinkSync(fpath);
        console.info('fileio_test_copy_file_sync_009 has failed for ' + err);
        expect(err.message == 'Filename too long').assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_1000
     * @tc.name fileio_test_copy_file_sync_010
     * @tc.desc Function of API, dir layers too long
     */
    it('fileio_test_copy_file_sync_010', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_010');
      fileio.openSync(fpath, 0o102, 0o777);
      let dpath = await nextFileName('fileio_test_copy_file_sync_010') + 'd';
      fileio.mkdirSync(dpath);
      try {
        for (let i = 0; i < 113; i++) {
          if (i == 112) {
            let fpathTarget = dpath + '/f' + i
            fileio.copyFileSync(fpath, fpathTarget);
            fileio.unlinkSync(fpath);
            fileio.unlinkSync(fpathTarget);
          } else {
            dpath = dpath + '/d' + i
            fileio.mkdirSync(dpath);
          }
        }
        throw new Error('dir layers too long');
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_010 has failed for ' + err);
        forceRemoveDir(dpath, 112);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_1100
     * @tc.name fileio_test_copy_file_sync_011
     * @tc.desc Function of API, special parameter.
     */
    it('fileio_test_copy_file_sync_011', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_011');
      fileio.openSync(fpath, 0o102, 0o777);
      let fpathTarget = await nextFileName('?*:<>/|');
      try {
        fileio.copyFileSync(fpath, fpathTarget);
      } 
      catch (err) {
        fileio.unlinkSync(fpath);
        console.info('fileio_test_copy_file_sync_011 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_1200
     * @tc.name fileio_test_copy_file_sync_012
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, same path, file not same, mode is 0.
     */
    it('fileio_test_copy_file_sync_012', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_sync_012');
      let fpathTarget = fpath + 'tgt'
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.copyFileSync(fpath, fpathTarget, 0);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_copy_file_sync_012 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_copyFileSync_1200
     * @tc.name fileio_test_copy_file_async_001
     * @tc.desc Function of API, copy. fpatch is vaild, fpathTarget is vaild, same path, file not same, mode is 0.
     */
    it('fileio_test_copy_file_async_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_copy_file_async_001');
      let fpathTarget = fpath + 'tgt'
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  
      await fileio.copyFile(fpath, fpathTarget).then(()=> {
        fileio.unlinkSync(fpath);
        expect(fileio.unlinkSync(fpathTarget) !== null).assertTrue();
        console.info('fileio_test_copy_file_async_001 Success');
      }).catch((err) => {
        console.info("fileio_test_copy_file_async_001 err: "  + JSON.stringify(err));
      });
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_truncateSync_0000
     * @tc.name fileio_test_truncate_sync_000
     * @tc.desc Function of API, truncateSync.
     */
    it('fileio_test_truncate_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_truncate_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        expect(fileio.truncateSync(fpath, 10) !== null).assertTrue();
        expect(fileio.statSync(fpath).size == 10).assertTrue();
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_truncate_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_truncateSync_0100
     * @tc.name fileio_test_truncate_sync_001
     * @tc.desc Function of API, no value for parameter.
     */
    it('fileio_test_truncate_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.truncateSync();
      }catch (err) {
        console.info('fileio_test_truncate_sync_001 has failed for ' + err);
        expect(err.message == "Number of arguments unmatched").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_truncateSync_0200
     * @tc.name fileio_test_truncate_sync_002
     * @tc.desc Function of API, no invalid parameter.
     */
    it('fileio_test_truncate_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_truncate_sync_001');
      try {
        fileio.truncateSync(fpath);
      }catch (err) {
        console.info('fileio_test_truncate_sync_002 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_truncateSync_0300
     * @tc.name fileio_test_truncate_sync_003
     * @tc.desc Function of API, .
     */
    it('fileio_test_truncate_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_truncate_sync_003');
      try {
        fileio.truncateSync(fpath, -1);
      }catch (err) {
        console.info('fileio_test_truncate_sync_003 has failed for ' + err);
        expect(err.message == "Invalid argument").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0000
     * @tc.name fileio_test_rename_sync_000
     * @tc.desc Function of API, renameSync. The test file is exist,
     * fpathTarget is not same with fpatch, file name are same.
     */
    it('fileio_test_rename_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_rename_sync_000');
      let fpathTarget = fpath + 'tgt'
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.renameSync(fpath, fpathTarget);
        fileio.accessSync(fpathTarget);
        fileio.unlinkSync(fpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_rename_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0100
     * @tc.name fileio_test_rename_sync_001
     * @tc.desc Function of API, renameSync. The test file is not exist, 
     * fpathTarget is not same with fpatch, file name are same.
     */
    it('fileio_test_rename_sync_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_rename_sync_001');
      let fpathTarget = fpath + 'tgt'
      try {
        fileio.renameSync(fpath, fpathTarget);
      }catch (err) {
        console.info('fileio_test_rename_sync_001 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0200
     * @tc.name fileio_test_rename_sync_002
     * @tc.desc Function of API, renameSync. The test file is exist, fpathTarget is invalid.
     */
    it('fileio_test_rename_sync_002', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_rename_sync_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.renameSync(fpath, '/');
      }catch (err) {
        fileio.unlinkSync(fpath);
        console.info('fileio_test_rename_sync_002 has failed for ' + err);
        expect(err.message == "Cross-device link").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0300
     * @tc.name fileio_test_rename_sync_003
     * @tc.desc Function of API, renameSync.
     * The test file is not exist, fpathTarget is same with fpatch, file name are same.
     */
    it('fileio_test_rename_sync_003', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_rename_sync_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        console.info('fileio_test_rename_sync_003 Test start');
        fileio.renameSync(fpath, fpath);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_rename_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0400
     * @tc.name fileio_test_rename_sync_004
     * @tc.desc Function of API, no fpath parameter.
     */
    it('fileio_test_rename_sync_004', Level.LEVEL1, async function () {
      try {
        fileio.renameSync(1, 1);
      } 
      catch (err) {
        console.info('fileio_test_rename_sync_004 has failed for ' + err);
        expect(err.message == "Invalid src").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0500
     * @tc.name fileio_test_rename_sync_005
     * @tc.desc Function of API, no fpathTarget parameter.
     */
    it('fileio_test_rename_sync_005', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_rename_sync_005');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        fileio.renameSync(fpath, 1);
      } 
      catch (err) {
        fileio.unlinkSync(fpath);
        console.info('fileio_test_rename_sync_005 has failed for ' + err);
        expect(err.message == "Invalid dest").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0600
     * @tc.name fileio_test_rename_sync_006
     * @tc.desc Function of API, rename dir.
     */
    it('fileio_test_rename_sync_006', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_rename_sync_006') + 'd'
      let dpathTarget = await nextFileName('fileio_test_rename_sync_006-1') + 'd'
      try {
        fileio.mkdirSync(dpath);
        fileio.renameSync(dpath, dpathTarget);
        fileio.accessSync(dpathTarget);
        fileio.rmdirSync(dpathTarget);
      } 
      catch (err) {
        console.info('fileio_test_rename_sync_006 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0700
     * @tc.name fileio_test_rename_sync_007
     * @tc.desc Function of API, dir not exist. The test dir is not exist.
     */
    it('fileio_test_rename_sync_007', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_rename_sync_007') + 'd'
      let dpathTarget = await nextFileName('fileio_test_rename_sync_007-1') + 'd'
      try {
        fileio.renameSync(dpath, dpathTarget);
      }catch (err) {
        console.info('fileio_test_rename_sync_007 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0800
     * @tc.name fileio_test_rename_sync_008
     * @tc.desc Function of API, fpathTarget not exist. fpathTarget not exist.
     */
    it('fileio_test_rename_sync_008', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_rename_sync_008') + 'd'
      let dpathTarget = '/data/accounts/account_0/appdata/aaa/bbb/fileio_test_rename_sync_008-1d'
      try {
        fileio.mkdirSync(dpath);
        fileio.renameSync(dpath, dpathTarget);
      }catch (err) {
        fileio.rmdirSync(dpath);
        console.info('fileio_test_rename_sync_008 has failed for ' + err);
        expect(err.message == "No such file or directory").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_RenameSync_0900
     * @tc.name fileio_test_rename_sync_009
     * @tc.desc Function of API, fpath is same with fpathTarget. fpath is same with fpathTarget.
     */
    it('fileio_test_rename_sync_009', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_rename_sync_009') + 'd'
      try {
        fileio.mkdirSync(dpath);
        fileio.renameSync(dpath, dpath);
        fileio.accessSync(dpath);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_rename_sync_009 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FtruncateSync_0000
     * @tc.name fileio_test_ftruncate_sync_000
     * @tc.desc Function of API, ftruncateSync. The test file is exist.
     */
    it('fileio_test_ftruncate_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_ftruncate_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        fileio.ftruncateSync(fd, 10);
        expect(fileio.statSync(fpath).size == 10).assertTrue();
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_ftruncate_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FtruncateSync_0100
     * @tc.name fileio_test_ftruncate_sync_001
     * @tc.desc Function of API, len not for value. The test file is exist.
     */
    it('fileio_test_ftruncate_sync_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_ftruncate_sync_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        fileio.ftruncateSync(fd);
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_ftruncate_sync_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FtruncateSync_0200
     * @tc.name fileio_test_ftruncate_sync_002
     * @tc.desc Function of API, invalid parameter. The test file is not exist.
     */
    it('fileio_test_ftruncate_sync_002', Level.LEVEL1, async function () {
      try {
        fileio.ftruncateSync(1);
      }catch (err) {
        console.info('fileio_test_ftruncate_sync_002 has failed for ' + err);
        expect(err.message == "Invalid argument").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FtruncateSync_0300
     * @tc.name fileio_test_ftruncate_sync_003
     * @tc.desc Function of API, invalid parameter. The test file is not exist.
     */
    it('fileio_test_ftruncate_sync_003', Level.LEVEL1, async function () {
      try {
        fileio.ftruncateSync(-1);
      }catch (err) {
        console.info('fileio_test_ftruncate_sync_003 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FtruncateSync_0400
     * @tc.name fileio_test_ftruncate_sync_004
     * @tc.desc Function of API, Parameter exception(len = -1).
     */
    it('fileio_test_ftruncate_sync_004', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_ftruncate_sync_004');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        fileio.ftruncateSync(fd, -1);
      }catch (err) {
        console.info('fileio_test_ftruncate_sync_004 has failed for ' + err);
        expect(err.message == "Invalid argument").assertTrue();
        fileio.unlinkSync(fpath);
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FsyncSync_0000
     * @tc.name fileio_test_fsync_sync_000
     * @tc.desc Function of API, fsyneSync.
     */
    it('fileio_test_fsync_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_fsync_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        expect(fileio.fsyncSync(fd) !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_fsync_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FsyncSync_0100
     * @tc.name fileio_test_fsync_sync_001
     * @tc.desc Function of API, no value of parameter.
     */
    it('fileio_test_fsync_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.fsyncSync(1);
      } 
      catch (err) {
        console.info('fileio_test_fsync_sync_001 has failed for ' + err);
        expect(err.message == "Invalid argument").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FsyncSync_0200
     * @tc.name fileio_test_fsync_sync_002
     * @tc.desc Function of API, invalid parameter.
     */
    it('fileio_test_fsync_sync_002', Level.LEVEL1, async function () {
      try {
        fileio.fsyncSync(-1);
        expect(false).assertTrue();
      } 
      catch (err) {
        console.info('fileio_test_fsync_sync_002 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0000
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_000
     * @tc.desc Sync to mkdir and rmdir.
     */
    it('fileio_test_mkdir_sync_rmdir_sync_000', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_fsync_sync_000') + 'd'
      try {
        fileio.mkdirSync(dpath);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0100
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_001
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o660).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_001', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_001') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o660);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_001 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0200
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_002
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o460).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_002', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_002') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o460);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_002 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0300
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_003
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o260).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_003', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_003') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o260);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0400
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_004
     * @tc.desc Function of API, invalid parameter. The test file is not exist.
     */
    it('fileio_test_mkdir_sync_rmdir_sync_004', Level.LEVEL1, async function () {
      try {
        fileio.mkdirSync(1);
      }catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_004 has failed for ' + err);
        expect(err.message == "Invalid path").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0500
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_005
     * @tc.desc Function of API, invalid parameter. The test file is not exist.
     */
    it('fileio_test_mkdir_sync_rmdir_sync_005', Level.LEVEL1, async function () {
      try {
        fileio.mkdirSync('/', 1);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_005 has failed for ' + err);
        expect(err.message == "File exists").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0600
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_006
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o700).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_006', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_006') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o700);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_006 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0700
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_007
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o400).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_007', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_007') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o400);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_007 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0800
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_008
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o200).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_008', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_008') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o200);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_008 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_0900
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_009
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o100).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_009', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_009') + 'd'
      try {
        fileio.mkdirSync(dpath, 0o100);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_009 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1000
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_010
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o070).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_010', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_010') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o070);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_010 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1100
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_011
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o040).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_011', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_011') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o040);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_011 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1200
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_012
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o020).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_012', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_012') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o020);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_012 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1300
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_013
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o010).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_013', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_013') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o010);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_013 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1400
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_014
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o007).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_014', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_014') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o007);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_014 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1500
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_015
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o004).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_015', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_015') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o004);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_015 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1600
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_016
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o002).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_016', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_016') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o002);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_016 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_MkdirSync_RmdirSync_1700
     * @tc.name fileio_test_mkdir_sync_rmdir_sync_017
     * @tc.desc Sync to mkdir and rmdir. mkdirSync(mode=0o001).
     */
    it('fileio_test_mkdir_sync_rmdir_sync_017', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_mkdir_sync_rmdir_sync_017') + 'd';
      try {
        fileio.mkdirSync(dpath, 0o001);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_mkdir_sync_rmdir_sync_017 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FstatSync_0000
     * @tc.name fileio_test_fstat_sync_000
     * @tc.desc Function of API, fstatSync. The test file is exist.
     */
    it('fileio_test_fstat_sync_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_fstat_sync_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      try {
        let fd = fileio.openSync(fpath, 0o2);
        let stat = fileio.fstatSync(fd);
        expect(stat !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_fstat_sync_000 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FstatSync_0100
     * @tc.name fileio_test_fstat_sync_001
     * @tc.desc Function of API, fstatSync, fd = -1. The test file is not exist.
     */
    it('fileio_test_fstat_sync_001', Level.LEVEL1, async function () {
      try {
        fileio.fstatSync(-1);
        expect(false).assertTrue();
      }catch (err) {
        console.info('fileio_test_fstat_sync_001 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FstatSync_0200
     * @tc.name fileio_test_fstat_sync_002
     * @tc.desc Function of API, fstatSync, fd is string type.
     */
    it('fileio_test_fstat_sync_002', Level.LEVEL1, async function () {
      try {
        fileio.fstatSync("");
      }catch (err) {
        console.info('fileio_test_fstat_sync_002 has failed for ' + err);
        expect(err.message == "Invalid fd").assertTrue();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_FstatSync_0300
     * @tc.name fileio_test_fstat_sync_003
     * @tc.desc Function of API, fstatSync, vaild fd. The test file is exist.
     */
    it('fileio_test_fstat_sync_003', Level.LEVEL1, async function () {
      let dpath = await nextFileName('fileio_test_fstat_sync_003') + 'd'
      try {
        fileio.mkdirSync(dpath);
        let fd = fileio.openSync(dpath);
        expect(fd !== null).assertTrue();
        let stat = fileio.fstatSync(fd);
        expect(stat !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.rmdirSync(dpath);
      } 
      catch (err) {
        console.info('fileio_test_fstat_sync_003 has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_prop_write_open_read_4k_sync
     * @tc.name fileio_test_prop_write_open_read_4k_sync
     * @tc.desc Sync to write & open & read 4K file.
     */
    it('fileio_test_prop_write_open_read_4k_sync', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_prop_write_open_read_4k_sync');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o777);
        expect(fd !== null).assertTrue();
        expect(fileio.writeSync(fd, randomString(4096)) !== null).assertTrue();
        fileio.closeSync(fd);
        let fd1 = fileio.openSync(fpath, 0o2);
        let rlen = fileio.readSync(fd1, new ArrayBuffer(4096));
        expect(rlen == 4096).assertTrue();
        fileio.closeSync(fd1);
        fileio.unlinkSync(fpath);
      } 
      catch (err) {
        console.info('fileio_test_prop_write_open_read_4k_sync has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number SUB_STORAGE_FileIO_prop_write_open_read_4k_sync
     * @tc.name fileio_test_prop_copyFile_4k_sync
     * @tc.desc Sync to copy 4K file.
     */
    it('fileio_test_prop_copyFile_4k_sync', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_prop_copyFile_4k_sync');
      let fpath1 = await fileName('fileio_test_prop_copyFile_4k_1_sync');
      try {
        let fd = fileio.openSync(fpath, 0o102, 0o777);
        expect(fd !== null).assertTrue();
        expect(fileio.writeSync(fd, randomString(4096)) !== null).assertTrue();
        fileio.closeSync(fd);
        fileio.copyFileSync(fpath, fpath1);
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(fpath1);
      } 
      catch (err) {
        console.info('fileio_test_prop_copyFile_4k_sync has failed for ' + err);
        expect(null).assertFail();
      }
    });
  
    /**
     * @tc.number fileio_test_close_async_000
     * @tc.name fileio_test_close_async_000
     * @tc.desc Function of API close promise
     */
    it('fileio_test_close_async_000', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_close_async_000');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd = fileio.openSync(fpath);
      expect(fd !== null).assertTrue();
      await fileio.close(fd);
      fileio.unlinkSync(fpath);
    });
  
    /**
     * @tc.number fileio_test_close_async_001
     * @tc.name fileio_test_close_async_001
     * @tc.desc Function of API close
     */
    it('fileio_test_close_async_001', Level.LEVEL1, async function () {
      let fpath = await nextFileName('fileio_test_close_async_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fd = fileio.openSync(fpath);
      fileio.close(fd, function (err) {
        fileio.unlinkSync(fpath);
      });
    });
  });
}
