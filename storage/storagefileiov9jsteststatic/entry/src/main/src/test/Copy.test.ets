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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'
import fileUri from '@ohos.file.fileuri';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';
export const CONTENT = 'hello!!!';
export function prepare2GFile(fpath: string) {
  try {
    let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    fs.truncateSync(file.fd)
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 70; i++) {
      hilog.info(domain, tag, '%{public}s', 'prepare2GFile start');
      let offset = bf.byteLength * i;
      let writeLen = fs.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
      hilog.info(domain, tag, '%{public}s', 'prepare2GFile end: ' + i);
    }
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
    return true
  }
  catch (e) {
    hilog.info(domain, tag, '%{public}s', 'prepare2GFile end error' + JSON.stringify(e));
    return false
  }
}

export default function fileIOCopy() {
  describe('fileIO_fs_copy', (): void => {

    /**
     * @tc.name   fileIO_copy_async_static_001
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0100
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_001');
      let fpathTarget = await Utils.nextFileName('dst');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();

      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }
      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_001 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0200
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_002');
      let fpathTarget = fpath + 'dst';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(fpathTarget, CONTENT)).assertTrue();
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(fpathTarget);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(fpathTarget);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_002 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_003
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0300
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_003');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, options);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_003 end error' + JSON.stringify(e));
        expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_004
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0400
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_004');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_004 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_006
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0600
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_006');
      let fpathTarget = fpath + 'dst';
      let srcDirUriLocal = fileUri.getUriFromPath(fpath);
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

      try {
        await fs.copy(srcDirUriLocal, dstDirUriLocal, undefined);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_006 end error' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_007
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0700
     * @tc.desc   Test copy() interfaces.callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_007');
      let destpath = fpath + 'dest';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        let progressListener = (progress: fs.Progress) =>  {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 start');
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 stat1' + stat1.size);
          let stat2 = fs.statSync(destpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 stat2' + stat2.size);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(destpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_007 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_008
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0800
     * @tc.desc   Test copy() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_008');
      let destpath = fpath + 'dest';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          let stat1 = fs.statSync(fpath);
          let stat2 = fs.statSync(destpath);
          expect(stat1.size == stat2.size).assertTrue();
          fs.unlinkSync(fpath);
          fs.unlinkSync(destpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_008 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_009
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_0900
     * @tc.desc   Test copy() interfaces.callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_009');
      let destpath = fpath + 'dest';
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_009 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900002 && err?.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_009 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_011
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1100
     * @tc.desc   Test copy() interfaces.callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_011');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          let result1 = fs.listFileSync(ddpath);
          let result2 = fs.listFileSync(dmpath);
          expect(result1.length == result2.length).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_011 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_012
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1200
     * @tc.desc   Test copy() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_012');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          let result1 = fs.listFileSync(ddpath);
          let result2 = fs.listFileSync(dmpath);
          expect(result1.length == result2.length).assertTrue();
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_012 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_013
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1300
     * @tc.desc   Test copy() interfaces.Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_013');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        let progressListener = (progress: fs.Progress) => {
          hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
        };
        let options: fs.CopyOptions = {
          "progressListener" : progressListener
        }
        await fs.copy(srcDirUri, dstDirUri, options);
        let result1 = fs.listFileSync(ddpath);
        let result2 = fs.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_013 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_014
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1400
     * @tc.desc   Test copy() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let dpath = await Utils.nextFileName('fileIO_copy_async_static_014');
      let ddpath = dpath + '/srcDir_first';
      let dmpath = dpath + '/srcDir_second';
      fs.mkdirSync(dpath);
      fs.mkdirSync(ddpath);
      fs.mkdirSync(dmpath);
      let ffpath = ddpath + '/srcFile_first_01';
      expect(await Utils.prepareFile(ffpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(ddpath);
      let dstDirUri = fileUri.getUriFromPath(dmpath);

      try {
        await fs.copy(srcDirUri, dstDirUri);
        let result1 = fs.listFileSync(ddpath);
        let result2 = fs.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_014 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_016
     * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_STATIC_1600
     * @tc.desc   Test copy() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath2G = await Utils.nextFileName('test2G');
      expect(prepare2GFile(fpath2G)).assertTrue();
      let destpath = fpath2G + 'dest';
      let srcDirUri = fileUri.getUriFromPath(fpath2G);
      let dstDirUri = fileUri.getUriFromPath(destpath);
      let copySignal: fs.TaskSignal = new fs.TaskSignal;
      let stat1 = fs.statSync(fpath2G);
      hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 stat1: ' + stat1.size);
      let progressListener: fs.ProgressListener = (progress: fs.Progress) => {
        console.info(`fileIO_copy_async_static_016: ${progress.processedSize}, totalSize16: ${progress.totalSize}`);
        if (progress.processedSize * 1.0 / progress.totalSize > 0.1) {
          copySignal.cancel();
        }
      }; 

      let options: fs.CopyOptions = {
        "progressListener" : progressListener,
        "copySignal" : copySignal,
      };
      try {
        fs.copy(srcDirUri, dstDirUri, options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 error package: ' + err?.code);
            let stat2 = fs.statSync(destpath);
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 stat2: ' + stat2.size);
            expect(err?.code == 13900049 && err?.message == 'Operation canceled').assertTrue();
            expect(stat2.size < stat1.size).assertTrue();
            fs.unlinkSync(destpath);
          }
          hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 succ');
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_018
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1800
     * @tc.desc   Test copy() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_018');
      let destpath = fpath + 'dest';
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        fs.copy(srcDirUri, dstDirUri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_018 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_018 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_019
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_1900
     * @tc.desc   Test copy() interfaces with first parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let destpath = await Utils.nextFileName('fileIO_copy_async_static_019');
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        await fs.copy('', dstDirUri);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_019 end error' + JSON.stringify(e));
        expect(e.code === 401 && e.message == 'The input parameter is invalid').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_020
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2000
     * @tc.desc   Test copy() interfaces with second parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);

      try {
        await fs.copy(srcDirUri, '');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_020 end error' + JSON.stringify(e));
        expect(e.code === 401 && e.message == 'The input parameter is invalid').assertTrue();
        fs.unlinkSync(fpath);
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_022
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2200
     * @tc.desc   Test copy() interfaces with third parameter as undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_static_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_022');
      let destpath = fpath + 'dest';
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      expect(await Utils.prepareFile(destpath, CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        await fs.copy(srcDirUri, dstDirUri, undefined);
        let stat1 = fs.statSync(fpath);
        let stat2 = fs.statSync(destpath);
        expect(stat1.size == stat2.size).assertTrue();
        fs.unlinkSync(fpath);
        fs.unlinkSync(destpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_022 end error' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_023
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2300
     * @tc.desc   Test copy() callback interfaces with first parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let destpath = await Utils.nextFileName('fileIO_copy_async_static_023');
      let dstDirUri = fileUri.getUriFromPath(destpath);

      try {
        fs.copy('', dstDirUri, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_023 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 401 && err?.message == 'The input parameter is invalid').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_023 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_024
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2400
     * @tc.desc   Test copy() callback interfaces with second parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_024');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);

      try {
        fs.copy(srcDirUri, '', (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_024 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 401 && err?.message == 'The input parameter is invalid').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_024 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_025
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2500
     * @tc.desc   Test copy() interfaces with options and callback, first parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let destpath = await Utils.nextFileName('fileIO_copy_async_static_025');
      let dstDirUri = fileUri.getUriFromPath(destpath);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }

      try {
        fs.copy('', dstDirUri, options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_025 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 401 && err?.message == 'The input parameter is invalid').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_025 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_copy_async_static_026
     * @tc.number SUB_BASIC_FM_FileAPI_fileIO_copy_async_static_2600
     * @tc.desc   Test copy() interfaces with options and callback, second parameter as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_copy_async_static_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_copy_async_static_026');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let srcDirUri = fileUri.getUriFromPath(fpath);

      let progressListener = (progress: fs.Progress) => {
        hilog.info(domain, tag, '%{public}s', `progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options: fs.CopyOptions = {
        "progressListener" : progressListener
      }

      try {
        fs.copy(srcDirUri, '', options, (err: BusinessError<void> | null) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_026 error: {message: ' + err?.message + ', code: ' + err?.code + '}');
            expect(err?.code === 401 && err?.message == 'The input parameter is invalid').assertTrue();
            fs.unlinkSync(fpath);
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_copy_async_static_026 end error' + JSON.stringify(e));
        expect(false).assertTrue();
        done();
      }
    });
  });
}