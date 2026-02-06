/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOCopyfile() {
  describe('fileIO_fs_copyfile', (): void => {

    /**
     * @tc.name   fileIO_copy_file_sync_static_000
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0000
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_file_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_000');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, fpathTarget);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_001
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0100
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_001');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.copyFileSync(file.fd, fpathTarget);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_002
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0200
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_002');
      let fpathTarget = fpath + 'tgt';

      try {
        fs.copyFileSync(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_005
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0500
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_005');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fileTgt = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.copyFileSync(file.fd, fileTgt.fd);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(file);
        fs.closeSync(fileTgt);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_006
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0600
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_006');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fileTgt = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        fs.copyFileSync(fpath, fileTgt.fd);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(fileTgt);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_007
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0700
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_007');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, fpathTarget, 1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_007 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_009
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_0900
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_009');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, fpathTarget, undefined);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_010
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_1000
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_010');
      let fpathTarget = fpath + 'tgt';

      try {
        fs.copyFileSync("", fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_010 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_011
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_1100
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_011 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_012
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_1200
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_file_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_012');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, fpathTarget, 0);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_sync_static_013
     * @tc.number SUB_DF_fileIO_copy_file_sync_static_1300
     * @tc.desc   Test copyFileSync() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_sync_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_sync_static_013');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, fpathTarget, -1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_sync_static_013 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_000
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0000
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_000');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, fpathTarget);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_001
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0010
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_001');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFile(fpath, fpathTarget, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(fpathTarget);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_002
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0200
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_002');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.copyFile(file.fd, fpathTarget);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_003
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0300
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_003');
      let fpathTarget = fpath + 'tgt';

      try {
        await fs.copyFile(fpath, fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_004
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0400
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_004');
      let fpathTarget = fpath + 'tgt';

      try {
        fs.copyFile(fpath, fpathTarget, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_004 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_004 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_005
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0500
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_005');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, fpathTarget, -1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_005 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_006
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0600
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_006');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, fpathTarget, 1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_007
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0700
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpathTarget = await Utils.nextFileName('fileIO_copy_file_async_static_007');

      try {
        fs.copyFile("/data/storage/el2/base/files/test.txt", fpathTarget, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_007 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_008
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0800
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_008');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, fpathTarget, 0);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_009
     * @tc.number SUB_DF_fileIO_copy_file_async_static_0900
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_009');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFile(fpath, fpathTarget, 0, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(fpathTarget);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_010
     * @tc.number SUB_DF_fileIO_copy_file_async_static_1000
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_010');
      let fpathTarget = fpath + 'tgt';

      try {
        fs.copyFile("", fpathTarget, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_010 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_011
     * @tc.number SUB_DF_fileIO_copy_file_async_static_1100
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFile(fpath, "", (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_011 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_012
     * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1200
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_012');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fileTgt = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        await fs.copyFile(file.fd, fileTgt.fd);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(file);
        fs.closeSync(fileTgt);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_013
     * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1300
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_012');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let fileTgt = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        fs.copyFile(file.fd, fileTgt.fd, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(fpathTarget);
          expect(stat1.size == stat2.size).assertTrue();
          fs.closeSync(file);
          fs.closeSync(fileTgt);
          fs.unlinkSync(fpath);
          fs.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_014
     * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1400
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_014');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, FILE_CONTENT)).assertTrue();

      try {
        let file = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        await fs.copyFile(fpath, file.fd, 0);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_015
     * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1500
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_014');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpathTarget, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);

      try {
        fs.copyFile(fpath, file.fd, 0, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(fpathTarget);
          expect(stat1.size == stat2.size).assertTrue();
          fs.closeSync(file);
          fs.unlinkSync(fpath);
          fs.unlinkSync(fpathTarget);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_015 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_016
     * @tc.number SUB_DF_fileIO_copy_file_async_static_1600
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_016');
      let fpathTarget = fpath + 'tgt';

      try {
        await fs.copyFile("", fpathTarget);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_016 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_017
     * @tc.number SUB_DF_fileIO_copy_file_async_static_1700
     * @tc.desc   Test copyFile() interfaces. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_017');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_017 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_018
     * @tc.number SUB_DF_FILEIO_COPY_FILE_ASYNC_1800
     * @tc.desc   Test copyFile() interfaces. Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_018');
      let fpathTarget = fpath + 'tgt';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.copyFile(fpath, fpathTarget, undefined);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_019
     * @tc.number SUB_DF_fileIO_copy_file_async_static_1900
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_019');
      let fpathTarget = fpath + 'tgt';

      try {
        fs.copyFile("", fpathTarget, 0, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_019 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_019 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_020
     * @tc.number SUB_DF_fileIO_copy_file_async_static_2000
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_file_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFile(fpath, "", 0, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.unlinkSync(fpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_020 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_020 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_file_async_static_021
     * @tc.number SUB_DF_fileIO_copy_file_async_static_2100
     * @tc.desc   Test copyFile() interfaces. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_file_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpathTarget = await Utils.nextFileName('fileIO_copy_file_async_static_021');

      try {
        fs.copyFile("/data/storage/el2/base/files/test.txt", fpathTarget, 0, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_021 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_file_async_static_021 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}