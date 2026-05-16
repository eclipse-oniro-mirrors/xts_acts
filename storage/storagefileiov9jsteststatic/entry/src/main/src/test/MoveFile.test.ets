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

export default function fileIOMoveFile() {
  describe('fileIO_fs_moveFile', (): void => {

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_000
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0000
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_000');
      let fpath = dpath + '/file_000.txt';
      let ddpath = dpath + '/dir_000';
      let ffpath = ddpath + '/file_000.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_001
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0100
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_001');
      let fpath = dpath + '/file_001.txt';
      let ddpath = dpath + '/dir_001';
      let ffpath = ddpath + '/file_001.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        fs.moveFileSync(fpath, ffpath, 1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_001 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_002
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0200
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_002');
      let fpath = dpath + '/file_002.txt';
      let ddpath = dpath + '/dir_002';
      let ffpath = ddpath + '/file_002.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        fs.moveFileSync(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_004
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0400
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_004');
      let ddpath = dpath + '/dir_003';
      fs.mkdirSync(dpath);

      try {
        fs.moveFileSync(dpath, ddpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_006
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0600
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_006');
      let fpath = dpath + '/file_004.txt';
      let ddpath = dpath + '/dir_004';
      let ffpath = ddpath + '/file_004.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, 0);
        let str1 = fs.readTextSync(ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_006 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_007
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0700
     * @tc.desc   Test moveFileSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_007');
      let fpath = dpath + '/file_015.txt';
      let ddpath = dpath + '/dir_015';
      let ffpath = ddpath + '/file_015.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, undefined);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_008
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0800
     * @tc.desc   Test moveFileSync() interface with empty src path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_008');
      let ffpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);

      try {
        fs.moveFileSync("", ffpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_008 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_009
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0900
     * @tc.desc   Test moveFileSync() interface with empty dest path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_009');
      let fpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_009 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_010
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_1000
     * @tc.desc   Test moveFileSync() interface with mode=-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_010');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, -1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_010 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_sync_static_011
     * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_1100
     * @tc.desc   Test moveFileSync() interface with mode=2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_sync_static_011');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFileSync(fpath, ffpath, 2);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_sync_static_011 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_000
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0000
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_000');
      let fpath = dpath + '/file_005.txt';
      let ddpath = dpath + '/dir_005';
      let ffpath = ddpath + '/file_005.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_000 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_001
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0100
     * @tc.desc   Test moveFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_001');
      let fpath = dpath + '/file_006.txt';
      let ddpath = dpath + '/dir_006';
      let ffpath = ddpath + '/file_006.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, (err: BusinessError<void> | null) => {
          let stat = fs.statSync(ffpath);
          expect(stat.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_002
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0200
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_002');
      let fpath = dpath + '/file_007.txt';
      let ddpath = dpath + '/dir_007';
      let ffpath = ddpath + '/file_007.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        await fs.moveFile(fpath, ffpath, 1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_002 end error' + JSON.stringify(e));
        expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_003
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0300
     * @tc.desc   Test moveFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_003');
      let fpath = dpath + '/file_008.txt';
      let ddpath = dpath + '/dir_008';
      let ffpath = ddpath + '/file_008.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.copyFileSync(fpath, ffpath);
        fs.moveFile(fpath, ffpath, 1, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_003 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900015 && err?.message == 'File exists').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_003 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_004
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0400
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_004');
      let fpath = dpath + '/file_009.txt';
      let ddpath = dpath + '/dir_009';
      let ffpath = ddpath + '/file_009.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        await fs.moveFile(fpath, ffpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_005
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0500
     * @tc.desc   Test moveFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_005');
      let fpath = dpath + '/file_010.txt';
      let ddpath = dpath + '/dir_010';
      let ffpath = ddpath + '/file_010.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);

      try {
        fs.moveFile(fpath, ffpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_005 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_005 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_006
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0600
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_006');
      let ddpath = dpath + '/dir_011';
      fs.mkdirSync(dpath);

      try {
        await fs.moveFile(dpath, ddpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_007
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0700
     * @tc.desc   Test moveFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_007');
      let ddpath = dpath + '/dir_012';
      fs.mkdirSync(dpath);

      try {
        fs.moveFile(dpath, ddpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_007 error1' + JSON.stringify(err));
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            fs.rmdirSync(dpath);
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_009
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0900
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_009');
      let fpath = dpath + '/file_013.txt';
      let ddpath = dpath + '/dir_013';
      let ffpath = ddpath + '/file_013.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, 0);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_010
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1000
     * @tc.desc   Test moveFile() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_moveFile_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_010');
      let fpath = dpath + '/file_014.txt';
      let ddpath = dpath + '/dir_014';
      let ffpath = ddpath + '/file_014.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, 0, (err: BusinessError<void> | null) => {
          let stat = fs.statSync(ffpath);
          expect(stat.size == FILE_CONTENT.length).assertTrue();
          fs.rmdirSync(dpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_010 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_011
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1100
     * @tc.desc   Test moveFile() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_011');
      let fpath = dpath + '/file_016.txt';
      let ddpath = dpath + '/dir_016';
      let ffpath = ddpath + '/file_016.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(ffpath, '')).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, undefined);
        let stat = fs.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fs.rmdirSync(dpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_012
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1200
     * @tc.desc   Test moveFile() interface with empty src path. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_012');
      let ffpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);

      try {
        await fs.moveFile("", ffpath);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_012 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_013
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1300
     * @tc.desc   Test moveFile() interface with empty dest path. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_013');
      let fpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.moveFile(fpath, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_013 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_014
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1400
     * @tc.desc   Test moveFile() interface with mode=-1. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_014');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, -1);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_014 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_015
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1500
     * @tc.desc   Test moveFile() interface with mode=2. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_015');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        await fs.moveFile(fpath, ffpath, 2);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.rmdirSync(dpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_015 error: {message: ' + e.message + ', code: ' + e.code + '}');
        expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_016
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1600
     * @tc.desc   Test moveFile() callback interface with empty src path. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_016');
      let ffpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);

      try {
        fs.moveFile("", ffpath, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_016 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_016 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_017
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1700
     * @tc.desc   Test moveFile() callback interface with empty dest path. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_017');
      let fpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, "", (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_017 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_017 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_018
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1800
     * @tc.desc   Test moveFile() callback interface with mode and empty src path. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_018');
      let ffpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);

      try {
        fs.moveFile("", ffpath, 0, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_018 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_019
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1900
     * @tc.desc   Test moveFile() callback interface with mode and empty dest path. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_019');
      let fpath = dpath + '/file.txt';
      fs.mkdirSync(dpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, "", 0, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_019 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_019 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_020
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_2000
     * @tc.desc   Test moveFile() callback interface with mode=-1. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_020');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, -1, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_020 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_020 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_moveFile_async_static_021
     * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_2100
     * @tc.desc   Test moveFile() callback interface with mode=2. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_moveFile_async_static_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_test_moveFile_async_static_021');
      let fpath = dpath + '/file.txt';
      let ddpath = dpath + '/dir';
      let ffpath = ddpath + '/file.txt';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        fs.moveFile(fpath, ffpath, 2, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            fs.rmdirSync(dpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_021 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_moveFile_async_static_021 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });
  });
}