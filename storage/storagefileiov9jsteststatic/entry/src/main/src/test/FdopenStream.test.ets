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

export default function fileIOFdopenStream() {
  describe('fileIO_fs_fdopenstream', (): void => {

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_000
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0000
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
        let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_000');
        let res = await Utils.prepareFile(fpath, FILE_CONTENT);
        expect(res).assertTrue();
        let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpr = fs.fdopenStreamSync(file.fd, 'r');

        try {
          expect(fpr !== null).assertTrue();
          expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
          fpr.writeSync(FILE_CONTENT);
          expect(false).assertTrue();
        } catch (e) {
          e = e as BusinessError;
          fpr.closeSync();
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_000 has failed for ' + e.message + ', code: ' + e.code);
          expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_001
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0010
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.fdopenStreamSync(-1, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_002
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0200
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_002');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpr = fs.fdopenStreamSync(file.fd, 'r+');
        expect(fpr !== null).assertTrue();
        expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        expect(fpr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_003
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0300
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      try {
        fs.fdopenStreamSync(-1, 'r+');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_004
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0400
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_004');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStreamSync(file.fd, 'ohos');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_005
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0500
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        fs.fdopenStreamSync(file.fd, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.closeSync(file);
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_006
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0600
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_006');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();
      let fpw = fs.fdopenStreamSync(file.fd, 'w');

      try {
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpw.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fpw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_007
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0700
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_007');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file1 = fs.openSync(fpath, fs.OpenMode.WRITE_ONLY);
        res = await Utils.isIntNum(file1.fd);
        expect(res).assertTrue();
        let fpw = fs.fdopenStreamSync(file1.fd, 'w');
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpw.closeSync();

        let file2 = fs.openSync(fpath, fs.OpenMode.READ_ONLY);
        let fpr = fs.fdopenStreamSync(file2.fd, 'r');
        expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_008
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0800
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_008');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpw = fs.fdopenStreamSync(file.fd, 'w+');
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_009
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0900
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_009');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file1 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        res = await Utils.isIntNum(file1.fd);
        expect(res).assertTrue();
        let fpa = fs.fdopenStreamSync(file1.fd, 'a');
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpa.closeSync();

        let file2 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fpr = fs.fdopenStreamSync(file2.fd, 'r');
        expect(fpr.readSync(new ArrayBuffer(4096)) == Number(FILE_CONTENT.length * 2)).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_010
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0100
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_010');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();
      let fpa = fs.fdopenStreamSync(file.fd, 'a');

      try {
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpa.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fpa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_011
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0110
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_011');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpa = fs.fdopenStreamSync(file.fd, 'a+');
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        fpa.closeSync();
        fs.unlinkSync(fpath);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_sync_static_012
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_1200
     * @tc.desc   Test fdopenStreamSync() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_sync_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_sync_static_012');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.closeSync(file.fd);
        fs.fdopenStreamSync(file.fd, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_sync_static_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_000
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0000
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_000');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      let fpr = await fs.fdopenStream(file.fd, 'r');

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        expect(fpr !== null).assertTrue();
        expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        fpr.writeSync(FILE_CONTENT);
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fpr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_000 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_001
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0100
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_001');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStream(file.fd, 'r', (err: BusinessError | null, fpr: fs.Stream | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_001 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpr !== null).assertTrue();
          expect(fpr?.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
          fpr?.write(FILE_CONTENT, (e: BusinessError | null, writeLen: long | undefined) => {
            if (e?.code !== 0) {
              fpr?.closeSync();
              fs.unlinkSync(fpath);
              hilog.info(domain, tag, '%{public}s',
                'fileIO_test_fdopenstream_async_static_001 error: {message: ' + e?.message + ', code: ' + e?.code + '}'
              );
              expect(e?.code == 13900005 && e?.message == 'I/O error').assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_002
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0200
     * @tc.desc   Test fdopenStream() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {

      try {
        await fs.fdopenStream(-1, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_002 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_003
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0300
     * @tc.desc   Test fdopenStream() interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      try {
        fs.fdopenStream(-1, 'r', (err: BusinessError | null, fpr: fs.Stream | undefined) => {
          if(err?.code != 0){
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_003 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_004
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0400
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_004');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpr = await fs.fdopenStream(file.fd, 'r+');
        expect(fpr !== null).assertTrue();
        expect(fpr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_004 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_005
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0500
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_005');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStream(file.fd, 'r+', (err: BusinessError | null, fpr: fs.Stream | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_005 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpr !== null).assertTrue();
          expect(fpr?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          expect(fpr?.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
          fpr?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_005 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_006
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0600
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_006');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        await fs.fdopenStream(file.fd, 'ohos');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_007
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0700
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        expect(await Utils.isIntNum(file.fd)).assertTrue();
        await fs.fdopenStream(file.fd, "");
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_008
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0800
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_008');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();
      let fpw = await fs.fdopenStream(file.fd, 'w');

      try {
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpw.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fpw.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_008 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_009
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0900
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_009');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStream(file.fd, 'w', (err: BusinessError | null, fpw: fs.Stream | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_009 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpw !== null).assertTrue();
          expect(fpw?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          fpw?.read(new ArrayBuffer(4096), (e: BusinessError | null, readLen: long | undefined) => {
            if (e?.code !== 0) {
              fpw?.closeSync();
              fs.unlinkSync(fpath);
              hilog.info(domain, tag, '%{public}s',
                'fileIO_test_fdopenstream_async_static_009 error: {message: ' + e?.message + ', code: ' + e?.code + '}'
              );
              expect(e?.code == 13900005 && e?.message == 'I/O error').assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_009 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_010
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1000
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_010');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file1 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fpw = await fs.fdopenStream(file1.fd, 'w');
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpw.closeSync();

        let file2 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fpr = await fs.fdopenStream(file2.fd, 'r');
        expect(fpr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_010 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_011
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1100
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_011');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpw = await fs.fdopenStream(file.fd, 'w+');
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_011 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_012
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1200
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_012');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStream(file.fd, 'w+', (err: BusinessError | null, fpw: fs.Stream | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_012 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpw !== null).assertTrue();
          expect(fpw?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          expect(fpw?.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
          fpw?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_012 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_013
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1300
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_013');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();

      try {
        let file1 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fpa = await fs.fdopenStream(file1.fd, 'a');
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpa.closeSync();

        let file2 = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
        let fpr = await fs.fdopenStream(file2.fd, 'r');
        expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length * 2).assertTrue();
        fpr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_013 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_014
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1400
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_014');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();
      let fpa = await fs.fdopenStream(file.fd, 'a');

      try {
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpa.readSync(new ArrayBuffer(4096));
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fpa.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_014 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_015
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1500
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_015');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();

      try {
        fs.fdopenStream(file.fd, 'a', (err: BusinessError | null, fpa: fs.Stream | undefined) => {
          if (err?.code != 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_015 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpa !== null).assertTrue();
          expect(fpa?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          fpa?.read(new ArrayBuffer(4096), (e: BusinessError | null, readLen: long | undefined) => {
            if (e?.code != 0) {
              fpa?.closeSync();
              fs.unlinkSync(fpath);
              hilog.info(domain, tag, '%{public}s',
                'fileIO_test_fdopenstream_async_static_015 error: {message: ' + e?.message + ', code: ' + e?.code + '}'
              );
              expect(e?.code == 13900005 && e?.message == 'I/O error').assertTrue();
              done();
            } else {
              expect(false).assertTrue();
            }
          });
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_015 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_016
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1600
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_016');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        let fpa = await fs.fdopenStream(file.fd, 'a+');
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        fpa.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_016 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_017
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1700
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_017');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.fdopenStream(file.fd, 'a+', (err: BusinessError | null, fpa: fs.Stream | undefined) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_017 error package: ' + err?.message + ', code: ' + err?.code);
            expect(false).assertTrue();
          }
          expect(fpa !== null).assertTrue();
          expect(fpa?.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
          expect(fpa?.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
          fpa?.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_017 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_018
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1800
     * @tc.desc   Test fdopenStream() interface. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_fdopenstream_async_static_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_018');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);

      try {
        res = await Utils.isIntNum(file.fd);
        expect(res).assertTrue();
        fs.closeSync(file.fd);
        await fs.fdopenStream(file.fd, 'r');
        expect(false).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_018 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_019
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1900
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_019');
      let res = await Utils.prepareFile(fpath, FILE_CONTENT);
      expect(res).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      res = await Utils.isIntNum(file.fd);
      expect(res).assertTrue();

      try {
        fs.closeSync(file.fd);
        fs.fdopenStream(file.fd, 'a', (err: BusinessError<void> | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_019 error package: ' + err?.message + ', code: ' + err?.code);
            expect(err?.code == 13900008 && err?.message == 'Bad file descriptor').assertTrue();
            done();
          }
        });
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_019 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_fdopenstream_async_static_020
     * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_2000
     * @tc.desc   Test fdopenStream() interface. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_fdopenstream_async_static_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void) : Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_fdopenstream_async_static_020');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let file = fs.openSync(fpath, fs.OpenMode.READ_WRITE);
      expect(await Utils.isIntNum(file.fd)).assertTrue();

      try {
        fs.fdopenStream(file.fd, "", (err: BusinessError<void> | null) => {
          if (err?.code !== 0) {
            hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_020 error package: ' + err?.message + ', code: ' + err?.code);
            expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
            done();
          }
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_fdopenstream_async_static_020 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

  });
}