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

import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'
import { ReadOptions } from '@ohos.file.fs';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIOStreamRead() {
  describe('fileIO_fs_stream_read', (): void => {

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_000
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0000
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16));
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8));
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_001
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0100
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_sync_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen =  sr.readSync(new ArrayBuffer(4096), { length: 2 });
        expect(readLen == 2).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_002
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0200
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_sync_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen = sr.readSync(new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong(),
        });
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_002 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_003
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0300
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_sync_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidLength = 4097;

      try {
        expect(sr !== null).assertTrue();
        sr.readSync(new ArrayBuffer(4096), { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_003 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_004
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0400
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_sync_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');
      const invalidOffset = -1;

      try {
        expect(sr !== null).assertTrue();
        sr.readSync(new ArrayBuffer(4096), { offset: invalidOffset });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_004 has failed for ' + JSON.stringify(e));
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_005
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0500
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_stream_read_sync_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16), undefined);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8), undefined);
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_005 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_sync_static_006
     * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0600
     * @tc.desc   Test the readSync() interface of class Stream.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_stream_read_sync_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_sync_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = sr.readSync(new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        });
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = sr.readSync(new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_sync_static_006 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_000
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0000
     * @tc.desc   Test read() interface, Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16));
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8));
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_000 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_001
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0100
     * @tc.desc   Test read() interface, Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_001');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(16), (err: BusinessError | null, readLen1: long | undefined) => {
          expect(readLen1 == FILE_CONTENT.length).assertTrue();
          sr.read(new ArrayBuffer(8), (err, readLen2) => {
            expect(readLen2 == 0).assertTrue();
            sr.closeSync();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_001 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_002
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0200
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_002');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          length: 5
        });
        expect(readLen == 5).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_002 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_003
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0300
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_003');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          length: 5
        }, (err: BusinessError | null, readLen: long | undefined) => {
          expect(readLen == 5).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_003 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_004
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0400
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_004');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          offset: 5
        });
        expect(readLen == FILE_CONTENT.length - 5).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_004 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_005
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0500
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_005');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: 5
        }, (err: BusinessError | null, readLen: long | undefined) => {
          expect(readLen == FILE_CONTENT.length - 5).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_005 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_006
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0600
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_006');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');

      try {
        expect(sr !== null).assertTrue();
        const invalidLength = 4097;
        await sr.read(new ArrayBuffer(4096), { length: invalidLength });
        expect(false).assertTrue();
      } catch (e: BusinessError) {
        sr.closeSync();
        fs.unlinkSync(fpath);
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
        done();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_007
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0700
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_007');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let sr = fs.createStreamSync(fpath, 'r+');

      try {
        expect(sr !== null).assertTrue();
        let options: ReadOptions = {
          offset: -1,
        }
        sr.read(new ArrayBuffer(4096), options, (err: BusinessError<void> | null) => {
          sr.closeSync();
          fs.unlinkSync(fpath);
          hilog.info(domain, tag, '%{public}s',
            'fileIO_test_stream_write_async_007 has failed for ' + JSON.stringify(err));
          expect(err?.code == 13900020 && err?.message == 'Invalid argument').assertTrue();
          done();
        });
      }catch(e: BusinessError){
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_007 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_008
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0800
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_008');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong(),
        });
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_008 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_009
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0900
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_009');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: 1,
          length: FILE_CONTENT.length.toLong(),
        }, (err: BusinessError | null, readLen: long | undefined) => {
          expect(readLen == FILE_CONTENT.length - 1).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_009 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_010
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1000
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_010');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen = await sr.read(new ArrayBuffer(4096), {});
        expect(readLen == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_010 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_011
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1100
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_test_stream_read_async_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_011');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
        }, (err: BusinessError | null, readLen: long | undefined) => {
          expect(readLen == FILE_CONTENT.length).assertTrue();
          sr.closeSync();
          fs.unlinkSync(fpath);
          done();
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_011 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_012
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1200
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_stream_read_async_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_012');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16), undefined);
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8), undefined);
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_012 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_013
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1300
     * @tc.desc   Test the read() interface of class Stream. Promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_stream_read_async_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_013');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        let readLen1 = await sr.read(new ArrayBuffer(16), {
          offset: undefined,
          length: undefined
        });
        expect(readLen1 == FILE_CONTENT.length).assertTrue();
        let readLen2 = await sr.read(new ArrayBuffer(8), {
          offset: undefined,
          length: undefined
        });
        expect(readLen2 == 0).assertTrue();
        sr.closeSync();
        fs.unlinkSync(fpath);
        done();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_013 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.name   fileIO_test_stream_read_async_static_014
     * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1400
     * @tc.desc   Test the read() interface of class Stream. Callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('fileIO_test_stream_read_async_static_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_test_stream_read_async_static_014');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let sr = fs.createStreamSync(fpath, 'r+');
        expect(sr !== null).assertTrue();
        sr.read(new ArrayBuffer(4096), {
          offset: undefined,
          length: undefined
        }, (err, readLen1) => {
          expect(readLen1 == FILE_CONTENT.length).assertTrue();
          sr.read(new ArrayBuffer(8), {
            offset: undefined,
            length: undefined
          }, (err: BusinessError | null, readLen2: long | undefined) => {
            expect(readLen2 == 0).assertTrue();
            sr.closeSync();
            fs.unlinkSync(fpath);
            done();
          });
        });
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_test_stream_read_async_static_014 has failed for ' + JSON.stringify(e));
        expect(false).assertTrue();
      }
    });
  });
}
