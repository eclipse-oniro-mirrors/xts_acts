/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function fileIOLseek() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe("fileIO_fs_lseek", (): void => {
    hilog.info(domain, tag, '%{public}s', 'fileIO_fs_lseek start');

    /**
     * @tc.name   fileIO_test_lseek_static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0100
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_001 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 5;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum);
        expect(pnumber == offsetnum).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_001 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0200
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_002 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 3;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum, fs.WhenceType.SEEK_SET);
        expect(pnumber == offsetnum).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length - offsetnum).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_002 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_003
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0300
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_003 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 3;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum, fs.WhenceType.SEEK_CUR);
        expect(pnumber == offsetnum).assertTrue();
        let pnumber2 = fs.lseek(file.fd, offsetnum, fs.WhenceType.SEEK_CUR);
        expect(pnumber2 == offsetnum * 2).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length - offsetnum * 2).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_003 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_004
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0400
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_004 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 3;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum, fs.WhenceType.SEEK_END);
        expect(pnumber == FILE_CONTENT.length + offsetnum).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_004 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_005
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0500
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.lseek(-1,-1);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_005 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_006
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0600
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_006 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_006');
      let offsetnum = 3;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum);
        expect(pnumber == offsetnum).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_006 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_007
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0700
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_007 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 3;
      let offsetnum1 = 5;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum);
        expect(pnumber == offsetnum).assertTrue();
        let pnumber1 =  fs.lseek(file.fd, offsetnum1,fs.WhenceType.SEEK_CUR);
        expect(pnumber1 == offsetnum + offsetnum1).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length - (offsetnum + offsetnum1)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_007 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_008
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0800
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_008 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 3;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum, undefined);
        expect(pnumber == offsetnum).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_008 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_009
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0900
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_009 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      const invalidoffset = -1;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.lseek(file.fd, invalidoffset, fs.WhenceType.SEEK_SET);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_009 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_010
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1000
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_010 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let offsetnum = 5;
      const invalidoffset = -1;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, offsetnum);
        expect(pnumber == offsetnum).assertTrue();
        let pnumber1 =  fs.lseek(file.fd, invalidoffset,fs.WhenceType.SEEK_CUR);
        expect(pnumber1 == offsetnum + invalidoffset).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length - (offsetnum + invalidoffset)).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_010 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_011
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1100
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_011 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let invalidoffset = -2;
      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let pnumber = fs.lseek(file.fd, invalidoffset, fs.WhenceType.SEEK_END);
        expect(pnumber == FILE_CONTENT.length + invalidoffset).assertTrue();
        let readLen = fs.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == FILE_CONTENT.length - pnumber).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_011 has failed for' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_012
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1200
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_012 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      let offsetnum = 5;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        let fd = file.fd;
        fs.closeSync(file);
        fs.lseek(fd, offsetnum, fs.WhenceType.SEEK_CUR);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_012 has failed for' + JSON.stringify(e));
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_lseek_static_013
     * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1300
     * @tc.desc   Test lseek() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_lseek_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_013 start');
      let fpath = await Utils.nextFileName('fileIO_test_lseek_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      let invalidoffset = -100;
      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.lseek(file.fd, invalidoffset, fs.WhenceType.SEEK_CUR);
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_lseek_static_013 has failed for' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'fileIO_fs_lseek end');

}